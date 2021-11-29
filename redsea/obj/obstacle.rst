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



                             20 .include "obstacle.h.s"
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
                             20 .globl ob_draw
                             21 .globl ob_init
                             22 .globl ob_damage
                             23 .globl _obstacle_sp_0
                             24 .globl _obstacle_sp_1
                             25 .globl _mastil_sp
                             26 .globl _camarote_sp
                             27 .globl obstacle
                             28 .globl obstacle2
                             29 .globl mastil
                             30 .globl camarote
                             31 .globl ob_level_1
                             32 .globl ob_level_3
                             33 .globl ob_level_4
                             34 .globl ob_level_5
                             35 .globl ob_level_6
                             36 .globl ob_draw_obstacles
                             37 
                             38 .macro DefineObstacle _name, _x, _y, _w, _h, _sprite, _life 
                             39 _name: 
                             40 	DefineDrawableEntity _name'_drawable, _x, _y, _w, _h, _sprite
                             41    .db   _life
                             42 _name'_size = . - _name
                             43 .endm
                             44 
                     0006    45 o_size_dw = 6
                             46 
                     0000    47 o_de = 0
                     0007    48 o_life = 1 + o_size_dw
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             22 .include "main.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             55 .globl cpct_setPALColour_asm
                             56 .globl DecompressTilemap
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             23 
   4798                      24 DefineObstacle obstacle, #0x00, #0x00, #0x06, #0x0F, _obstacle_sp_0, #0x05
   4798                       1 obstacle: 
   0000                       2 	DefineDrawableEntity obstacle_drawable, #0x00, #0x00, #0x06, #0x0F, _obstacle_sp_0
   0000                       1 obstacle_drawable:
   4798 00 00                 2 	.db #0x00, #0x00
   479A 06 0F                 3 	.db #0x06, #0x0F
   479C 53 35                 4 	.dw _obstacle_sp_0
   479E 05                    3    .db   #0x05
                     0007     4 obstacle_size = . - obstacle
   479F                      25 DefineObstacle obstacle2, #0x00, #0x00, #0x06, #0x0F, _obstacle_sp_0, #0x05
   479F                       1 obstacle2: 
   0007                       2 	DefineDrawableEntity obstacle2_drawable, #0x00, #0x00, #0x06, #0x0F, _obstacle_sp_0
   0007                       1 obstacle2_drawable:
   479F 00 00                 2 	.db #0x00, #0x00
   47A1 06 0F                 3 	.db #0x06, #0x0F
   47A3 53 35                 4 	.dw _obstacle_sp_0
   47A5 05                    3    .db   #0x05
                     0007     4 obstacle2_size = . - obstacle2
   47A6                      26 DefineObstacle mastil, #0x0C, #0x18, #0x04, #0x32, _mastil_sp, #0xFF
   47A6                       1 mastil: 
   000E                       2 	DefineDrawableEntity mastil_drawable, #0x0C, #0x18, #0x04, #0x32, _mastil_sp
   000E                       1 mastil_drawable:
   47A6 0C 18                 2 	.db #0x0C, #0x18
   47A8 04 32                 3 	.db #0x04, #0x32
   47AA 27 39                 4 	.dw _mastil_sp
   47AC FF                    3    .db   #0xFF
                     0007     4 mastil_size = . - mastil
   47AD                      27 DefineObstacle camarote, #0x3C, #0x18, #0x14, #0x1A, _camarote_sp, #0xFF
   47AD                       1 camarote: 
   0015                       2 	DefineDrawableEntity camarote_drawable, #0x3C, #0x18, #0x14, #0x1A, _camarote_sp
   0015                       1 camarote_drawable:
   47AD 3C 18                 2 	.db #0x3C, #0x18
   47AF 14 1A                 3 	.db #0x14, #0x1A
   47B1 1F 37                 4 	.dw _camarote_sp
   47B3 FF                    3    .db   #0xFF
                     0007     4 camarote_size = . - camarote
                             28 
   47B4 00                   29 ob_created: .db #0
   47B5 00                   30 ob_active: 	.db #0
                             31 
   47B6                      32 ob_init:
   47B6 21 98 47      [10]   33 	ld hl, #obstacle
   47B9 CD C3 47      [17]   34 	call init_parameters
   47BC 21 9F 47      [10]   35 	ld hl, #obstacle2
   47BF CD C3 47      [17]   36 	call init_parameters
                             37 
   47C2 C9            [10]   38 ret
                             39 
   47C3                      40 init_parameters:
   47C3 23            [ 6]   41 	inc hl
   47C4 23            [ 6]   42 	inc hl 
   47C5 23            [ 6]   43 	inc hl
   47C6 23            [ 6]   44 	inc hl
   47C7 3E 53         [ 7]   45 	ld a, #_obstacle_sp_0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   47C9 77            [ 7]   46 	ld (hl), a
   47CA 23            [ 6]   47 	inc hl
   47CB 23            [ 6]   48 	inc hl
   47CC 3E 05         [ 7]   49 	ld a, #0x05
   47CE 77            [ 7]   50 	ld (hl), a
   47CF C9            [10]   51 ret
                             52 
   47D0                      53 ob_damage:
                             54 
   47D0 3E 18         [ 7]   55 	ld a, #0x18
   47D2 47            [ 4]   56 	ld b, a
   47D3 7E            [ 7]   57 	ld a, (hl) 	;;obstacle pos y
   47D4 90            [ 4]   58 	sub b
   47D5 28 10         [12]   59 	jr z, dont_damage
                             60 
   47D7 23            [ 6]   61 	inc hl
   47D8 23            [ 6]   62 	inc hl
   47D9 23            [ 6]   63 	inc hl
   47DA 23            [ 6]   64 	inc hl 	;;obstacles's life
   47DB 23            [ 6]   65 	inc hl
                             66 
   47DC 7E            [ 7]   67 	ld a, (hl)
   47DD 3D            [ 4]   68 	dec a
   47DE 20 06         [12]   69 	jr nz, barril_vivo
                             70 
                             71 	;;Change sprite
   47E0 2B            [ 6]   72 	dec hl
   47E1 2B            [ 6]   73 	dec hl
   47E2 36 AD         [10]   74 	ld (hl), #_obstacle_sp_1
   47E4 23            [ 6]   75 	inc hl
   47E5 23            [ 6]   76 	inc hl
   47E6                      77 	barril_vivo:
                             78 
   47E6 77            [ 7]   79 	ld (hl), a 
                             80 
   47E7                      81 	dont_damage:
                             82 
   47E7 C9            [10]   83 ret
                             84 
                             85 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             86 ;;;;;;;;;;;;ENT_DRAW ;;;;;;;;;;;;;
                             87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             88 
   47E8                      89 ob_draw:
   47E8 C3 BF 46      [10]   90 	jp render_draw
                             91 
                             92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             93 ;;;;;;;ob_draw_obstacles ;;;;;;;;;
                             94 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             95 
   47EB                      96 ob_draw_obstacles:
                             97 	
   47EB 3A B5 47      [13]   98 	ld a, (ob_active)
   47EE 3D            [ 4]   99 	dec a
   47EF FA 08 48      [10]  100 	jp m, no_ob_active
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            101 
   47F2 DD 21 98 47   [14]  102 		ld ix, #obstacle
   47F6 CD BF 46      [17]  103 		call render_draw
   47F9 3A B5 47      [13]  104 		ld a, (ob_active)
   47FC 3D            [ 4]  105 		dec a
   47FD 3D            [ 4]  106 		dec a
   47FE FA 08 48      [10]  107 		jp m, no_ob_active
                            108 
   4801 DD 21 9F 47   [14]  109 			ld ix, #obstacle2
   4805 C3 BF 46      [10]  110 			jp render_draw
                            111 
   4808                     112 no_ob_active:
                            113 
                            114 
   4808 C9            [10]  115 	ret
                            116 
                            117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            118 ;;;;;;;;;OB_LEVEL_X;;;;;;;;;;;;;;;
                            119 ;; Change pos xy in every level ;;
                            120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            121 
   4809                     122 ob_level_1:
                            123 
                            124 	;Number of active obstacle 
   4809 3E 00         [ 7]  125 	ld a, #0
   480B 32 B5 47      [13]  126 	ld (ob_active), a
                            127 
                            128 	;Pos obstacle 1
   480E DD 21 98 47   [14]  129 	ld ix, #obstacle
   4812 DD 36 00 00   [19]  130 	ld de_x(ix), #0
   4816 DD 36 01 00   [19]  131 	ld de_y(ix), #0
                            132 
                            133 	;Pos obstacle 2
   481A DD 21 9F 47   [14]  134 	ld ix, #obstacle2
   481E DD 36 00 00   [19]  135 	ld de_x(ix), #0
   4822 DD 36 01 00   [19]  136 	ld de_y(ix), #0
                            137 
   4826 C9            [10]  138 ret
                            139 
   4827                     140 ob_level_3:
                            141 
                            142 	;Number of active obstacle 
   4827 3E 01         [ 7]  143 	ld a, #1
   4829 32 B5 47      [13]  144 	ld (ob_active), a
                            145 	
                            146 	;Pos obstacle 1
   482C DD 21 98 47   [14]  147 	ld ix, #obstacle
   4830 DD 36 00 29   [19]  148 	ld de_x(ix), #0x29
   4834 DD 36 01 50   [19]  149 	ld de_y(ix), #0x50
                            150 
                            151 	;Pos obstacle 2
   4838 DD 21 9F 47   [14]  152 	ld ix, #obstacle2
   483C DD 36 00 00   [19]  153 	ld de_x(ix), #0
   4840 DD 36 01 00   [19]  154 	ld de_y(ix), #0
                            155 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   4844 C9            [10]  156 ret
                            157 
   4845                     158 ob_level_4:
                            159 
                            160 	;Number of active obstacle 
   4845 3E 01         [ 7]  161 	ld a, #1
   4847 32 B5 47      [13]  162 	ld (ob_active), a
                            163 	
                            164 	;Pos obstacle 1
   484A DD 21 98 47   [14]  165 	ld ix, #obstacle
   484E DD 36 00 1C   [19]  166 	ld de_x(ix), #0x1C
   4852 DD 36 01 38   [19]  167 	ld de_y(ix), #0x38
                            168 
                            169 	;Pos obstacle 2
   4856 DD 21 9F 47   [14]  170 	ld ix, #obstacle2
   485A DD 36 00 00   [19]  171 	ld de_x(ix), #0
   485E DD 36 01 00   [19]  172 	ld de_y(ix), #0
                            173 
   4862 C9            [10]  174 ret
                            175 
   4863                     176 ob_level_5:
                            177 
                            178 	;Number of active obstacle 
   4863 3E 01         [ 7]  179 	ld a, #1
   4865 32 B5 47      [13]  180 	ld (ob_active), a
                            181 	
                            182 	;Pos obstacle 1
   4868 DD 21 98 47   [14]  183 	ld ix, #obstacle
   486C DD 36 00 20   [19]  184 	ld de_x(ix), #0x20
   4870 DD 36 01 23   [19]  185 	ld de_y(ix), #0x23
                            186 
                            187 	;Pos obstacle 2
   4874 DD 21 9F 47   [14]  188 	ld ix, #obstacle2
   4878 DD 36 00 00   [19]  189 	ld de_x(ix), #0
   487C DD 36 01 00   [19]  190 	ld de_y(ix), #0
                            191 
   4880 C9            [10]  192 ret
                            193 
   4881                     194 ob_level_6:
                            195 
                            196 	;Number of active obstacle 
   4881 3E 02         [ 7]  197 	ld a, #2
   4883 32 B5 47      [13]  198 	ld (ob_active), a
                            199 	
                            200 	;Pos obstacle 1
   4886 DD 21 98 47   [14]  201 	ld ix, #obstacle
   488A DD 36 00 10   [19]  202 	ld de_x(ix), #0x10
   488E DD 36 01 50   [19]  203 	ld de_y(ix), #0x50
                            204 
                            205 	;Pos obstacle 2
   4892 DD 21 9F 47   [14]  206 	ld ix, #obstacle2
   4896 DD 36 00 30   [19]  207 	ld de_x(ix), #0x30
   489A DD 36 01 23   [19]  208 	ld de_y(ix), #0x23
                            209 
   489E C9            [10]  210 ret
