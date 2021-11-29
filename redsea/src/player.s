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
.include "player.h.s"
.include "render.h.s"
.include "obstacle.h.s"
.include "enemy.h.s"
.include "gameover.h.s"
.include "nextlevel.h.s"
.include "win.h.s"


lifes: .db #3
no_lifes: .db #0
enemies: .db #3
cociente: .db #0
resto: .db #0
anim: .db #0x03
sprHAct: .db #0x00
level: 	.db 1
state:  .db 0    		;;0 normal, 1 dying
animMuerto: .db #0x0F

max_level = 6

pos_y_life= #0x90
pos_x_life2= #0x21
pos_x_life1= #0x15
pos_x_life3= #0x09

pos_x_score1=#0x3A
pos_y_score1=#0xA8
pos_x_score2=#0x3D


DefinePlayer hero_data, #0x24, #0x69, #0x00, #0x00, #0x08, #0x14, _hero_sp_0, pl_moveKeyboard
DefinePlayer shoot_data, #0x25, #0x40, #0x00, #0x00, #0x04, #0x8, _assets_sp_0, pl_moveAsShooter

pl_draw:
	jp render_draw

pl_update:

	ld     h, p_up_h(ix)
   	ld     l, p_up_l(ix)
   	jp    (hl)

pl_clear:
	jp render_clear

	ret

pl_clear_mira:

	jp render_clear_asset

	ret

pl_move:

   	ld    a, de_x(ix) 
   	add   p_vx(ix)
   	ld    de_x(ix), a

   	ld    a, de_y(ix) 
   	add   p_vy(ix)
   	ld    de_y(ix), a

	ret


pl_moveKeyboard:

	ld a, (state)
	dec a
	jp z, esta_muriendo

	call cpct_scanKeyboard_asm 		;; Scan keyboard

	ld hl, #Key_O					;; Check key O
	call cpct_isKeyPressed_asm		;; If not pressed check P key
	jr z, o_no_pulsada
	ld hl, #Key_Space				;; Check space key
	call cpct_isKeyPressed_asm		;; If not pressed check P key
	jr nz, o_no_pulsada		
	ld a, de_x(ix)					;; Load player pos x 
	dec a  							;; Dec pos x to check if its 0
	jp m, no_te_muevas_again		;; If 0 stop moving player so dont be out of screen
	ld p_vx(ix), #-1 				;; If not 0, player velocity = -1 --> move left
	
	;;Change player sprite 

	ld a, de_w(ix)
	ld b, a 
	ld a, #0x08
	sub b
	jr nz, no_update_sp

	;;;;;;;;; Sprite Animation ;;;;;;;;;

	call pl_AnimationSprite_I

	no_update_sp:


o_no_pulsada: 						;; Check P key
	ld hl, #Key_P 					
	call cpct_isKeyPressed_asm 		;; If not press, dont do anything
	jr z, p_no_pulsada
	ld hl, #Key_Space 				;; Check space key
	call cpct_isKeyPressed_asm 		;; If not press, dont do anything
	jr nz, p_no_pulsada			
	
	ld a, de_x(ix)					;; Load player pos x 
	sub #0x48 						;; Subtract max position

	jp p, no_te_muevas_again		;; If positive, dont move so dont be out the screen

	;;Change player sprite

	ld a, de_w(ix)
	ld b, a 
	ld a, #0x08
	sub b
	jr nz, no_update_sp_D


	;;;;;;;;;;; Sprite Animation ;;;;;;;;;;;

	call pl_AnimationSprite_D

	no_update_sp_D:

loopeoagain:						;; Loop
	dec a 							;; a -1 
	dec b           				;; b -1
	jr nz, loopeoagain 				;; If b = 0 -> end loop
	dec a 							;; a -1 again and check if is 0
	jr z, no_te_muevas_again 		;; If is 0 --> player is max right position and dont move it
	ld p_vx(ix), #+1 				;; If not 0, change vel so move player to the right

p_no_pulsada:

	ld a, de_w(ix)
	ld b, a 
	ld a, #0x08
	sub b
	jr nz, no_update_sp_C

	ld a, p_vx(ix)
	ld b, a 
	ld a, #0x0
	sub b 
	jr nz, no_update_sp_C

	ld hl, #_hero_sp_0
	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

	no_update_sp_C:

	call pl_move 					;; Call move method
	no_te_muevas_again: 			;; Tag to jump when player is on the edges
	ld p_vx(ix), #0x00 				;; Change vel = 0, stop moving player
no_updatear:

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; PL_ANIMATIONSPRITE_D ;;;;;;;;;;;;;;;;;;;;;
;; Changes de Sprite of the player when we move him with P ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

pl_AnimationSprite_D:

	ld a, (anim)
	dec a
	jr nz, dont_try

	ld a, #0x03
	ld (anim), a

	ld a, (sprHAct)
	ld b, a 

	ld hl, #_hero_sp_6
	ld a, #0x01 
	ld (sprHAct), a
	dec b
	jp m, dont_continue
	ld hl, #_hero_sp_1
	ld a, #0x02
	ld (sprHAct), a
	dec b
	jp m, dont_continue
	ld hl, #_hero_sp_2
	ld a, #0x00
	ld (sprHAct), a
	dec b
	jp m, dont_continue

	dont_continue:

	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

	dont_try:
	ld a, (anim)
	dec a
	ld (anim), a
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; PL_ANIMATIONSPRITE_I ;;;;;;;;;;;;;;;;;;;;;
;; Changes de Sprite of the player when we move him with O ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


pl_AnimationSprite_I:
	ld a, (anim)
	dec a
	jr nz, dont_try_I

	ld a, #0x03
	ld (anim), a

	ld a, (sprHAct)
	ld b, a 

	ld hl, #_hero_sp_5
	ld a, #0x01 
	ld (sprHAct), a
	dec b
	jp m, dont_continue_I
	ld hl, #_hero_sp_4
	ld a, #0x02
	ld (sprHAct), a
	dec b
	jp m, dont_continue_I
	ld hl, #_hero_sp_3
	ld a, #0x00
	ld (sprHAct), a
	dec b
	jp m, dont_continue_I

	dont_continue_I:

	ld de_sp_h(ix), h
	ld de_sp_l(ix), l

	dont_try_I:
	ld a, (anim)
	dec a
	ld (anim), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; PL_MOVEASSHOOTER ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Gun movement ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

pl_moveAsShooter:

	call cpct_scanKeyboard_asm 		;; Scan keyboard

	ld hl, #Key_Q 					;; Check if Q key is pressed
	call cpct_isKeyPressed_asm 		
	jr z, q_no_pulsada 				;; If not pressed, check A key
		ld a, de_y(ix) 					;;Load gun pos Y
		ld b, #30 						;; Check if its inside the game screen
		sub b
		jr z, no_te_muevas
		jp m, no_te_muevas
		ld p_vy(ix), #-2 				;; If its inside, change vel to -2, move up
q_no_pulsada:
	ld hl, #Key_A 					;; Check A key
	call cpct_isKeyPressed_asm  	
	jr z, a_no_pulsada 				;;If not pressed, check Spce key
		ld a, de_y(ix) 					;;Load gun pos Y
		sub #0x70 						;; Check if its inside the game screen
		jp p, no_te_muevas 				;; Si da 0 significa que estamos en el borde de abajo de pantalla y no muevo la mira
		ld p_vy(ix), #+2 				;; If its inside, change vel to -2, move down
a_no_pulsada:
	
	ld hl, #Key_Space				;; Check space key
	call cpct_isKeyPressed_asm		
	jr z, Space_no_pulsado 			
		;; if its pressed, check O or P

		call pl_shoot 	;;Shoot

		;;Move right or Left

		ld hl, #Key_O					;; Check O key
		call cpct_isKeyPressed_asm		;; If not pressed, check P key
		jr z, o2_no_pulsada		
		ld a, de_x(ix)					;; Load gun pos x
		dec a  							;; Dec pos x
		jp m, no_te_muevas 				;; If its negative, it would be out screen so dont move
		ld p_vx(ix), #-1

		o2_no_pulsada:

		ld hl, #Key_P 					;; Check P key
		call cpct_isKeyPressed_asm 		;; If not pressed, dont do anything
		jr z, Space_no_pulsado			
		ld a, de_x(ix)					;; Load gun pos x
		ld b, #0x4D
		loopeoagain2:						;; Loop
			dec a 							;; a -1 
			dec b           				;; b -1
			jr nz, loopeoagain2 				;; if b = cero, end loop
			dec a 							;; a-1 
		jr z, no_te_muevas 			 	;; if a = 0 -> dont move because is on the max right
		ld p_vx(ix), #+1 

Space_no_pulsado:
	call pl_move 					;; Call move method
no_te_muevas:
	ld p_vy(ix), #0 				;; Reset velocity y = 0
	ld p_vx(ix), #0 				;; Reset velocity x = 0
	call pl_moveKeyboard 			;; Check player movement

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; GET_ENEMY ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; Decrement enemies to kill counter ;;;;;;;;;;;;;;
;; If enemies to kill = 0, win game  and go to next level ;;;
;;;;;;;;;;;;;;;;;; Destroy registers: A ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

get_Enemy:

	ld a, (enemies)
	dec a
	jr nz, not_finished 		;; If not 0, player didnt kill all enemies
	jr z, finished
	jp m, finished

	finished:
	ld b, a
	ld a, (level)
	sub #6 
	jr nz, no_final_win

	call init_win
	ld a, b
	ld (enemies), a
	jp pl_next_level

no_final_win:

	call init_nextLevel
	call pl_next_level 			;; Win level -> Reset game

	not_finished:
	ld (enemies), a 			;; Update enemies to kill
	;call draw_Score
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; DRAW_SCORE ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; Draw enemies to kill counter ;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Destroy registers: HL, BC, DE, A ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

draw_Score:

	;;Divide counter/10 -> i keep quotient and rest ( They give me the figures that compse the number)

	ld a, (enemies) 				;; Enemies number in total
	ld l, a
	ld a, #0
	ld h, a 						;; Divide: HL
	ld a, #10
	ld e, a
  	ld bc,#0                     	;; BC is used to accumulate the result (Osea que aqui voy a tener el Cociente de la division)
  	ld d, #0                    	;; clearing D, so DE holds the divisor --> Ahora mismo tendria en de 0x000A (10 en decimal)
	DivLoop:
		ld a, l  		            ;; subtracting DE from HL until the first overflow
		ld (resto), a
  		sbc hl,de
  		jp m, no_increment                  	;; since the carry is zero, SBC works as if it was a SUB
  		inc bc
  	no_increment:                      ;; note that this instruction does not alter the flags
  	jr nc, DivLoop                  ;; no carry means that there was no overflow --> Si no hay carry es que aun puedo dividir


  	;; Now, in BC we have the quotient from division. The rest is on HL
  	;; Si divido 25/10 el resto sale 5 y el cociente 2, por lo tanto dibujare primero el cociente y luego el resto (1º BC --> 2º HL)
  	;; I save the results because cpct_getScreenPtr_asm destroy HL register

  	ld a, c
  	ld (cociente), a

	ld     a, (m_back_buffer)
	ld     d, a
	ld     e, #0
	ld     c, #pos_x_score1         		;; C = Title X
   	ld     b, #pos_y_score1         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	
   	ex    de, hl   					;; DE = memory pointer


   	ld a, (cociente)
   	
   	call calculate_Number

   	ld  b, #0x07 	;;height
   	ld  c, #0x03 	;;width

   	call cpct_drawSprite_asm

   	ld     a, (m_back_buffer)
	ld     d, a
	ld     e, #0
	ld     c, #pos_x_score2         		;; C = Title X
   	ld     b, #pos_y_score1         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	
   	ex    de, hl   					;; DE = memory pointer
	ld a, (resto)
   	
   	call calculate_Number

   	ld  b, #0x07 	;;height
   	ld  c, #0x03 	;;width

   	call cpct_drawSprite_asm	

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; CALCULATE_NUMBER ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; Calculate number to show in counter screen ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; INPUT: A  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; OUTPUT: HL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

calculate_Number:

	dec a
   	jp m, n_cero
   	dec a
   	jp m, n_uno
   	dec a
   	jp m, n_dos
   	dec a
   	jp m, n_tres
   	dec a
   	jp m, n_cuatro
   	dec a
   	jp m, n_cinco
   	dec a
   	jp m, n_seis
   	dec a
   	jp m, n_siete
   	dec a
   	jp m, n_ocho
   	dec a
   	jp m, n_nueve

   	n_cero:
	ld hl, #_numbers_00
	jp load_number
	n_uno:
	ld hl, #_numbers_01
	jp load_number
	n_dos:
	ld hl, #_numbers_02
	jp load_number
	n_tres:
	ld hl, #_numbers_03
	jp load_number
	n_cuatro:
	ld hl, #_numbers_04
	jp load_number
	n_cinco:
	ld hl, #_numbers_05
	jp load_number
	n_seis:
	ld hl, #_numbers_06
	jp load_number
	n_siete:
	ld hl, #_numbers_07
	jp load_number
	n_ocho:
	ld hl, #_numbers_08
	jp load_number
	n_nueve:
	ld hl, #_numbers_09

	load_number:

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; DRAW_LIFES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; Draw current player lifes ;;;;;;;;;;;;;;;;;;;;;;
;;;;;; If counter = 0, game over and comeback to menu ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

draw_Lifes:

	ld a, (lifes) 		;; Current player lifes
	ld b, a
	ld a, #3 			;; Max player lifes
	sub b  				;; Substrac current lifes to max lifes
	ld (no_lifes), a 	 			

	;; (Es decir, si tengo 1 vida actualmente, pintare un sprite de un tipo y 2 de otro para darle el feedback apropiado al usuario)


	dec a
	jp m, tercero_positivo


	ld (no_lifes), a
	;; Negative

	
	ld     c, #pos_x_life2        		;; C = Title X
   	ld     b, #pos_y_life      		;; B = Title Y
   	call draw_Life_Sprite_1

   	jp comprobacion_next

	;; Positive
	tercero_positivo:

	ld (no_lifes), a

	
	ld     c, #pos_x_life2       		;; C = Title X
   	ld     b, #pos_y_life        		;; B = Title Y
   	call draw_Life_Sprite_0

   	comprobacion_next:

   	ld a, (no_lifes)

   	dec a 
   	jp m, segundo_positivo


	ld (no_lifes), a
	;; Negative

	
	ld     c, #pos_x_life1         		;; C = Title X
   	ld     b, #pos_y_life        		;; B = Title Y
   	call draw_Life_Sprite_1

   	jp comprobacion_next2

	;; Positive
	segundo_positivo:

	ld (no_lifes), a

	
	ld     c, #pos_x_life1         		;; C = Title X
   	ld     b, #pos_y_life         		;; B = Title Y
   	call draw_Life_Sprite_0

   	comprobacion_next2:

   	ld a, (no_lifes)

   	dec a 
   	jp m, primero_positivo


	ld (no_lifes), a
	;; Negative

	
	ld     c, #pos_x_life3         		;; C = Title X
   	ld     b, #pos_y_life         		;; B = Title Y
   	call draw_Life_Sprite_1

   	jp comprobacion_next3

	;; Positive
	primero_positivo:

	ld (no_lifes), a

	ld     c, #pos_x_life3        		;; C = Title X
   	ld     b, #pos_y_life        		;; B = Title Y
	call draw_Life_Sprite_0

   	comprobacion_next3:

ret

draw_Life_Sprite_0:

	ld     a, (m_back_buffer)
	ld     d, a
	ld     e, #0
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_lifes_0
	ld  b, #0x16 	;;height
   	ld  c, #0x0B 	;;width

   	call cpct_drawSprite_asm

ret

draw_Life_Sprite_1:

	ld     a, (m_back_buffer)
	ld     d, a
	ld     e, #0
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_lifes_1
	ld  b, #0x16 	;;height
   	ld  c, #0x0B 	;;width

   	call cpct_drawSprite_asm

ret

pl_shoot:
	ld hl, #obstacle
	call pl_checkCollisionObstacle
	ld hl, #obstacle2
	call pl_checkCollisionObstacle

ret

pl_checkCollisionObstacle:

	;;check collision gun - obstacle
	ld a, de_x(ix) 		  ;;a=gun_x
	ld b, de_w(ix)		  ;;b=gun_w
	add b         		  ;;a=gun_x+gun_w
	ld b, (hl)     		  ;;b=obstacle_x
	sub b 				  ;;a=(gun_x+gun_w)-obstacle_x
	jr z, no_collisionO
	jp m, no_collisionO

	;;check collision obstacle - gun
	ld a, (hl) 		  	  ;;a=obstacle_x
	inc hl
	inc hl
	ld b, (hl)			  ;;b=obstacle_w
	add b         		  ;;a=obstacle_x+obstacle_w
	ld b, de_x(ix)   	  ;;b=gun_x
	sub b 				  ;;a=(obstacle_x+obstacle_w)-gun_x
	jr z, no_collisionO 	  
	jp m, no_collisionO

	;;check collision  obstacle
	;;  -
	;; gun

	dec hl				  ;;hl --> obstacle_y
	ld a, (hl)            ;;a=obstacle_y
	inc hl
	inc hl				  ;;hl --> obstacle_h
	ld b, (hl) 		  	  ;;a=obstacle_h
	add b         		  ;;a=obstacle_y+obstacle_h
	ld b, de_y(ix)   	  ;;b=gun_y
	sub b 				  ;;a=(obstacle_y+obstacle_h)-gun_y
	jr z, no_collisionO 	  
	jp m, no_collisionO

	;;check collision  enemy
						  ;;  -
						  ;; shoot

	ld a, de_y(ix)        ;;a=gun_y
	ld b, de_h(ix)	  	  ;;a=gun_h
	add b         		  ;;a=gun_y+gun_h
	dec hl
	dec hl 				  ;;hl --> obstacle_y
	ld b, (hl)			  ;;b=obstacle_y
	sub b 				  ;;a=(obstacle_y+obstacle_h)-gun_y
	jr z, no_collisionO 	  
	jp m, no_collisionO

	call ob_damage

no_collisionO:

	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;REDUCE_LIFE;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

reduce_life:

	ld a, (lifes)
	dec a 
	jp m, game_over
	ld (lifes), a

	ld a, #1
	ld (state), a

	ld bc, #_hero_sp_8
	ld hl, #hero_data
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl), c
	inc hl
	ld (hl), b

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;RESET_PLAYER;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

reset_player:

	;;hero_data
	ld ix, #hero_data
	ld de_x(ix), #0x24
	ld de_y(ix), #0x69
	;;shoot_data
	ld ix, #shoot_data
	ld de_x(ix), #0x25
	ld de_y(ix), #0x30
	;;animation time
	ld a, #0x02
	ld (anim), a

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;PL_NEXT_LEVEL;;;;;;;;;;;;
;; Change parameters in each level ;:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

pl_next_level:
	

	ld a, (level)
	inc a
	ld (level), a
	
	dec a
	dec a
	jr nz, no_level_2

		ld a, #5
		ld (enemies), a

		call ent_start_level_2
		jp reset_game_win

	no_level_2:

		dec a
		jr nz, no_level_3

			ld a, #8
			ld (enemies), a
			
			call ob_level_3
			call ent_start_level_3
			jp reset_game_win

	no_level_3:

		dec a
		jr nz, no_level_4

			ld a, #10
			ld (enemies), a

			call ob_level_4
			call ent_start_level_4
			jp reset_game_win

	no_level_4:

		dec a
		jr nz, no_level_5

			ld a, #15
			ld (enemies), a

			call ob_level_5
			call ent_start_level_5
			jp reset_game_win

	no_level_5:

		dec a
		jr nz, no_level_6

			ld a, #20
			ld (enemies), a

			call ob_level_6
			call ent_start_level_6
			jp reset_game_win

	no_level_6:

		ld a, #3
		ld (enemies), a

		call ob_level_1
		;call ent_start_level_1
		;;lifes
		ld a, #0x03
		ld (lifes), a
		ld a, #1
		ld (level), a

		jp reset_game

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;GAME_OVER;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

game_over:
	
	ld a, #1
	ld (level), a

	ld a, #3
	ld (enemies), a

	;;lifes
	ld a, #0x03
	ld (lifes), a

	call init_gameOver	
	call ob_level_1
	call reset_game 			

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;ESTA_MURIENDO;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
esta_muriendo:

	ld a, (animMuerto)
	dec a
	jr nz, no_reviv
	ld a, #0
	ld (state), a ;;revive
	ld a, #0x0F
	ld (animMuerto), a
	jp no_updatear

no_reviv:

	ld e, a
	ld b, #0x08
	sub b
	jr nz, dont_change_dead_sprite_hero

	;;change sprite to second dying
	ld bc, #_hero_sp_7
	ld hl, #hero_data
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl), c
	inc hl
	ld (hl), b

dont_change_dead_sprite_hero:
	ld a, e
	ld (animMuerto), a

	jp no_updatear