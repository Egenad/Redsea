;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module Enemy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _enemy_sc_sp
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
_enemy_sc_sp:
	.db #0xb5	; 181
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0xf0	; 240
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x50	; 80	'P'
	.db #0x3f	; 63
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x2a	; 42
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x57	; 87	'W'
	.db #0xea	; 234
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xd5	; 213
	.db #0xab	; 171
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xff	; 255
	.db #0xd5	; 213
	.db #0xea	; 234
	.db #0xff	; 255
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x57	; 87	'W'
	.db #0xd5	; 213
	.db #0xea	; 234
	.db #0xab	; 171
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x57	; 87	'W'
	.db #0xd5	; 213
	.db #0xea	; 234
	.db #0xab	; 171
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.area _INITIALIZER
	.area _CABS (ABS)
