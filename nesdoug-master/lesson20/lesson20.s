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
	.import		_UnRLE
	.import		_Get_Input
	.import		_Wait_Vblank
	.import		_Add_Scroll
	.export		_NMI_flag
	.export		_Frame_Count
	.export		_index
	.export		_joypad1
	.export		_joypad1old
	.export		_joypad1test
	.export		_joypad2
	.export		_joypad2old
	.export		_joypad2test
	.export		_CHRbank
	.export		_PRGbank
	.export		_Scroll_Index
	.export		_Scroll
	.export		_temp
	.export		_TEXT1
	.export		_TEXT2
	.export		_TEXT3
	.export		_TEXT4
	.export		_TEXT5
	.export		_TEXT6
	.export		_TEXT7
	.export		_NT
	.export		_All_Off
	.export		_All_On
	.export		_Reset_Scroll
	.export		_Palette
	.export		_Load_Palette
	.export		_Draw_Bank_Num
	.export		_Initialize_MMC3
	.export		_main

.segment	"RODATA"

.segment	"CODE0"
_TEXT1:
	.byte	$42,$61,$6E,$6B,$30,$00
.segment	"CODE1"
_TEXT2:
	.byte	$42,$61,$6E,$6B,$31,$00
.segment	"CODE2"
_TEXT3:
	.byte	$42,$61,$6E,$6B,$32,$00
.segment	"CODE3"
_TEXT4:
	.byte	$42,$61,$6E,$6B,$33,$00
.segment	"CODE4"
_TEXT5:
	.byte	$42,$61,$6E,$6B,$34,$00
.segment	"CODE5"
_TEXT6:
	.byte	$42,$61,$6E,$6B,$35,$00
.segment	"CODE6"
_TEXT7:
	.byte	$42,$61,$6E,$6B,$36,$00
.segment	"CODE"
_NT:
	.byte	$09
	.byte	$00
	.byte	$09
	.byte	$0C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$15
	.byte	$42
	.byte	$61
	.byte	$6E
	.byte	$6B
	.byte	$30
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$1C
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$09
	.byte	$35
	.byte	$05
	.byte	$04
	.byte	$09
	.byte	$02
	.byte	$0E
	.byte	$09
	.byte	$03
	.byte	$04
	.byte	$09
	.byte	$02
	.byte	$06
	.byte	$00
	.byte	$09
	.byte	$13
	.byte	$07
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$0F
	.byte	$09
	.byte	$03
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$08
	.byte	$00
	.byte	$09
	.byte	$13
	.byte	$07
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$0F
	.byte	$09
	.byte	$03
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$08
	.byte	$00
	.byte	$09
	.byte	$13
	.byte	$07
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$0F
	.byte	$09
	.byte	$03
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$08
	.byte	$00
	.byte	$09
	.byte	$13
	.byte	$07
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$0F
	.byte	$09
	.byte	$03
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$08
	.byte	$00
	.byte	$09
	.byte	$13
	.byte	$07
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$0F
	.byte	$09
	.byte	$03
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$08
	.byte	$00
	.byte	$09
	.byte	$13
	.byte	$07
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$0D
	.byte	$09
	.byte	$03
	.byte	$02
	.byte	$09
	.byte	$02
	.byte	$08
	.byte	$00
	.byte	$09
	.byte	$0D
	.byte	$01
	.byte	$09
	.byte	$09
	.byte	$0C
	.byte	$09
	.byte	$03
	.byte	$01
	.byte	$09
	.byte	$1B
	.byte	$0C
	.byte	$09
	.byte	$03
	.byte	$01
	.byte	$09
	.byte	$1B
	.byte	$0C
	.byte	$09
	.byte	$03
	.byte	$01
	.byte	$09
	.byte	$1B
	.byte	$0C
	.byte	$09
	.byte	$03
	.byte	$01
	.byte	$09
	.byte	$1B
	.byte	$0C
	.byte	$09
	.byte	$03
	.byte	$01
	.byte	$09
	.byte	$1B
	.byte	$0C
	.byte	$09
	.byte	$03
	.byte	$01
	.byte	$09
	.byte	$11
	.byte	$00
	.byte	$09
	.byte	$02
	.byte	$55
	.byte	$00
	.byte	$09
	.byte	$04
	.byte	$04
	.byte	$05
	.byte	$55
	.byte	$00
	.byte	$09
	.byte	$06
	.byte	$55
	.byte	$00
	.byte	$09
	.byte	$06
	.byte	$55
	.byte	$00
	.byte	$09
	.byte	$05
	.byte	$44
	.byte	$11
	.byte	$00
	.byte	$09
	.byte	$05
	.byte	$44
	.byte	$11
	.byte	$00
	.byte	$09
	.byte	$05
	.byte	$44
	.byte	$11
	.byte	$00
	.byte	$09
	.byte	$05
	.byte	$04
	.byte	$01
	.byte	$00
	.byte	$09
	.byte	$03
	.byte	$09
	.byte	$00
_Palette:
	.byte	$21
	.byte	$09
	.byte	$2A
	.byte	$2A
	.byte	$21
	.byte	$0C
	.byte	$1C
	.byte	$3C

.segment	"BSS"

_NMI_flag:
	.res	1,$00
_Frame_Count:
	.res	1,$00
_index:
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
_CHRbank:
	.res	1,$00
_PRGbank:
	.res	1,$00
_Scroll_Index:
	.res	1,$00
_Scroll:
	.res	10,$00
_temp:
	.res	1,$00

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
; PPU_CTRL = 0x88; // screen is on, NMI on
;
	lda     #$88
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
; for(index = 0;index<sizeof(Palette);++index){
;
	sta     _index
L01F3:	lda     _index
	cmp     #$08
	bcs     L0165
;
; PPU_DATA = Palette[index];
;
	ldy     _index
	lda     _Palette,y
	sta     $2007
;
; for(index = 0;index<sizeof(Palette);++index){
;
	inc     _index
	jmp     L01F3
;
; }
;
L0165:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ Draw_Bank_Num (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Draw_Bank_Num: near

.segment	"CODE"

;
; PPU_ADDRESS = 0x20;
;
	lda     #$20
	sta     $2006
;
; PPU_ADDRESS = 0xa6;
;
	lda     #$A6
	sta     $2006
;
; for (index = 0;index < 5;++index){
;
	lda     #$00
	sta     _index
L01F4:	lda     _index
	cmp     #$05
	bcs     L01F5
;
; PPU_DATA = TEXT1[index];
;
	ldy     _index
	lda     _TEXT1,y
	sta     $2007
;
; for (index = 0;index < 5;++index){
;
	inc     _index
	jmp     L01F4
;
; PPU_ADDRESS = 0;
;
L01F5:	lda     #$00
	sta     $2006
;
; PPU_ADDRESS = 0;
;
	sta     $2006
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ Initialize_MMC3 (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Initialize_MMC3: near

.segment	"CODE"

;
; *((unsigned char*)0xa000) = 1;
;
	lda     #$01
	sta     $A000
;
; *((unsigned char*)0x8000) = 6;
;
	lda     #$06
	sta     $8000
;
; *((unsigned char*)0x8001) = 0;
;
	lda     #$00
	sta     $8001
;
; *((unsigned char*)0x8000) = 7;
;
	lda     #$07
	sta     $8000
;
; *((unsigned char*)0x8001) = 5;
;
	lda     #$05
	sta     $8001
;
; *((unsigned char*)0x8000) = 0;
;
	lda     #$00
	sta     $8000
;
; *((unsigned char*)0x8001) = 0;
;
	sta     $8001
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; All_Off();
;
	jsr     _All_Off
;
; Initialize_MMC3();
;
	jsr     _Initialize_MMC3
;
; PPU_ADDRESS = 0x20;
;
	lda     #$20
	sta     $2006
;
; PPU_ADDRESS = 0x00;
;
	lda     #$00
	sta     $2006
;
; UnRLE(NT); // uncompresses our BG data
;
	lda     #<(_NT)
	ldx     #>(_NT)
	jsr     _UnRLE
;
; Load_Palette();
;
	jsr     _Load_Palette
;
; Reset_Scroll();
;
	jsr     _Reset_Scroll
;
; Wait_Vblank(); // don't turn on screen until in v-blank
;
	jsr     _Wait_Vblank
;
; All_On();
;
	jsr     _All_On
;
; asm ("cli"); // turns ON IRQ interrupts
;
	cli
;
; while (NMI_flag == 0); // wait till NMI
;
L01F6:	lda     _NMI_flag
	beq     L01F6
;
; Get_Input();
;
	jsr     _Get_Input
;
; if ((Frame_Count & 0x03) == 3){ // bankswitch the CHR = waterfall, every 4 frames
;
	lda     _Frame_Count
	and     #$03
	cmp     #$03
	bne     L01F9
;
; ++CHRbank;
;
	inc     _CHRbank
;
; ++CHRbank;
;
	inc     _CHRbank
;
; if (CHRbank > 7) CHRbank = 0;
;
	lda     _CHRbank
	cmp     #$08
	lda     #$00
	bcc     L01F8
	sta     _CHRbank
;
; *((unsigned char*)0x8000) = 0;
;
L01F8:	sta     $8000
;
; *((unsigned char*)0x8001) = CHRbank;
;
	lda     _CHRbank
	sta     $8001
;
; if (((joypad1old & START) == 0)&&((joypad1 & START) != 0)){
;
L01F9:	lda     _joypad1old
	and     #$10
	bne     L01FD
	lda     _joypad1
	and     #$10
	beq     L01FD
;
; ++PRGbank;
;
	inc     _PRGbank
;
; if (PRGbank > 7) PRGbank = 0;
;
	lda     _PRGbank
	cmp     #$08
	bcc     L01FC
	lda     #$00
	sta     _PRGbank
;
; *((unsigned char*)0x8000) = 6; // bankswitch a PRG bank into $8000
;
L01FC:	lda     #$06
	sta     $8000
;
; *((unsigned char*)0x8001) = PRGbank;
;
	lda     _PRGbank
	sta     $8001
;
; Draw_Bank_Num(); // re-writes the text on the screen
;
	jsr     _Draw_Bank_Num
;
; *((unsigned char*)0xe000) = 1; // turn off MMC3 IRQ
;
L01FD:	lda     #$01
	sta     $E000
;
; *((unsigned char*)0xc000) = 20; // count 20 scanlines, then IRQ
;
	lda     #$14
	sta     $C000
;
; *((unsigned char*)0xc001) = 20;
;
	sta     $C001
;
; *((unsigned char*)0xe001) = 1; // turn on MMC3 IRQ
;
	lda     #$01
	sta     $E001
;
; Scroll_Index = 0;
;
	lda     #$00
	sta     _Scroll_Index
;
; Add_Scroll(); // wrote this in asm, it adds to the scroll array each frame, a little more for lower ones
;
	jsr     _Add_Scroll
;
; NMI_flag = 0;
;
	lda     #$00
	sta     _NMI_flag
;
; while(1){
;
	jmp     L01F6

.endproc

