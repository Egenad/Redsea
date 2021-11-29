ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;------------------------------------------------LICENSE NOTICE------------------------------------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "Redsea"
                              3 ;;  Copyright (C) 2018 Gameroid / Angel Jesus Terol Martinez (@miya_nashi) / Raquel Gonzalez Roma (@kelara712) / Carla Macia Diez (@shiryuko)
                              4 ;;  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;------------------------------------------------LICENSE NOTICE-------------------------------------------------------------------------
                             19 
                             20 .globl cpct_disableFirmware_asm
                             21 .globl cpct_setVideoMode_asm
                             22 .globl cpct_waitVSYNC_asm
                             23 .globl cpct_drawSolidBox_asm
                             24 .globl cpct_getScreenPtr_asm
                             25 .globl cpct_scanKeyboard_asm
                             26 .globl cpct_isKeyPressed_asm
                             27 .globl cpct_setVideoMemoryPage_asm
                             28 .globl cpct_memset_f64_asm
                             29 .globl cpct_drawSprite_asm
                             30 .globl cpct_setPalette_asm
                             31 .globl _hero_pal
                             32 .globl _enemy_sc_sp
                             33 .globl cpct_zx7b_decrunch_s_asm
                             34 .globl _level0_pack_end
                             35 .globl cpct_etm_setDrawTilemap4x8_ag_asm
                             36 .globl cpct_etm_drawTilemap4x8_ag_asm
                             37 .globl _level0_W
                             38 .globl _tile_palette
                             39 .globl tilemap_ptr
                             40 .globl _menu_pack_end
                             41 .globl _menu2_pack_end
                             42 .globl reset_game_win
                             43 .globl reset_game
                             44 .globl cpct_getRandom_mxor_u8_asm
                             45 .globl cpct_akp_musicInit_asm
                             46 .globl cpct_akp_musicPlay_asm
                             47 .globl cpct_akp_stop_asm
                             48 .globl cpct_setInterruptHandler_asm
                             49 .globl _main_theme
                             50 .globl _true_theme
                             51 .globl _shootSFX
                             52 .globl cpct_akp_SFXInit_asm
                             53 .globl cpct_akp_SFXPlay_asm
                             54 .globl cpct_akp_SFXStop_asm
                             55 .globl cpct_setPALColour_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 .globl DecompressTilemap
