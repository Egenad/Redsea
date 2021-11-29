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

.globl _assets_sp_1
.globl bul_move
.globl bul_update
.globl bul_clear
.globl bul_draw
.globl bul_doForAll
.globl bul_new
.globl bullet_vector
.globl reset_bullets

.macro DefineBullet _name, _x, _y, _vx, _vy, _w, _h, _sprite, _upd
_name: 
	DefineDrawableEntity _name'_drawable, _x, _y, _w, _h, _sprite
   .db   _vx, _vy     ;; VX, VY
   .dw   _upd         ;; Update
_name'_size = . - _name
.endm

b_size_dw = 6

b_de = 0
b_vx = 0 + b_size_dw
b_vy = 1 + b_size_dw
b_up_l = 2 + b_size_dw
b_up_h = 3 + b_size_dw

.macro DefineBulletDefault _name, _suf

	DefineBullet _name'_suf, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move

.endm

.macro DefineNBullets _name, _n
	_c = 0
	.rept _n
		DefineBulletDefault _name, \_c
		_c=_c+1
	.endm
.endm