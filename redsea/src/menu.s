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
.include "controls.h.s"


location: .db #0xC0

GetScreenForTitle:
	ld     d, a
	ld     e, #0
	ld     c, #0x11         		;; C = Title X
   	ld     b, #0x40         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_title_sp_0
   	ld  b, #0x0C 	;;height
   	ld  c, #0x2E 	;;width

   	call cpct_drawSprite_asm
ret

GetScreenForTitle1:
	ld     d, a
	ld     e, #0
	ld     c, #0x0D         		;; C = Title X
   	ld     b, #0x65         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_title_sp_1
   	ld  b, #0x0C 	;;height
   	ld  c, #0x2E 	;;width

   	call cpct_drawSprite_asm
ret

GetScreenForTitle2:
	ld     d, a
	ld     e, #0
	ld     c, #0x0D         		;; C = Title X
   	ld     b, #0x75         		;; B = Title Y
   	call cpct_getScreenPtr_asm

   	ex    de, hl   					;; DE = memory pointer

	ld hl, #_title_sp_2
   	ld  b, #0x9 	;;height
   	ld  c, #0x2E 	;;width

   	call cpct_drawSprite_asm
ret

drawTileMap:
	ld h, a
	ld a, #0x0
	ld l, a 
	ld de, #tilemap_ptr
	call cpct_etm_drawTilemap4x8_ag_asm
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; INIT_MENU ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Initalize game showng title ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Until dont press 1 dont come back to main loop ;;;;;;;;;
;;;;;;;;;;;;;; Destroy registers: A, DE, BC, HL ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init_menu:

	Reset_menu:

	ld a, #0xC0
	call drawTileMap

	ld a, #0x80
	call drawTileMap

	ld     a, #0xC0
	call GetScreenForTitle

   	ld     a, #0x80
   	call GetScreenForTitle

   	ld     a, #0xC0
	call GetScreenForTitle1

   	ld     a, #0x80
   	call GetScreenForTitle1

   	ld     a, #0xC0
	call GetScreenForTitle2

   	ld     a, #0x80
   	call GetScreenForTitle2	


	Init: 							;; Infinite Loop until player press 1 or 2

	   	call cpct_waitVSYNC_asm
		call ren_newScene
		call changeLocation

		call cpct_scanKeyboard_asm 		;;Scan keyboard
		ld hl, #Key_2					;;Check key 2 -> controls screen
		call cpct_isKeyPressed_asm

		jr z, not_show_menu

		ld   hl, #_menu_pack_end
  		call DecompressTilemap

		call init_controls

		ld   hl, #_menu2_pack_end
		call DecompressTilemap

		jp Reset_menu

		not_show_menu:

		call cpct_scanKeyboard_asm 		;;Scan keyboard
		ld hl, #Key_1					;;Check key 1 -> play game
		call cpct_isKeyPressed_asm

	jr z, Init

ret

changeLocation:
	ld a, (m_back_buffer)
	ld (location), a
ret
