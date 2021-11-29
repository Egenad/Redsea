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
.include "render.h.s"
.include "menu.h.s"
.include "gameover.h.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; INIT_GAMEOVER ;;;;;;;;;;;;;;;;;;
;;;;;; Show game over screen ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init_gameOver:

	ld hl, #_menu_pack_end 	;;load here the tilemap you want
	call DecompressTilemap

	ld a, #0xC0
	call drawTileMap

	ld a, #0x80
	call drawTileMap  ;;call tilemap menu

	ld a, #0xC0
	call draw_text_sp

	ld a, #0x80
	call draw_text_sp

initeando:

	call cpct_waitVSYNC_asm

	call cpct_scanKeyboard_asm 		;; scan keyboard
	ld hl, #Key_Space				;; Check Space key
	call cpct_isKeyPressed_asm

	jr z, initeando


ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; DRAW_TEXT_SP;;;;;;;;;;;;;;;;
;;;;; Draw sprite game over screen ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

draw_text_sp:

	push af

	ld     d, a
	ld     e, #0
	ld     c, #0x14         		;; C = Title X
   	ld     b, #0x40         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_gameover_text_sp_0
   	ld  b, #0x1A	;;height
   	ld  c, #0x28 	;;width

   	call cpct_drawSprite_asm

   	pop af

   	ld     d, a
	ld     e, #0
	ld     c, #0x14         		;; C = Title X
   	ld     b, #0x70         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_gameover_text_sp_1
   	ld  b, #0x0D;; alto
   	ld  c, #0x28;; Ancho

   	call cpct_drawSprite_asm
ret