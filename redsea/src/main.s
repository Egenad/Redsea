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

.area _DATA
.area _CODE

.include "cpctelera.h.s"
.include "main.h.s"
.include "enemy.h.s"
.include "player.h.s"
.include "render.h.s"
.include "menu.h.s"
.include "bullet.h.s"
.include "obstacle.h.s"

decompress_buffer     = 0x040
levelmaxsize          = 0x654
decompress_buffer_end = decompress_buffer + levelmaxsize - 1
tilemap_ptr 		  = decompress_buffer + 0
tileset_ptr 		  = decompress_buffer + 500

contf1:  .db #0x30
max_cont_f1: .db #0x30
contf2:  .db #0x30
max_cont_f2: .db #0x30	
contf3:  .db #0x30	
max_cont_f3: .db #0x30	
unavariable: .db #12
otravariable: .db #12

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; ISR ;;;;;;;;;;;;;;;;;;;;
;;;; Method to control interruptions ;;;;
;; So music is not affected by process ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

isr::
	
	ex af, af'
	exx
	push af
	push bc
	push de
	push hl
	push iy 

	ld a, (unavariable)
	dec a
	ld (unavariable), a
	jr nz, volver
		call cpct_akp_musicPlay_asm
		ld a, (otravariable) 
		ld(unavariable), a 
	volver:
	pop iy
	pop hl
	pop de
	pop bc 
	pop af
	exx
	ex af, af'
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; DECOMPRESSTILEMAP ;;;;;;;;;
;; Decompress tilemap load in  Hl ;;
;;;;;;;;;;; Input: HL ;;;;;;;;;;;;;;
;;;;;;; Destroy registers: DE ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DecompressTilemap:
	ld   de, #decompress_buffer_end
  	call cpct_zx7b_decrunch_s_asm 		;; Decompress tilemap
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; MAIN PROGRAM ;;;;;;;;;;;
;;; Generate, updates and desroys ;;
;;; all game's objects ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_main::

	ld   sp, #0x8000 					;; Change cue position, so there is no problem with secundary buffer
	call cpct_disableFirmware_asm
   	ld    c, #0
  	call cpct_setVideoMode_asm

  	ld   hl, #_hero_pal
  	ld   de, #16
  	call cpct_setPalette_asm

  	ld   bc, #0x1914
  	ld   de, #_level0_W
  	ld   hl, #tileset_ptr

  	call cpct_etm_setDrawTilemap4x8_ag_asm

	;; Edges to black

  	ld l, #16
  	ld a, #20
  	ld h, a 
  	call cpct_setPALColour_asm

  	;;Change interruptions counter

	ld a, #6
  	ld (otravariable), a
  	ld (unavariable), a

   	;;Music

  	ld hl, #isr
  	call cpct_setInterruptHandler_asm

resetted:

	ld de, #_true_theme
    call cpct_akp_musicInit_asm

  	ld   hl, #_menu2_pack_end
	call DecompressTilemap

  	call init_menu

  	;Create first enemies
	call ent_start_level_1
	
resetted_win:

  	;;Change interruptions counter

  	ld a, #6
  	ld (otravariable), a
  	ld (unavariable), a

  	;;Game Initializing

  	ld   hl, #_level0_pack_end
  	call DecompressTilemap

  	ld de, #_main_theme
    call cpct_akp_musicInit_asm

    ;;Initializing TILEMAP in both buffer

    ld a, #0xC0
	call drawTileMap
	ld a, #0xC0
	call draw_Enemy_score

   	ld a, #0x80
	call drawTileMap
	ld a, #0x80
	call draw_Enemy_score

	;;Initializing shooting sound

	ld de, #_shootSFX
	call cpct_akp_SFXInit_asm


loop:

  	;;CREATE ENEMIES
	ld a, (level)
	dec a
	jr z, no_create_enemies ;dont create if level 1

		;;Enemies Type 1
		ld a, (contf1)
		dec a
		jr nz, no_create_enemies_f1

			call ent_new_type1
			ld a, (max_cont_f1)
			ld (max_cont_f1), a

		no_create_enemies_f1:
		ld (contf1), a

		;;Enemies Type 2
		ld a, (contf2)
		dec a
		jr nz, no_create_enemies_f2

			call ent_new_type2
			ld a, (max_cont_f2)
			ld (max_cont_f2), a

		no_create_enemies_f2:
		ld (contf2), a

		;;Enemies Type 3
		ld a, (contf3)
		dec a
		jr nz, no_create_enemies_f3

			call ent_new_type3
			ld a, (max_cont_f3)
			ld (max_cont_f3), a

		no_create_enemies_f3:
		ld (contf3), a

	no_create_enemies:

	;;ENEMIES

	ld hl, #ent_clear
	call ent_doForAll
	ld hl, #ent_update
	call ent_doForAll

	;;SHOOT SFX

	call checkShooted

	not_shooted:

	ld hl, #ent_draw
	call ent_doForAll

	;;CABIN

	ld ix, #camarote
	call ob_draw

	;;BULLETS

	ld hl, #bul_clear
	call bul_doForAll
	ld hl, #bul_update
	call bul_doForAll
	ld hl, #bul_draw
	call bul_doForAll

	;;OBSTACLES

	call ob_draw_obstacles

	;; MAST 

	ld ix, #mastil
	call ob_draw

	;;ENEMY WINDOW

	ld ix, #enemy_window
	call ent_updEnemy2
	call ent_draw

	;;PLAYER

	ld ix, #hero_data
	call pl_clear
	call pl_update
	call pl_draw

	ld ix, #shoot_data
	call pl_clear_mira
	call pl_update
	call pl_draw

	;;SCORE AND LIFE
	call draw_Lifes
   	call draw_Score

	call cpct_waitVSYNC_asm
   	call ren_newScene

	jp loop


reset_game:

	;RESET THE GAME TO ITS DEFAULT VALUES
	;;Player
	call reset_player
	;;Enemies
	call reset_enemies
	;;Bullets
	call reset_bullets
	;;Obstacles
	call ob_init
	;;Other
	ld a, #0x10
	ld (contf1), a
	ld a, #0x10
	ld (contf2), a
	ld a, #0x10
	ld (contf3), a
	
	call changeLocation

jp resetted

reset_game_win:

	;RESET THE GAME TO ITS DEFAULT VALUES
	;;Player
	call reset_player
	;;Enemies
	call reset_enemies
	;;Bullets
	call reset_bullets
	;;Obstacles
	call ob_init
	;;Other
	ld a, (level)
	dec a
	dec a
	jr nz, not_level_2

		ld a, #0x40
		ld (contf1), a
		ld (max_cont_f1), a
		ld a, #0x2A
		ld (contf2), a
		ld (max_cont_f2), a
		jp cont_changed

	not_level_2:

		dec a
		jr nz, not_level_3

			ld a, #0x3F
			ld (contf2), a
			ld (max_cont_f2), a
			ld a, #0x30
			ld (contf3), a
			ld (max_cont_f3), a
			jp cont_changed		

	not_level_3:

		dec a
		jr nz, not_level_4

			ld a, #0x3E
			ld (contf1), a
			ld (max_cont_f1), a
			ld a, #0x30
			ld (contf2), a
			ld (max_cont_f2), a
			ld a, #0x50
			ld (contf3), a
			ld (max_cont_f3), a
			jp cont_changed		

	not_level_4:

		dec a
		jr nz, not_level_5

			ld a, #0x50
			ld (contf1), a
			ld (max_cont_f1), a
			ld a, #0x35
			ld (contf2), a
			ld (max_cont_f2), a
			ld a, #0x40
			ld (contf3), a
			ld (max_cont_f3), a
			jp cont_changed		

	not_level_5:

		dec a
		jr nz, not_level_6

			ld a, #0x30
			ld (contf1), a
			ld (max_cont_f1), a
			ld a, #0x40
			ld (contf2), a
			ld (max_cont_f2), a
			ld a, #0x35
			ld (contf3), a
			ld (max_cont_f3), a
			jp cont_changed		

	not_level_6:

		ld a, #0x10
		ld (contf1), a
		ld (max_cont_f1), a
		ld a, #0x10
		ld (contf2), a
		ld (max_cont_f2), a
		ld a, #0x10
		ld (contf3), a
		ld (max_cont_f3), a

	cont_changed:
	
	call changeLocation

jp resetted_win

checkShooted:

	ld a, (shootEffect)
	dec a
	;jp m, not_shooted

	ret m

	ld a, #1
	ld l, a
	ld a, #15
	ld h, a
	ld a, #60
	ld e, a
	ld a, #0 
	ld d, a
	ld bc, #0x00
	ld a, #1
	call cpct_akp_SFXPlay_asm

	ld a, #00
	ld (shootEffect), a

ret

;;A -> VIDEO POINTER;;;;
draw_Enemy_score:
  	;;draw the enemy scoreboard sprite
  	ld b, #0xA0 ;;Y
  	ld c, #0x3F         		
	ld d, a
	ld e, #0
   	call cpct_getScreenPtr_asm

   	ex de, hl

   	ld hl, #_enemy_sc_sp
  	ld  b, #0x16
   	ld  c, #0x0B
   	call cpct_drawSprite_asm
ret