##-----------------------------LICENSE NOTICE------------------------------------
##  This file is part of CPCtelera: An Amstrad CPC Game Engine 
##  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU Lesser General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##------------------------------------------------------------------------------
############################################################################
##                        CPCTELERA ENGINE                                ##
##                 Automatic image conversion file                        ##
##------------------------------------------------------------------------##
## This file is intended for users to automate image conversion from JPG, ##
## PNG, GIF, etc. into C-arrays.                                          ##
############################################################################

##
## NEW MACROS
##

## 16 colours palette
#PALETTE=0 1 2 3 6 9 11 12 13 15 16 18 20 24 25 26

## Default values
#$(eval $(call IMG2SP, SET_MODE        , 0                  ))  { 0, 1, 2 }
#$(eval $(call IMG2SP, SET_MASK        , none               ))  { interlaced, none }
#$(eval $(call IMG2SP, SET_FOLDER      , src/               ))
#$(eval $(call IMG2SP, SET_EXTRAPAR    ,                    ))
#$(eval $(call IMG2SP, SET_IMG_FORMAT  , sprites            ))	{ sprites, zgtiles, screen }
#$(eval $(call IMG2SP, SET_OUTPUT      , c                  ))  { bin, c }
#$(eval $(call IMG2SP, SET_PALETTE_FW  , $(PALETTE)         ))
#$(eval $(call IMG2SP, CONVERT_PALETTE , $(PALETTE), g_palette ))
#$(eval $(call IMG2SP, CONVERT         , img.png , w, h, array, palette, tileset))
PALETTE=3 0 1 2 5  6 11 12 13 15 16 18 20 24 25 26
$(eval $(call IMG2SP, SET_FOLDER      , src/sprites/))
$(eval $(call IMG2SP, SET_PALETTE_FW  , $(PALETTE)         ))
$(eval $(call IMG2SP, CONVERT, assets/pirate_hero.png, 16, 20, hero_sp, hero_pal))
$(eval $(call IMG2SP, CONVERT, assets/mastil.png, 8, 50, mastil_sp))
$(eval $(call IMG2SP, CONVERT, assets/camarote.png, 40, 26, camarote_sp))
$(eval $(call IMG2SP, CONVERT, assets/enemy2.png, 12, 12, enemy2_sp))
$(eval $(call IMG2SP, CONVERT, assets/assets.png, 8, 8, assets_sp))
$(eval $(call IMG2SP, CONVERT, assets/obstacle.png, 12, 15, obstacle_sp))
$(eval $(call IMG2SP, CONVERT, assets/Pirate_Close_3.png, 16, 20, enemy12_sp))
$(eval $(call IMG2SP, CONVERT, assets/Pirate_Far.png, 12, 13, enemy3_sp))
$(eval $(call IMG2SP, CONVERT, assets/title.png, 92, 12, title_sp))
$(eval $(call IMG2SP, CONVERT, assets/numbers.png, 6, 7, numbers))
$(eval $(call IMG2SP, CONVERT, assets/controls.png, 78, 56, controls_sp))
$(eval $(call IMG2SP, CONVERT, assets/Vidas.png, 22, 22, lifes))
$(eval $(call IMG2SP, CONVERT, assets/thanks.png, 86, 60, thanks_sp))
$(eval $(call IMG2SP, CONVERT, assets/Enemy.png, 22, 22, enemy_sc_sp))
$(eval $(call IMG2SP, CONVERT, assets/gameover_text.png, 80, 26, gameover_text_sp))
$(eval $(call IMG2SP, CONVERT, assets/nextlevel_text.png, 68, 12, nextlevel_text_sp))

#Tileset

$(eval $(call IMG2SP, SET_FOLDER      , src/tiles/				 ))
$(eval $(call IMG2SP, SET_IMG_FORMAT  , zgtiles           		 ))
$(eval $(call IMG2SP, SET_OUTPUT      , bin               		 ))
$(eval $(call IMG2SP, CONVERT_PALETTE , $(PALETTE), tile_palette ))
$(eval $(call IMG2SP, CONVERT, assets/Tileset.png, 8, 8, tiles   ))

##
## OLD MACROS (For compatibility)
##

## Example firmware palette definition as variable in cpct_img2tileset format

# PALETTE={0 1 3 4 7 9 10 12 13 16 19 20 21 24 25 26}

## AUTOMATED IMAGE CONVERSION EXAMPLE (Uncomment EVAL line to use)
##
##    This example would convert img/example.png into src/example.{c|h} files.
##    A C-array called pre_example[24*12*2] would be generated with the definition
##    of the image example.png in mode 0 screen pixel format, with interlaced mask.
##    The palette used for conversion is given through the PALETTE variable and
##    a pre_palette[16] array will be generated with the 16 palette colours as 
##	  hardware colour values.

#$(eval $(call IMG2SPRITES,img/example.png,0,pre,24,12,$(PALETTE),mask,src/,hwpalette))



############################################################################
##              DETAILED INSTRUCTIONS AND PARAMETERS                      ##
##------------------------------------------------------------------------##
##                                                                        ##
## Macro used for conversion is IMG2SPRITES, which has up to 9 parameters:##
##  (1): Image file to be converted into C sprite (PNG, JPG, GIF, etc)    ##
##  (2): Graphics mode (0,1,2) for the generated C sprite                 ##
##  (3): Prefix to add to all C-identifiers generated                     ##
##  (4): Width in pixels of each sprite/tile/etc that will be generated   ##
##  (5): Height in pixels of each sprite/tile/etc that will be generated  ##
##  (6): Firmware palette used to convert the image file into C values    ##
##  (7): (mask / tileset / zgtiles)                                       ##
##     - "mask":    generate interlaced mask for all sprites converted    ##
##     - "tileset": generate a tileset array with pointers to all sprites ##
##     - "zgtiles": generate tiles/sprites in Zig-Zag pixel order and     ##
##                  Gray Code row order                                   ##
##  (8): Output subfolder for generated .C/.H files (in project folder)   ##
##  (9): (hwpalette)                                                      ##
##     - "hwpalette": output palette array with hardware colour values    ##
## (10): Aditional options (you can use this to pass aditional modifiers  ##
##       to cpct_img2tileset)                                             ##
##                                                                        ##
## Macro is used in this way (one line for each image to be converted):   ##
##  $(eval $(call IMG2SPRITES,(1),(2),(3),(4),(5),(6),(7),(8),(9), (10))) ##
##                                                                        ##
## Important:                                                             ##
##  * Do NOT separate macro parameters with spaces, blanks or other chars.##
##    ANY character you put into a macro parameter will be passed to the  ##
##    macro. Therefore ...,src/sprites,... will represent "src/sprites"   ##
##    folder, whereas ...,  src/sprites,... means "  src/sprites" folder. ##
##                                                                        ##
##  * You can omit parameters but leaving them empty. Therefore, if you   ##
##  wanted to specify an output folder but do not want your sprites to    ##
##  have mask and/or tileset, you may omit parameter (7) leaving it empty ##
##     $(eval $(call IMG2SPRITES,imgs/1.png,0,g,4,8,$(PAL),,src/))        ##
############################################################################
