; sprite object collision code, in ASM
; this would work with any size struct, as long as the first 4 bytes are...
; x, y, width, height

.export _CheckCollision, _BGCollisionRL, _BGCollisionUD
.import _tempX, _tempY


;note PTR is the same as TEMP and TEMP+1
;note2, I added a PTR2 (2 bytes) in crt0.s

;collision Sprite vs Sprite
_CheckCollision:

	sta PTR
	stx PTR+1 ;set up a pointer to the first object
	jsr popax
	sta PTR2
	stx PTR2+1 ;set up a pointer to the second object
	
	;move the stuct elements to TEMP+2...TEMP+9
	ldy #0
	lda (PTR),y
	sta TEMP+2
	lda (PTR2), y
	sta TEMP+6
	iny
	lda (PTR),y
	sta TEMP+3
	lda (PTR2), y
	sta TEMP+7
	iny
	lda (PTR),y
	sta TEMP+4
	lda (PTR2), y
	sta TEMP+8
	iny
	lda (PTR),y
	sta TEMP+5
	lda (PTR2), y
	sta TEMP+9
	
	;see if they are colliding
	
; struct BoxGuy {
	; unsigned char X;
	; unsigned char Y;
	; unsigned char width;
	; unsigned char height;
	
;first check if obj1 R (obj1 x + width) < obj2 L
	
	lda TEMP+2 ;X 1
	clc
	adc TEMP+4 ;width 1

	cmp TEMP+6 ;X 2
	bcc No_Collision
	
;now check if obj1 L > obj2 R (obj2 x + width)

	lda TEMP+6 ;X 2
	clc
	adc TEMP+8 ;width 2

	cmp TEMP+2 ;X 1
	bcc No_Collision

;now check if obj1 Bottom < obj2 Top

	lda TEMP+3 ;Y 1
	clc
	adc TEMP+5 ;Y height

	cmp TEMP+7 ;Y 2
	bcc No_Collision

;now check if obj1 Top > obj2 Bottom (T + height)

	lda TEMP+7 ;Y 2
	clc
	adc TEMP+9 ;height 2

	cmp TEMP+3 ;Y 1
	bcc No_Collision

;YES, collision
	lda #1
	rts
	
No_Collision:
	lda #0
	rts

	
	
	
	
	
	
	
	
;collision w background, 2 points, 2 args _tempX, _tempY
_BGCollisionRL:

	ldx _tempY+1 ;high byte
	lda _tempY ;low byte
	clc
	adc #2 ;this should never overflow, y low should be < 0xf0
	cmp #$f0
	bcc :+
	clc
	adc #$10
	inx
:

	jsr Collision_Shared
	beq :+
	lda #1
	rts
:

;do it again, a few pixels lower, make sure y ! >= 0xf0
	ldx _tempY+1 ;high byte
	lda _tempY ;low byte
	clc
	adc #12 ;this should never overflow, y low should be < 0xf0
	cmp #$f0
	bcc :+
	clc
	adc #$10
	inx
:
	sta _tempY
	stx _tempY+1
	jsr Collision_Shared
	beq :+
	lda #1
	rts
:
	lda #0
	rts
	
	
;collision w background, 2 points, 2 args _tempX, _tempY
_BGCollisionUD:

	jsr Collision_Shared
	beq :+
	lda #1
	rts
:

;do it again, a few pixels to the right
	ldx _tempX+1 ;high byte
	lda _tempX ;low byte
	clc
	adc #15
	bcc :+
	inx
:
	sta _tempX
	stx _tempX+1
	
	jsr Collision_Shared
	beq :+
	lda #1
	rts
:
	lda #0
	rts
	
	
	
	
	
	
	
	
Collision_Shared:	
	lda #<_BG_TABLE
	sta PTR
	lda #>_BG_TABLE
	sta PTR+1
;get room x2 into y
	lda _tempY+1 ;high byte Y 0-7
	asl a ;2
	asl a ;4
	asl a ;8 0-56
	
	clc
	adc _tempX+1	
	asl a ;x 2
	tay
	
;set up the pointer to that room
	lda (PTR), y
	sta PTR2
	iny
	lda (PTR), y
	sta PTR2+1

;get position in the room
	lda _tempX
	lsr a
	lsr a
	lsr a
	lsr a
	sta TEMP+2
	lda _tempY
	and #$f0
	clc
	adc TEMP+2
	tay
	
	lda (PTR2), y
	tax
	lda MT_Solid, x
	rts
	
	
MT_Solid:
.byte 0,1,1,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
.byte 1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
.byte 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
.byte 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0