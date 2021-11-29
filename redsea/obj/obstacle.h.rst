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
