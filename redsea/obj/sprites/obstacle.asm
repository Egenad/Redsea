;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module obstacle
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _obstacle_sp_1
	.globl _obstacle_sp_0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_obstacle_sp_0:
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe2	; 226
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x81	; 129
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xe2	; 226
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xd1	; 209
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xe2	; 226
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc2	; 194
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0xe2	; 226
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc2	; 194
	.db #0xc0	; 192
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc2	; 194
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc2	; 194
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xe2	; 226
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x81	; 129
	.db #0x02	; 2
_obstacle_sp_1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc2	; 194
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc2	; 194
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xc2	; 194
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x57	; 87	'W'
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x81	; 129
	.db #0x02	; 2
	.area _INITIALIZER
	.area _CABS (ABS)
