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

.globl enemy_vector
.globl ent_clear
.globl ent_move
.globl ent_update
.globl ent_draw
.globl ent_doForAll
.globl ent_new_type1
.globl ent_new_type2
.globl ent_new_type3
.globl _enemy12_sp_0
.globl _enemy12_sp_1
.globl _enemy12_sp_2
.globl _enemy12_sp_3
.globl _enemy12_sp_4
.globl _enemy12_sp_5
.globl _enemy12_sp_6
.globl _enemy12_sp_7
.globl _enemy12_sp_8
.globl reset_enemies
.globl shootEffect
.globl ent_start_level_1
.globl ent_start_level_2
.globl ent_start_level_3
.globl ent_start_level_4
.globl ent_start_level_5
.globl ent_start_level_6
.globl _enemy2_sp_0
.globl _enemy2_sp_1
.globl _enemy2_sp_2
.globl enemy_window
.globl ent_updEnemy2


.macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _sprite, _upd, _anim, _spAct, _shooting, _animSh, _animDie
_name: 
	DefineDrawableEntity _name'_drawable, _x, _y, _w, _h, _sprite
   .db   _vx, _vy     ;; VX, VY
   .dw   _upd         ;; Update
   .db   _anim		  ;;Clock to change sprite
   .db   _spAct       ;;Actual sprite 
   .db   _shooting    ;;If the enemy is shooting or not (0=not, 1=yes)
   .db   _animSh	  ;;Clock to change sprite while shooting
   .db   _animDie	  ;;clock to change the sprite while is dying
_name'_size = . - _name
.endm

e_size_dw = 6

e_de = 0
e_vx = 0 + e_size_dw
e_vy = 1 + e_size_dw
e_up_l = 2 + e_size_dw
e_up_h = 3 + e_size_dw
e_anim = 4 + e_size_dw
e_spAct = 5 + e_size_dw
e_shooting = 6 + e_size_dw
e_shClock = 7 + e_size_dw
e_shDie = 8 + e_size_dw

.macro DefineEntityDefault _name, _suf

	DefineEntity _name'_suf, 0, 0, 1, 0, #0x08, #0x14, _enemy12_sp_0, ent_updEnemy, #0x03, 0, 0, #0x0A, #0x0A

.endm

.macro DefineNEntities _name, _n
	_c = 0
	.rept _n
		DefineEntityDefault _name, \_c
		_c=_c+1
	.endm
.endm