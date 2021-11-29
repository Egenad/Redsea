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

.include "cpctelera.h.s"
.include "main.h.s"
.include "enemy.h.s"
.include "render.h.s"
.include "player.h.s"
.include "bullet.h.s"
.include "obstacle.h.s"

enemy_vector:
DefineNEntities enemy_vector, k_tot_enemies

;;default data for enemy in case we need to restart
DefineEntity enemy_default, 0, 0, 1, 0, #0x08, #0x14, _enemy12_sp_0, ent_updEnemy, #0x03, 0, 0, #0x0A, #0x0A
DefineEntity enemy_window,  #0x40, #0x1D, 0, 0, #0x06, #0x0C, _enemy2_sp_0,  ent_updEnemy2, #0x03, #0xFF, #0x14, #0x0A, #0x0A

k_size_entity = enemy_vector0_size 					;;size of each enemy     								;;how many enemies we can have of type 3 (type 3= close enemy sprite and pos y = 40)
k_tot_enemies = 20 									;;total enemies
animation_time = #0x03
animation_time_shoot = #0x0A

cont_ent_f1: .db 1       								;;how many enemies we can have of type 1 (type 1= far enemy sprite and pos y = 0), typ 1 is the default entity
cont_ent_f2: .db 2      								;;how many enemies we can have of type 2 (type 2= close enemy sprite and pos y = 20)
cont_ent_f3: .db 0      								;;how many enemies we can have of type 3 (type 3= close enemy sprite and pos y = 40)


active_enemies:		.db 00
active_enemies_f1:  .db 00							;;active enemies of type 1
active_enemies_f2: 	.db 00							;;active enemies of type 2
active_enemies_f3:  .db 00							;;active enemies of type 3

active_window_enemy: .db 00

m_next_entity: .dw #enemy_vector
copy_enemy:    .dw 00

shootEffect: .db #0

stay_mode: .db #1 	;mode stay (enemies dont move)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;ENT_NEW;;;;;;;;;;;;;;;
;;;;;;creates a new enemy ;;;;;;;;
;;;;;destroys: a, b, hl, de;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_new:

	;;if the array is full dont create a new enemy
	ld b, #k_tot_enemies
	ld a, (active_enemies)
	sub b
	jr z, no_create_enemy

	;;increments enemy counter
	ld a, (active_enemies)
	inc a
	ld (active_enemies), a

	;;increments enemy pointer
	ld hl, (m_next_entity)
	ld de, #k_size_entity
	add hl, de
	ld (m_next_entity), hl

no_create_enemy:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;ENT_NEW_TYPE1;;;;;;;;;;
;;creates a new enemy of type 1 ;;
;;;;;destroys: a, b, hl, de;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_new_type1:

	;;check if we can create one of type 1
	ld a, (cont_ent_f1)
	ld b, a
	ld a, (active_enemies_f1)
	sub b
	jr z, dont_create_f1

	call ent_new

	;;increment counter of type 1
	ld a, (active_enemies_f1)
	inc a
	ld (active_enemies_f1), a

	;;and load last enemy created in hl to change some of its data
	ld hl, (m_next_entity)
	ld de, #k_size_entity
	or a
	sbc hl, de

	;;change pos Y
	inc hl
	ld (hl), #30
dont_create_f1:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;ENT_NEW_TYPE2;;;;;;;;;;
;;creates a new enemy of type 2 ;;
;;;;;destroys: a, b, hl, de;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_new_type2:

	;;check if we can create one of type 1
	ld a, (cont_ent_f2)
	ld b, a
	ld a, (active_enemies_f2)
	sub b
	jr z, dont_create_f2

	call ent_new

	;;increment counter of type 1
	ld a, (active_enemies_f2)
	inc a
	ld (active_enemies_f2), a

	;;and load last enemy created in hl to change some of its data
	ld hl, (m_next_entity)
	ld de, #k_size_entity
	or a
	sbc hl, de

	;;change pos Y
	inc hl
	ld (hl), #52

	;change pos x 
	ld a, (level)
	dec a
	dec a
	jr z, no_change_posX  ;if level2 no change pos x
		;; change pos X
		dec hl
		ld (hl), #0x49	
		;;change velx
		inc hl
		inc hl
		inc hl
		inc hl

		ld (hl), #-1

	no_change_posX:
	
dont_create_f2:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;ENT_NEW_TYPE3;;;;;;;;;;
;;creates a new enemy of type 3 ;;
;;;;;destroys: a, b, hl, de;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_new_type3:

	;;check if we can create one of type 1
	ld a, (cont_ent_f3)
	ld b, a
	ld a, (active_enemies_f3)
	sub b
	jr z, dont_create_f3

	call ent_new

	;;increment counter of type 1
	ld a, (active_enemies_f3)
	inc a
	ld (active_enemies_f3), a

	;;and load last enemy created in hl to change some of its data
	ld hl, (m_next_entity)
	ld de, #k_size_entity
	or a
	sbc hl, de

	;;change pos Y
	inc hl
	ld (hl), #75
dont_create_f3:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;ENT_COPY;;;;;;;;;;;;;;
;;copies data from one enemy;;;;;;
;;;;;;;;;;;;to oher ;;;;;;;;;;;;;;
;;;;;destroys: hl, bc, de ;;;;;;;;
;;;arguments: hl -> origin;;;;;;;;
;;;;;;;;;;;;;;de -> destiny;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_copy:
	ld bc, #k_size_entity
	ldir
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;ENT_DESTROY;;;;;;;;;;;;
;;;;;; destroys an enemy ;;;;;;;;;
;;;arguments: ix -> enemy to ;;;;;
;;;;;;;;;;;;;destroy;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_destroy:

	;;first of all we need to check what type of enemy it was (1,2 or 3)
	ld a, de_y(ix)
	ld b, #30
	sub b
	jr nz, not_type_1

	;;decrement type1
	ld a, (active_enemies_f1)
	dec a 
	ld (active_enemies_f1), a
	jp type_found

not_type_1:
	ld a, de_y(ix)
	ld b, #52
	sub b
	jr nz, not_type_2
	
	;;decrement type2
	ld a, (active_enemies_f2)
	dec a 
	ld (active_enemies_f2), a 
	jp type_found

not_type_2:
	;;decrement type3
	ld a, (active_enemies_f3)
	dec a 
	ld (active_enemies_f3)	, a

type_found:

	ld de, #k_size_entity
	ld hl, (m_next_entity)
	or a
	sbc hl, de   				;;hl has de latest enemy created (our origin)
	ld (copy_enemy), ix
	ld de, (copy_enemy) 		;;we want to copy the data of the latest enemy to the enemy we are going to destroy, so we can just copy the default values on the last enemy of the array

	call ent_copy  				;;now we have two equal bullets. We just need to erase the last one

	ld de, #k_size_entity
	ld hl, (m_next_entity)
	or a
	sbc hl, de
	ld de, #enemy_default		;;copying the default values on the last enemy is like we destroy it

	ex de, hl

	call ent_copy

	;;decrease the active enemy counter
	ld a, (active_enemies)
	dec a 
	ld (active_enemies), a

	;;and change the last bullet pointer
	ld de, #k_size_entity
	ld hl, (m_next_entity)
	or a
	sbc hl, de
	ld (m_next_entity), hl

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;ENT_DRAW ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_draw:
	jp render_draw

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;ENT_UPDATE;;;;;;;;;;;;;
;;;;calls the method wich the ;;;;
;;entity has stored on its data;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_update:

	ld     h, e_up_h(ix)
   	ld     l, e_up_l(ix)
   	jp    (hl)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;ENT_CLEAR ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_clear:
	jp render_clear

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;ENT_CHECKOBSTACLE ;;;;;;;;;;;;
;;;;;;Check if obstacle is death ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_checkObstacleInc:
	
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl 	;;Obstacle's life
	inc hl
	ld a, (hl)
	dec a

ret

ent_checkObstacleDec:
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl 	
	dec hl
	call ent_checkCollision

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;ENT_UPDENEMY2 ;;;;;;;;;;;
;;;;;;;Update window enemy;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ent_updEnemy2:

	;;Check if it's active
	ld a, (active_window_enemy)
	dec a

	jp m, inactive  ;;if no active, no update

	;;check animation
	ld a, e_shClock(ix)
	dec a
	jr z, start_updating 	;if 1, start update

	;;Wait until there are enemies in all rows

	ld a, (active_enemies_f1)
	dec a
	ret m 	;if no active enemies ret
	ld a, (active_enemies_f2)
	dec a
	ret m 	;if no active enemies ret
	ld a, (active_enemies_f3)
	dec a
	ret m 	;if no active enemies ret

	;;When all rows active
	ld a, #1
	ld e_shClock(ix), a

	ret

	start_updating:

	ld a, e_spAct(ix)
	dec a
	jp p, actua_e2			;; Check current sprite, if not negative, enemy is attacking

	ld a, e_shooting(ix) 	;; If its 0, check if its going to attack now or not
	dec a
	jr nz, no_actua 		;;;===== if not 0 change the sprite

	ld a, #0x01
	ld e_spAct(ix), a
	ld hl, #_enemy2_sp_1
	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

	no_actua:				;;;===== If not 0, dec e_shooting 

	ld a, e_shooting(ix)
	dec a
	ld e_shooting(ix), a

	ret

	actua_e2: 				;; check if enemy its getting closer or going to shoot

	ld a, e_spAct(ix)
	dec a
	jr z, se_acerca 		;; if 0, enemy is getting closer
	dec a
	jr nz, se_mantiene

	continuo_con_lo_mio_2:

	call bul_new
	;;hl -> bullet de_y
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl), #-1


	ld a, #1
	ld (shootEffect), a

	ld a, #0x14
	ld e_anim(ix), a
	ld a, #0x04
	ld e_spAct(ix), a 

	ret

	se_mantiene:

		ld a, e_anim(ix)
		dec a
		jr nz, continua_stoppeado

		call check_space_pressed
		jr z, continuo_con_lo_mio

		;;check collisions gun with enemy

		ld hl, #shoot_data
		call ent_checkCollision
		ld b, a
		ld a, #1
		sub b
		jr z, lo_aniquilo

		continuo_con_lo_mio:

		ld a, #0x14
		ld e_anim(ix), a
		ld hl, #_enemy2_sp_0
		ld de_sp_h(ix), h
		ld de_sp_l(ix), l
		ld a, #0xFF
		ld e_shooting(ix), a
		ld a, #0x00
		ld e_spAct(ix), a 

		ret

		continua_stoppeado:

		call check_space_pressed
		jr z, continuo_con_lo_mio_3

		;;check collisions gun with enemy

		ld hl, #shoot_data
		call ent_checkCollision
		ld b, a
		ld a, #1
		sub b
		jr z, lo_aniquilo

		continuo_con_lo_mio_3:

		ld a, e_anim(ix)
		dec a 
		ld e_anim(ix), a

	ret

	se_acerca:

	call check_space_pressed
	jr z, continuo_con_lo_mio_4

	;;check collisions gun with enemy

	ld hl, #shoot_data
	call ent_checkCollision
	ld b, a
	ld a, #1
	sub b
	jr z, lo_aniquilo

	continuo_con_lo_mio_4:

	ld a, e_anim(ix) 		;; if animation = 0, change sprite to shooting sprite
	dec a
	jr nz, no_cambies_na

	ld a, #0x02
	ld e_spAct(ix), a
	ld hl, #_enemy2_sp_2
	ld de_sp_h(ix), h
	ld de_sp_l(ix), l
	ld a, #0x03 
	ld e_anim(ix), a
	ld a, #3
	ld e_shDie(ix), a

	no_cambies_na:

	ld a, e_anim(ix) 		;; update animacion counter
	dec a
	ld e_anim(ix), a
	
	ret

	lo_aniquilo:

	ld a, #0x14
	ld e_anim(ix), a
	ld hl, #_enemy2_sp_0
	ld de_sp_h(ix), h
	ld de_sp_l(ix), l
	ld a, #0xFF
	ld e_shooting(ix), a
	ld a, #0x00
	ld e_spAct(ix), a

	call get_Enemy

	ret

inactive:

	;;Empty window
	ld a, #0x00
	ld e_spAct(ix), a
	ld hl, #_enemy2_sp_0
	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;ENT_UPDENEMY ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_updEnemy:

	;;check the state of the enemy before updating
	ld a, e_shooting(ix)
	dec a 
	jr z, change_sprite_shoot ;;state is 1 (shooting)
	dec a 
	jr z, change_sprite_dead  ;;state is 2 (dead)

	ld a, (stay_mode)
	dec a
	jr nz, no_stay_mode

		call shoot_sprite
		ld e_shooting(ix), #0

	no_stay_mode:

	ld a, (stay_mode)
	dec a
	jr z, no_move

		call ent_move

	no_move:

	call check_space_pressed
	jr z, no_pulsada

	;;check collisions gun with enemy

	ld hl, #shoot_data
	call ent_checkCollision
	ld b, a
	ld a, #1
	sub b
	jr nz, no_pulsada

	ld hl, #obstacle 			;;check collisions gun with obstacle
	call ent_checkObstacleInc
	jp m, barril1_muerto
	call ent_checkObstacleDec
	ld b, a 
	ld a, #1 
	sub b
	jr z, no_pulsada 			;;obstacle 1 block the bullet, enemy dont die
	barril1_muerto:
	ld hl, #obstacle2 			;;Check colisions gun with obstacle 2
	call ent_checkObstacleInc
	jp m, barril2_muerto
	call ent_checkObstacleDec
	ld b, a 
	ld a, #1 
	sub b
	jr z, no_pulsada 			;; Obstacle 2 block bullet, enemy dont die
	barril2_muerto:
	ld hl, #mastil 				;;Check collisions gun with mast
	call ent_checkCollision
	ld b, a
	ld a, #1
	sub b
	jr z, no_pulsada
	call dead_sprite	  ;;kill the enemy
	

no_pulsada:

	;if stay mode on, enemies dont move
	ld a, (stay_mode)
	dec a
	jr z, no_move2

		call ent_animation

	no_move2:

	call shoot

dont_update:
	ret

change_sprite_shoot:
	ld a, e_shClock(ix)
	dec a
	jr nz, continue_being_stop
	ld a, #animation_time_shoot
	ld e_shooting(ix), #0
continue_being_stop:
	ld e_shClock(ix), a
	jp dont_update

change_sprite_dead:
	ld a, e_shDie(ix)
	dec a
	jr nz, continue_being_dead
	call render_clear_asset_both
	call ent_destroy	  ;;kill the enemy
	call get_Enemy		  ;;update enemy counter
	jp dont_update
continue_being_dead:

	ld c, a
	ld b, #0x04
	sub b
	jr nz, dont_change_dead_sprite
	ld hl, #_enemy12_sp_8
	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

dont_change_dead_sprite:
	ld a, c
	ld e_shDie(ix), a
	jp dont_update

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;ENT_MOVE;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_move:

	ld a, de_y(ix)
	sub #30
	jr nz, isnt_type_1

	ld a, de_x(ix)
	sub #0x35
	jr z, move_left

isnt_type_1:
   	ld a, de_x(ix)
	sub #0x48
	jr z, move_left
	jp p, move_left

	ld a, de_x(ix)
	dec a
	jp m, move_right

	call ent_change_velocity

	ret

move_right:
	ld e_vx(ix),#+1
	call ent_change_velocity
	ret

move_left:
	ld e_vx(ix),#-1
	call ent_change_velocity
	ret

ent_change_velocity:

   	ld    a, de_x(ix) 
   	add   e_vx(ix)
   	ld    de_x(ix), a

   	ld    a, de_y(ix) 
   	add   e_vy(ix)
   	ld    de_y(ix), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;ENT_CHECKCOLISSION ;;;;;;;
;;Check collision enemy with shoot;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_checkCollision:

	;;Check collision enemy - shoot
	ld a, de_x(ix) 		  ;;a=enemy_x
	ld b, de_w(ix)		  ;;b=enemy_w
	add b         		  ;;a=enemy_x+enemy_w
	ld b, (hl)     		  ;;b=shoot_x
	sub b 				  ;;a=(enemy_x+enemy_w)-shoot_x
	jr z, no_collision
	jp m, no_collision

	;;Check collision shoot - enemy
	ld a, (hl) 		  	  ;;a=shoot_x
	inc hl
	inc hl
	ld b, (hl)			  ;;b=shoot_w
	add b         		  ;;a=shoot_x+shoot_w
	ld b, de_x(ix)   	  ;;b=enemy_x
	sub b 				  ;;a=(shoot_x+shoot_w)-enemy_x
	jr z, no_collision 	  
	jp m, no_collision

	;;check collision  shoot
						  ;;  -
						  ;; enemy

	dec hl				  ;;hl apunta a shoot_y
	ld a, (hl)            ;;a=shoot_y
	inc hl
	inc hl				  ;;hl apunta a shoot_h
	ld b, (hl) 		  	  ;;a=shoot_h
	add b         		  ;;a=shoot_y+shoot_h
	ld b, de_y(ix)   	  ;;b=enemy_y
	sub b 				  ;;a=(shoot_y+shoot_h)-enemy_y
	jr z, no_collision 	  
	jp m, no_collision

	;;check collision  enemy
						  ;;  -
						  ;; shoot

	ld a, de_y(ix)        ;;a=enemy_y
	ld b, de_h(ix)	  	  ;;a=enemy_h
	add b         		  ;;a=enemy_y+enemy_h
	dec hl
	dec hl 				  ;;hl apunta a shoot_y
	ld b, (hl)			  ;;b=shoot_y
	sub b 				  ;;a=(shoot_y+shoot_h)-enemy_y
	jr z, no_collision 	  
	jp m, no_collision

	ld a, #1
	jp dont_do_anything

no_collision:
	ld a, #0
dont_do_anything:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;ENT_DOFORALL ;;;;;;;;;;;
;;;calls the method stored in HL;;
;;for the all the enemies stored;;
;;;;;;;;;;in the vector;;;;;;;;;;;
;;;;;;destroys: a, ix, bc, hl ;;;;
;;arguments: hl ->method to call;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_doForAll:

	;;check if there are no enemies created
	ld a, (active_enemies)
	dec a
	jp m, no_enemies

	ld a, (active_enemies) ;;number of enemies
	ld ix, #enemy_vector
	ld (metodo), hl
vuelve:
	push af ;;ENT DRAW DESTROYS A, SO I SAVE IT
	metodo = . + 1
	call ent_draw
	pop af 	;;RECOVER A
	ld bc, #k_size_entity ;;size entity
	add ix, bc
	dec a
	jr nz, vuelve

no_enemies:

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;CHECK_SPACE_PRESSED;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

check_space_pressed:

	call cpct_scanKeyboard_asm 

	ld hl, #Key_Space
	call cpct_isKeyPressed_asm  ;;z=0 no pulsada, z!=0 pulsada

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;ENT_ANIMATION ;;;;;;;;;;
;;;;;Enemy running animation ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_animation:

	ld a, e_shooting(ix) ;;if the enemy is dying
	dec a
	dec a
	jr z, is_dead

	ld a, e_anim(ix)
	dec a
	jr nz, continue


	ld a, e_vx(ix)
	dec a
	jr z, not_flip

	ld a, e_spAct(ix)
	
	ld hl, #_enemy12_sp_5
	ld e_spAct(ix), #1
	dec a 
	jp m, ya
	ld hl, #_enemy12_sp_4
	ld e_spAct(ix), #2
	dec a
	jp m, ya
	ld hl, #_enemy12_sp_3
	ld e_spAct(ix), #0

	jp ya

not_flip:

	ld a, e_spAct(ix)
	
	ld hl, #_enemy12_sp_0
	ld e_spAct(ix), #1
	dec a 
	jp m, ya
	ld hl, #_enemy12_sp_1
	ld e_spAct(ix), #2
	dec a
	jp m, ya
	ld hl, #_enemy12_sp_2
	ld e_spAct(ix), #0

ya:

	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

	ld a, #animation_time

continue:

	ld e_anim(ix), a
is_dead:
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;SHOOT ;;;;;;;;;;;;;;;
;;;;;; Enemy random shoot;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

shoot:

	call cpct_getRandom_mxor_u8_asm ;;return in l random number from 00 to ff
	ld a, #0xE0
	sub a, l
	jr nz, dont_shoot
	call shoot_sprite
	call bul_new
	ld a, #1
	ld (shootEffect), a

dont_shoot:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;RESET_ENEMIES;;;;;;;;;;
;;;;;;; Delete all enemies ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

reset_enemies:

	ld a, (active_enemies)
	dec a
	jp m, not_reset
	ld a, (active_enemies)
non_stop:
	ld ix, #enemy_vector
	push af
	call ent_destroy
	pop af 
	dec a
	jr nz, non_stop
not_reset:
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;SHOOT_SPRITE;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

shoot_sprite:

	ld hl, #_enemy12_sp_6

	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

	ld e_shooting(ix), #1
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;DEAD_SPRITE;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

dead_sprite:

	call render_clear_asset_both

	ld hl, #_enemy12_sp_7

	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

	ld e_shooting(ix), #2
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Start Level 1;;;;;;;;;;;
;;; Set parameters for level 1 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_start_level_1:

	;;Stay mode on
	ld a, #1
	ld (stay_mode), a

	;Number of enemies in each row
	ld a, #1
	ld (cont_ent_f1), a
	ld a, #1
	ld (cont_ent_f2), a
	ld a, #1
	ld (cont_ent_f3), a

	;;Create stay enemies
	call ent_new_type1
	;;change position x
	dec hl 			;pos x
	ld (hl), #0x25	

	call ent_new_type2
	;;change position x
	dec hl 			;pos x
	dec hl
	dec hl
	dec hl
	ld (hl), #0x15

	call ent_new_type3
	;;change position x
	dec hl 			;pos xdec hl
	ld (hl), #0x35

	;Desactive window enemy
	ld a, #0
	ld (active_window_enemy), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Start Level 2;;;;;;;;;;;
;;; Set parameters for level 2 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_start_level_2:

	;;Stay mode off
	ld a, #0
	ld (stay_mode), a

	;Number of enemies in each row
	ld a, #1
	ld (cont_ent_f1), a
	ld a, #2
	ld (cont_ent_f2), a
	ld a, #0
	ld (cont_ent_f3), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Start Level 3;;;;;;;;;;;
;;; Set parameters for level 3 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_start_level_3:

	; Number of enemies in each row
	ld a, #0
	ld (cont_ent_f1), a
	ld a, #2
	ld (cont_ent_f2), a
	ld a, #3
	ld (cont_ent_f3), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Start Level 4;;;;;;;;;;;
;;; Set parameters for level 4 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_start_level_4:

	; Number of enemies in each row
	ld a, #1
	ld (cont_ent_f1), a
	ld a, #2
	ld (cont_ent_f2), a
	ld a, #2
	ld (cont_ent_f3), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Start Level 5;;;;;;;;;;;
;;; Set parameters for level 5 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_start_level_5:

	;Number of enemies in each row
	ld a, #2
	ld (cont_ent_f1), a
	ld a, #3
	ld (cont_ent_f2), a
	ld a, #2
	ld (cont_ent_f3), a

	;Active window enemy
	ld a, #1
	ld (active_window_enemy), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Start Level 6;;;;;;;;;;;
;;; Set parameters for level 6 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_start_level_6:

	;Number of enemies in each row
	ld a, #2
	ld (cont_ent_f1), a
	ld a, #4
	ld (cont_ent_f2), a
	ld a, #2
	ld (cont_ent_f3), a

	ret