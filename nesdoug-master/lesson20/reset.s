; Startup code for cc65/ca65

	.import _main
	.importzp _NMI_flag, _Frame_Count, _Scroll_Index, _Scroll
	.export __STARTUP__:absolute=1

; Linker generated symbols
	.import __STACK_START__, __STACK_SIZE__
    .include "zeropage.inc"
	.import initlib, copydata



.segment "ZEROPAGE"


;no variables yet

.segment "RODATA"
.segment "INIT"


.segment "HEADER"

    .byte $4e,$45,$53,$1a
	.byte $04
	.byte $08
	.byte $40
	.byte 00
	.res 8,0



.segment "STARTUP"
;the startup code should be in the last bank!

.byte $42, $61, $6E, $6B, $37 ;= "Bank7"

start:
	sei
	cld
	ldx #$40
	stx $4017
	ldx #$ff
	txs
	inx
	stx $2000
	stx $2001
	stx $4010
:
	lda $2002
	bpl :-
	lda #$00
Blankram:			;puts zero in all CPU RAM
	sta $00, x
	sta $0100, x
	sta $0200, x
	sta $0300, x
	sta $0400, x
	sta $0500, x
	sta $0600, x
	sta $0700, x
	inx
	bne Blankram
	
:
	lda $2002
	bpl :-

Isprites:
	jsr Blanksprite
	lda #$00		;pushes all sprites from 200-2ff
	sta $2003		;to the sprite memory
	lda #$02
	sta $4014
	
	jsr ClearNT		;puts zero in all PPU RAM

MusicInit:			;turns music channels off
	lda #0
	sta $4015
	
	lda #<(__STACK_START__+__STACK_SIZE__)
    sta	sp
    lda	#>(__STACK_START__+__STACK_SIZE__)
    sta	sp+1            ; Set the c stack pointer
	
	jsr	copydata
	jsr	initlib
	
	lda $2002		;reset the 'latch'
	jmp _main		;jumps to main in c code


	
	

	
_Blanksprite:
Blanksprite:
	ldy #$40
	ldx #$00
	lda #$f8
Blanksprite2:		;puts all sprites off screen
	sta $0200, x
	inx
	inx
	inx
	inx
	dey
	bne Blanksprite2
	rts
	


_ClearNT:
ClearNT:
	lda $2002
	lda #$20
	sta $2006
	lda #$00
	sta $2006
	lda #$00	;tile 00 is blank
	ldy #$10
	ldx #$00
BlankName:		;blanks screen
	sta $2007
	dex
	bne BlankName
	dey
	bne BlankName
	rts







nmi:
	pha
	tya
	pha
	txa
	pha
	
	inc _NMI_flag
	inc _Frame_Count

	lda #0
	sta $2003
	lda #2
	sta $4014 ;push sprite data to OAM from $200-2ff
	lda #$88
	sta $2000 ;nmi on
	lda #$1e
	sta $2001 ;screen on
	lda $2002 ;reset the latch
	lda #0
	sta $2005
	sta $2005 ;reset the scrolling
	
	pla
	tax
	pla
	tay
	pla
	rti

	
	
	
;I'm waiting, because I want to do the Scroll split at
;exactly the H-Blank period, so it isn't so glitchy
;it's about 114 cycles per line, I'm waiting about 90 cycles
;between the IRQ trigger and the actual scroll change.
;fceux prefers a few more cycles, it's not the most accurate
;so I'm going to agree with Nintendulator and Nestopia

irq:
	pha
	txa
	pha
	tya
	pha
	ldy #15	;wait a little, loop 15 times
:	dey		;2 cycles
	bne :- 	;3 cycles

	ldx _Scroll_Index ;each time the irq fires, it fetches a different byte from and array
	lda _Scroll, x
	sta $2005	;change the horizontal scroll
	lda #0
	sta $2005	;vertical scroll = 0
	inc _Scroll_Index
	
	lda #1
	sta $e000 ; acknowledge the irq, turn off the counter
	lda #20
	sta $c000 ; set up the next irq, 20 scanlines
	sta $c001
	lda #1
	sta $e001 ; turn on the scanline counter
    pla
	tay
	pla
	tax
	pla
	rti




.segment "VECTORS"

    .word nmi	;$fffa vblank nmi
    .word start	;$fffc reset
   	.word irq	;$fffe irq / brk


.segment "CHARS"

	.incbin "BG.chr"
