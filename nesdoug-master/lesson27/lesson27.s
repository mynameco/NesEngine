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
	.dbg		file, "lesson27.c", 5599, 1502341196
	.dbg		file, "neslib.h", 8578, 1492006296
	.dbg		file, "lesson27.h", 1831, 1502305452
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
	.dbg		sym, "music_play", "00", extern, "_music_play"
	.dbg		sym, "music_pause", "00", extern, "_music_pause"
	.dbg		sym, "sfx_play", "00", extern, "_sfx_play"
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
	.import		_music_play
	.import		_music_pause
	.import		_sfx_play
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
; music_play(0);
;
	.dbg	line, "lesson27.c", 74
	lda     #$00
	jsr     _music_play
;
; pal_bg(PALETTE_BG);
;
	.dbg	line, "lesson27.c", 77
	lda     #<(_PALETTE_BG)
	ldx     #>(_PALETTE_BG)
	jsr     _pal_bg
;
; pal_spr(PALETTE_SP);
;
	.dbg	line, "lesson27.c", 78
	lda     #<(_PALETTE_SP)
	ldx     #>(_PALETTE_SP)
	jsr     _pal_spr
;
; bank_spr(1);
;
	.dbg	line, "lesson27.c", 82
	lda     #$01
	jsr     _bank_spr
;
; vram_adr(NTADR_A(0,0)); // top left of nametable A
;
	.dbg	line, "lesson27.c", 85
	ldx     #$20
	lda     #$00
	jsr     _vram_adr
;
; vram_unrle(BG_RLE); // push the BG data to the PPU
;
	.dbg	line, "lesson27.c", 87
	lda     #<(_BG_RLE)
	ldx     #>(_BG_RLE)
	jsr     _vram_unrle
;
; ppu_on_all();
;
	.dbg	line, "lesson27.c", 90
	jsr     _ppu_on_all
;
; Paddle1.X = 0x70;
;
	.dbg	line, "lesson27.c", 93
	lda     #$70
	sta     _Paddle1
;
; Paddle2.X = 0x70;
;
	.dbg	line, "lesson27.c", 94
	sta     _Paddle2
;
; Paddle1.Y = 0xca;
;
	.dbg	line, "lesson27.c", 95
	lda     #$CA
	sta     _Paddle1+1
;
; Paddle2.Y = 0x20;
;
	.dbg	line, "lesson27.c", 96
	lda     #$20
	sta     _Paddle2+1
;
; Paddle1.width = 32;
;
	.dbg	line, "lesson27.c", 97
	sta     _Paddle1+2
;
; Paddle1.height = 4;
;
	.dbg	line, "lesson27.c", 98
	lda     #$04
	sta     _Paddle1+3
;
; Paddle2.width = 32;
;
	.dbg	line, "lesson27.c", 99
	lda     #$20
	sta     _Paddle2+2
;
; Paddle2.height = 4;
;
	.dbg	line, "lesson27.c", 100
	lda     #$04
	sta     _Paddle2+3
;
; while (!pad_poll(0)){
;
	.dbg	line, "lesson27.c", 103
	jmp     L0248
;
; ++Seedy;
;
	.dbg	line, "lesson27.c", 106
L0246:	inc     _Seedy
	bne     L0317
	inc     _Seedy+1
;
; while (!pad_poll(0)){
;
	.dbg	line, "lesson27.c", 103
L0248:	lda     #$00
L0317:	jsr     _pad_poll
	tax
	beq     L0246
;
; set_rand(Seedy); // seed the random number
;
	.dbg	line, "lesson27.c", 109
	lda     _Seedy
	ldx     _Seedy+1
	jsr     _set_rand
;
; Ball.X = (rand8() / 2) + 0x40;
;
	.dbg	line, "lesson27.c", 111
	jsr     _rand8
	jsr     shrax1
	clc
	adc     #$40
	sta     _Ball
;
; Ball.Y = 0x80;
;
	.dbg	line, "lesson27.c", 112
	lda     #$80
	sta     _Ball+1
;
; Ball_X_Speed = (rand8() & 4) - 2;
;
	.dbg	line, "lesson27.c", 113
	jsr     _rand8
	and     #$04
	sec
	sbc     #$02
	sta     _Ball_X_Speed
;
; Ball_Y_Speed = (rand8() & 4) - 2;
;
	.dbg	line, "lesson27.c", 114
	jsr     _rand8
	and     #$04
	sec
	sbc     #$02
	sta     _Ball_Y_Speed
;
; memcpy(v_ram_buffer,CLEAR,sizeof(CLEAR)); // copy from the ROM to the RAM
;
	.dbg	line, "lesson27.c", 117
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
	.dbg	line, "lesson27.c", 118
	lda     #<(_v_ram_buffer)
	ldx     #>(_v_ram_buffer)
	jsr     _set_vram_update
;
; music_play(1);
;
	.dbg	line, "lesson27.c", 120
	lda     #$01
	jsr     _music_play
;
; ppu_wait_nmi();
;
	.dbg	line, "lesson27.c", 125
L0266:	jsr     _ppu_wait_nmi
;
; pad_poll(0); // read controller 1
;
	.dbg	line, "lesson27.c", 127
	lda     #$00
	jsr     _pad_poll
;
; pad_poll(1); // read controller 2
;
	.dbg	line, "lesson27.c", 128
	lda     #$01
	jsr     _pad_poll
;
; oam_clear();
;
	.dbg	line, "lesson27.c", 134
	jsr     _oam_clear
;
; sprid = 0;
;
	.dbg	line, "lesson27.c", 137
	lda     #$00
	sta     _sprid
;
; sprid = oam_spr(Ball.X, Ball.Y, 1, 0, sprid);
;
	.dbg	line, "lesson27.c", 141
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
	.dbg	line, "lesson27.c", 145
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
	.dbg	line, "lesson27.c", 147
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
	.dbg	line, "lesson27.c", 151
	lda     _PAD_STATE
	and     #$40
	beq     L0312
;
; Paddle1.X -= 4;
;
	.dbg	line, "lesson27.c", 152
	lda     _Paddle1
	sec
	sbc     #$04
	sta     _Paddle1
;
; if (Paddle1.X < 0x50) Paddle1.X = 0x50;
;
	.dbg	line, "lesson27.c", 153
	cmp     #$50
	bcs     L0313
	lda     #$50
;
; else if (PAD_STATE & PAD_RIGHT){
;
	.dbg	line, "lesson27.c", 155
	jmp     L0310
L0312:	lda     _PAD_STATE
	and     #$80
	beq     L0313
;
; Paddle1.X += 4;
;
	.dbg	line, "lesson27.c", 156
	lda     #$04
	clc
	adc     _Paddle1
	sta     _Paddle1
;
; if (Paddle1.X > 0x90) Paddle1.X = 0x90;
;
	.dbg	line, "lesson27.c", 157
	cmp     #$91
	bcc     L0313
	lda     #$90
L0310:	sta     _Paddle1
;
; if(PAD_STATE2 & PAD_LEFT){
;
	.dbg	line, "lesson27.c", 161
L0313:	lda     _PAD_STATE2
	and     #$40
	beq     L0314
;
; Paddle2.X -= 4;
;
	.dbg	line, "lesson27.c", 162
	lda     _Paddle2
	sec
	sbc     #$04
	sta     _Paddle2
;
; if (Paddle2.X < 0x50) Paddle2.X = 0x50;
;
	.dbg	line, "lesson27.c", 163
	cmp     #$50
	bcs     L02A3
	lda     #$50
;
; else if (PAD_STATE2 & PAD_RIGHT){
;
	.dbg	line, "lesson27.c", 165
	jmp     L0311
L0314:	lda     _PAD_STATE2
	and     #$80
	beq     L02A3
;
; Paddle2.X += 4;
;
	.dbg	line, "lesson27.c", 166
	lda     #$04
	clc
	adc     _Paddle2
	sta     _Paddle2
;
; if (Paddle2.X > 0x90) Paddle2.X = 0x90;
;
	.dbg	line, "lesson27.c", 167
	cmp     #$91
	bcc     L02A3
	lda     #$90
L0311:	sta     _Paddle2
;
; if (!Pause){
;
	.dbg	line, "lesson27.c", 173
L02A3:	lda     _Pause
	jne     L02E9
;
; KeepIt = Ball.X;
;
	.dbg	line, "lesson27.c", 176
	lda     _Ball
	sta     _KeepIt
;
; Ball.X += Ball_X_Speed;
;
	.dbg	line, "lesson27.c", 177
	lda     _Ball_X_Speed
	clc
	adc     _Ball
	sta     _Ball
;
; index = (Ball.Y & 0xf0) + (Ball.X >> 4);
;
	.dbg	line, "lesson27.c", 181
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
	.dbg	line, "lesson27.c", 183
	ldy     _index
	lda     _MAP,y
	beq     L0315
;
; Ball_X_Speed = 0 - Ball_X_Speed;
;
	.dbg	line, "lesson27.c", 184
	lda     #$00
	sec
	sbc     _Ball_X_Speed
	sta     _Ball_X_Speed
;
; Ball.X = KeepIt;
;
	.dbg	line, "lesson27.c", 185
	lda     _KeepIt
	sta     _Ball
;
; sfx_play(0,0);
;
	.dbg	line, "lesson27.c", 186
	lda     #$00
	jsr     pusha
	jsr     _sfx_play
;
; KeepIt = Ball.Y;
;
	.dbg	line, "lesson27.c", 191
L0315:	lda     _Ball+1
	sta     _KeepIt
;
; Ball.Y += Ball_Y_Speed;
;
	.dbg	line, "lesson27.c", 192
	lda     _Ball_Y_Speed
	clc
	adc     _Ball+1
	sta     _Ball+1
;
; index = (Ball.Y & 0xf0) + (Ball.X >> 4);
;
	.dbg	line, "lesson27.c", 196
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
	.dbg	line, "lesson27.c", 198
	ldy     _index
	lda     _MAP,y
	beq     L02C4
;
; Ball_Y_Speed = 0 - Ball_Y_Speed;
;
	.dbg	line, "lesson27.c", 199
	lda     #$00
	sec
	sbc     _Ball_Y_Speed
	sta     _Ball_Y_Speed
;
; Ball.Y = KeepIt;
;
	.dbg	line, "lesson27.c", 200
	lda     _KeepIt
	sta     _Ball+1
;
; sfx_play(0,0);
;
	.dbg	line, "lesson27.c", 201
	lda     #$00
	jsr     pusha
	jsr     _sfx_play
;
; collision = CheckCollision(&Paddle1, &Ball);
;
	.dbg	line, "lesson27.c", 206
L02C4:	lda     #<(_Paddle1)
	ldx     #>(_Paddle1)
	jsr     pushax
	lda     #<(_Ball)
	ldx     #>(_Ball)
	jsr     _CheckCollision
	sta     _collision
;
; if (collision){
;
	.dbg	line, "lesson27.c", 207
	lda     _collision
	beq     L02D3
;
; Ball_Y_Speed = 0 - Ball_Y_Speed;
;
	.dbg	line, "lesson27.c", 208
	lda     #$00
	sec
	sbc     _Ball_Y_Speed
	sta     _Ball_Y_Speed
;
; Ball.Y = KeepIt;
;
	.dbg	line, "lesson27.c", 209
	lda     _KeepIt
	sta     _Ball+1
;
; sfx_play(0,0);
;
	.dbg	line, "lesson27.c", 210
	lda     #$00
	jsr     pusha
	jsr     _sfx_play
;
; collision = CheckCollision(&Paddle2, &Ball);
;
	.dbg	line, "lesson27.c", 213
L02D3:	lda     #<(_Paddle2)
	ldx     #>(_Paddle2)
	jsr     pushax
	lda     #<(_Ball)
	ldx     #>(_Ball)
	jsr     _CheckCollision
	sta     _collision
;
; if (collision){
;
	.dbg	line, "lesson27.c", 214
	lda     _collision
	beq     L02E0
;
; Ball_Y_Speed = 0 - Ball_Y_Speed;
;
	.dbg	line, "lesson27.c", 215
	lda     #$00
	sec
	sbc     _Ball_Y_Speed
	sta     _Ball_Y_Speed
;
; Ball.Y = KeepIt;
;
	.dbg	line, "lesson27.c", 216
	lda     _KeepIt
	sta     _Ball+1
;
; sfx_play(0,0);
;
	.dbg	line, "lesson27.c", 217
	lda     #$00
	jsr     pusha
	jsr     _sfx_play
;
; if ((Ball.Y > 0xe8) || (Ball.Y < 0x8)){
;
	.dbg	line, "lesson27.c", 223
L02E0:	lda     _Ball+1
	cmp     #$E9
	bcs     L0316
	cmp     #$08
	bcs     L02E9
;
; Ball.Y = 0xf8; // keep it off screen
;
	.dbg	line, "lesson27.c", 224
L0316:	lda     #$F8
	sta     _Ball+1
;
; Ball_Y_Speed = 0;
;
	.dbg	line, "lesson27.c", 225
	lda     #$00
	sta     _Ball_Y_Speed
;
; Pause = 0x80; // wait 2 seconds
;
	.dbg	line, "lesson27.c", 226
	lda     #$80
	sta     _Pause
;
; music_pause(1); // pause music
;
	.dbg	line, "lesson27.c", 227
	lda     #$01
	jsr     _music_pause
;
; sfx_play(1,0);
;
	.dbg	line, "lesson27.c", 228
	lda     #$01
	jsr     pusha
	lda     #$00
	jsr     _sfx_play
;
; if(Pause){
;
	.dbg	line, "lesson27.c", 233
L02E9:	lda     _Pause
	jeq     L0266
;
; --Pause;
;
	.dbg	line, "lesson27.c", 234
	dec     _Pause
;
; if(!Pause){ // on last loop, when pause counts to zero
;
	.dbg	line, "lesson27.c", 236
	jne     L0266
;
; Ball.X = (rand8() / 2) + 0x40; // restart the ball
;
	.dbg	line, "lesson27.c", 237
	jsr     _rand8
	jsr     shrax1
	clc
	adc     #$40
	sta     _Ball
;
; Ball.Y = 0x80;
;
	.dbg	line, "lesson27.c", 238
	lda     #$80
	sta     _Ball+1
;
; Ball_X_Speed = (rand8() & 4) - 2;
;
	.dbg	line, "lesson27.c", 239
	jsr     _rand8
	and     #$04
	sec
	sbc     #$02
	sta     _Ball_X_Speed
;
; Ball_Y_Speed = (rand8() & 4) - 2;
;
	.dbg	line, "lesson27.c", 240
	jsr     _rand8
	and     #$04
	sec
	sbc     #$02
	sta     _Ball_Y_Speed
;
; music_pause(0); // unpause music
;
	.dbg	line, "lesson27.c", 241
	lda     #$00
	jsr     _music_pause
;
; while (1){
;
	.dbg	line, "lesson27.c", 123
	jmp     L0266
	.dbg	line

.endproc

