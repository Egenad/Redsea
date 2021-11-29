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
.include "win.h.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; INIT_WIN ;;;;;;;;;;;;;;
;;;;;;;; Show final win screen;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init_win:

	ld hl, #_menu_pack_end 	;;load here the tilemap you want
	call DecompressTilemap

	ld a, #0xC0
	call drawTileMap

	ld a, #0x80
	call drawTileMap  

	ld a, #0xC0
	call draw_text_sp_win

	ld a, #0x80
	call draw_text_sp_win

initeando_win:

	call cpct_waitVSYNC_asm

	call cpct_scanKeyboard_asm 		;; Scan keyboard
	ld hl, #Key_X					;; Check X key
	call cpct_isKeyPressed_asm

	jr z, initeando_win


ret

draw_text_sp_win:

	push af

	ld     d, a
	ld     e, #0
	ld     c, #0x14         		;; C = Title X
   	ld     b, #0x30         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_thanks_sp_0
   	ld  b, #0x3C 	;;height
   	ld  c, #0x2B 	;;width

   	call cpct_drawSprite_asm

   	pop af

   	ld     d, a
	ld     e, #0
	ld     c, #0x14         		;; C = Title X
   	ld     b, #0x80         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_thanks_sp_1
   	ld  b, #0x05 	;;height
   	ld  c, #0x2B 	;;width

   	call cpct_drawSprite_asm
ret