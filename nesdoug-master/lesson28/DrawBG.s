.export _CSV2NT_FULL, _CSV2NT_COL_FILL, _CSV2NT_ROW_FILL, _CSV2NT_COL_DRAW, _CSV2NT_ROW_DRAW

.import _Col_Buffer, _Row_Buffer, _tempX, _tempY, _BG_TABLE, _Col_Buffer_Ready, _Row_Buffer_Ready
.import _AT_Buffer1, _AT_Buffer2








_CSV2NT_FULL:
	;x and y are zero from start
	
	lda #$00
	sta $2000 ;no NMIs


	lda #0
	sta TEMP+10
	
:	
	lda TEMP+10
	sta _tempY
	lda #0
	sta _tempX
	sta _tempX+1
	sta _tempY+1
	
	jsr _CSV2NT_ROW_FILL
	jsr _CSV2NT_ROW_DRAW
	
	

	lda TEMP+10
	clc
	adc #$10
	sta TEMP+10
	cmp #$f0
	bcc :-
	
	lda #1
	sta _tempY+1
	lda #0
	sta _tempY
	sta _tempX
	sta _tempX+1
	
	jsr _CSV2NT_ROW_FILL
	jsr _CSV2NT_ROW_DRAW
	
	lda PPU_CTRL_VAR ;assuming nmi is on
	sta $2000 ;NMIs

	rts
	
	
	
	
	
	
	
_CSV2NT_COL_FILL: ;takes 2 args,...in tempX, tempY
	lda #0
	sta _AT_Buffer1
	sta _AT_Buffer1+10

	;sanitize input
	lda _tempY
	and #$f0
	sta _tempY
	
	lda _tempX
	and #$f0
	sta _tempX


	;disallow too far X,Y
	lda _tempY+1
	cmp #8 ;ROOMS_HIGH
	bcc :+
	lda #$ff
	sta _Col_Buffer
	rts
:
	lda _tempX+1
	cmp #8 ;ROOMS_WIDE
	bcc :+
	lda #$ff
	sta _Col_Buffer
	rts
:

	lda #<_BG_TABLE
	sta PTR
	lda #>_BG_TABLE
	sta PTR+1
	
;which room to start from?
	lda _tempY+1 ;high byte Y 0-7
	asl a ;2
	asl a ;4
	asl a ;8 0-56
	
	clc
	adc _tempX+1 ;high byte X 0-7
;now we have the room #
	tay
	
;get the nametable of that room
;0 = 0, 1 = 4, 2 = 0, 3 = 4, just use a pre rendered table
	lda Room2Nametable, y
	sta TEMP+2
	
	tya
	asl a ;double it, each room has 2 bytes
	tay
;set up the pointer to that room
	lda (PTR), y
	sta PTR2
	iny
	lda (PTR), y
	sta PTR2+1
	
	;added, for attribute table later
	lda PTR2
	sta PTR
	lda PTR2+1
	sta PTR+1
	
	
	
;which column?
	lda _tempX
	and #$f0 ; high nibble is col of room
	lsr a
	lsr a
	lsr a
	lsr a ;start from top
	tay
	pha ;save for later
	
;get the position in the nametable, push an address to the buffer	
	asl a
	sta _Col_Buffer+1

	lda TEMP+2
	ora #$20
	sta _Col_Buffer
	
	
	ldx #0  ;index to buffer
	stx TEMP+4
	ldx #15 ;loop 30 times / 2 = 16
	stx TEMP+5 ;count loops
COL_LOOP:
	lda (PTR2), y
	asl a ;2
	asl a ;4
	tax

	lda Tiles, x ;top left
	sta TEMP+6
	lda Tiles+1, x ;top right
	sta TEMP+7
	lda Tiles+2, x ;bot left
	sta TEMP+8
	lda Tiles+3, x ;bot right
	sta TEMP+9
	
	ldx TEMP+4 ;index to buffer
	lda TEMP+6
	sta _Col_Buffer+2, x
	lda TEMP+8
	sta _Col_Buffer+3, x
	lda TEMP+7
	sta _Col_Buffer+32, x
	lda TEMP+9
	sta _Col_Buffer+33, x
	
	;iny ;no, shift down
	lda PTR2
	clc
	adc #$10
	sta PTR2
	bcc :+
	inc PTR2+1
:	
	
	inc TEMP+4 ; shift buffer position right 2
	inc TEMP+4
	dec TEMP+5 ; count down
	bne COL_LOOP
	
	
;attribute table now
;address
	lda _Col_Buffer 
	and #$fc
	ora #$03
	sta _AT_Buffer1
	

	lda _Col_Buffer+1
	lsr a
	lsr a ;0000 0xxx
	ora #$c0 ;c0 c1 c2 c3...c7
	sta _AT_Buffer1+1
	
	
	pla ;y I saved earlier
	and #$fe ;make sure left side only 
	tay
	ldx #0  ;index to buffer
	stx TEMP+4
	ldx #8 ;loop
	stx TEMP+5 ;count loops
:
	lda (PTR), y ;metatile
	tax
	lda MT_PALETTE, x
	sta TEMP+6
	
	iny
	lda (PTR), y ;metatile
	tax
	lda MT_PALETTE, x
	asl a
	asl a
	ora TEMP+6
	sta TEMP+6
	
	tya
	clc
	adc #$0f
	tay
	lda (PTR), y ;metatile
	tax
	lda MT_PALETTE, x
	asl a
	asl a
	asl a
	asl a
	ora TEMP+6
	sta TEMP+6
	
	iny
	lda (PTR), y ;metatile
	tax
	lda MT_PALETTE, x
	lsr a
	ror a
	ror a
	and #$c0
	ora TEMP+6
	sta TEMP+6
	
	ldx TEMP+4
	sta _AT_Buffer1+2, x
	inc TEMP+4
	
	tya
	clc
	adc #$0f
	tay
	
	dec TEMP+5
	bne :-
	
	lda _AT_Buffer1+9 ;last one only needs half bytes
	and #$0f
	sta _AT_Buffer1+9
	
	
	
	;62
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;next column, nametable down one
	inc _tempY+1
	
	
	
	;disallow too far X,Y
	lda _tempY+1
	cmp #8 ;ROOMS_HIGH
	bcc :+
	lda #$ff
	sta _Col_Buffer+62
	;rts
	jmp Col_Ready
:
	lda _tempX+1
	cmp #8 ;ROOMS_WIDE
	bcc :+
	lda #$ff
	sta _Col_Buffer+62
	;rts
	jmp Col_Ready
:

	lda #<_BG_TABLE
	sta PTR
	lda #>_BG_TABLE
	sta PTR+1
	
;which room to start from?
	lda _tempY+1 ;high byte Y 0-7
	asl a ;2
	asl a ;4
	asl a ;8 0-56
	
	clc
	adc _tempX+1 ;high byte X 0-7
;now we have the room #
	tay
	
;get the nametable of that room
;0 = 0, 1 = 4, 2 = 0, 3 = 4, just use a pre rendered table
	lda Room2Nametable, y
	sta TEMP+2
	
	tya
	asl a ;double it, each room has 2 bytes
	tay
;set up the pointer to that room
	lda (PTR), y
	sta PTR2
	iny
	lda (PTR), y
	sta PTR2+1
	
	;added, for attribute table later
	lda PTR2
	sta PTR
	lda PTR2+1
	sta PTR+1
	
	
	
;which column?
	lda _tempX
	and #$f0 ; high nibble is col of room
	lsr a
	lsr a
	lsr a
	lsr a ;start from top
	tay
	pha ;save for later
	
;get the position in the nametable, push an address to the buffer	
	asl a
	sta _Col_Buffer+63

	lda TEMP+2
	ora #$20
	sta _Col_Buffer+62
	
	
	ldx #0  ;index to buffer
	stx TEMP+4
	ldx #15 ;loop
	stx TEMP+5 ;count loops
COL_LOOP2:
	lda (PTR2), y
	asl a ;2
	asl a ;4
	tax

	lda Tiles, x ;top left
	sta TEMP+6
	lda Tiles+1, x ;top right
	sta TEMP+7
	lda Tiles+2, x ;bot left
	sta TEMP+8
	lda Tiles+3, x ;bot right
	sta TEMP+9
	
	ldx TEMP+4 ;index to buffer
	lda TEMP+6
	sta _Col_Buffer+64, x
	lda TEMP+8
	sta _Col_Buffer+65, x
	lda TEMP+7
	sta _Col_Buffer+94, x
	lda TEMP+9
	sta _Col_Buffer+95, x
	
	lda PTR2
	clc
	adc #$10
	sta PTR2
	bcc :+
	inc PTR2+1
:	
	
	inc TEMP+4 ; shift buffer position right 2
	inc TEMP+4
	dec TEMP+5 ; count down
	bne COL_LOOP2
	
	
	
	
;attribute table now
;address
	lda _Col_Buffer+62
	and #$fc
	ora #$03
	sta _AT_Buffer1+10
	

	lda _Col_Buffer+63 
	lsr a
	lsr a ;0000 0xxx
	ora #$c0 ;c0 c1 c2 c3...c7
	sta _AT_Buffer1+11
	
	
	pla ;y I saved earlier
	and #$fe ;make sure left side only
	tay
	ldx #0  ;index to buffer
	stx TEMP+4
	ldx #8 ;loop
	stx TEMP+5 ;count loops
:
	lda (PTR), y ;metatile
	tax
	lda MT_PALETTE, x
	sta TEMP+6
	
	iny
	lda (PTR), y ;metatile
	tax
	lda MT_PALETTE, x
	asl a
	asl a
	ora TEMP+6
	sta TEMP+6
	
	tya
	clc
	adc #$0f
	tay
	lda (PTR), y ;metatile
	tax
	lda MT_PALETTE, x
	asl a
	asl a
	asl a
	asl a
	ora TEMP+6
	sta TEMP+6
	
	iny
	lda (PTR), y ;metatile
	tax
	lda MT_PALETTE, x
	lsr a
	ror a
	ror a
	and #$c0
	ora TEMP+6
	sta TEMP+6
	
	ldx TEMP+4
	sta _AT_Buffer1+12, x
	inc TEMP+4
	
	tya
	clc
	adc #$0f
	tay
	
	dec TEMP+5
	bne :-
	
	lda _AT_Buffer1+19 ;last one only needs half bytes
	and #$0f
	sta _AT_Buffer1+19
	



Col_Ready:
	lda #1
	sta _Col_Buffer_Ready
	rts
	
	
	
	
	
	
	
	
_CSV2NT_ROW_FILL: ;takes 2 args, ...in tempX, tempY
	lda #0
	sta _AT_Buffer2
	sta _AT_Buffer2+10
	
	;sanitize input
	lda _tempY
	and #$f0
	sta _tempY
	
	lda _tempX
	and #$f0
	sta _tempX

;disallow too far X,Y
	lda _tempY+1
	cmp #8 ;ROOMS_HIGH
	bcc :+
	lda #$ff
	sta _Row_Buffer
	rts
:
	lda _tempX+1
	cmp #8 ;ROOMS_WIDE
	bcc :+
	lda #$ff
	sta _Row_Buffer
	rts
:

	lda #<_BG_TABLE
	sta PTR
	lda #>_BG_TABLE
	sta PTR+1
	
;which room to start from?
	lda _tempY+1 ;high byte Y 0-7
	asl a ;2
	asl a ;4
	asl a ;8 0-56
	
	clc
	adc _tempX+1 ;high byte X 0-7
;now we have the room #
	tay
	
;get the nametable of that room
;0 = 0, 1 = 4, 2 = 0, 3 = 4, just use a pre rendered table
	lda Room2Nametable, y
	sta TEMP+2
	
	tya
	asl a ;double it, each room has 2 bytes
	tay
;set up the pointer to that room
	lda (PTR), y
	sta PTR2
	iny
	lda (PTR), y
	sta PTR2+1
	
;which row?
	lda _tempY
	and #$f0 ; high nibble is row of room
	tay
	pha ;save for later
	
;get the position in the nametable, push an address to the buffer	
	ldx #0
	stx TEMP+3
	clc
	asl a ;
	rol TEMP+3 ;0-1
	asl a ;
	rol TEMP+3 ;0-3
	and #$e0
	sta _Row_Buffer+1
	lda TEMP+3
	clc
	adc TEMP+2
	ora #$20
	sta _Row_Buffer
	
	
	ldx #0  ;index to buffer
	stx TEMP+4
	ldx #16 ;loop
	stx TEMP+5 ;count loops
:
	lda (PTR2), y
	asl a ;2
	asl a ;4
	tax

	lda Tiles, x ;top left
	sta TEMP+6
	lda Tiles+1, x ;top right
	sta TEMP+7
	lda Tiles+2, x ;bot left
	sta TEMP+8
	lda Tiles+3, x ;bot right
	sta TEMP+9
	
	ldx TEMP+4
	lda TEMP+6
	sta _Row_Buffer+2, x
	lda TEMP+7
	sta _Row_Buffer+3, x
	lda TEMP+8
	sta _Row_Buffer+34, x
	lda TEMP+9
	sta _Row_Buffer+35, x
	
	iny
	inc TEMP+4 ; shift buffer position right 2
	inc TEMP+4
	dec TEMP+5 ; count down
	bne :-
	
	
;attribute table now
;address
	lda _Row_Buffer
	and #$fc
	ora #$03
	sta _AT_Buffer2
	
	lda _Row_Buffer+1
	asl a ;y bit now in carry flag
	lda _Row_Buffer
	and #$03
	rol a ;0000 0yyy
	asl a ;0000 yyy0
	asl a ;000y yy00
	asl a ;00yy y000
	ora #$c0
	sta _AT_Buffer2+1
	;c0 c8 d0 d8...

	pla ;y I saved earlier
	and #$e0 ;00 20 40 60 80...make sure start at the top half of the AT byte
	tay
	ldx #0  ;index to buffer
	stx TEMP+4
	ldx #8 ;loop
	stx TEMP+5 ;count loops
AT_LOOP:
	lda (PTR2), y ;metatile
	tax
	lda MT_PALETTE, x
	sta TEMP+6
	
	iny
	lda (PTR2), y ;metatile
	tax
	lda MT_PALETTE, x
	asl a
	asl a
	ora TEMP+6
	sta TEMP+6
	
	tya
	clc
	adc #$0f
	cmp #$f0
	bcc :+
	iny
	lda #0
	jmp AT_LOOPb
:
	tay
	lda (PTR2), y ;metatile
	tax
	lda MT_PALETTE, x
	asl a
	asl a
	asl a
	asl a
	ora TEMP+6
	sta TEMP+6
	
	iny
	lda (PTR2), y ;metatile
	tax
	lda MT_PALETTE, x
	lsr a
	ror a
	ror a
AT_LOOPb:	
	ora TEMP+6
	sta TEMP+6
	
	ldx TEMP+4
	sta _AT_Buffer2+2, x
	inc TEMP+4
	
	tya
	sec
	sbc #$0f
	tay
	
	dec TEMP+5
	bne AT_LOOP
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	;;66
;next row, nametable to the right
	inc _tempX+1
	
;disallow too far X,Y
	lda _tempY+1
	cmp #8 ;ROOMS_HIGH
	bcc :+
	lda #$ff
	sta _Row_Buffer+66
	;rts
	jmp Row_Ready
:
	lda _tempX+1
	cmp #8 ;ROOMS_WIDE
	bcc :+
	lda #$ff
	sta _Row_Buffer+66
	;rts
	jmp Row_Ready
:

	lda #<_BG_TABLE
	sta PTR
	lda #>_BG_TABLE
	sta PTR+1
	
;which room to start from? ;64 rooms in 8x8 grid
	lda _tempY+1 ;high byte Y 0-7
	asl a ;2
	asl a ;4
	asl a ;8 0-56
	
	clc
	adc _tempX+1 ;high byte X 0-7
;now we have the room #
	tay
	
;get the nametable of that room
;0 = 0, 1 = 4, 2 = 0, 3 = 4, just use a pre rendered table
	lda Room2Nametable, y
	sta TEMP+2
	
	tya
	asl a ;double it, each room has 2 bytes
	tay
;set up the pointer to that room
	lda (PTR), y
	sta PTR2
	iny
	lda (PTR), y
	sta PTR2+1
	
;which row?
	lda _tempY
	and #$f0 ; high nibble is row of room
	tay
	pha ; save for later
	
;get the position in the nametable, push an address to the buffer	
	ldx #0
	stx TEMP+3
	clc
	asl a ;
	rol TEMP+3 ;0-1
	asl a ;
	rol TEMP+3 ;0-3
	and #$e0
	sta _Row_Buffer+67
	lda TEMP+3
	clc
	adc TEMP+2
	ora #$20
	sta _Row_Buffer+66
	
	
	ldx #0  ;index to buffer
	stx TEMP+4
	ldx #16 ;loop
	stx TEMP+5 ;count loops
:
	lda (PTR2), y
	asl a ;2
	asl a ;4
	tax

	lda Tiles, x ;top left
	sta TEMP+6
	lda Tiles+1, x ;top right
	sta TEMP+7
	lda Tiles+2, x ;bot left
	sta TEMP+8
	lda Tiles+3, x ;bot right
	sta TEMP+9
	
	ldx TEMP+4
	lda TEMP+6
	sta _Row_Buffer+68, x
	lda TEMP+7
	sta _Row_Buffer+69, x
	lda TEMP+8
	sta _Row_Buffer+100, x
	lda TEMP+9
	sta _Row_Buffer+101, x
	
	iny
	inc TEMP+4 ; shift buffer position right 2
	inc TEMP+4
	dec TEMP+5 ; count down
	bne :-	
	
	
;attribute table now
;address
	lda _Row_Buffer+66
	and #$fc
	ora #$03
	sta _AT_Buffer2+10
	
	lda _Row_Buffer+67
	asl a ;y bit now in carry flag
	lda _Row_Buffer+66
	and #$03
	rol a ;0000 0yyy
	asl a ;0000 yyy0
	asl a ;000y yy00
	asl a ;00yy y000
	ora #$c0
	sta _AT_Buffer2+11
	;c0 c8 d0 d8...

	pla ;y I saved earlier
	and #$e0 ;00 20 40 60 80...make sure start at the top half of the AT byte
	tay
	ldx #0  ;index to buffer
	stx TEMP+4
	ldx #8 ;loop
	stx TEMP+5 ;count loops
AT_LOOP2:
	lda (PTR2), y ;metatile
	tax
	lda MT_PALETTE, x
	sta TEMP+6
	
	iny
	lda (PTR2), y ;metatile
	tax
	lda MT_PALETTE, x
	asl a
	asl a
	ora TEMP+6
	sta TEMP+6
	
	tya
	clc
	adc #$0f
	cmp #$f0 ;
	bcc :+ ;
	iny ;
	lda #0 ;
	jmp AT_LOOP2b ;
:	;
	tay
	lda (PTR2), y ;metatile
	tax
	lda MT_PALETTE, x
	asl a
	asl a
	asl a
	asl a
	ora TEMP+6
	sta TEMP+6
	
	iny
	lda (PTR2), y ;metatile
	tax
	lda MT_PALETTE, x
	lsr a
	ror a
	ror a

AT_LOOP2b:	
	ora TEMP+6
	sta TEMP+6
	
	ldx TEMP+4
	sta _AT_Buffer2+12, x
	inc TEMP+4
	
	tya
	sec
	sbc #$0f
	tay
	
	dec TEMP+5
	bne AT_LOOP2
	
	

	
Row_Ready:	
	lda #1
	sta _Row_Buffer_Ready
	rts
	
	
	
MT_PALETTE:
.byte 0,0,0,0,0,0,0,0	
.byte 0,0,0,0,0,0,0,0
.byte 1,0,0,0,0,0,0,0
.byte 0,0,0,0,0,0,0,0	
	
	
	
Room2Nametable:
.byte 0,4,0,4,0,4,0,4	
.byte 8,12,8,12,8,12,8,12	
.byte 0,4,0,4,0,4,0,4	
.byte 8,12,8,12,8,12,8,12
.byte 0,4,0,4,0,4,0,4	
.byte 8,12,8,12,8,12,8,12
.byte 0,4,0,4,0,4,0,4	
.byte 8,12,8,12,8,12,8,12

Tiles: ;4 tiles per metatile
.byte 0,0,0,0
.byte 4,4,4,4
.byte 5,6,8,7
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0

.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0 ;10

.byte 9,9,9,9
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0

.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0
.byte 0,0,0,0 ;20






	
	
_CSV2NT_COL_DRAW:
	lda PPU_CTRL_VAR
	ora #4
	sta $2000 ;make sure top to bottom
	


	lda _Col_Buffer_Ready
	bne :+
	rts
:
	lda _Col_Buffer
	cmp #$ff
	bne :+
	;rts
	jmp UD_AT_DRAW
:


;address
	sta $2006
	lda _Col_Buffer+1
	sta $2006
	
	
;NO LOOPS, MUST BE SUPER FAST	
	lda _Col_Buffer+2
	sta $2007
	lda _Col_Buffer+3
	sta $2007
	lda _Col_Buffer+4
	sta $2007
	lda _Col_Buffer+5
	sta $2007
	lda _Col_Buffer+6
	sta $2007
	lda _Col_Buffer+7
	sta $2007
	lda _Col_Buffer+8
	sta $2007
	lda _Col_Buffer+9
	sta $2007
	lda _Col_Buffer+10
	sta $2007
	lda _Col_Buffer+11 ;10
	sta $2007
	
	lda _Col_Buffer+12
	sta $2007
	lda _Col_Buffer+13
	sta $2007
	lda _Col_Buffer+14
	sta $2007
	lda _Col_Buffer+15
	sta $2007
	lda _Col_Buffer+16
	sta $2007
	lda _Col_Buffer+17
	sta $2007
	lda _Col_Buffer+18
	sta $2007
	lda _Col_Buffer+19
	sta $2007
	lda _Col_Buffer+20
	sta $2007
	lda _Col_Buffer+21 ;20
	sta $2007
	
	lda _Col_Buffer+22
	sta $2007
	lda _Col_Buffer+23
	sta $2007
	lda _Col_Buffer+24
	sta $2007
	lda _Col_Buffer+25
	sta $2007
	lda _Col_Buffer+26
	sta $2007
	lda _Col_Buffer+27
	sta $2007
	lda _Col_Buffer+28
	sta $2007
	lda _Col_Buffer+29
	sta $2007
	lda _Col_Buffer+30
	sta $2007
	lda _Col_Buffer+31 ;30
	sta $2007
	
;address again, 1 to the right	
	lda _Col_Buffer
	sta $2006
	lda _Col_Buffer+1
	clc
	adc #1
	sta $2006
	
	lda _Col_Buffer+32
	sta $2007
	lda _Col_Buffer+33
	sta $2007
	lda _Col_Buffer+34
	sta $2007
	lda _Col_Buffer+35
	sta $2007
	lda _Col_Buffer+36
	sta $2007
	lda _Col_Buffer+37
	sta $2007
	lda _Col_Buffer+38
	sta $2007
	lda _Col_Buffer+39
	sta $2007
	lda _Col_Buffer+40
	sta $2007
	lda _Col_Buffer+41 ;40
	sta $2007
	
	lda _Col_Buffer+42
	sta $2007
	lda _Col_Buffer+43
	sta $2007
	lda _Col_Buffer+44
	sta $2007
	lda _Col_Buffer+45
	sta $2007
	lda _Col_Buffer+46
	sta $2007
	lda _Col_Buffer+47
	sta $2007
	lda _Col_Buffer+48
	sta $2007
	lda _Col_Buffer+49
	sta $2007
	lda _Col_Buffer+50
	sta $2007
	lda _Col_Buffer+51 ;50
	sta $2007
	
	lda _Col_Buffer+52
	sta $2007
	lda _Col_Buffer+53
	sta $2007
	lda _Col_Buffer+54
	sta $2007
	lda _Col_Buffer+55
	sta $2007
	lda _Col_Buffer+56
	sta $2007
	lda _Col_Buffer+57
	sta $2007
	lda _Col_Buffer+58
	sta $2007
	lda _Col_Buffer+59
	sta $2007
	lda _Col_Buffer+60
	sta $2007
	lda _Col_Buffer+61 ;60
	sta $2007
	

	
	
	
;other nametable
	lda _Col_Buffer+62 ;control byte
	cmp #$ff
	bne :+
	;rts
	jmp UD_AT_DRAW
:
;address
	sta $2006
	lda _Col_Buffer+63
	sta $2006
	
	
;NO LOOPS, MUST BE SUPER FAST	
	lda _Col_Buffer+64
	sta $2007
	lda _Col_Buffer+65
	sta $2007
	lda _Col_Buffer+66
	sta $2007
	lda _Col_Buffer+67
	sta $2007
	lda _Col_Buffer+68
	sta $2007
	lda _Col_Buffer+69
	sta $2007
	lda _Col_Buffer+70
	sta $2007
	lda _Col_Buffer+71
	sta $2007
	lda _Col_Buffer+72
	sta $2007
	lda _Col_Buffer+73 ;10
	sta $2007
	
	lda _Col_Buffer+74
	sta $2007
	lda _Col_Buffer+75
	sta $2007
	lda _Col_Buffer+76
	sta $2007
	lda _Col_Buffer+77
	sta $2007
	lda _Col_Buffer+78
	sta $2007
	lda _Col_Buffer+79
	sta $2007
	lda _Col_Buffer+80
	sta $2007
	lda _Col_Buffer+81
	sta $2007
	lda _Col_Buffer+82
	sta $2007
	lda _Col_Buffer+83 ;20
	sta $2007
	
	lda _Col_Buffer+84
	sta $2007
	lda _Col_Buffer+85
	sta $2007
	lda _Col_Buffer+86
	sta $2007
	lda _Col_Buffer+87
	sta $2007
	lda _Col_Buffer+88
	sta $2007
	lda _Col_Buffer+89
	sta $2007
	lda _Col_Buffer+90
	sta $2007
	lda _Col_Buffer+91
	sta $2007
	lda _Col_Buffer+92
	sta $2007
	lda _Col_Buffer+93 ;30
	sta $2007
	
;address again, 1 to the right	
	lda _Col_Buffer+62
	sta $2006
	lda _Col_Buffer+63
	clc
	adc #1
	sta $2006
	
	lda _Col_Buffer+94
	sta $2007
	lda _Col_Buffer+95
	sta $2007
	lda _Col_Buffer+96
	sta $2007
	lda _Col_Buffer+97
	sta $2007
	lda _Col_Buffer+98
	sta $2007
	lda _Col_Buffer+99
	sta $2007
	lda _Col_Buffer+100
	sta $2007
	lda _Col_Buffer+101
	sta $2007
	lda _Col_Buffer+102
	sta $2007
	lda _Col_Buffer+103 ;40
	sta $2007
	
	lda _Col_Buffer+104
	sta $2007
	lda _Col_Buffer+105
	sta $2007
	lda _Col_Buffer+106
	sta $2007
	lda _Col_Buffer+107
	sta $2007
	lda _Col_Buffer+108
	sta $2007
	lda _Col_Buffer+109
	sta $2007
	lda _Col_Buffer+110
	sta $2007
	lda _Col_Buffer+111
	sta $2007
	lda _Col_Buffer+112
	sta $2007
	lda _Col_Buffer+113 ;50
	sta $2007
	
	lda _Col_Buffer+114
	sta $2007
	lda _Col_Buffer+115
	sta $2007
	lda _Col_Buffer+116
	sta $2007
	lda _Col_Buffer+117
	sta $2007
	lda _Col_Buffer+118
	sta $2007
	lda _Col_Buffer+119
	sta $2007
	lda _Col_Buffer+120
	sta $2007
	lda _Col_Buffer+121
	sta $2007
	lda _Col_Buffer+122
	sta $2007
	lda _Col_Buffer+123 ;60
	sta $2007
	
	
	
	
UD_AT_DRAW:
	lda _AT_Buffer1 ;address
	bne :+
	jmp Col_Clear
:
	sta $2006
	lda _AT_Buffer1+1
	sta $2006
	
	lda _AT_Buffer1+2 
	sta $2007
	lda _AT_Buffer1+6 
	sta $2007
	
	lda _AT_Buffer1 ;address
	sta $2006
	lda _AT_Buffer1+1
		clc
		adc #8
	sta $2006
	
	lda _AT_Buffer1+3 
	sta $2007
	lda _AT_Buffer1+7 
	sta $2007
	
	lda _AT_Buffer1 ;address
	sta $2006
	lda _AT_Buffer1+1
		clc
		adc #$10
	sta $2006
	
	lda _AT_Buffer1+4 
	sta $2007
	lda _AT_Buffer1+8 
	sta $2007
	
	lda _AT_Buffer1 ;address
	sta $2006
	lda _AT_Buffer1+1
		clc
		adc #$18
	sta $2006
	
	lda _AT_Buffer1+5 
	sta $2007
	lda _AT_Buffer1+9 
	sta $2007
	
;**********************	
	lda _AT_Buffer1+10 ;address
	beq Col_Clear
	sta $2006
	lda _AT_Buffer1+11
	sta $2006
	
	lda _AT_Buffer1+12 
	sta $2007
	lda _AT_Buffer1+16 
	sta $2007
	
	lda _AT_Buffer1+10 ;address
	sta $2006
	lda _AT_Buffer1+11
		clc
		adc #8
	sta $2006
	
	lda _AT_Buffer1+13 
	sta $2007
	lda _AT_Buffer1+17 
	sta $2007
	
	lda _AT_Buffer1+10 ;address
	sta $2006
	lda _AT_Buffer1+11
		clc
		adc #$10
	sta $2006
	
	lda _AT_Buffer1+14 
	sta $2007
	lda _AT_Buffer1+18 
	sta $2007
	
	lda _AT_Buffer1+10 ;address
	sta $2006
	lda _AT_Buffer1+11
		clc
		adc #$18
	sta $2006
	
	lda _AT_Buffer1+15 
	sta $2007
	lda _AT_Buffer1+19 
	sta $2007
	
	
Col_Clear:	
	lda #0
	sta _Col_Buffer_Ready
	rts
	
	
	
	
	
	
	
_CSV2NT_ROW_DRAW:
	lda PPU_CTRL_VAR
	and #$fb ;remove the 4
	sta $2000 ;to ensure left to right

	lda _Row_Buffer_Ready
	bne :+
	rts
:
	lda _Row_Buffer
	cmp #$ff
	bne :+
	;rts
	jmp LR_AT_DRAW
:


;address
	sta $2006
	lda _Row_Buffer+1
	sta $2006

;NO LOOPS, MUST BE SUPER FAST
	lda _Row_Buffer+2
	sta $2007
	lda _Row_Buffer+3
	sta $2007
	lda _Row_Buffer+4
	sta $2007
	lda _Row_Buffer+5
	sta $2007
	lda _Row_Buffer+6
	sta $2007
	lda _Row_Buffer+7
	sta $2007
	lda _Row_Buffer+8
	sta $2007
	lda _Row_Buffer+9
	sta $2007
	lda _Row_Buffer+10
	sta $2007
	lda _Row_Buffer+11 ;10
	sta $2007
	
	lda _Row_Buffer+12
	sta $2007
	lda _Row_Buffer+13
	sta $2007
	lda _Row_Buffer+14
	sta $2007
	lda _Row_Buffer+15
	sta $2007
	lda _Row_Buffer+16
	sta $2007
	lda _Row_Buffer+17
	sta $2007
	lda _Row_Buffer+18
	sta $2007
	lda _Row_Buffer+19
	sta $2007
	lda _Row_Buffer+20
	sta $2007
	lda _Row_Buffer+21 ;20
	sta $2007
	
	lda _Row_Buffer+22
	sta $2007
	lda _Row_Buffer+23
	sta $2007
	lda _Row_Buffer+24
	sta $2007
	lda _Row_Buffer+25
	sta $2007
	lda _Row_Buffer+26
	sta $2007
	lda _Row_Buffer+27
	sta $2007
	lda _Row_Buffer+28
	sta $2007
	lda _Row_Buffer+29
	sta $2007
	lda _Row_Buffer+30
	sta $2007
	lda _Row_Buffer+31 ;30
	sta $2007
	
	lda _Row_Buffer+32
	sta $2007
	lda _Row_Buffer+33
	sta $2007
	lda _Row_Buffer+34
	sta $2007
	lda _Row_Buffer+35
	sta $2007
	lda _Row_Buffer+36
	sta $2007
	lda _Row_Buffer+37
	sta $2007
	lda _Row_Buffer+38
	sta $2007
	lda _Row_Buffer+39
	sta $2007
	lda _Row_Buffer+40
	sta $2007
	lda _Row_Buffer+41 ;40
	sta $2007
	
	lda _Row_Buffer+42
	sta $2007
	lda _Row_Buffer+43
	sta $2007
	lda _Row_Buffer+44
	sta $2007
	lda _Row_Buffer+45
	sta $2007
	lda _Row_Buffer+46
	sta $2007
	lda _Row_Buffer+47
	sta $2007
	lda _Row_Buffer+48
	sta $2007
	lda _Row_Buffer+49
	sta $2007
	lda _Row_Buffer+50
	sta $2007
	lda _Row_Buffer+51 ;50
	sta $2007
	
	lda _Row_Buffer+52
	sta $2007
	lda _Row_Buffer+53
	sta $2007
	lda _Row_Buffer+54
	sta $2007
	lda _Row_Buffer+55
	sta $2007
	lda _Row_Buffer+56
	sta $2007
	lda _Row_Buffer+57
	sta $2007
	lda _Row_Buffer+58
	sta $2007
	lda _Row_Buffer+59
	sta $2007
	lda _Row_Buffer+60
	sta $2007
	lda _Row_Buffer+61 ;60
	sta $2007
	
	lda _Row_Buffer+62
	sta $2007
	lda _Row_Buffer+63
	sta $2007
	lda _Row_Buffer+64
	sta $2007
	lda _Row_Buffer+65
	sta $2007
	
	
;address	
	lda _Row_Buffer+66
	cmp #$ff
	bne :+
	;rts
	jmp LR_AT_DRAW
:
	sta $2006
	lda _Row_Buffer+67
	sta $2006
	
;NO LOOPS, MUST BE SUPER FAST
	lda _Row_Buffer+68
	sta $2007
	lda _Row_Buffer+69
	sta $2007
	lda _Row_Buffer+70
	sta $2007
	lda _Row_Buffer+71
	sta $2007
	lda _Row_Buffer+72
	sta $2007
	lda _Row_Buffer+73
	sta $2007
	lda _Row_Buffer+74
	sta $2007
	lda _Row_Buffer+75
	sta $2007
	lda _Row_Buffer+76
	sta $2007
	lda _Row_Buffer+77 ;10
	sta $2007
	
	lda _Row_Buffer+78
	sta $2007
	lda _Row_Buffer+79
	sta $2007
	lda _Row_Buffer+80
	sta $2007
	lda _Row_Buffer+81
	sta $2007
	lda _Row_Buffer+82
	sta $2007
	lda _Row_Buffer+83
	sta $2007
	lda _Row_Buffer+84
	sta $2007
	lda _Row_Buffer+85
	sta $2007
	lda _Row_Buffer+86
	sta $2007
	lda _Row_Buffer+87 ;20
	sta $2007
	
	lda _Row_Buffer+88
	sta $2007
	lda _Row_Buffer+89
	sta $2007
	lda _Row_Buffer+90
	sta $2007
	lda _Row_Buffer+91
	sta $2007
	lda _Row_Buffer+92
	sta $2007
	lda _Row_Buffer+93
	sta $2007
	lda _Row_Buffer+94
	sta $2007
	lda _Row_Buffer+95
	sta $2007
	lda _Row_Buffer+96
	sta $2007
	lda _Row_Buffer+97 ;30
	sta $2007
	
	lda _Row_Buffer+98
	sta $2007
	lda _Row_Buffer+99
	sta $2007
	lda _Row_Buffer+100
	sta $2007
	lda _Row_Buffer+101
	sta $2007
	lda _Row_Buffer+102
	sta $2007
	lda _Row_Buffer+103
	sta $2007
	lda _Row_Buffer+104
	sta $2007
	lda _Row_Buffer+105
	sta $2007
	lda _Row_Buffer+106
	sta $2007
	lda _Row_Buffer+107 ;40
	sta $2007

	lda _Row_Buffer+108
	sta $2007
	lda _Row_Buffer+109
	sta $2007
	lda _Row_Buffer+110
	sta $2007
	lda _Row_Buffer+111
	sta $2007
	lda _Row_Buffer+112
	sta $2007
	lda _Row_Buffer+113
	sta $2007
	lda _Row_Buffer+114
	sta $2007
	lda _Row_Buffer+115
	sta $2007
	lda _Row_Buffer+116
	sta $2007
	lda _Row_Buffer+117 ;50
	sta $2007

	lda _Row_Buffer+118
	sta $2007
	lda _Row_Buffer+119
	sta $2007
	lda _Row_Buffer+120
	sta $2007
	lda _Row_Buffer+121
	sta $2007
	lda _Row_Buffer+122
	sta $2007
	lda _Row_Buffer+123
	sta $2007
	lda _Row_Buffer+124
	sta $2007
	lda _Row_Buffer+125
	sta $2007
	lda _Row_Buffer+126
	sta $2007
	lda _Row_Buffer+127 ;60
	sta $2007
	
	lda _Row_Buffer+128
	sta $2007
	lda _Row_Buffer+129
	sta $2007
	lda _Row_Buffer+130
	sta $2007
	lda _Row_Buffer+131
	sta $2007
	
	
	
LR_AT_DRAW:	
	lda _AT_Buffer2 ;address
	beq Row_Clear
	sta $2006
	lda _AT_Buffer2+1
	sta $2006
	
	lda _AT_Buffer2+2
	sta $2007
	lda _AT_Buffer2+3
	sta $2007
	lda _AT_Buffer2+4
	sta $2007
	lda _AT_Buffer2+5
	sta $2007
	lda _AT_Buffer2+6
	sta $2007
	lda _AT_Buffer2+7
	sta $2007
	lda _AT_Buffer2+8
	sta $2007
	lda _AT_Buffer2+9
	sta $2007
	
	lda _AT_Buffer2+10 ;address
	beq Row_Clear
	sta $2006
	lda _AT_Buffer2+11
	sta $2006
	
	lda _AT_Buffer2+12
	sta $2007
	lda _AT_Buffer2+13
	sta $2007
	lda _AT_Buffer2+14
	sta $2007
	lda _AT_Buffer2+15
	sta $2007
	lda _AT_Buffer2+16
	sta $2007
	lda _AT_Buffer2+17
	sta $2007
	lda _AT_Buffer2+18
	sta $2007
	lda _AT_Buffer2+19
	sta $2007
	
	
	
Row_Clear:	
	lda #0
	sta _Row_Buffer_Ready
	rts
	