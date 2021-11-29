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
