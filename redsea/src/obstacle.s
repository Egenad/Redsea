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

.include "obstacle.h.s"
.include "render.h.s"
.include "main.h.s"

DefineObstacle obstacle, #0x00, #0x00, #0x06, #0x0F, _obstacle_sp_0, #0x05
DefineObstacle obstacle2, #0x00, #0x00, #0x06, #0x0F, _obstacle_sp_0, #0x05
DefineObstacle mastil, #0x0C, #0x18, #0x04, #0x32, _mastil_sp, #0xFF
DefineObstacle camarote, #0x3C, #0x18, #0x14, #0x1A, _camarote_sp, #0xFF

ob_created: .db #0
ob_active: 	.db #0

ob_init:
	ld hl, #obstacle
	call init_parameters
	ld hl, #obstacle2
	call init_parameters

ret

init_parameters:
	inc hl
	inc hl 
	inc hl
	inc hl
	ld a, #_obstacle_sp_0
	ld (hl), a
	inc hl
	inc hl
	ld a, #0x05
	ld (hl), a
ret

ob_damage:

	ld a, #0x18
	ld b, a
	ld a, (hl) 	;;obstacle pos y
	sub b
	jr z, dont_damage

	inc hl
	inc hl
	inc hl
	inc hl 	;;obstacles's life
	inc hl

	ld a, (hl)
	dec a
	jr nz, barril_vivo

	;;Change sprite
	dec hl
	dec hl
	ld (hl), #_obstacle_sp_1
	inc hl
	inc hl
	barril_vivo:

	ld (hl), a 

	dont_damage:

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;ENT_DRAW ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ob_draw:
	jp render_draw

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;ob_draw_obstacles ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ob_draw_obstacles:
	
	ld a, (ob_active)
	dec a
	jp m, no_ob_active

		ld ix, #obstacle
		call render_draw
		ld a, (ob_active)
		dec a
		dec a
		jp m, no_ob_active

			ld ix, #obstacle2
			jp render_draw

no_ob_active:


	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;OB_LEVEL_X;;;;;;;;;;;;;;;
;; Change pos xy in every level ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ob_level_1:

	;Number of active obstacle 
	ld a, #0
	ld (ob_active), a

	;Pos obstacle 1
	ld ix, #obstacle
	ld de_x(ix), #0
	ld de_y(ix), #0

	;Pos obstacle 2
	ld ix, #obstacle2
	ld de_x(ix), #0
	ld de_y(ix), #0

ret

ob_level_3:

	;Number of active obstacle 
	ld a, #1
	ld (ob_active), a
	
	;Pos obstacle 1
	ld ix, #obstacle
	ld de_x(ix), #0x29
	ld de_y(ix), #0x50

	;Pos obstacle 2
	ld ix, #obstacle2
	ld de_x(ix), #0
	ld de_y(ix), #0

ret

ob_level_4:

	;Number of active obstacle 
	ld a, #1
	ld (ob_active), a
	
	;Pos obstacle 1
	ld ix, #obstacle
	ld de_x(ix), #0x1C
	ld de_y(ix), #0x38

	;Pos obstacle 2
	ld ix, #obstacle2
	ld de_x(ix), #0
	ld de_y(ix), #0

ret

ob_level_5:

	;Number of active obstacle 
	ld a, #1
	ld (ob_active), a
	
	;Pos obstacle 1
	ld ix, #obstacle
	ld de_x(ix), #0x20
	ld de_y(ix), #0x23

	;Pos obstacle 2
	ld ix, #obstacle2
	ld de_x(ix), #0
	ld de_y(ix), #0

ret

ob_level_6:

	;Number of active obstacle 
	ld a, #2
	ld (ob_active), a
	
	;Pos obstacle 1
	ld ix, #obstacle
	ld de_x(ix), #0x10
	ld de_y(ix), #0x50

	;Pos obstacle 2
	ld ix, #obstacle2
	ld de_x(ix), #0x30
	ld de_y(ix), #0x23

ret