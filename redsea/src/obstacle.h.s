;;------------------------------------------------LICENSE NOTICE------------------------------------------------------------------------------
;;  This file is part of Amstrad CPC videogame "Redsea"
;;  Copyright (C) 2018 Gameroid / Angel Jesus Terol Martinez (@miya_nashi) / Raquel Gonzalez Roma (@kelara712) / Carla Macia Diez (@shiryuko)
;;  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
;;
;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU Lesser General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.
;;
;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU Lesser General Public License for more details.
;;
;;  You should have received a copy of the GNU Lesser General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;------------------------------------------------LICENSE NOTICE-------------------------------------------------------------------------

.globl ob_draw
.globl ob_init
.globl ob_damage
.globl _obstacle_sp_0
.globl _obstacle_sp_1
.globl _mastil_sp
.globl _camarote_sp
.globl obstacle
.globl obstacle2
.globl mastil
.globl camarote
.globl ob_level_1
.globl ob_level_3
.globl ob_level_4
.globl ob_level_5
.globl ob_level_6
.globl ob_draw_obstacles

.macro DefineObstacle _name, _x, _y, _w, _h, _sprite, _life 
_name: 
	DefineDrawableEntity _name'_drawable, _x, _y, _w, _h, _sprite
   .db   _life
_name'_size = . - _name
.endm

o_size_dw = 6

o_de = 0
o_life = 1 + o_size_dw
