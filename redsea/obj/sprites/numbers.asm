;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module numbers
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _numbers_09
	.globl _numbers_08
	.globl _numbers_07
	.globl _numbers_06
	.globl _numbers_05
	.globl _numbers_04
	.globl _numbers_03
	.globl _numbers_02
	.globl _numbers_01
	.globl _numbers_00
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
_numbers_00:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_01:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_02:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_03:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_04:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_05:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_06:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_07:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_08:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
_numbers_09:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0xc0	; 192
	.db #0x95	; 149
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.area _INITIALIZER
	.area _CABS (ABS)
