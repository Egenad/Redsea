ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;------------------------------------------------LICENSE NOTICE------------------------------------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "Redsea"
                              3 ;;  Copyright (C) 2018 Gameroid / Angel Jesus Terol Martinez (@miya_nashi) / Raquel Gonzalez Roma (@kelara712) / Carla Macia Diez (@shiryuko)
                              4 ;;  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;------------------------------------------------LICENSE NOTICE-------------------------------------------------------------------------
                             19 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             20 .include "bullet.h.s"
                              1 ;;------------------------------------------------LICENSE NOTICE------------------------------------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "Redsea"
                              3 ;;  Copyright (C) 2018 Gameroid / Angel Jesus Terol Martinez (@miya_nashi) / Raquel Gonzalez Roma (@kelara712) / Carla Macia Diez (@shiryuko)
                              4 ;;  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;------------------------------------------------LICENSE NOTICE-------------------------------------------------------------------------
                             19 
                             20 .globl _assets_sp_1
                             21 .globl bul_move
                             22 .globl bul_update
                             23 .globl bul_clear
                             24 .globl bul_draw
                             25 .globl bul_doForAll
                             26 .globl bul_new
                             27 .globl bullet_vector
                             28 .globl reset_bullets
                             29 
                             30 .macro DefineBullet _name, _x, _y, _vx, _vy, _w, _h, _sprite, _upd
                             31 _name: 
                             32 	DefineDrawableEntity _name'_drawable, _x, _y, _w, _h, _sprite
                             33    .db   _vx, _vy     ;; VX, VY
                             34    .dw   _upd         ;; Update
                             35 _name'_size = . - _name
                             36 .endm
                             37 
                     0006    38 b_size_dw = 6
                             39 
                     0000    40 b_de = 0
                     0006    41 b_vx = 0 + b_size_dw
                     0007    42 b_vy = 1 + b_size_dw
                     0008    43 b_up_l = 2 + b_size_dw
                     0009    44 b_up_h = 3 + b_size_dw
                             45 
                             46 .macro DefineBulletDefault _name, _suf
                             47 
                             48 	DefineBullet _name'_suf, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move
                             49 
                             50 .endm
                             51 
                             52 .macro DefineNBullets _name, _n
                             53 	_c = 0
                             54 	.rept _n
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             55 		DefineBulletDefault _name, \_c
                             56 		_c=_c+1
                             57 	.endm
                             58 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             21 .include "render.h.s"
                              1 ;;------------------------------------------------LICENSE NOTICE------------------------------------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "Redsea"
                              3 ;;  Copyright (C) 2018 Gameroid / Angel Jesus Terol Martinez (@miya_nashi) / Raquel Gonzalez Roma (@kelara712) / Carla Macia Diez (@shiryuko)
                              4 ;;  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;------------------------------------------------LICENSE NOTICE-------------------------------------------------------------------------
                             19 
                             20 .globl render_draw
                             21 .globl render_clear
                             22 .globl ren_newScene
                             23 .globl m_back_buffer
                             24 .globl render_clear_asset
                             25 .globl render_clear_asset_both
                             26 
                             27 .macro DefineDrawableEntity _name, _x, _y, _w, _h, _s
                             28 _name:
                             29 	.db _x, _y
                             30 	.db _w, _h
                             31 	.dw _s
                             32 .endm
                     0000    33 de_x = 0
                     0001    34 de_y = 1
                     0002    35 de_w = 2
                     0003    36 de_h = 3
                     0004    37 de_sp_l = 4
                     0005    38 de_sp_h = 5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             22 .include "player.h.s"
                              1 ;;------------------------------------------------LICENSE NOTICE------------------------------------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "Redsea"
                              3 ;;  Copyright (C) 2018 Gameroid / Angel Jesus Terol Martinez (@miya_nashi) / Raquel Gonzalez Roma (@kelara712) / Carla Macia Diez (@shiryuko)
                              4 ;;  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;------------------------------------------------LICENSE NOTICE-------------------------------------------------------------------------
                             19 
                             20 .globl pl_clear
                             21 .globl pl_clear_mira
                             22 .globl pl_move
                             23 .globl pl_update
                             24 .globl pl_draw
                             25 .globl pl_moveKeyboard
                             26 .globl pl_moveAsShooter
                             27 .globl hero_data
                             28 .globl shoot_data
                             29 .globl _hero_sp_0
                             30 .globl _hero_sp_1
                             31 .globl _hero_sp_2
                             32 .globl _hero_sp_3
                             33 .globl _hero_sp_4
                             34 .globl _hero_sp_5
                             35 .globl _hero_sp_6
                             36 .globl _hero_sp_7
                             37 .globl _hero_sp_8
                             38 .globl _assets_sp_0
                             39 .globl get_Enemy
                             40 .globl draw_Score
                             41 .globl _numbers_00
                             42 .globl _numbers_01
                             43 .globl _numbers_02
                             44 .globl _numbers_03
                             45 .globl _numbers_04
                             46 .globl _numbers_05
                             47 .globl _numbers_06
                             48 .globl _numbers_07
                             49 .globl _numbers_08
                             50 .globl _numbers_09
                             51 .globl _lifes_0
                             52 .globl _lifes_1
                             53 .globl draw_Lifes
                             54 .globl reduce_life
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             55 .globl reset_player
                             56 .globl level
                             57 
                             58 .macro DefinePlayer _name, _x, _y, _vx, _vy, _w, _h, _sprite, _upd
                             59 _name: 
                             60 	DefineDrawableEntity _name'_drawable, _x, _y, _w, _h, _sprite
                             61    .db   _vx, _vy     ;; VX, VY
                             62    .dw   _upd         ;; Update 
                             63 _name'_size = . - _name
                             64 .endm
                             65 
                     0006    66 p_size_dw = 6
                             67 
                     0000    68 p_de = 0
                     0006    69 p_vx = 0 + p_size_dw
                     0007    70 p_vy = 1 + p_size_dw
                     0008    71 p_up_l = 2 + p_size_dw
                     0009    72 p_up_h = 3 + p_size_dw
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             23 .include "main.h.s"
                              1 ;;------------------------------------------------LICENSE NOTICE------------------------------------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "Redsea"
                              3 ;;  Copyright (C) 2018 Gameroid / Angel Jesus Terol Martinez (@miya_nashi) / Raquel Gonzalez Roma (@kelara712) / Carla Macia Diez (@shiryuko)
                              4 ;;  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;------------------------------------------------LICENSE NOTICE-------------------------------------------------------------------------
                             19 
                             20 .globl cpct_disableFirmware_asm
                             21 .globl cpct_setVideoMode_asm
                             22 .globl cpct_waitVSYNC_asm
                             23 .globl cpct_drawSolidBox_asm
                             24 .globl cpct_getScreenPtr_asm
                             25 .globl cpct_scanKeyboard_asm
                             26 .globl cpct_isKeyPressed_asm
                             27 .globl cpct_setVideoMemoryPage_asm
                             28 .globl cpct_memset_f64_asm
                             29 .globl cpct_drawSprite_asm
                             30 .globl cpct_setPalette_asm
                             31 .globl _hero_pal
                             32 .globl _enemy_sc_sp
                             33 .globl cpct_zx7b_decrunch_s_asm
                             34 .globl _level0_pack_end
                             35 .globl cpct_etm_setDrawTilemap4x8_ag_asm
                             36 .globl cpct_etm_drawTilemap4x8_ag_asm
                             37 .globl _level0_W
                             38 .globl _tile_palette
                             39 .globl tilemap_ptr
                             40 .globl _menu_pack_end
                             41 .globl _menu2_pack_end
                             42 .globl reset_game_win
                             43 .globl reset_game
                             44 .globl cpct_getRandom_mxor_u8_asm
                             45 .globl cpct_akp_musicInit_asm
                             46 .globl cpct_akp_musicPlay_asm
                             47 .globl cpct_akp_stop_asm
                             48 .globl cpct_setInterruptHandler_asm
                             49 .globl _main_theme
                             50 .globl _true_theme
                             51 .globl _shootSFX
                             52 .globl cpct_akp_SFXInit_asm
                             53 .globl cpct_akp_SFXPlay_asm
                             54 .globl cpct_akp_SFXStop_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                             55 .globl cpct_setPALColour_asm
                             56 .globl DecompressTilemap
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                             24 
   449F                      25 bullet_vector:
   449F                      26 DefineNBullets bullet_vector, cont_bul
                     0000     1 	_c = 0
                              2 	.rept cont_bul
                              3 		DefineBulletDefault bullet_vector, \_c
                              4 		_c=_c+1
                              5 	.endm
   449F                       1 		DefineBulletDefault bullet_vector, \_c
                              1 
   0000                       2 	DefineBullet bullet_vector0, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move
   0000                       1 bullet_vector0: 
   0000                       2 	DefineDrawableEntity bullet_vector0_drawable, 0, 0, #0x04, #0x08, _assets_sp_1
   0000                       1 bullet_vector0_drawable:
   449F 00 00                 2 	.db 0, 0
   44A1 04 08                 3 	.db #0x04, #0x08
   44A3 27 36                 4 	.dw _assets_sp_1
   44A5 00 03                 3    .db   0, 3     ;; VX, VY
   44A7 9B 45                 4    .dw   bul_move         ;; Update
                     000A     5 bullet_vector0_size = . - bullet_vector0
                              3 
                     0001     2 		_c=_c+1
   44A9                       1 		DefineBulletDefault bullet_vector, \_c
                              1 
   44A9                       2 	DefineBullet bullet_vector1, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move
   000A                       1 bullet_vector1: 
   000A                       2 	DefineDrawableEntity bullet_vector1_drawable, 0, 0, #0x04, #0x08, _assets_sp_1
   000A                       1 bullet_vector1_drawable:
   44A9 00 00                 2 	.db 0, 0
   44AB 04 08                 3 	.db #0x04, #0x08
   44AD 27 36                 4 	.dw _assets_sp_1
   44AF 00 03                 3    .db   0, 3     ;; VX, VY
   44B1 9B 45                 4    .dw   bul_move         ;; Update
                     000A     5 bullet_vector1_size = . - bullet_vector1
                              3 
                     0002     2 		_c=_c+1
   44B3                       1 		DefineBulletDefault bullet_vector, \_c
                              1 
   44B3                       2 	DefineBullet bullet_vector2, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move
   0014                       1 bullet_vector2: 
   0014                       2 	DefineDrawableEntity bullet_vector2_drawable, 0, 0, #0x04, #0x08, _assets_sp_1
   0014                       1 bullet_vector2_drawable:
   44B3 00 00                 2 	.db 0, 0
   44B5 04 08                 3 	.db #0x04, #0x08
   44B7 27 36                 4 	.dw _assets_sp_1
   44B9 00 03                 3    .db   0, 3     ;; VX, VY
   44BB 9B 45                 4    .dw   bul_move         ;; Update
                     000A     5 bullet_vector2_size = . - bullet_vector2
                              3 
                     0003     2 		_c=_c+1
   44BD                       1 		DefineBulletDefault bullet_vector, \_c
                              1 
   44BD                       2 	DefineBullet bullet_vector3, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move
   001E                       1 bullet_vector3: 
   001E                       2 	DefineDrawableEntity bullet_vector3_drawable, 0, 0, #0x04, #0x08, _assets_sp_1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   001E                       1 bullet_vector3_drawable:
   44BD 00 00                 2 	.db 0, 0
   44BF 04 08                 3 	.db #0x04, #0x08
   44C1 27 36                 4 	.dw _assets_sp_1
   44C3 00 03                 3    .db   0, 3     ;; VX, VY
   44C5 9B 45                 4    .dw   bul_move         ;; Update
                     000A     5 bullet_vector3_size = . - bullet_vector3
                              3 
                     0004     2 		_c=_c+1
   44C7                       1 		DefineBulletDefault bullet_vector, \_c
                              1 
   44C7                       2 	DefineBullet bullet_vector4, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move
   0028                       1 bullet_vector4: 
   0028                       2 	DefineDrawableEntity bullet_vector4_drawable, 0, 0, #0x04, #0x08, _assets_sp_1
   0028                       1 bullet_vector4_drawable:
   44C7 00 00                 2 	.db 0, 0
   44C9 04 08                 3 	.db #0x04, #0x08
   44CB 27 36                 4 	.dw _assets_sp_1
   44CD 00 03                 3    .db   0, 3     ;; VX, VY
   44CF 9B 45                 4    .dw   bul_move         ;; Update
                     000A     5 bullet_vector4_size = . - bullet_vector4
                              3 
                     0005     2 		_c=_c+1
   44D1                       1 		DefineBulletDefault bullet_vector, \_c
                              1 
   44D1                       2 	DefineBullet bullet_vector5, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move
   0032                       1 bullet_vector5: 
   0032                       2 	DefineDrawableEntity bullet_vector5_drawable, 0, 0, #0x04, #0x08, _assets_sp_1
   0032                       1 bullet_vector5_drawable:
   44D1 00 00                 2 	.db 0, 0
   44D3 04 08                 3 	.db #0x04, #0x08
   44D5 27 36                 4 	.dw _assets_sp_1
   44D7 00 03                 3    .db   0, 3     ;; VX, VY
   44D9 9B 45                 4    .dw   bul_move         ;; Update
                     000A     5 bullet_vector5_size = . - bullet_vector5
                              3 
                     0006     2 		_c=_c+1
                             27 
                             28 ;;default data for bullet in case we need to restart
   44DB                      29 DefineBullet bullet_default, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move
   44DB                       1 bullet_default: 
   003C                       2 	DefineDrawableEntity bullet_default_drawable, 0, 0, #0x04, #0x08, _assets_sp_1
   003C                       1 bullet_default_drawable:
   44DB 00 00                 2 	.db 0, 0
   44DD 04 08                 3 	.db #0x04, #0x08
   44DF 27 36                 4 	.dw _assets_sp_1
   44E1 00 03                 3    .db   0, 3     ;; VX, VY
   44E3 9B 45                 4    .dw   bul_move         ;; Update
                     000A     5 bullet_default_size = . - bullet_default
                             30 
                     0006    31 cont_bul = 6      
                     000A    32 k_size_bul = bullet_vector0_size
                             33 
   44E5 00                   34 active_bullets: .db 00
   44E6 9F 44                35 m_next_bullet: .dw bullet_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   44E8 00 00                36 copy_bul:	   .dw 00
                             37 
                             38 
                             39 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             40 ;;;;;;;;;;;;BUL_NEW;;;;;;;;;;;;;;;
                             41 ;;;;;;creates a new bullet ;;;;;;;
                             42 ;;;and changes its position to;;;;
                             43 ;;;;the enemy who shooted it ;;;;;
                             44 ;;;;;destroys: a, b, hl, de;;;;;;;
                             45 ;;;;;arguments: ix -> enemy;;;;;;;
                             46 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             47 
   44EA                      48 bul_new:
                             49 
                             50 	;; if pos y is 0, no create bullet
   44EA DD 7E 01      [19]   51 	ld a, de_y(ix)
   44ED 3D            [ 4]   52 	dec a
   44EE FA 16 45      [10]   53 	jp m, no_crear_bul
                             54 
                             55 	;;if the array is full dont create a new bullet
   44F1 06 06         [ 7]   56 	ld b, #cont_bul
   44F3 3A E5 44      [13]   57 	ld a, (active_bullets)
   44F6 90            [ 4]   58 	sub b
   44F7 28 1D         [12]   59 	jr z, no_crear_bul
                             60 
                             61 	;;increments bullet counter
   44F9 3A E5 44      [13]   62 	ld a, (active_bullets)
   44FC 3C            [ 4]   63 	inc a
   44FD 32 E5 44      [13]   64 	ld (active_bullets), a
                             65 
                             66 	;;increments bullet pointer
   4500 2A E6 44      [16]   67 	ld hl, (m_next_bullet)
   4503 11 0A 00      [10]   68 	ld de, #k_size_bul
   4506 19            [11]   69 	add hl, de
   4507 22 E6 44      [16]   70 	ld (m_next_bullet), hl
                             71 
                             72 	;;points to the last bullet created and changes its position to the enemy who shooted it
   450A B7            [ 4]   73 	or a
   450B ED 52         [15]   74 	sbc hl, de
                             75 
   450D DD 7E 00      [19]   76 	ld a, de_x(ix)
   4510 77            [ 7]   77 	ld (hl), a
   4511 23            [ 6]   78 	inc hl
   4512 DD 7E 01      [19]   79 	ld a, de_y(ix)
   4515 77            [ 7]   80 	ld (hl), a
                             81 
   4516                      82 no_crear_bul:
                             83 
   4516 C9            [10]   84 ret
                             85 
                             86 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             87 ;;;;;;;;;;;;BUL_COPY;;;;;;;;;;;;;;
                             88 ;;copies data from one bullet;;;;;
                             89 ;;;;;;;;;;;;to oher ;;;;;;;;;;;;;;
                             90 ;;;;;destroys: hl, bc, de ;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                             91 ;;;arguments: hl -> origin;;;;;;;;
                             92 ;;;;;;;;;;;;;;de -> destiny;;;;;;;
                             93 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             94 
   4517                      95 bul_copy:
   4517 01 0A 00      [10]   96 	ld bc, #k_size_bul
   451A ED B0         [21]   97 	ldir
   451C C9            [10]   98 	ret
                             99 
                            100 
                            101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            102 ;;;;;;;;;;;BUL_DESTROY;;;;;;;;;;;;
                            103 ;;;;;; destroys a bullet ;;;;;;;;;
                            104 ;;;arguments: ix -> bullet to ;;;;
                            105 ;;;;;;;;;;;;;destroy;;;;;;;;;;;;;;
                            106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            107 
   451D                     108 bul_destroy:
                            109 
   451D 11 0A 00      [10]  110 	ld de, #k_size_bul
   4520 2A E6 44      [16]  111 	ld hl, (m_next_bullet)
   4523 B7            [ 4]  112 	or a
   4524 ED 52         [15]  113 	sbc hl, de   			;;hl has de latest bullet created (our origin)
   4526 DD 22 E8 44   [20]  114 	ld (copy_bul), ix
   452A ED 5B E8 44   [20]  115 	ld de, (copy_bul) 		;;we want to copy the data of the latest bullet to the bullet we are going to destroy, so we can just copy the default values on the last bullet of the array
                            116 
   452E CD 17 45      [17]  117 	call bul_copy  			;;now we have two equal bullets. We just need to erase the last one
                            118 
   4531 11 0A 00      [10]  119 	ld de, #k_size_bul
   4534 2A E6 44      [16]  120 	ld hl, (m_next_bullet)
   4537 B7            [ 4]  121 	or a
   4538 ED 52         [15]  122 	sbc hl, de
   453A 11 DB 44      [10]  123 	ld de, #bullet_default
                            124 
   453D EB            [ 4]  125 	ex de, hl
                            126 
   453E CD 17 45      [17]  127 	call bul_copy
                            128 
                            129 	;;decrease the active bullets counter
   4541 3A E5 44      [13]  130 	ld a, (active_bullets)
   4544 3D            [ 4]  131 	dec a 
   4545 32 E5 44      [13]  132 	ld (active_bullets), a
                            133 
                            134 	;;and change the last bullet pointer
   4548 11 0A 00      [10]  135 	ld de, #k_size_bul
   454B 2A E6 44      [16]  136 	ld hl, (m_next_bullet)
   454E B7            [ 4]  137 	or a
   454F ED 52         [15]  138 	sbc hl, de
   4551 22 E6 44      [16]  139 	ld (m_next_bullet), hl
                            140 
   4554 C9            [10]  141 	ret
                            142 
                            143 
                            144 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            145 ;;;;;;;;;;;;BUL_CLEAR;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



                            146 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            147 
   4555                     148 bul_clear:
   4555 C3 06 47      [10]  149 	jp render_clear_asset
                            150 
                            151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            152 ;;;;;;;;;;;BUL_UPDATE;;;;;;;;;;;;;
                            153 ;;;;calls the method wich the ;;;;
                            154 ;;entity has stored on its data;;;
                            155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            156 
   4558                     157 bul_update:
                            158 
   4558 DD 66 09      [19]  159 	ld     h, b_up_h(ix)
   455B DD 6E 08      [19]  160    	ld     l, b_up_l(ix)
   455E E9            [ 4]  161    	jp    (hl)
                            162 
                            163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            164 ;;;;;;;;;;;;BUL_DRAW;;;;;;;;;;;;;;
                            165 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            166 
   455F                     167 bul_draw:
   455F C3 BF 46      [10]  168 	jp render_draw
                            169 
                            170 
                            171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            172 ;;;;;;;BUL_CHECKCOLPLAYER;;;;;;;;;
                            173 ;;Check colision with the player;;
                            174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            175 
   4562                     176 bul_checkColPlayer:
                            177 
   4562 21 1D 52      [10]  178 	ld hl, #hero_data
                            179 
                            180 	;;Check collision  bullet - hero
                            181 
   4565 DD 7E 01      [19]  182 	ld a, de_y(ix)        ;;a=bullet_y
   4568 DD 46 03      [19]  183 	ld b, de_h(ix)	  	  ;;a=bullet_h
   456B 80            [ 4]  184 	add b         		  ;;a=bullet_y+bullet_h
   456C 23            [ 6]  185 	inc hl 				  ;;hl apunta a hero_y
   456D 46            [ 7]  186 	ld b, (hl)			  ;;b=hero_y
   456E 90            [ 4]  187 	sub b 				  ;;a=(bullet_y+bullet_h)-hero_y
   456F 28 29         [12]  188 	jr z, no_collision 	  
   4571 FA 9A 45      [10]  189 	jp m, no_collision
                            190 
                            191 	;;check colision bullet - hero
   4574 DD 7E 00      [19]  192 	ld a, de_x(ix) 		  ;;a=bullet_x
   4577 DD 46 02      [19]  193 	ld b, de_w(ix)		  ;;b=bullet_w
   457A 80            [ 4]  194 	add b         		  ;;a=bullet_x+bullet_w
   457B 2B            [ 6]  195 	dec hl 				  ;;hl apunta a hero_x
   457C 46            [ 7]  196 	ld b, (hl)     		  ;;b=hero_x
   457D 90            [ 4]  197 	sub b 				  ;;a=(bullet_x+bullet_w)-hero_x
   457E 28 1A         [12]  198 	jr z, no_collision
   4580 FA 9A 45      [10]  199 	jp m, no_collision
                            200 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



                            201 	;;check colision hero - bullet
   4583 7E            [ 7]  202 	ld a, (hl) 		  	  ;;a=hero_x
   4584 23            [ 6]  203 	inc hl
   4585 23            [ 6]  204 	inc hl
   4586 46            [ 7]  205 	ld b, (hl)			  ;;b=hero_w
   4587 80            [ 4]  206 	add b         		  ;;a=hero_x+hero_w
   4588 DD 46 00      [19]  207 	ld b, de_x(ix)   	  ;;b=bullet_x
   458B 90            [ 4]  208 	sub b 				  ;;a=(hero_x+hero_w)-bullet_x
   458C 28 0C         [12]  209 	jr z, no_collision 	  
   458E FA 9A 45      [10]  210 	jp m, no_collision
                            211 
                            212 	;;kill player
   4591 CD 85 55      [17]  213 	call reduce_life
                            214 	;;clear bullet
   4594 CD 37 47      [17]  215 	call render_clear_asset_both
                            216 	;;destroy bullet
   4597 CD 1D 45      [17]  217 	call bul_destroy
                            218 
   459A                     219 no_collision:
                            220 
   459A C9            [10]  221 	ret
                            222 
                            223 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            224 ;;;;;;;;;;;BUL_MOVE;;;;;;;;;;;;;;;
                            225 ;;;moves bullet to its next;;;;;;;
                            226 ;;position using its velocity ;;;;
                            227 ;;;;;;;;;destroys: a, b;;;;;;;;;;;
                            228 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            229 
   459B                     230 bul_move:
                            231 	
   459B CD 62 45      [17]  232 	call bul_checkColPlayer
                            233 
                            234 	;;if the bullet has reached the end -> destroy
                            235 
   459E 3E 70         [ 7]  236 	ld a, #0x70
   45A0 DD 46 01      [19]  237 	ld b, de_y(ix)
   45A3 90            [ 4]  238 	sub b
   45A4 F2 AD 45      [10]  239 	jp p, dont_destroy_bullet
   45A7 CD 37 47      [17]  240 	call render_clear_asset_both
   45AA CD 1D 45      [17]  241 	call bul_destroy
                            242 
   45AD                     243 dont_destroy_bullet:
   45AD DD 7E 01      [19]  244    	ld    a, de_y(ix) 
   45B0 DD 86 07      [19]  245    	add   b_vy(ix)
   45B3 DD 77 01      [19]  246    	ld    de_y(ix), a
                            247 
   45B6 DD 7E 00      [19]  248    	ld    a, de_x(ix) 
   45B9 DD 86 06      [19]  249    	add   b_vx(ix)
   45BC DD 77 00      [19]  250    	ld    de_x(ix), a
                            251 
   45BF C9            [10]  252 	ret
                            253 
                            254 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            255 ;;;;;;;;;;BUL_DOFORALL;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



                            256 ;;;calls the method stored in HL;;
                            257 ;;for the all the bullets stored;;
                            258 ;;;;;;;;;;in the vector;;;;;;;;;;;
                            259 ;;;;;;destroys: a, ix, bc, hl ;;;;
                            260 ;;arguments: hl ->method to call;;
                            261 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            262 
   45C0                     263 bul_doForAll:
                            264 
                            265 	;;check if there are no bullets created
   45C0 3A E5 44      [13]  266 	ld a, (active_bullets)
   45C3 3D            [ 4]  267 	dec a
   45C4 FA DE 45      [10]  268 	jp m, no_bullets
                            269 
   45C7 3A E5 44      [13]  270 	ld a, (active_bullets) 
   45CA DD 21 9F 44   [14]  271 	ld ix, #bullet_vector
   45CE 22 D3 45      [16]  272 	ld (metodoB), hl
   45D1                     273 vuelve_bul:
   45D1 F5            [11]  274 	push af
                     0134   275 	metodoB = . + 1
   45D2 CD 5F 45      [17]  276 	call bul_draw    ;;this method will be changed for the method loaded in hl
   45D5 F1            [10]  277 	pop af
   45D6 01 0A 00      [10]  278 	ld bc, #k_size_bul 
   45D9 DD 09         [15]  279 	add ix, bc
   45DB 3D            [ 4]  280 	dec a
   45DC 20 F3         [12]  281 	jr nz, vuelve_bul
                            282 
   45DE                     283 no_bullets:
                            284 
   45DE C9            [10]  285 ret
                            286 
                            287 
                            288 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            289 ;;;;;;;;;;;RESET_BULLETS;;;;;;;;;;
                            290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            291 
   45DF                     292 reset_bullets:
                            293 
                            294 
   45DF 3A E5 44      [13]  295 	ld a, (active_bullets)
   45E2 3D            [ 4]  296 	dec a
   45E3 FA F5 45      [10]  297 	jp m, not
   45E6 3A E5 44      [13]  298 	ld a, (active_bullets)
   45E9                     299 non_stop2:
   45E9 DD 21 9F 44   [14]  300 	ld ix, #bullet_vector
   45ED F5            [11]  301 	push af
   45EE CD 1D 45      [17]  302 	call bul_destroy
   45F1 F1            [10]  303 	pop af 
   45F2 3D            [ 4]  304 	dec a
   45F3 20 F4         [12]  305 	jr nz, non_stop2
   45F5                     306 not:
   45F5 C9            [10]  307 	ret
