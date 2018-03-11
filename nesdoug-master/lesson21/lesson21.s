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
	.dbg		file, "lesson21.c", 1377, 1502273542
	.dbg		file, "neslib.h", 8578, 1492006296
	.dbg		file, "lesson21.h", 1373, 1491854522
	.forceimport	__STARTUP__
	.dbg		sym, "pal_bg", "00", extern, "_pal_bg"
	.dbg		sym, "ppu_on_all", "00", extern, "_ppu_on_all"
	.dbg		sym, "vram_adr", "00", extern, "_vram_adr"
	.dbg		sym, "vram_write", "00", extern, "_vram_write"
	.import		_pal_bg
	.import		_ppu_on_all
	.import		_vram_adr
	.import		_vram_write
	.export		_PAD_STATE
	.export		_PAD_STATE2
	.export		_PAD_STATET
	.export		_PAD_STATET2
	.export		_TEXT
	.export		_PALETTE
	.export		_main

.segment	"RODATA"

_TEXT:
	.byte	$48,$65,$6C,$6C,$6F,$20,$57,$6F,$72,$6C,$64,$21,$00
_PALETTE:
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

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

	.dbg	func, "main", "00", extern, "_main"

.segment	"CODE"

;
; pal_bg(PALETTE);
;
	.dbg	line, "lesson21.c", 34
	lda     #<(_PALETTE)
	ldx     #>(_PALETTE)
	jsr     _pal_bg
;
; vram_adr(NTADR_A(10,14)); // screen is 32 x 30 tiles
;
	.dbg	line, "lesson21.c", 38
	ldx     #$21
	lda     #$CA
	jsr     _vram_adr
;
; vram_write((unsigned char*)TEXT,sizeof(TEXT));
;
	.dbg	line, "lesson21.c", 41
	lda     #<(_TEXT)
	ldx     #>(_TEXT)
	jsr     pushax
	ldx     #$00
	lda     #$0D
	jsr     _vram_write
;
; ppu_on_all();
;
	.dbg	line, "lesson21.c", 50
	jsr     _ppu_on_all
;
; while (1){
;
	.dbg	line, "lesson21.c", 53
L0027:	jmp     L0027
	.dbg	line

.endproc
