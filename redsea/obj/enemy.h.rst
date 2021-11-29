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
                             20 .globl enemy_vector
                             21 .globl ent_clear
                             22 .globl ent_move
                             23 .globl ent_update
                             24 .globl ent_draw
                             25 .globl ent_doForAll
                             26 .globl ent_new_type1
                             27 .globl ent_new_type2
                             28 .globl ent_new_type3
                             29 .globl _enemy12_sp_0
                             30 .globl _enemy12_sp_1
                             31 .globl _enemy12_sp_2
                             32 .globl _enemy12_sp_3
                             33 .globl _enemy12_sp_4
                             34 .globl _enemy12_sp_5
                             35 .globl _enemy12_sp_6
                             36 .globl _enemy12_sp_7
                             37 .globl _enemy12_sp_8
                             38 .globl reset_enemies
                             39 .globl shootEffect
                             40 .globl ent_start_level_1
                             41 .globl ent_start_level_2
                             42 .globl ent_start_level_3
                             43 .globl ent_start_level_4
                             44 .globl ent_start_level_5
                             45 .globl ent_start_level_6
                             46 .globl _enemy2_sp_0
                             47 .globl _enemy2_sp_1
                             48 .globl _enemy2_sp_2
                             49 .globl enemy_window
                             50 .globl ent_updEnemy2
                             51 
                             52 
                             53 .macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _sprite, _upd, _anim, _spAct, _shooting, _animSh, _animDie
                             54 _name: 
                             55 	DefineDrawableEntity _name'_drawable, _x, _y, _w, _h, _sprite
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56    .db   _vx, _vy     ;; VX, VY
                             57    .dw   _upd         ;; Update
                             58    .db   _anim		  ;;Clock to change sprite
                             59    .db   _spAct       ;;Actual sprite 
                             60    .db   _shooting    ;;If the enemy is shooting or not (0=not, 1=yes)
                             61    .db   _animSh	  ;;Clock to change sprite while shooting
                             62    .db   _animDie	  ;;clock to change the sprite while is dying
                             63 _name'_size = . - _name
                             64 .endm
                             65 
                     0006    66 e_size_dw = 6
                             67 
                     0000    68 e_de = 0
                     0006    69 e_vx = 0 + e_size_dw
                     0007    70 e_vy = 1 + e_size_dw
                     0008    71 e_up_l = 2 + e_size_dw
                     0009    72 e_up_h = 3 + e_size_dw
                     000A    73 e_anim = 4 + e_size_dw
                     000B    74 e_spAct = 5 + e_size_dw
                     000C    75 e_shooting = 6 + e_size_dw
                     000D    76 e_shClock = 7 + e_size_dw
                     000E    77 e_shDie = 8 + e_size_dw
                             78 
                             79 .macro DefineEntityDefault _name, _suf
                             80 
                             81 	DefineEntity _name'_suf, 0, 0, 1, 0, #0x08, #0x14, _enemy12_sp_0, ent_updEnemy, #0x03, 0, 0, #0x0A, #0x0A
                             82 
                             83 .endm
                             84 
                             85 .macro DefineNEntities _name, _n
                             86 	_c = 0
                             87 	.rept _n
                             88 		DefineEntityDefault _name, \_c
                             89 		_c=_c+1
                             90 	.endm
                             91 .endm
