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
.include "nextlevel.h.s"

reloj: .db #0x88 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;INIT_NEXTLEVEL;;;;;;;;;;;;;;;
;;;;;;;;Show next level screen;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


init_nextLevel:

	ld hl, #_menu_pack_end 	;;Load here the tilemap you want
	call DecompressTilemap

	ld a, #0xC0
	call drawTileMap

	ld a, #0x80
	call drawTileMap  ;;call menu tilemap

	ld a, #0xC0
	call draw_text_sp2

	ld a, #0x80
	call draw_text_sp2

	ld a, (reloj)

initeando2:

	halt

	push af
	call cpct_waitVSYNC_asm
	pop af

	dec a

	jr nz, initeando2
	ld a, #0x88
	ld (reloj), a

ret

draw_text_sp2:

	push af

	ld     d, a
	ld     e, #0
	ld     c, #0x17         		;; C = Title X
   	ld     b, #0x45         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_nextlevel_text_sp_0
   	ld  b, #0x0C 	;;height
   	ld  c, #0x22 	;;width

   	call cpct_drawSprite_asm


   	pop af

   	ld     d, a
	ld     e, #0
	ld     c, #0x17         		;; C = Title X
   	ld     b, #0x69         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_nextlevel_text_sp_1
   	ld  b, #0x0C 	;;height
   	ld  c, #0x22 	;;width

   	call cpct_drawSprite_asm
ret