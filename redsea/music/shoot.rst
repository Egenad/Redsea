ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;;
                              2 ;;; File generated by cpct_aks2c CPCtelera script
                              3 ;;; Souce file of this conversion: music/shoot.aks
                              4 ;;; Generation time: mar oct 30 19:42:22 CET 2018
                              5 ;;;
                              6 
                              7 ;;; Set absolute memory addressing
                              8 .area __shootSFX (ABS)
   6F48                       9 .org 0x6F48
                             10 
                             11 ;;; Music data start (101 bytes)
                             12 ;;;
   6F48                      13 _shootSFX::
   6F48 41 54 31 30 01 40    14 .db 0x41, 0x54, 0x31, 0x30, 0x01, 0x40, 0x42, 0x0f, 0x02, 0x06, 0x2f, 0x00, 0x58, 0x6f, 0x61, 0x6f
        42 0F 02 06 2F 00
        58 6F 61 6F
   6F58 00 00 00 00 00 00    15 .db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d, 0x5a, 0x6f, 0x03, 0x00, 0x3e, 0x3f, 0x3e, 0x00, 0x0e
        0D 5A 6F 03 00 3E
        3F 3E 00 0E
   6F68 31 32 0A 12 26 2E    16 .db 0x31, 0x32, 0x0a, 0x12, 0x26, 0x2e, 0x1d, 0x2e, 0x28, 0x1e, 0x09, 0x12, 0x27, 0x52, 0x24, 0x0c
        1D 2E 28 1E 09 12
        27 52 24 0C
   6F78 12 01 4C 0C 0A 21    17 .db 0x12, 0x01, 0x4c, 0x0c, 0x0a, 0x21, 0x48, 0x0c, 0x0d, 0x5a, 0x6f, 0x07, 0x00, 0x00, 0x00, 0x93
        48 0C 0D 5A 6F 07
        00 00 00 93
   6F88 6F 00 94 6F A3 6F    18 .db 0x6f, 0x00, 0x94, 0x6f, 0xa3, 0x6f, 0xa8, 0x6f, 0x01, 0x89, 0x6f, 0x00, 0xa2, 0xe0, 0x00, 0x00
        A8 6F 01 89 6F 00
        A2 E0 00 00
   6F98 01 02 42 00 42 00    19 .db 0x01, 0x02, 0x42, 0x00, 0x42, 0x00, 0x42, 0x00, 0x02, 0x42, 0x00, 0x42, 0x80, 0x00, 0x00, 0x00
        42 00 02 42 00 42
        80 00 00 00
   6FA8 42 80 00 00 00       20 .db 0x42, 0x80, 0x00, 0x00, 0x00
