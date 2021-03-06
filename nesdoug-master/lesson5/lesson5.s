;
; File generated by cc65 v 2.16 - Git 83890e5
;
	.fopt		compiler,"cc65 v 2.16 - Git 83890e5"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.export		_NMI_flag
	.export		_Frame_Count
	.export		_index
	.export		_index4
	.export		_X1
	.export		_Y1
	.export		_state
	.export		_state4
	.export		_joypad1
	.export		_joypad1old
	.export		_joypad1test
	.export		_joypad2
	.export		_joypad2old
	.export		_joypad2test
	.export		_SPRITES
	.export		_PALETTE
	.export		_MetaSprite_Y
	.export		_MetaSprite_Tile
	.export		_MetaSprite_Attrib
	.export		_MetaSprite_X
	.export		_All_Off
	.export		_All_On
	.export		_Reset_Scroll
	.export		_Load_Palette
	.export		_update_Sprites
	.export		_move_logic
	.import		_Get_Input
	.export		_main

.segment	"RODATA"

_PALETTE:
	.byte	$19
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$19
	.byte	$37
	.byte	$24
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_MetaSprite_Y:
	.byte	$00
	.byte	$00
	.byte	$08
	.byte	$08
_MetaSprite_Tile:
	.byte	$02
	.byte	$03
	.byte	$12
	.byte	$13
	.byte	$00
	.byte	$01
	.byte	$10
	.byte	$11
	.byte	$06
	.byte	$07
	.byte	$16
	.byte	$17
	.byte	$04
	.byte	$05
	.byte	$14
	.byte	$15
_MetaSprite_Attrib:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_MetaSprite_X:
	.byte	$00
	.byte	$08
	.byte	$00
	.byte	$08

.segment	"BSS"

.segment	"ZEROPAGE"
_NMI_flag:
	.res	1,$00
_Frame_Count:
	.res	1,$00
_index:
	.res	1,$00
_index4:
	.res	1,$00
_X1:
	.res	1,$00
_Y1:
	.res	1,$00
_state:
	.res	1,$00
_state4:
	.res	1,$00
_joypad1:
	.res	1,$00
_joypad1old:
	.res	1,$00
_joypad1test:
	.res	1,$00
_joypad2:
	.res	1,$00
_joypad2old:
	.res	1,$00
_joypad2test:
	.res	1,$00
.segment	"OAM"
_SPRITES:
	.res	256,$00

; ---------------------------------------------------------------
; void __near__ All_Off (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_All_Off: near

.segment	"CODE"

;
; PPU_CTRL = 0;
;
	lda     #$00
	sta     $2000
;
; PPU_MASK = 0; 
;
	sta     $2001
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ All_On (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_All_On: near

.segment	"CODE"

;
; PPU_CTRL = 0x90; // screen is on, NMI on
;
	lda     #$90
	sta     $2000
;
; PPU_MASK = 0x1e; 
;
	lda     #$1E
	sta     $2001
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ Reset_Scroll (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Reset_Scroll: near

.segment	"CODE"

;
; PPU_ADDRESS = 0;
;
	lda     #$00
	sta     $2006
;
; PPU_ADDRESS = 0;
;
	sta     $2006
;
; SCROLL = 0;
;
	sta     $2005
;
; SCROLL = 0;
;
	sta     $2005
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ Load_Palette (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Load_Palette: near

.segment	"CODE"

;
; PPU_ADDRESS = 0x3f;
;
	lda     #$3F
	sta     $2006
;
; PPU_ADDRESS = 0x00;
;
	lda     #$00
	sta     $2006
;
; for( index = 0; index < sizeof(PALETTE); ++index ){
;
	sta     _index
L00CB:	lda     _index
	cmp     #$20
	bcs     L0079
;
; PPU_DATA = PALETTE[index];
;
	ldy     _index
	lda     _PALETTE,y
	sta     $2007
;
; for( index = 0; index < sizeof(PALETTE); ++index ){
;
	inc     _index
	jmp     L00CB
;
; }
;
L0079:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ update_Sprites (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_update_Sprites: near

.segment	"CODE"

;
; state4 = state << 2; // same as state * 4
;
	lda     _state
	asl     a
	asl     a
	sta     _state4
;
; index4 = 0;
;
	lda     #$00
	sta     _index4
;
; for (index = 0; index < 4; ++index ){
;
	sta     _index
L00CF:	lda     _index
	cmp     #$04
	bcc     L00D0
;
; }
;
	rts
;
; SPRITES[index4] = MetaSprite_Y[index] + Y1; // relative y + master y
;
L00D0:	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0095
	inx
L0095:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Y,y
	clc
	adc     _Y1
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Tile[index + state4]; // tile numbers
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L009C
	inx
L009C:	sta     sreg
	stx     sreg+1
	ldx     #$00
	lda     _index
	clc
	adc     _state4
	bcc     L00CD
	inx
L00CD:	sta     ptr1
	txa
	clc
	adc     #>(_MetaSprite_Tile)
	sta     ptr1+1
	ldy     #<(_MetaSprite_Tile)
	lda     (ptr1),y
	ldy     #$00
	sta     (sreg),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Attrib[index]; // attributes, all zero here
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L00A2
	inx
L00A2:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Attrib,y
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L00A9
	inx
L00A9:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_X,y
	clc
	adc     _X1
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; for (index = 0; index < 4; ++index ){
;
	inc     _index
	jmp     L00CF

.endproc

; ---------------------------------------------------------------
; void __near__ move_logic (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_move_logic: near

.segment	"CODE"

;
; if ((joypad1 & RIGHT) != 0){
;
	lda     _joypad1
	and     #$01
	beq     L00D1
;
; state = Going_Right;
;
	lda     #$00
	sta     _state
;
; ++X1;
;
	inc     _X1
;
; if ((joypad1 & LEFT) != 0){
;
L00D1:	lda     _joypad1
	and     #$02
	beq     L00D2
;
; state = Going_Left;
;
	lda     #$02
	sta     _state
;
; --X1;
;
	dec     _X1
;
; if ((joypad1 & DOWN) != 0){
;
L00D2:	lda     _joypad1
	and     #$04
	beq     L00D3
;
; state = Going_Down;
;
	lda     #$01
	sta     _state
;
; ++Y1;
;
	inc     _Y1
;
; if ((joypad1 & UP) != 0){
;
L00D3:	lda     _joypad1
	and     #$08
	beq     L00C4
;
; state = Going_Up;
;
	lda     #$03
	sta     _state
;
; --Y1;
;
	dec     _Y1
;
; }
;
L00C4:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; All_Off();  // turn off screen
;
	jsr     _All_Off
;
; X1 = 0x7f;  // set the starting position of the top left sprite
;
	lda     #$7F
	sta     _X1
;
; Y1 = 0x77;   // middle of screen
;
	lda     #$77
	sta     _Y1
;
; Load_Palette();
;
	jsr     _Load_Palette
;
; Reset_Scroll();
;
	jsr     _Reset_Scroll
;
; All_On();   // turn on screen
;
	jsr     _All_On
;
; while (NMI_flag == 0); // wait till NMI
;
L00D4:	lda     _NMI_flag
	beq     L00D4
;
; Get_Input();
;
	jsr     _Get_Input
;
; move_logic();
;
	jsr     _move_logic
;
; update_Sprites();
;
	jsr     _update_Sprites
;
; NMI_flag = 0;
;
	lda     #$00
	sta     _NMI_flag
;
; while (1){   // infinite loop
;
	jmp     L00D4

.endproc

