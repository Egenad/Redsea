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

.globl pl_clear
.globl pl_clear_mira
.globl pl_move
.globl pl_update
.globl pl_draw
.globl pl_moveKeyboard
.globl pl_moveAsShooter
.globl hero_data
.globl shoot_data
.globl _hero_sp_0
.globl _hero_sp_1
.globl _hero_sp_2
.globl _hero_sp_3
.globl _hero_sp_4
.globl _hero_sp_5
.globl _hero_sp_6
.globl _hero_sp_7
.globl _hero_sp_8
.globl _assets_sp_0
.globl get_Enemy
.globl draw_Score
.globl _numbers_00
.globl _numbers_01
.globl _numbers_02
.globl _numbers_03
.globl _numbers_04
.globl _numbers_05
.globl _numbers_06
.globl _numbers_07
.globl _numbers_08
.globl _numbers_09
.globl _lifes_0
.globl _lifes_1
.globl draw_Lifes
.globl reduce_life
.globl reset_player
.globl level

.macro DefinePlayer _name, _x, _y, _vx, _vy, _w, _h, _sprite, _upd
_name: 
	DefineDrawableEntity _name'_drawable, _x, _y, _w, _h, _sprite
   .db   _vx, _vy     ;; VX, VY
   .dw   _upd         ;; Update 
_name'_size = . - _name
.endm

p_size_dw = 6

p_de = 0
p_vx = 0 + p_size_dw
p_vy = 1 + p_size_dw
p_up_l = 2 + p_size_dw
p_up_h = 3 + p_size_dw