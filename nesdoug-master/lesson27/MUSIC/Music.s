;this file for FamiTone2 library generated by text2data tool

Music_music_data:
	.byte 2
	.word @instruments
	.word @samples-3
	.word @song0ch0,@song0ch1,@song0ch2,@song0ch3,@song0ch4,307,256
	.word @song1ch0,@song1ch1,@song1ch2,@song1ch3,@song1ch4,307,256

@instruments:
	.byte $b0 ;instrument $00
	.word @env1,@env0,@env0
	.byte $00
	.byte $30 ;instrument $01
	.word @env2,@env0,@env0
	.byte $00
	.byte $30 ;instrument $02
	.word @env3,@env0,@env0
	.byte $00
	.byte $30 ;instrument $03
	.word @env4,@env0,@env0
	.byte $00

@samples:
@env0:
	.byte $c0,$00,$00
@env1:
	.byte $cc,$ca,$c6,$c4,$02,$c3,$02,$c2,$c2,$c1,$00,$09
@env2:
	.byte $cf,$00,$00
@env3:
	.byte $c3,$c2,$c2,$c1,$02,$c0,$00,$05
@env4:
	.byte $c8,$c6,$c4,$c3,$c2,$c2,$c1,$04,$c0,$00,$08


@song0ch0:
	.byte $fb,$06
@ref0:
	.byte $80,$32,$85,$38,$85,$36,$85,$38,$85,$32,$8d,$32,$8d
@ref1:
	.byte $2a,$85,$32,$85,$32,$85,$2a,$85,$28,$95,$2f,$30,$81
@ref2:
	.byte $32,$85,$38,$85,$36,$85,$38,$85,$32,$8d,$32,$8d
	.byte $ff,$0d
	.word @ref1
@song0ch0loop:
	.byte $ff,$0c
	.word @ref0
	.byte $ff,$0d
	.word @ref1
	.byte $fd
	.word @song0ch0loop

@song0ch1:
@ref6:
	.byte $bf
@ref7:
	.byte $bf
@ref8:
	.byte $bf
@ref9:
	.byte $bf
@song0ch1loop:
@ref10:
	.byte $bf
@ref11:
	.byte $bf
	.byte $fd
	.word @song0ch1loop

@song0ch2:
@ref12:
	.byte $82,$1a,$00,$83,$2c,$00,$83,$1e,$00,$83,$2c,$00,$83,$1a,$85,$00
	.byte $85,$1a,$85,$00,$85
@ref13:
	.byte $1a,$00,$83,$2c,$00,$83,$1e,$00,$83,$2c,$00,$83,$1a,$85,$00,$85
	.byte $1a,$85,$00,$85
	.byte $ff,$14
	.word @ref13
	.byte $ff,$14
	.word @ref13
@song0ch2loop:
	.byte $ff,$14
	.word @ref12
	.byte $ff,$14
	.word @ref13
	.byte $fd
	.word @song0ch2loop

@song0ch3:
@ref18:
	.byte $00,$bd
@ref19:
	.byte $bf
@ref20:
	.byte $00,$bd
@ref21:
	.byte $bf
@song0ch3loop:
@ref22:
	.byte $84,$09,$16,$85,$17,$09,$16,$85,$17,$09,$16,$85,$17,$09,$16,$85
	.byte $16,$81
@ref23:
	.byte $09,$16,$85,$17,$09,$16,$85,$17,$09,$16,$85,$17,$0f,$17,$0f,$16
	.byte $81
	.byte $fd
	.word @song0ch3loop

@song0ch4:
@ref24:
	.byte $bf
@ref25:
	.byte $bf
@ref26:
	.byte $bf
@ref27:
	.byte $bf
@song0ch4loop:
@ref28:
	.byte $bf
@ref29:
	.byte $bf
	.byte $fd
	.word @song0ch4loop


@song1ch0:
	.byte $fb,$06
@ref30:
	.byte $80,$2d,$1e,$85,$1e,$85,$1e,$85,$1f,$2e,$99,$2c,$81
@ref31:
	.byte $29,$1a,$85,$1a,$85,$1a,$85,$1a,$85,$1b,$23,$29,$24,$85,$22,$85
@ref32:
	.byte $2d,$1e,$85,$1e,$85,$1e,$85,$1f,$2e,$99,$2c,$81
	.byte $ff,$10
	.word @ref31
	.byte $ff,$0c
	.word @ref32
	.byte $ff,$10
	.word @ref31
@song1ch0loop:
	.byte $ff,$0c
	.word @ref30
	.byte $ff,$10
	.word @ref31
	.byte $fd
	.word @song1ch0loop

@song1ch1:
@ref38:
	.byte $00,$bd
@ref39:
	.byte $bf
@ref40:
	.byte $00,$bd
@ref41:
	.byte $bf
@ref42:
	.byte $00,$bd
@ref43:
	.byte $bf
@song1ch1loop:
@ref44:
	.byte $00,$bd
@ref45:
	.byte $bf
	.byte $fd
	.word @song1ch1loop

@song1ch2:
@ref46:
	.byte $00,$bd
@ref47:
	.byte $bf
@ref48:
	.byte $82,$3c,$99,$3b,$34,$8d,$36,$8d
@ref49:
	.byte $3a,$9d,$3c,$85,$3a,$85,$36,$85,$34,$85
@ref50:
	.byte $3c,$99,$3b,$34,$8d,$36,$8d
	.byte $ff,$0a
	.word @ref49
@song1ch2loop:
	.byte $ff,$07
	.word @ref48
	.byte $ff,$0a
	.word @ref49
	.byte $fd
	.word @song1ch2loop

@song1ch3:
@ref54:
	.byte $00,$bd
@ref55:
	.byte $bf
@ref56:
	.byte $00,$bd
@ref57:
	.byte $bf
@ref58:
	.byte $00,$bd
@ref59:
	.byte $bf
@song1ch3loop:
@ref60:
	.byte $86,$20,$89,$03,$02,$02,$20,$89,$20,$89,$03,$02,$02,$20,$89
@ref61:
	.byte $20,$89,$03,$02,$02,$20,$89,$20,$89,$03,$02,$02,$20,$89
	.byte $fd
	.word @song1ch3loop

@song1ch4:
@ref62:
	.byte $bf
@ref63:
	.byte $bf
@ref64:
	.byte $bf
@ref65:
	.byte $bf
@ref66:
	.byte $bf
@ref67:
	.byte $bf
@song1ch4loop:
@ref68:
	.byte $bf
@ref69:
	.byte $bf
	.byte $fd
	.word @song1ch4loop