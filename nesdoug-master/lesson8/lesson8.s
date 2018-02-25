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
	.export		_new_background
	.export		_which_BGD
	.export		_p_C_MAP
	.export		_X1_Right_Side
	.export		_X1_Left_Side
	.export		_Y1_Bottom
	.export		_Y1_Top
	.export		_corner
	.export		_SPRITES
	.export		_C_MAP
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
	.export		_check_Start
	.export		_four_Sides
	.export		_collide_Check_LR
	.export		_collide_Check_UD
	.export		_move_logic
	.export		_Draw_Background
	.import		_Wait_Vblank
	.import		_UnRLE
	.import		_Get_Input
	.export		_n1
	.export		_n2
	.export		_n3
	.export		_n4
	.export		_All_Backgrounds
	.export		_c1
	.export		_c2
	.export		_c3
	.export		_c4
	.export		_All_Collision_Maps
	.export		_main

.segment	"RODATA"

_PALETTE:
	.byte	$1F
	.byte	$00
	.byte	$10
	.byte	$20
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
	.byte	$1F
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
_n1:
	.byte	$01
	.byte	$10
	.byte	$01
	.byte	$C1
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$C1
	.byte	$01
	.byte	$00
_n2:
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$C9
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$53
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$07
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$13
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$07
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$15
	.byte	$10
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$17
	.byte	$10
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$4E
	.byte	$01
	.byte	$00
_n3:
	.byte	$01
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$10
	.byte	$10
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
_n4:
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$10
	.byte	$01
	.byte	$0F
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$10
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$C0
	.byte	$10
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$10
	.byte	$01
	.byte	$0F
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$10
	.byte	$01
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$1B
	.byte	$10
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$0D
	.byte	$01
	.byte	$00
_All_Backgrounds:
	.addr	_n1
	.addr	_n2
	.addr	_n3
	.addr	_n4
_c1:
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
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
_c2:
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
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
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
	.byte	$00
	.byte	$00
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
	.byte	$00
	.byte	$00
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
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_c3:
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
_c4:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
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
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_All_Collision_Maps:
	.addr	_c1
	.addr	_c2
	.addr	_c3
	.addr	_c4

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
_new_background:
	.res	1,$00
_which_BGD:
	.res	1,$00
_p_C_MAP:
	.res	2,$00
_X1_Right_Side:
	.res	1,$00
_X1_Left_Side:
	.res	1,$00
_Y1_Bottom:
	.res	1,$00
_Y1_Top:
	.res	1,$00
_corner:
	.res	1,$00
.segment	"OAM"
_SPRITES:
	.res	256,$00
.segment	"MAP"
_C_MAP:
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
L0823:	lda     _index
	cmp     #$20
	bcs     L0705
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
	jmp     L0823
;
; }
;
L0705:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ update_Sprites (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_update_Sprites: near

.segment	"CODE"

;
; state4 = state << 2; // shift left 2 = multiply 4
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
L0827:	lda     _index
	cmp     #$04
	bcc     L0828
;
; }
;
	rts
;
; SPRITES[index4] = MetaSprite_Y[index] + Y1; // relative y + master y
;
L0828:	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0721
	inx
L0721:	sta     ptr1
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
	bcc     L0728
	inx
L0728:	sta     sreg
	stx     sreg+1
	ldx     #$00
	lda     _index
	clc
	adc     _state4
	bcc     L0825
	inx
L0825:	sta     ptr1
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
	bcc     L072E
	inx
L072E:	sta     ptr1
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
	bcc     L0735
	inx
L0735:	sta     ptr1
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
	jmp     L0827

.endproc

; ---------------------------------------------------------------
; void __near__ check_Start (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_check_Start: near

.segment	"CODE"

;
; if ( ((joypad1 & START) != 0) && ((joypad1old & START) == 0) ){
;
	lda     _joypad1
	and     #$10
	beq     L082A
	lda     _joypad1old
	and     #$10
	beq     L082B
L082A:	rts
;
; ++new_background;
;
L082B:	inc     _new_background
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ four_Sides (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_four_Sides: near

.segment	"CODE"

;
; if (X1 < (255-3)){ // find the left side, the first 3 pixels are blank
;
	lda     _X1
	cmp     #$FC
	bcs     L082F
;
; X1_Left_Side = X1 + 4;
;
	clc
	adc     #$04
;
; else {
;
	jmp     L082C
;
; X1_Left_Side = 255;
;
L082F:	lda     #$FF
L082C:	sta     _X1_Left_Side
;
; if (X1 < (255-12)){ // find the right side, the last 3 pixels are blank
;
	lda     _X1
	cmp     #$F3
	bcs     L0830
;
; X1_Right_Side = X1 + 11;
;
	clc
	adc     #$0B
;
; else {
;
	jmp     L082D
;
; X1_Right_Side = 255;
;
L0830:	lda     #$FF
L082D:	sta     _X1_Right_Side
;
; Y1_Top = Y1+9; // our top is the same as the master Y
;
	lda     _Y1
	clc
	adc     #$09
	sta     _Y1_Top
;
; if (Y1 < (255-15)){ // find the bottom side
;
	lda     _Y1
	cmp     #$F0
	bcs     L0831
;
; Y1_Bottom = Y1 + 15;
;
	clc
	adc     #$0F
;
; else {
;
	jmp     L082E
;
; Y1_Bottom = 255;
;
L0831:	lda     #$FF
L082E:	sta     _Y1_Bottom
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ collide_Check_LR (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_collide_Check_LR: near

.segment	"CODE"

;
; four_Sides(); // set the L R bottom top variables
;
	jsr     _four_Sides
;
; if ((joypad1 & RIGHT) != 0){  // first check right
;
	lda     _joypad1
	and     #$01
	beq     L0834
;
; corner = ((X1_Right_Side & 0xf0) >> 4) + (Y1_Top & 0xf0); // top right
;
	lda     _X1_Right_Side
	and     #$F0
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1_Top
	and     #$F0
	clc
	adc     ptr1
	sta     _corner
;
; if (C_MAP[corner] != 0)
;
	ldy     _corner
	lda     _C_MAP,y
	beq     L0833
;
; X1 = (X1 & 0xf0) + 4; // if collision, realign
;
	lda     _X1
	and     #$F0
	clc
	adc     #$04
	sta     _X1
;
; corner = ((X1_Right_Side & 0xf0) >> 4) + (Y1_Bottom & 0xf0); // bottom right
;
L0833:	lda     _X1_Right_Side
	and     #$F0
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1_Bottom
	and     #$F0
	clc
	adc     ptr1
	sta     _corner
;
; if (C_MAP[corner] != 0)
;
	ldy     _corner
	lda     _C_MAP,y
	beq     L079C
;
; X1 = (X1 & 0xf0) + 4; // if collision, realign
;
	lda     _X1
	and     #$F0
	clc
	adc     #$04
;
; else if ((joypad1 & LEFT) != 0){ // check left
;
	jmp     L0832
L0834:	lda     _joypad1
	and     #$02
	beq     L079C
;
; corner = ((X1_Left_Side & 0xf0) >> 4) + (Y1_Top & 0xf0); // top left
;
	lda     _X1_Left_Side
	and     #$F0
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1_Top
	and     #$F0
	clc
	adc     ptr1
	sta     _corner
;
; if (C_MAP[corner] != 0)
;
	ldy     _corner
	lda     _C_MAP,y
	beq     L0835
;
; X1 = (X1 & 0xf0) + 12; // if collision, realign
;
	lda     _X1
	and     #$F0
	clc
	adc     #$0C
	sta     _X1
;
; corner = ((X1_Left_Side & 0xf0) >> 4) + (Y1_Bottom & 0xf0); // bottom left
;
L0835:	lda     _X1_Left_Side
	and     #$F0
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1_Bottom
	and     #$F0
	clc
	adc     ptr1
	sta     _corner
;
; if (C_MAP[corner] != 0)
;
	ldy     _corner
	lda     _C_MAP,y
	beq     L079C
;
; X1 = (X1 & 0xf0) + 12; // if collision, realign
;
	lda     _X1
	and     #$F0
	clc
	adc     #$0C
L0832:	sta     _X1
;
; }
;
L079C:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ collide_Check_UD (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_collide_Check_UD: near

.segment	"CODE"

;
; four_Sides();
;
	jsr     _four_Sides
;
; if ((joypad1 & DOWN) != 0){ // down first
;
	lda     _joypad1
	and     #$04
	beq     L083C
;
; corner = ((X1_Right_Side & 0xf0) >> 4) + (Y1_Bottom & 0xf0); // bottom right
;
	lda     _X1_Right_Side
	and     #$F0
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1_Bottom
	and     #$F0
	clc
	adc     ptr1
	sta     _corner
;
; if (C_MAP[corner] != 0)
;
	ldy     _corner
	lda     _C_MAP,y
	beq     L083B
;
; Y1 = (Y1 & 0xf0) ; // if collision, realign
;
	lda     _Y1
	and     #$F0
	sta     _Y1
;
; corner = ((X1_Left_Side & 0xf0) >> 4) + (Y1_Bottom & 0xf0); // bottom left
;
L083B:	lda     _X1_Left_Side
	and     #$F0
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1_Bottom
	and     #$F0
	clc
	adc     ptr1
	sta     _corner
;
; if (C_MAP[corner] != 0)
;
	ldy     _corner
	lda     _C_MAP,y
	beq     L07D9
;
; Y1 = (Y1 & 0xf0); // if collision, realign
;
	lda     _Y1
	and     #$F0
;
; else if ((joypad1 & UP) != 0) { //or up
;
	jmp     L083A
L083C:	lda     _joypad1
	and     #$08
	beq     L07D9
;
; corner = ((X1_Right_Side & 0xf0) >> 4) + (Y1_Top & 0xf0); // top right
;
	lda     _X1_Right_Side
	and     #$F0
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1_Top
	and     #$F0
	clc
	adc     ptr1
	sta     _corner
;
; if (C_MAP[corner] != 0)
;
	ldy     _corner
	lda     _C_MAP,y
	beq     L083D
;
; Y1 = (Y1 & 0xf0) + 7; // if collision, realign
;
	lda     _Y1
	and     #$F0
	clc
	adc     #$07
	sta     _Y1
;
; corner = ((X1_Left_Side & 0xf0) >> 4) + (Y1_Top & 0xf0); // top left
;
L083D:	lda     _X1_Left_Side
	and     #$F0
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1_Top
	and     #$F0
	clc
	adc     ptr1
	sta     _corner
;
; if (C_MAP[corner] != 0)
;
	ldy     _corner
	lda     _C_MAP,y
	beq     L07D9
;
; Y1 = (Y1 & 0xf0) + 7; // if collision, realign
;
	lda     _Y1
	and     #$F0
	clc
	adc     #$07
L083A:	sta     _Y1
;
; }
;
L07D9:	rts

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
	beq     L0842
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
L0842:	lda     _joypad1
	and     #$02
	beq     L07E9
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
; collide_Check_LR();
;
L07E9:	jsr     _collide_Check_LR
;
; if ((joypad1 & DOWN) != 0){
;
	lda     _joypad1
	and     #$04
	beq     L0843
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
L0843:	lda     _joypad1
	and     #$08
	beq     L07F8
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
; collide_Check_UD();
;
L07F8:	jmp     _collide_Check_UD

.endproc

; ---------------------------------------------------------------
; void __near__ Draw_Background (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Draw_Background: near

.segment	"CODE"

;
; All_Off();
;
	jsr     _All_Off
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
; UnRLE(All_Backgrounds[which_BGD]); // uncompresses our BG tiles
;
	tax
	lda     _which_BGD
	asl     a
	bcc     L0847
	inx
	clc
L0847:	adc     #<(_All_Backgrounds)
	sta     ptr1
	txa
	adc     #>(_All_Backgrounds)
	sta     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	tax
	dey
	lda     (ptr1),y
	jsr     _UnRLE
;
; p_C_MAP = All_Collision_Maps[which_BGD];
;
	ldx     #$00
	lda     _which_BGD
	asl     a
	bcc     L0848
	inx
	clc
L0848:	adc     #<(_All_Collision_Maps)
	sta     ptr1
	txa
	adc     #>(_All_Collision_Maps)
	sta     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	sta     _p_C_MAP+1
	dey
	lda     (ptr1),y
	sta     _p_C_MAP
;
; for (index = 0;index < 240; ++index){
;
	sty     _index
L0849:	lda     _index
	cmp     #$F0
	bcs     L080F
;
; C_MAP[index] = p_C_MAP[index];
;
	lda     #<(_C_MAP)
	ldx     #>(_C_MAP)
	clc
	adc     _index
	bcc     L0818
	inx
L0818:	jsr     pushax
	lda     _p_C_MAP
	ldx     _p_C_MAP+1
	ldy     _index
	sta     ptr1
	stx     ptr1+1
	lda     (ptr1),y
	ldy     #$00
	jsr     staspidx
;
; for (index = 0;index < 240; ++index){
;
	inc     _index
	jmp     L0849
;
; Wait_Vblank(); // don't turn on screen until in v-blank
;
L080F:	jsr     _Wait_Vblank
;
; All_On();
;
	jsr     _All_On
;
; Reset_Scroll();
;
	jsr     _Reset_Scroll
;
; ++which_BGD;
;
	inc     _which_BGD
;
; if (which_BGD == 4) // shuffles between 0-3
;
	lda     _which_BGD
	cmp     #$04
	bne     L081F
;
; which_BGD = 0;
;
	lda     #$00
	sta     _which_BGD
;
; }
;
L081F:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; All_Off(); // turn off screen
;
	jsr     _All_Off
;
; X1 = 0x7f; // starting position
;
	lda     #$7F
	sta     _X1
;
; Y1 = 0x77; // middle of screen
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
; All_On(); // turn on screen
;
	jsr     _All_On
;
; while (NMI_flag == 0); // wait till NMI
;
L084A:	lda     _NMI_flag
	beq     L084A
;
; if (new_background > 0) {
;
	lda     _new_background
	beq     L06D7
;
; Draw_Background();
;
	jsr     _Draw_Background
;
; new_background = 0;
;
	lda     #$00
	sta     _new_background
;
; Get_Input();
;
L06D7:	jsr     _Get_Input
;
; move_logic();
;
	jsr     _move_logic
;
; check_Start();
;
	jsr     _check_Start
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
; while (1){ // infinite loop
;
	jmp     L084A

.endproc

