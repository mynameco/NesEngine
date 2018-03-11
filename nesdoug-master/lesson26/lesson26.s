;
; File generated by cc65 v 2.16 - Git 83890e5
;
	.fopt		compiler,"cc65 v 2.16 - Git 83890e5"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	on
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.dbg		file, "lesson26.c", 5512, 1502273302
	.dbg		file, "neslib.h", 8578, 1492006296
	.dbg		file, "lesson26.h", 1831, 1502305452
	.dbg		file, "Sprites.c", 151, 1502134276
	.dbg		file, "BG_RLE.h", 1084, 1502272442
	.forceimport	__STARTUP__
	.dbg		sym, "pal_bg", "00", extern, "_pal_bg"
	.dbg		sym, "pal_spr", "00", extern, "_pal_spr"
	.dbg		sym, "ppu_wait_nmi", "00", extern, "_ppu_wait_nmi"
	.dbg		sym, "ppu_on_all", "00", extern, "_ppu_on_all"
	.dbg		sym, "oam_clear", "00", extern, "_oam_clear"
	.dbg		sym, "oam_spr", "00", extern, "_oam_spr"
	.dbg		sym, "oam_meta_spr", "00", extern, "_oam_meta_spr"
	.dbg		sym, "pad_poll", "00", extern, "_pad_poll"
	.dbg		sym, "bank_spr", "00", extern, "_bank_spr"
	.dbg		sym, "rand8", "00", extern, "_rand8"
	.dbg		sym, "set_rand", "00", extern, "_set_rand"
	.dbg		sym, "set_vram_update", "00", extern, "_set_vram_update"
	.dbg		sym, "vram_adr", "00", extern, "_vram_adr"
	.dbg		sym, "vram_unrle", "00", extern, "_vram_unrle"
	.dbg		sym, "memcpy", "00", extern, "_memcpy"
	.dbg		sym, "CheckCollision", "00", extern, "_CheckCollision"
	.import		_pal_bg
	.import		_pal_spr
	.import		_ppu_wait_nmi
	.import		_ppu_on_all
	.import		_oam_clear
	.import		_oam_spr
	.import		_oam_meta_spr
	.import		_pad_poll
	.import		_bank_spr
	.import		_rand8
	.import		_set_rand
	.import		_set_vram_update
	.import		_vram_adr
	.import		_vram_unrle
	.import		_memcpy
	.export		_PAD_STATE
	.export		_PAD_STATE2
	.export		_PAD_STATET
	.export		_PAD_STATET2
	.export		_Paddle1
	.export		_Paddle2
	.export		_Ball
	.export		_Ball_X_Speed
	.export		_Ball_Y_Speed
	.export		_Pause
	.export		_collision
	.export		_sprid
	.export		_index
	.export		_KeepIt
	.export		_Seedy
	.import		_CheckCollision
	.export		_Paddle
	.export		_BG_RLE
	.export		_MAP
	.export		_PALETTE_BG
	.export		_PALETTE_SP
	.export		_CLEAR
	.export		_main

.segment	"RODATA"

_Paddle:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$08
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$18
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$80
_BG_RLE:
	.byte	$01
	.byte	$03
	.byte	$01
	.byte	$09
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$03
	.byte	$01
	.byte	$13
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$03
	.byte	$01
	.byte	$13
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$03
	.byte	$01
	.byte	$13
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$03
	.byte	$01
	.byte	$0D
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$50
	.byte	$72
	.byte	$65
	.byte	$73
	.byte	$73
	.byte	$00
	.byte	$53
	.byte	$74
	.byte	$61
	.byte	$72
	.byte	$74
	.byte	$00
	.byte	$01
	.byte	$06
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$03
	.byte	$01
	.byte	$0D
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$03
	.byte	$01
	.byte	$13
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$03
	.byte	$01
	.byte	$13
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$03
	.byte	$01
	.byte	$13
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$03
	.byte	$01
	.byte	$09
	.byte	$00
	.byte	$01
	.byte	$3E
	.byte	$00
	.byte	$01
	.byte	$00
_MAP:
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
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
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_PALETTE_BG:
	.byte	$0F
	.byte	$00
	.byte	$10
	.byte	$30
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
_PALETTE_SP:
	.byte	$0F
	.byte	$00
	.byte	$10
	.byte	$30
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
_CLEAR:
	.byte	$61
	.byte	$8A
	.byte	$0C
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
	.byte	$FF

.segment	"BSS"

.segment	"ZEROPAGE"
_PAD_STATE:
	.res	1,$00
_PAD_STATE2:
	.res	1,$00
_PAD_STATET:
	.res	1,$00
_PAD_STATET2:
	.res	1,$00
.segment	"BSS"
_Paddle1:
	.res	4,$00
_Paddle2:
	.res	4,$00
_Ball:
	.res	4,$00
_Ball_X_Speed:
	.res	1,$00
_Ball_Y_Speed:
	.res	1,$00
_Pause:
	.res	1,$00
_collision:
	.res	1,$00
_sprid:
	.res	1,$00
_index:
	.res	1,$00
_KeepIt:
	.res	1,$00
_Seedy:
	.res	2,$00
_v_ram_buffer:
	.res	256,$00

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

	.dbg	func, "main", "00", extern, "_main"

.segment	"CODE"

;
; pal_bg(PALETTE_BG);
;
	.dbg	line, "lesson26.c", 80
	lda     #<(_PALETTE_BG)
	ldx     #>(_PALETTE_BG)
	jsr     _pal_bg
;
; pal_spr(PALETTE_SP);
;
	.dbg	line, "lesson26.c", 81
	lda     #<(_PALETTE_SP)
	ldx     #>(_PALETTE_SP)
	jsr     _pal_spr
;
; bank_spr(1);
;
	.dbg	line, "lesson26.c", 85
	lda     #$01
	jsr     _bank_spr
;
; vram_adr(NTADR_A(0,0)); // top left of nametable A
;
	.dbg	line, "lesson26.c", 88
	ldx     #$20
	lda     #$00
	jsr     _vram_adr
;
; vram_unrle(BG_RLE); // push the BG data to the PPU
;
	.dbg	line, "lesson26.c", 90
	lda     #<(_BG_RLE)
	ldx     #>(_BG_RLE)
	jsr     _vram_unrle
;
; ppu_on_all();
;
	.dbg	line, "lesson26.c", 93
	jsr     _ppu_on_all
;
; Paddle1.X = 0x70;
;
	.dbg	line, "lesson26.c", 96
	lda     #$70
	sta     _Paddle1
;
; Paddle2.X = 0x70;
;
	.dbg	line, "lesson26.c", 97
	sta     _Paddle2
;
; Paddle1.Y = 0xca;
;
	.dbg	line, "lesson26.c", 98
	lda     #$CA
	sta     _Paddle1+1
;
; Paddle2.Y = 0x20;
;
	.dbg	line, "lesson26.c", 99
	lda     #$20
	sta     _Paddle2+1
;
; Paddle1.width = 32;
;
	.dbg	line, "lesson26.c", 100
	sta     _Paddle1+2
;
; Paddle1.height = 4;
;
	.dbg	line, "lesson26.c", 101
	lda     #$04
	sta     _Paddle1+3
;
; Paddle2.width = 32;
;
	.dbg	line, "lesson26.c", 102
	lda     #$20
	sta     _Paddle2+2
;
; Paddle2.height = 4;
;
	.dbg	line, "lesson26.c", 103
	lda     #$04
	sta     _Paddle2+3
;
; while (!pad_poll(0)){
;
	.dbg	line, "lesson26.c", 106
	jmp     L0246
;
; ++Seedy;
;
	.dbg	line, "lesson26.c", 109
L0244:	inc     _Seedy
	bne     L0300
	inc     _Seedy+1
;
; while (!pad_poll(0)){
;
	.dbg	line, "lesson26.c", 106
L0246:	lda     #$00
L0300:	jsr     _pad_poll
	tax
	beq     L0244
;
; set_rand(Seedy); // seed the random number
;
	.dbg	line, "lesson26.c", 112
	lda     _Seedy
	ldx     _Seedy+1
	jsr     _set_rand
;
; Ball.X = (rand8() / 2) + 0x40;
;
	.dbg	line, "lesson26.c", 114
	jsr     _rand8
	jsr     shrax1
	clc
	adc     #$40
	sta     _Ball
;
; Ball.Y = 0x80;
;
	.dbg	line, "lesson26.c", 115
	lda     #$80
	sta     _Ball+1
;
; Ball_X_Speed = (rand8() & 4) - 2;
;
	.dbg	line, "lesson26.c", 116
	jsr     _rand8
	and     #$04
	sec
	sbc     #$02
	sta     _Ball_X_Speed
;
; Ball_Y_Speed = (rand8() & 4) - 2;
;
	.dbg	line, "lesson26.c", 117
	jsr     _rand8
	and     #$04
	sec
	sbc     #$02
	sta     _Ball_Y_Speed
;
; memcpy(v_ram_buffer,CLEAR,sizeof(CLEAR)); // copy from the ROM to the RAM
;
	.dbg	line, "lesson26.c", 120
	lda     #<(_v_ram_buffer)
	ldx     #>(_v_ram_buffer)
	jsr     pushax
	lda     #<(_CLEAR)
	ldx     #>(_CLEAR)
	jsr     pushax
	ldx     #$00
	lda     #$10
	jsr     _memcpy
;
; set_vram_update(v_ram_buffer);
;
	.dbg	line, "lesson26.c", 121
	lda     #<(_v_ram_buffer)
	ldx     #>(_v_ram_buffer)
	jsr     _set_vram_update
;
; ppu_wait_nmi();
;
	.dbg	line, "lesson26.c", 126
L0262:	jsr     _ppu_wait_nmi
;
; pad_poll(0); // read controller 1
;
	.dbg	line, "lesson26.c", 128
	lda     #$00
	jsr     _pad_poll
;
; pad_poll(1); // read controller 2
;
	.dbg	line, "lesson26.c", 129
	lda     #$01
	jsr     _pad_poll
;
; oam_clear();
;
	.dbg	line, "lesson26.c", 135
	jsr     _oam_clear
;
; sprid = 0;
;
	.dbg	line, "lesson26.c", 138
	lda     #$00
	sta     _sprid
;
; sprid = oam_spr(Ball.X, Ball.Y, 1, 0, sprid);
;
	.dbg	line, "lesson26.c", 142
	jsr     decsp4
	lda     _Ball
	ldy     #$03
	sta     (sp),y
	lda     _Ball+1
	dey
	sta     (sp),y
	lda     #$01
	dey
	sta     (sp),y
	lda     #$00
	dey
	sta     (sp),y
	lda     _sprid
	jsr     _oam_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Paddle1.X, Paddle1.Y, sprid, Paddle);
;
	.dbg	line, "lesson26.c", 146
	jsr     decsp3
	lda     _Paddle1
	ldy     #$02
	sta     (sp),y
	lda     _Paddle1+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_Paddle)
	ldx     #>(_Paddle)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Paddle2.X, Paddle2.Y, sprid, Paddle);
;
	.dbg	line, "lesson26.c", 148
	jsr     decsp3
	lda     _Paddle2
	ldy     #$02
	sta     (sp),y
	lda     _Paddle2+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_Paddle)
	ldx     #>(_Paddle)
	jsr     _oam_meta_spr
	sta     _sprid
;
; if(PAD_STATE & PAD_LEFT){
;
	.dbg	line, "lesson26.c", 152
	lda     _PAD_STATE
	and     #$40
	beq     L02FB
;
; Paddle1.X -= 4;
;
	.dbg	line, "lesson26.c", 153
	lda     _Paddle1
	sec
	sbc     #$04
	sta     _Paddle1
;
; if (Paddle1.X < 0x50) Paddle1.X = 0x50;
;
	.dbg	line, "lesson26.c", 154
	cmp     #$50
	bcs     L02FC
	lda     #$50
;
; else if (PAD_STATE & PAD_RIGHT){
;
	.dbg	line, "lesson26.c", 156
	jmp     L02F9
L02FB:	lda     _PAD_STATE
	and     #$80
	beq     L02FC
;
; Paddle1.X += 4;
;
	.dbg	line, "lesson26.c", 157
	lda     #$04
	clc
	adc     _Paddle1
	sta     _Paddle1
;
; if (Paddle1.X > 0x90) Paddle1.X = 0x90;
;
	.dbg	line, "lesson26.c", 158
	cmp     #$91
	bcc     L02FC
	lda     #$90
L02F9:	sta     _Paddle1
;
; if(PAD_STATE2 & PAD_LEFT){
;
	.dbg	line, "lesson26.c", 162
L02FC:	lda     _PAD_STATE2
	and     #$40
	beq     L02FD
;
; Paddle2.X -= 4;
;
	.dbg	line, "lesson26.c", 163
	lda     _Paddle2
	sec
	sbc     #$04
	sta     _Paddle2
;
; if (Paddle2.X < 0x50) Paddle2.X = 0x50;
;
	.dbg	line, "lesson26.c", 164
	cmp     #$50
	bcs     L029F
	lda     #$50
;
; else if (PAD_STATE2 & PAD_RIGHT){
;
	.dbg	line, "lesson26.c", 166
	jmp     L02FA
L02FD:	lda     _PAD_STATE2
	and     #$80
	beq     L029F
;
; Paddle2.X += 4;
;
	.dbg	line, "lesson26.c", 167
	lda     #$04
	clc
	adc     _Paddle2
	sta     _Paddle2
;
; if (Paddle2.X > 0x90) Paddle2.X = 0x90;
;
	.dbg	line, "lesson26.c", 168
	cmp     #$91
	bcc     L029F
	lda     #$90
L02FA:	sta     _Paddle2
;
; if (!Pause){
;
	.dbg	line, "lesson26.c", 174
L029F:	lda     _Pause
	jne     L02D9
;
; KeepIt = Ball.X;
;
	.dbg	line, "lesson26.c", 177
	lda     _Ball
	sta     _KeepIt
;
; Ball.X += Ball_X_Speed;
;
	.dbg	line, "lesson26.c", 178
	lda     _Ball_X_Speed
	clc
	adc     _Ball
	sta     _Ball
;
; index = (Ball.Y & 0xf0) + (Ball.X >> 4);
;
	.dbg	line, "lesson26.c", 182
	lda     _Ball+1
	and     #$F0
	sta     ptr1
	lda     _Ball
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	clc
	adc     ptr1
	sta     _index
;
; if (MAP[index]){
;
	.dbg	line, "lesson26.c", 184
	ldy     _index
	lda     _MAP,y
	beq     L02FE
;
; Ball_X_Speed = 0 - Ball_X_Speed;
;
	.dbg	line, "lesson26.c", 185
	lda     #$00
	sec
	sbc     _Ball_X_Speed
	sta     _Ball_X_Speed
;
; Ball.X = KeepIt;
;
	.dbg	line, "lesson26.c", 186
	lda     _KeepIt
	sta     _Ball
;
; KeepIt = Ball.Y;
;
	.dbg	line, "lesson26.c", 191
L02FE:	lda     _Ball+1
	sta     _KeepIt
;
; Ball.Y += Ball_Y_Speed;
;
	.dbg	line, "lesson26.c", 192
	lda     _Ball_Y_Speed
	clc
	adc     _Ball+1
	sta     _Ball+1
;
; index = (Ball.Y & 0xf0) + (Ball.X >> 4);
;
	.dbg	line, "lesson26.c", 196
	and     #$F0
	sta     ptr1
	lda     _Ball
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	clc
	adc     ptr1
	sta     _index
;
; if (MAP[index]){
;
	.dbg	line, "lesson26.c", 198
	ldy     _index
	lda     _MAP,y
	beq     L02BD
;
; Ball_Y_Speed = 0 - Ball_Y_Speed;
;
	.dbg	line, "lesson26.c", 199
	lda     #$00
	sec
	sbc     _Ball_Y_Speed
	sta     _Ball_Y_Speed
;
; Ball.Y = KeepIt;
;
	.dbg	line, "lesson26.c", 200
	lda     _KeepIt
	sta     _Ball+1
;
; collision = CheckCollision(&Paddle1, &Ball);
;
	.dbg	line, "lesson26.c", 205
L02BD:	lda     #<(_Paddle1)
	ldx     #>(_Paddle1)
	jsr     pushax
	lda     #<(_Ball)
	ldx     #>(_Ball)
	jsr     _CheckCollision
	sta     _collision
;
; if (collision){
;
	.dbg	line, "lesson26.c", 206
	lda     _collision
	beq     L02C9
;
; Ball_Y_Speed = 0 - Ball_Y_Speed;
;
	.dbg	line, "lesson26.c", 207
	lda     #$00
	sec
	sbc     _Ball_Y_Speed
	sta     _Ball_Y_Speed
;
; Ball.Y = KeepIt;
;
	.dbg	line, "lesson26.c", 208
	lda     _KeepIt
	sta     _Ball+1
;
; collision = CheckCollision(&Paddle2, &Ball);
;
	.dbg	line, "lesson26.c", 211
L02C9:	lda     #<(_Paddle2)
	ldx     #>(_Paddle2)
	jsr     pushax
	lda     #<(_Ball)
	ldx     #>(_Ball)
	jsr     _CheckCollision
	sta     _collision
;
; if (collision){
;
	.dbg	line, "lesson26.c", 212
	lda     _collision
	beq     L02D3
;
; Ball_Y_Speed = 0 - Ball_Y_Speed;
;
	.dbg	line, "lesson26.c", 213
	lda     #$00
	sec
	sbc     _Ball_Y_Speed
	sta     _Ball_Y_Speed
;
; Ball.Y = KeepIt;
;
	.dbg	line, "lesson26.c", 214
	lda     _KeepIt
	sta     _Ball+1
;
; if ((Ball.Y > 0xe8) || (Ball.Y < 0x8)){
;
	.dbg	line, "lesson26.c", 220
L02D3:	lda     _Ball+1
	cmp     #$E9
	bcs     L02FF
	cmp     #$08
	bcs     L02D9
;
; Ball.Y = 0xf8; // keep it off screen
;
	.dbg	line, "lesson26.c", 221
L02FF:	lda     #$F8
	sta     _Ball+1
;
; Ball_Y_Speed = 0;
;
	.dbg	line, "lesson26.c", 222
	lda     #$00
	sta     _Ball_Y_Speed
;
; Pause = 0x80; // wait 2 seconds
;
	.dbg	line, "lesson26.c", 223
	lda     #$80
	sta     _Pause
;
; if(Pause){
;
	.dbg	line, "lesson26.c", 228
L02D9:	lda     _Pause
	jeq     L0262
;
; --Pause;
;
	.dbg	line, "lesson26.c", 229
	dec     _Pause
;
; if(!Pause){ // on last loop, when pause counts to zero
;
	.dbg	line, "lesson26.c", 231
	jne     L0262
;
; Ball.X = (rand8() / 2) + 0x40; // restart the ball
;
	.dbg	line, "lesson26.c", 232
	jsr     _rand8
	jsr     shrax1
	clc
	adc     #$40
	sta     _Ball
;
; Ball.Y = 0x80;
;
	.dbg	line, "lesson26.c", 233
	lda     #$80
	sta     _Ball+1
;
; Ball_X_Speed = (rand8() & 4) - 2;
;
	.dbg	line, "lesson26.c", 234
	jsr     _rand8
	and     #$04
	sec
	sbc     #$02
	sta     _Ball_X_Speed
;
; Ball_Y_Speed = (rand8() & 4) - 2;
;
	.dbg	line, "lesson26.c", 235
	jsr     _rand8
	and     #$04
	sec
	sbc     #$02
	sta     _Ball_Y_Speed
;
; while (1){
;
	.dbg	line, "lesson26.c", 124
	jmp     L0262
	.dbg	line

.endproc

