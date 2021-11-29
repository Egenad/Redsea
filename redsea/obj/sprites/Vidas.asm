;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module Vidas
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _lifes_1
	.globl _lifes_0
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
_lifes_0:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc1	; 193
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc0	; 192
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc2	; 194
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x6b	; 107	'k'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0xc1	; 193
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xae	; 174
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xc1	; 193
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0xcc	; 204
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0x95	; 149
	.db #0xc2	; 194
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc1	; 193
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0xc2	; 194
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc3	; 195
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc1	; 193
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
_lifes_1:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xc0	; 192
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xab	; 171
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xc0	; 192
	.db #0xd5	; 213
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x57	; 87	'W'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xab	; 171
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0xea	; 234
	.db #0xff	; 255
	.db #0xd5	; 213
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0xea	; 234
	.db #0xff	; 255
	.db #0xd5	; 213
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.area _INITIALIZER
	.area _CABS (ABS)
