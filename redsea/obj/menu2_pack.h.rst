ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;; File src/menu2_pack.h.s generated using cpct_pack
                              2 ;; Compresor used:   zx7b
                              3 ;; Files compressed: [ src/tiles/menu2.bin src/tiles/Tileset.bin ]
                              4 ;; Uncompressed:     1620 bytes
                              5 ;; Compressed:       418 bytes
                              6 ;; Space saved:      1202 bytes
                              7 ;;
                              8 
                              9 ;; Declaration of the compressed array and
                             10 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                             11 .globl _menu2_pack
                             12 .globl _menu2_pack_end
                             13 
                             14 ;; Compressed and uncompressed sizes
                     01A2    15 _menu2_pack_size_z = 418
                     0654    16 _menu2_pack_size   = 1620
                             17 
                             18 
                             19 ;; Define constants for starting offsets of files in the uncompressed array
                     0000    20 _menu2_pack_OFF_000 =      0   ;; Starting offset for src/tiles/menu2.bin
                     01F4    21 _menu2_pack_OFF_001 =    500   ;; Starting offset for src/tiles/Tileset.bin
                             22 
