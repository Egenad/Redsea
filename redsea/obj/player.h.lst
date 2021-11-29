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
                             55 .globl reset_player
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



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
