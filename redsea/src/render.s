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

m_front_buffer: .db 0xC0
m_back_buffer:  .db 0x80


ren_newScene:
   call ren_switchBuffers
   ;;call ren_clearBackBuffer
ret


ren_clearBackBuffer:

   ;ld       a, (m_back_buffer)
   ;ld       h, a
   ;ld      de, #0
   ;ld       l, e
   ;ld      bc, #0x4000

   ;call cpct_memset_f64_asm

ret

ren_switchBuffers:

   ld    a, (m_back_buffer)
   ld    b, a 
   ld    a, (m_front_buffer)
   ld    (m_back_buffer), a 
   ld    a, b 
   ld    (m_front_buffer), a

   srl   b
   srl   b
   ld    l, b
   jp cpct_setVideoMemoryPage_asm


render_draw:

	;;ld    de, #0xC000       ;;Start video memory
	ld     a, (m_back_buffer)
   ld     d, a
   ld     e, #0
   ld     c, de_x(ix)         ;; C = Entity Y
   ld     b, de_y(ix)         ;; B = Entity X
   call cpct_getScreenPtr_asm

   ex    de, hl   ;; DE = memory pointer
   ;;ld  a, de_c(ix)   ;; Color --> With Sprites its not necessary
   ;;ld hl, #_hero_sp_00
   ld  l, de_sp_l(ix)
   ld  h, de_sp_h(ix)
   ld  b, de_h(ix)   ;;de_h(ix)   ;; height
   ld  c, de_w(ix)   ;;de_w(ix)   ;; width

   ;;call cpct_drawSolidBox_asm
   call cpct_drawSprite_asm      ;; Now draw Sprites
	ret

calcule_clear:
   ld     a, (m_back_buffer)
   ld     d, a
   ld     e, #0
   ld     c, de_x(ix)         ;; C = Entity Y
   dec c
   jp p, no_es_negativo
   inc c 
   no_es_negativo:
   ld     b, de_y(ix)         ;; B = Entity X
ret

render_clear:
   
   call calcule_clear
   call cpct_getScreenPtr_asm


   ex de, hl

   
   ld c, de_w(ix)
   inc c
   inc c 
   ld b, de_h(ix)
   ld a, #0x0

   call cpct_drawSolidBox_asm

   ret

render_clear_asset:

   call calcule_clear
   dec b
   call cpct_getScreenPtr_asm

   ex de, hl
   
   ld c, de_w(ix)
   inc c
   inc c 
   ld b, de_h(ix)
   inc b
   inc b 
   ld a, #0x0

   call cpct_drawSolidBox_asm

ret

erase_inbothBuffers:

   ld     d, a
   ld     e, #0
   ld     c, de_x(ix)         ;; C = Entity Y
   ld     b, de_y(ix)         ;; B = Entity X
   call cpct_getScreenPtr_asm

   ex de, hl
   
   ld c, de_w(ix)
   ld b, de_h(ix)
   ld a, #0x0

   call cpct_drawSolidBox_asm

ret

render_clear_asset_both:
   ld     a, #0xC0
   call erase_inbothBuffers
   ld     a, #0x80
   call erase_inbothBuffers
ret