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
                             55 		DefineBulletDefault _name, \_c
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 		_c=_c+1
                             57 	.endm
                             58 .endm
