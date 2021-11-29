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

.globl cpct_disableFirmware_asm
.globl cpct_setVideoMode_asm
.globl cpct_waitVSYNC_asm
.globl cpct_drawSolidBox_asm
.globl cpct_getScreenPtr_asm
.globl cpct_scanKeyboard_asm
.globl cpct_isKeyPressed_asm
.globl cpct_setVideoMemoryPage_asm
.globl cpct_memset_f64_asm
.globl cpct_drawSprite_asm
.globl cpct_setPalette_asm
.globl _hero_pal
.globl _enemy_sc_sp
.globl cpct_zx7b_decrunch_s_asm
.globl _level0_pack_end
.globl cpct_etm_setDrawTilemap4x8_ag_asm
.globl cpct_etm_drawTilemap4x8_ag_asm
.globl _level0_W
.globl _tile_palette
.globl tilemap_ptr
.globl _menu_pack_end
.globl _menu2_pack_end
.globl reset_game_win
.globl reset_game
.globl cpct_getRandom_mxor_u8_asm
.globl cpct_akp_musicInit_asm
.globl cpct_akp_musicPlay_asm
.globl cpct_akp_stop_asm
.globl cpct_setInterruptHandler_asm
.globl _main_theme
.globl _true_theme
.globl _shootSFX
.globl cpct_akp_SFXInit_asm
.globl cpct_akp_SFXPlay_asm
.globl cpct_akp_SFXStop_asm
.globl cpct_setPALColour_asm
.globl DecompressTilemap