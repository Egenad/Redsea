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

.include "bullet.h.s"
.include "render.h.s"
.include "player.h.s"
.include "main.h.s"

bullet_vector:
DefineNBullets bullet_vector, cont_bul

;;default data for bullet in case we need to restart
DefineBullet bullet_default, 0, 0, 0, 3, #0x04, #0x08, _assets_sp_1, bul_move

cont_bul = 6      
k_size_bul = bullet_vector0_size

active_bullets: .db 00
m_next_bullet: .dw bullet_vector
copy_bul:	   .dw 00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;BUL_NEW;;;;;;;;;;;;;;;
;;;;;;creates a new bullet ;;;;;;;
;;;and changes its position to;;;;
;;;;the enemy who shooted it ;;;;;
;;;;;destroys: a, b, hl, de;;;;;;;
;;;;;arguments: ix -> enemy;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_new:

	;; if pos y is 0, no create bullet
	ld a, de_y(ix)
	dec a
	jp m, no_crear_bul

	;;if the array is full dont create a new bullet
	ld b, #cont_bul
	ld a, (active_bullets)
	sub b
	jr z, no_crear_bul

	;;increments bullet counter
	ld a, (active_bullets)
	inc a
	ld (active_bullets), a

	;;increments bullet pointer
	ld hl, (m_next_bullet)
	ld de, #k_size_bul
	add hl, de
	ld (m_next_bullet), hl

	;;points to the last bullet created and changes its position to the enemy who shooted it
	or a
	sbc hl, de

	ld a, de_x(ix)
	ld (hl), a
	inc hl
	ld a, de_y(ix)
	ld (hl), a

no_crear_bul:

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;BUL_COPY;;;;;;;;;;;;;;
;;copies data from one bullet;;;;;
;;;;;;;;;;;;to oher ;;;;;;;;;;;;;;
;;;;;destroys: hl, bc, de ;;;;;;;;
;;;arguments: hl -> origin;;;;;;;;
;;;;;;;;;;;;;;de -> destiny;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_copy:
	ld bc, #k_size_bul
	ldir
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;BUL_DESTROY;;;;;;;;;;;;
;;;;;; destroys a bullet ;;;;;;;;;
;;;arguments: ix -> bullet to ;;;;
;;;;;;;;;;;;;destroy;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_destroy:

	ld de, #k_size_bul
	ld hl, (m_next_bullet)
	or a
	sbc hl, de   			;;hl has de latest bullet created (our origin)
	ld (copy_bul), ix
	ld de, (copy_bul) 		;;we want to copy the data of the latest bullet to the bullet we are going to destroy, so we can just copy the default values on the last bullet of the array

	call bul_copy  			;;now we have two equal bullets. We just need to erase the last one

	ld de, #k_size_bul
	ld hl, (m_next_bullet)
	or a
	sbc hl, de
	ld de, #bullet_default

	ex de, hl

	call bul_copy

	;;decrease the active bullets counter
	ld a, (active_bullets)
	dec a 
	ld (active_bullets), a

	;;and change the last bullet pointer
	ld de, #k_size_bul
	ld hl, (m_next_bullet)
	or a
	sbc hl, de
	ld (m_next_bullet), hl

	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;BUL_CLEAR;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_clear:
	jp render_clear_asset

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;BUL_UPDATE;;;;;;;;;;;;;
;;;;calls the method wich the ;;;;
;;entity has stored on its data;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_update:

	ld     h, b_up_h(ix)
   	ld     l, b_up_l(ix)
   	jp    (hl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;BUL_DRAW;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_draw:
	jp render_draw


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;BUL_CHECKCOLPLAYER;;;;;;;;;
;;Check colision with the player;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_checkColPlayer:

	ld hl, #hero_data

	;;Check collision  bullet - hero

	ld a, de_y(ix)        ;;a=bullet_y
	ld b, de_h(ix)	  	  ;;a=bullet_h
	add b         		  ;;a=bullet_y+bullet_h
	inc hl 				  ;;hl apunta a hero_y
	ld b, (hl)			  ;;b=hero_y
	sub b 				  ;;a=(bullet_y+bullet_h)-hero_y
	jr z, no_collision 	  
	jp m, no_collision

	;;check colision bullet - hero
	ld a, de_x(ix) 		  ;;a=bullet_x
	ld b, de_w(ix)		  ;;b=bullet_w
	add b         		  ;;a=bullet_x+bullet_w
	dec hl 				  ;;hl apunta a hero_x
	ld b, (hl)     		  ;;b=hero_x
	sub b 				  ;;a=(bullet_x+bullet_w)-hero_x
	jr z, no_collision
	jp m, no_collision

	;;check colision hero - bullet
	ld a, (hl) 		  	  ;;a=hero_x
	inc hl
	inc hl
	ld b, (hl)			  ;;b=hero_w
	add b         		  ;;a=hero_x+hero_w
	ld b, de_x(ix)   	  ;;b=bullet_x
	sub b 				  ;;a=(hero_x+hero_w)-bullet_x
	jr z, no_collision 	  
	jp m, no_collision

	;;kill player
	call reduce_life
	;;clear bullet
	call render_clear_asset_both
	;;destroy bullet
	call bul_destroy

no_collision:

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;BUL_MOVE;;;;;;;;;;;;;;;
;;;moves bullet to its next;;;;;;;
;;position using its velocity ;;;;
;;;;;;;;;destroys: a, b;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_move:
	
	call bul_checkColPlayer

	;;if the bullet has reached the end -> destroy

	ld a, #0x70
	ld b, de_y(ix)
	sub b
	jp p, dont_destroy_bullet
	call render_clear_asset_both
	call bul_destroy

dont_destroy_bullet:
   	ld    a, de_y(ix) 
   	add   b_vy(ix)
   	ld    de_y(ix), a

   	ld    a, de_x(ix) 
   	add   b_vx(ix)
   	ld    de_x(ix), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;BUL_DOFORALL;;;;;;;;;;;;
;;;calls the method stored in HL;;
;;for the all the bullets stored;;
;;;;;;;;;;in the vector;;;;;;;;;;;
;;;;;;destroys: a, ix, bc, hl ;;;;
;;arguments: hl ->method to call;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bul_doForAll:

	;;check if there are no bullets created
	ld a, (active_bullets)
	dec a
	jp m, no_bullets

	ld a, (active_bullets) 
	ld ix, #bullet_vector
	ld (metodoB), hl
vuelve_bul:
	push af
	metodoB = . + 1
	call bul_draw    ;;this method will be changed for the method loaded in hl
	pop af
	ld bc, #k_size_bul 
	add ix, bc
	dec a
	jr nz, vuelve_bul

no_bullets:

ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;RESET_BULLETS;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

reset_bullets:


	ld a, (active_bullets)
	dec a
	jp m, not
	ld a, (active_bullets)
non_stop2:
	ld ix, #bullet_vector
	push af
	call bul_destroy
	pop af 
	dec a
	jr nz, non_stop2
not:
	ret