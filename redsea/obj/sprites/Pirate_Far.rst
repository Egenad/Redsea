                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Pirate_Far
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _enemy3_sp_8
                             12 	.globl _enemy3_sp_7
                             13 	.globl _enemy3_sp_6
                             14 	.globl _enemy3_sp_5
                             15 	.globl _enemy3_sp_4
                             16 	.globl _enemy3_sp_3
                             17 	.globl _enemy3_sp_2
                             18 	.globl _enemy3_sp_1
                             19 	.globl _enemy3_sp_0
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _INITIALIZED
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 	.area _CODE
   2CF5                      52 _enemy3_sp_0:
   2CF5 C0                   53 	.db #0xc0	; 192
   2CF6 C0                   54 	.db #0xc0	; 192
   2CF7 D0                   55 	.db #0xd0	; 208
   2CF8 F0                   56 	.db #0xf0	; 240
   2CF9 C0                   57 	.db #0xc0	; 192
   2CFA C0                   58 	.db #0xc0	; 192
   2CFB C0                   59 	.db #0xc0	; 192
   2CFC 40                   60 	.db #0x40	; 64
   2CFD F0                   61 	.db #0xf0	; 240
   2CFE F5                   62 	.db #0xf5	; 245
   2CFF C0                   63 	.db #0xc0	; 192
   2D00 C0                   64 	.db #0xc0	; 192
   2D01 C0                   65 	.db #0xc0	; 192
   2D02 80                   66 	.db #0x80	; 128
   2D03 50                   67 	.db #0x50	; 80	'P'
   2D04 A0                   68 	.db #0xa0	; 160
   2D05 C0                   69 	.db #0xc0	; 192
   2D06 C0                   70 	.db #0xc0	; 192
   2D07 C0                   71 	.db #0xc0	; 192
   2D08 40                   72 	.db #0x40	; 64
   2D09 3F                   73 	.db #0x3f	; 63
   2D0A FC                   74 	.db #0xfc	; 252
   2D0B C0                   75 	.db #0xc0	; 192
   2D0C C0                   76 	.db #0xc0	; 192
   2D0D C0                   77 	.db #0xc0	; 192
   2D0E C0                   78 	.db #0xc0	; 192
   2D0F C0                   79 	.db #0xc0	; 192
   2D10 3F                   80 	.db #0x3f	; 63
   2D11 C0                   81 	.db #0xc0	; 192
   2D12 C0                   82 	.db #0xc0	; 192
   2D13 D5                   83 	.db #0xd5	; 213
   2D14 6C                   84 	.db #0x6c	; 108	'l'
   2D15 57                   85 	.db #0x57	; 87	'W'
   2D16 FF                   86 	.db #0xff	; 255
   2D17 C0                   87 	.db #0xc0	; 192
   2D18 95                   88 	.db #0x95	; 149
   2D19 6A                   89 	.db #0x6a	; 106	'j'
   2D1A C4                   90 	.db #0xc4	; 196
   2D1B 9C                   91 	.db #0x9c	; 156
   2D1C 3C                   92 	.db #0x3c	; 60
   2D1D 9C                   93 	.db #0x9c	; 156
   2D1E EA                   94 	.db #0xea	; 234
   2D1F C0                   95 	.db #0xc0	; 192
   2D20 C0                   96 	.db #0xc0	; 192
   2D21 57                   97 	.db #0x57	; 87	'W'
   2D22 FF                   98 	.db #0xff	; 255
   2D23 C8                   99 	.db #0xc8	; 200
   2D24 C0                  100 	.db #0xc0	; 192
   2D25 C0                  101 	.db #0xc0	; 192
   2D26 C0                  102 	.db #0xc0	; 192
   2D27 9C                  103 	.db #0x9c	; 156
   2D28 3C                  104 	.db #0x3c	; 60
   2D29 C0                  105 	.db #0xc0	; 192
   2D2A C0                  106 	.db #0xc0	; 192
   2D2B C0                  107 	.db #0xc0	; 192
   2D2C C0                  108 	.db #0xc0	; 192
   2D2D C0                  109 	.db #0xc0	; 192
   2D2E E2                  110 	.db #0xe2	; 226
   2D2F C0                  111 	.db #0xc0	; 192
   2D30 C0                  112 	.db #0xc0	; 192
   2D31 80                  113 	.db #0x80	; 128
   2D32 40                  114 	.db #0x40	; 64
   2D33 30                  115 	.db #0x30	; 48	'0'
   2D34 30                  116 	.db #0x30	; 48	'0'
   2D35 C0                  117 	.db #0xc0	; 192
   2D36 C0                  118 	.db #0xc0	; 192
   2D37 C0                  119 	.db #0xc0	; 192
   2D38 40                  120 	.db #0x40	; 64
   2D39 30                  121 	.db #0x30	; 48	'0'
   2D3A 30                  122 	.db #0x30	; 48	'0'
   2D3B 40                  123 	.db #0x40	; 64
   2D3C 40                  124 	.db #0x40	; 64
   2D3D C0                  125 	.db #0xc0	; 192
   2D3E 90                  126 	.db #0x90	; 144
   2D3F 60                  127 	.db #0x60	; 96
   2D40 C0                  128 	.db #0xc0	; 192
   2D41 80                  129 	.db #0x80	; 128
   2D42 C0                  130 	.db #0xc0	; 192
   2D43                     131 _enemy3_sp_1:
   2D43 C0                  132 	.db #0xc0	; 192
   2D44 C0                  133 	.db #0xc0	; 192
   2D45 D0                  134 	.db #0xd0	; 208
   2D46 F0                  135 	.db #0xf0	; 240
   2D47 C0                  136 	.db #0xc0	; 192
   2D48 C0                  137 	.db #0xc0	; 192
   2D49 C0                  138 	.db #0xc0	; 192
   2D4A 40                  139 	.db #0x40	; 64
   2D4B F0                  140 	.db #0xf0	; 240
   2D4C F5                  141 	.db #0xf5	; 245
   2D4D C0                  142 	.db #0xc0	; 192
   2D4E C0                  143 	.db #0xc0	; 192
   2D4F C0                  144 	.db #0xc0	; 192
   2D50 80                  145 	.db #0x80	; 128
   2D51 50                  146 	.db #0x50	; 80	'P'
   2D52 A0                  147 	.db #0xa0	; 160
   2D53 C0                  148 	.db #0xc0	; 192
   2D54 C0                  149 	.db #0xc0	; 192
   2D55 C0                  150 	.db #0xc0	; 192
   2D56 40                  151 	.db #0x40	; 64
   2D57 3F                  152 	.db #0x3f	; 63
   2D58 FC                  153 	.db #0xfc	; 252
   2D59 C0                  154 	.db #0xc0	; 192
   2D5A C0                  155 	.db #0xc0	; 192
   2D5B C0                  156 	.db #0xc0	; 192
   2D5C C0                  157 	.db #0xc0	; 192
   2D5D C0                  158 	.db #0xc0	; 192
   2D5E 3F                  159 	.db #0x3f	; 63
   2D5F C0                  160 	.db #0xc0	; 192
   2D60 C0                  161 	.db #0xc0	; 192
   2D61 C0                  162 	.db #0xc0	; 192
   2D62 C4                  163 	.db #0xc4	; 196
   2D63 57                  164 	.db #0x57	; 87	'W'
   2D64 FF                  165 	.db #0xff	; 255
   2D65 C0                  166 	.db #0xc0	; 192
   2D66 C0                  167 	.db #0xc0	; 192
   2D67 C0                  168 	.db #0xc0	; 192
   2D68 46                  169 	.db #0x46	; 70	'F'
   2D69 9C                  170 	.db #0x9c	; 156
   2D6A 3C                  171 	.db #0x3c	; 60
   2D6B C0                  172 	.db #0xc0	; 192
   2D6C C0                  173 	.db #0xc0	; 192
   2D6D C0                  174 	.db #0xc0	; 192
   2D6E EA                  175 	.db #0xea	; 234
   2D6F 57                  176 	.db #0x57	; 87	'W'
   2D70 FF                  177 	.db #0xff	; 255
   2D71 17                  178 	.db #0x17	; 23
   2D72 C0                  179 	.db #0xc0	; 192
   2D73 C0                  180 	.db #0xc0	; 192
   2D74 6A                  181 	.db #0x6a	; 106	'j'
   2D75 9C                  182 	.db #0x9c	; 156
   2D76 3C                  183 	.db #0x3c	; 60
   2D77 C0                  184 	.db #0xc0	; 192
   2D78 C0                  185 	.db #0xc0	; 192
   2D79 C0                  186 	.db #0xc0	; 192
   2D7A C0                  187 	.db #0xc0	; 192
   2D7B C0                  188 	.db #0xc0	; 192
   2D7C E2                  189 	.db #0xe2	; 226
   2D7D C0                  190 	.db #0xc0	; 192
   2D7E C0                  191 	.db #0xc0	; 192
   2D7F C0                  192 	.db #0xc0	; 192
   2D80 C0                  193 	.db #0xc0	; 192
   2D81 30                  194 	.db #0x30	; 48	'0'
   2D82 30                  195 	.db #0x30	; 48	'0'
   2D83 40                  196 	.db #0x40	; 64
   2D84 C0                  197 	.db #0xc0	; 192
   2D85 C0                  198 	.db #0xc0	; 192
   2D86 80                  199 	.db #0x80	; 128
   2D87 10                  200 	.db #0x10	; 16
   2D88 60                  201 	.db #0x60	; 96
   2D89 40                  202 	.db #0x40	; 64
   2D8A C0                  203 	.db #0xc0	; 192
   2D8B C0                  204 	.db #0xc0	; 192
   2D8C 40                  205 	.db #0x40	; 64
   2D8D C0                  206 	.db #0xc0	; 192
   2D8E C0                  207 	.db #0xc0	; 192
   2D8F 80                  208 	.db #0x80	; 128
   2D90 C0                  209 	.db #0xc0	; 192
   2D91                     210 _enemy3_sp_2:
   2D91 C0                  211 	.db #0xc0	; 192
   2D92 D0                  212 	.db #0xd0	; 208
   2D93 F0                  213 	.db #0xf0	; 240
   2D94 F0                  214 	.db #0xf0	; 240
   2D95 C0                  215 	.db #0xc0	; 192
   2D96 C0                  216 	.db #0xc0	; 192
   2D97 00                  217 	.db #0x00	; 0
   2D98 50                  218 	.db #0x50	; 80	'P'
   2D99 F0                  219 	.db #0xf0	; 240
   2D9A F5                  220 	.db #0xf5	; 245
   2D9B 80                  221 	.db #0x80	; 128
   2D9C C0                  222 	.db #0xc0	; 192
   2D9D 80                  223 	.db #0x80	; 128
   2D9E 00                  224 	.db #0x00	; 0
   2D9F 50                  225 	.db #0x50	; 80	'P'
   2DA0 A0                  226 	.db #0xa0	; 160
   2DA1 40                  227 	.db #0x40	; 64
   2DA2 C0                  228 	.db #0xc0	; 192
   2DA3 00                  229 	.db #0x00	; 0
   2DA4 40                  230 	.db #0x40	; 64
   2DA5 3F                  231 	.db #0x3f	; 63
   2DA6 FC                  232 	.db #0xfc	; 252
   2DA7 00                  233 	.db #0x00	; 0
   2DA8 C0                  234 	.db #0xc0	; 192
   2DA9 C0                  235 	.db #0xc0	; 192
   2DAA 00                  236 	.db #0x00	; 0
   2DAB C0                  237 	.db #0xc0	; 192
   2DAC 3F                  238 	.db #0x3f	; 63
   2DAD C0                  239 	.db #0xc0	; 192
   2DAE C0                  240 	.db #0xc0	; 192
   2DAF 2E                  241 	.db #0x2e	; 46
   2DB0 46                  242 	.db #0x46	; 70	'F'
   2DB1 57                  243 	.db #0x57	; 87	'W'
   2DB2 FF                  244 	.db #0xff	; 255
   2DB3 98                  245 	.db #0x98	; 152
   2DB4 BF                  246 	.db #0xbf	; 191
   2DB5 06                  247 	.db #0x06	; 6
   2DB6 46                  248 	.db #0x46	; 70	'F'
   2DB7 9C                  249 	.db #0x9c	; 156
   2DB8 3C                  250 	.db #0x3c	; 60
   2DB9 C8                  251 	.db #0xc8	; 200
   2DBA 95                  252 	.db #0x95	; 149
   2DBB 57                  253 	.db #0x57	; 87	'W'
   2DBC 57                  254 	.db #0x57	; 87	'W'
   2DBD 57                  255 	.db #0x57	; 87	'W'
   2DBE FF                  256 	.db #0xff	; 255
   2DBF EA                  257 	.db #0xea	; 234
   2DC0 C0                  258 	.db #0xc0	; 192
   2DC1 3F                  259 	.db #0x3f	; 63
   2DC2 3F                  260 	.db #0x3f	; 63
   2DC3 9C                  261 	.db #0x9c	; 156
   2DC4 3C                  262 	.db #0x3c	; 60
   2DC5 3F                  263 	.db #0x3f	; 63
   2DC6 C0                  264 	.db #0xc0	; 192
   2DC7 95                  265 	.db #0x95	; 149
   2DC8 95                  266 	.db #0x95	; 149
   2DC9 C0                  267 	.db #0xc0	; 192
   2DCA E2                  268 	.db #0xe2	; 226
   2DCB C0                  269 	.db #0xc0	; 192
   2DCC C0                  270 	.db #0xc0	; 192
   2DCD C0                  271 	.db #0xc0	; 192
   2DCE FC                  272 	.db #0xfc	; 252
   2DCF 30                  273 	.db #0x30	; 48	'0'
   2DD0 30                  274 	.db #0x30	; 48	'0'
   2DD1 80                  275 	.db #0x80	; 128
   2DD2 40                  276 	.db #0x40	; 64
   2DD3 80                  277 	.db #0x80	; 128
   2DD4 80                  278 	.db #0x80	; 128
   2DD5 80                  279 	.db #0x80	; 128
   2DD6 60                  280 	.db #0x60	; 96
   2DD7 00                  281 	.db #0x00	; 0
   2DD8 C0                  282 	.db #0xc0	; 192
   2DD9 C0                  283 	.db #0xc0	; 192
   2DDA 80                  284 	.db #0x80	; 128
   2DDB 80                  285 	.db #0x80	; 128
   2DDC 40                  286 	.db #0x40	; 64
   2DDD 00                  287 	.db #0x00	; 0
   2DDE C0                  288 	.db #0xc0	; 192
   2DDF                     289 _enemy3_sp_3:
   2DDF C0                  290 	.db #0xc0	; 192
   2DE0 D0                  291 	.db #0xd0	; 208
   2DE1 F0                  292 	.db #0xf0	; 240
   2DE2 F0                  293 	.db #0xf0	; 240
   2DE3 E0                  294 	.db #0xe0	; 224
   2DE4 C0                  295 	.db #0xc0	; 192
   2DE5 C0                  296 	.db #0xc0	; 192
   2DE6 D5                  297 	.db #0xd5	; 213
   2DE7 FA                  298 	.db #0xfa	; 250
   2DE8 F0                  299 	.db #0xf0	; 240
   2DE9 A0                  300 	.db #0xa0	; 160
   2DEA 80                  301 	.db #0x80	; 128
   2DEB C0                  302 	.db #0xc0	; 192
   2DEC 80                  303 	.db #0x80	; 128
   2DED 50                  304 	.db #0x50	; 80	'P'
   2DEE A0                  305 	.db #0xa0	; 160
   2DEF 00                  306 	.db #0x00	; 0
   2DF0 40                  307 	.db #0x40	; 64
   2DF1 C0                  308 	.db #0xc0	; 192
   2DF2 80                  309 	.db #0x80	; 128
   2DF3 FC                  310 	.db #0xfc	; 252
   2DF4 3F                  311 	.db #0x3f	; 63
   2DF5 80                  312 	.db #0x80	; 128
   2DF6 00                  313 	.db #0x00	; 0
   2DF7 C0                  314 	.db #0xc0	; 192
   2DF8 95                  315 	.db #0x95	; 149
   2DF9 3F                  316 	.db #0x3f	; 63
   2DFA C0                  317 	.db #0xc0	; 192
   2DFB 00                  318 	.db #0x00	; 0
   2DFC C0                  319 	.db #0xc0	; 192
   2DFD 6A                  320 	.db #0x6a	; 106	'j'
   2DFE 7F                  321 	.db #0x7f	; 127
   2DFF FF                  322 	.db #0xff	; 255
   2E00 AB                  323 	.db #0xab	; 171
   2E01 9C                  324 	.db #0x9c	; 156
   2E02 BA                  325 	.db #0xba	; 186
   2E03 FF                  326 	.db #0xff	; 255
   2E04 6C                  327 	.db #0x6c	; 108	'l'
   2E05 3C                  328 	.db #0x3c	; 60
   2E06 6C                  329 	.db #0x6c	; 108	'l'
   2E07 8C                  330 	.db #0x8c	; 140
   2E08 1D                  331 	.db #0x1d	; 29
   2E09 95                  332 	.db #0x95	; 149
   2E0A 4C                  333 	.db #0x4c	; 76	'L'
   2E0B FF                  334 	.db #0xff	; 255
   2E0C AB                  335 	.db #0xab	; 171
   2E0D AB                  336 	.db #0xab	; 171
   2E0E C0                  337 	.db #0xc0	; 192
   2E0F C0                  338 	.db #0xc0	; 192
   2E10 90                  339 	.db #0x90	; 144
   2E11 3C                  340 	.db #0x3c	; 60
   2E12 6C                  341 	.db #0x6c	; 108	'l'
   2E13 24                  342 	.db #0x24	; 36
   2E14 C0                  343 	.db #0xc0	; 192
   2E15 C0                  344 	.db #0xc0	; 192
   2E16 C0                  345 	.db #0xc0	; 192
   2E17 D1                  346 	.db #0xd1	; 209
   2E18 C0                  347 	.db #0xc0	; 192
   2E19 C0                  348 	.db #0xc0	; 192
   2E1A C0                  349 	.db #0xc0	; 192
   2E1B C0                  350 	.db #0xc0	; 192
   2E1C 54                  351 	.db #0x54	; 84	'T'
   2E1D 30                  352 	.db #0x30	; 48	'0'
   2E1E 30                  353 	.db #0x30	; 48	'0'
   2E1F 80                  354 	.db #0x80	; 128
   2E20 00                  355 	.db #0x00	; 0
   2E21 80                  356 	.db #0x80	; 128
   2E22 80                  357 	.db #0x80	; 128
   2E23 30                  358 	.db #0x30	; 48	'0'
   2E24 30                  359 	.db #0x30	; 48	'0'
   2E25 80                  360 	.db #0x80	; 128
   2E26 80                  361 	.db #0x80	; 128
   2E27 C0                  362 	.db #0xc0	; 192
   2E28 40                  363 	.db #0x40	; 64
   2E29 40                  364 	.db #0x40	; 64
   2E2A B8                  365 	.db #0xb8	; 184
   2E2B 74                  366 	.db #0x74	; 116	't'
   2E2C E8                  367 	.db #0xe8	; 232
   2E2D                     368 _enemy3_sp_4:
   2E2D C0                  369 	.db #0xc0	; 192
   2E2E F0                  370 	.db #0xf0	; 240
   2E2F F0                  371 	.db #0xf0	; 240
   2E30 E0                  372 	.db #0xe0	; 224
   2E31 C0                  373 	.db #0xc0	; 192
   2E32 C0                  374 	.db #0xc0	; 192
   2E33 C0                  375 	.db #0xc0	; 192
   2E34 FA                  376 	.db #0xfa	; 250
   2E35 FA                  377 	.db #0xfa	; 250
   2E36 F0                  378 	.db #0xf0	; 240
   2E37 80                  379 	.db #0x80	; 128
   2E38 C0                  380 	.db #0xc0	; 192
   2E39 C0                  381 	.db #0xc0	; 192
   2E3A 50                  382 	.db #0x50	; 80	'P'
   2E3B 50                  383 	.db #0x50	; 80	'P'
   2E3C A0                  384 	.db #0xa0	; 160
   2E3D 40                  385 	.db #0x40	; 64
   2E3E C0                  386 	.db #0xc0	; 192
   2E3F C0                  387 	.db #0xc0	; 192
   2E40 00                  388 	.db #0x00	; 0
   2E41 FC                  389 	.db #0xfc	; 252
   2E42 3F                  390 	.db #0x3f	; 63
   2E43 80                  391 	.db #0x80	; 128
   2E44 C0                  392 	.db #0xc0	; 192
   2E45 C0                  393 	.db #0xc0	; 192
   2E46 3F                  394 	.db #0x3f	; 63
   2E47 3F                  395 	.db #0x3f	; 63
   2E48 C0                  396 	.db #0xc0	; 192
   2E49 C0                  397 	.db #0xc0	; 192
   2E4A C0                  398 	.db #0xc0	; 192
   2E4B EA                  399 	.db #0xea	; 234
   2E4C FF                  400 	.db #0xff	; 255
   2E4D FF                  401 	.db #0xff	; 255
   2E4E AB                  402 	.db #0xab	; 171
   2E4F C8                  403 	.db #0xc8	; 200
   2E50 C0                  404 	.db #0xc0	; 192
   2E51 95                  405 	.db #0x95	; 149
   2E52 30                  406 	.db #0x30	; 48	'0'
   2E53 3C                  407 	.db #0x3c	; 60
   2E54 6C                  408 	.db #0x6c	; 108	'l'
   2E55 89                  409 	.db #0x89	; 137
   2E56 C0                  410 	.db #0xc0	; 192
   2E57 2B                  411 	.db #0x2b	; 43
   2E58 2B                  412 	.db #0x2b	; 43
   2E59 FF                  413 	.db #0xff	; 255
   2E5A AB                  414 	.db #0xab	; 171
   2E5B D5                  415 	.db #0xd5	; 213
   2E5C C0                  416 	.db #0xc0	; 192
   2E5D C0                  417 	.db #0xc0	; 192
   2E5E 30                  418 	.db #0x30	; 48	'0'
   2E5F 3C                  419 	.db #0x3c	; 60
   2E60 6C                  420 	.db #0x6c	; 108	'l'
   2E61 95                  421 	.db #0x95	; 149
   2E62 C0                  422 	.db #0xc0	; 192
   2E63 C0                  423 	.db #0xc0	; 192
   2E64 C1                  424 	.db #0xc1	; 193
   2E65 D1                  425 	.db #0xd1	; 209
   2E66 C0                  426 	.db #0xc0	; 192
   2E67 C0                  427 	.db #0xc0	; 192
   2E68 C0                  428 	.db #0xc0	; 192
   2E69 00                  429 	.db #0x00	; 0
   2E6A A8                  430 	.db #0xa8	; 168
   2E6B 30                  431 	.db #0x30	; 48	'0'
   2E6C 30                  432 	.db #0x30	; 48	'0'
   2E6D C0                  433 	.db #0xc0	; 192
   2E6E C0                  434 	.db #0xc0	; 192
   2E6F 80                  435 	.db #0x80	; 128
   2E70 80                  436 	.db #0x80	; 128
   2E71 90                  437 	.db #0x90	; 144
   2E72 20                  438 	.db #0x20	; 32
   2E73 40                  439 	.db #0x40	; 64
   2E74 C0                  440 	.db #0xc0	; 192
   2E75 40                  441 	.db #0x40	; 64
   2E76 40                  442 	.db #0x40	; 64
   2E77 C0                  443 	.db #0xc0	; 192
   2E78 80                  444 	.db #0x80	; 128
   2E79 80                  445 	.db #0x80	; 128
   2E7A C0                  446 	.db #0xc0	; 192
   2E7B                     447 _enemy3_sp_5:
   2E7B C0                  448 	.db #0xc0	; 192
   2E7C C0                  449 	.db #0xc0	; 192
   2E7D F0                  450 	.db #0xf0	; 240
   2E7E E0                  451 	.db #0xe0	; 224
   2E7F C0                  452 	.db #0xc0	; 192
   2E80 C0                  453 	.db #0xc0	; 192
   2E81 C0                  454 	.db #0xc0	; 192
   2E82 C0                  455 	.db #0xc0	; 192
   2E83 FA                  456 	.db #0xfa	; 250
   2E84 F0                  457 	.db #0xf0	; 240
   2E85 80                  458 	.db #0x80	; 128
   2E86 C0                  459 	.db #0xc0	; 192
   2E87 C0                  460 	.db #0xc0	; 192
   2E88 C0                  461 	.db #0xc0	; 192
   2E89 50                  462 	.db #0x50	; 80	'P'
   2E8A A0                  463 	.db #0xa0	; 160
   2E8B 40                  464 	.db #0x40	; 64
   2E8C C0                  465 	.db #0xc0	; 192
   2E8D C0                  466 	.db #0xc0	; 192
   2E8E C0                  467 	.db #0xc0	; 192
   2E8F FC                  468 	.db #0xfc	; 252
   2E90 3F                  469 	.db #0x3f	; 63
   2E91 80                  470 	.db #0x80	; 128
   2E92 C0                  471 	.db #0xc0	; 192
   2E93 C0                  472 	.db #0xc0	; 192
   2E94 C0                  473 	.db #0xc0	; 192
   2E95 3F                  474 	.db #0x3f	; 63
   2E96 C0                  475 	.db #0xc0	; 192
   2E97 C0                  476 	.db #0xc0	; 192
   2E98 C0                  477 	.db #0xc0	; 192
   2E99 C0                  478 	.db #0xc0	; 192
   2E9A C4                  479 	.db #0xc4	; 196
   2E9B FF                  480 	.db #0xff	; 255
   2E9C AB                  481 	.db #0xab	; 171
   2E9D C8                  482 	.db #0xc8	; 200
   2E9E C0                  483 	.db #0xc0	; 192
   2E9F C0                  484 	.db #0xc0	; 192
   2EA0 C4                  485 	.db #0xc4	; 196
   2EA1 3C                  486 	.db #0x3c	; 60
   2EA2 6C                  487 	.db #0x6c	; 108	'l'
   2EA3 89                  488 	.db #0x89	; 137
   2EA4 C0                  489 	.db #0xc0	; 192
   2EA5 C0                  490 	.db #0xc0	; 192
   2EA6 81                  491 	.db #0x81	; 129
   2EA7 FF                  492 	.db #0xff	; 255
   2EA8 AB                  493 	.db #0xab	; 171
   2EA9 AB                  494 	.db #0xab	; 171
   2EAA C0                  495 	.db #0xc0	; 192
   2EAB C0                  496 	.db #0xc0	; 192
   2EAC 3F                  497 	.db #0x3f	; 63
   2EAD 3C                  498 	.db #0x3c	; 60
   2EAE 6C                  499 	.db #0x6c	; 108	'l'
   2EAF 3F                  500 	.db #0x3f	; 63
   2EB0 C0                  501 	.db #0xc0	; 192
   2EB1 C0                  502 	.db #0xc0	; 192
   2EB2 C0                  503 	.db #0xc0	; 192
   2EB3 D1                  504 	.db #0xd1	; 209
   2EB4 C0                  505 	.db #0xc0	; 192
   2EB5 6A                  506 	.db #0x6a	; 106	'j'
   2EB6 C0                  507 	.db #0xc0	; 192
   2EB7 C0                  508 	.db #0xc0	; 192
   2EB8 C0                  509 	.db #0xc0	; 192
   2EB9 30                  510 	.db #0x30	; 48	'0'
   2EBA 30                  511 	.db #0x30	; 48	'0'
   2EBB C0                  512 	.db #0xc0	; 192
   2EBC C0                  513 	.db #0xc0	; 192
   2EBD C0                  514 	.db #0xc0	; 192
   2EBE 80                  515 	.db #0x80	; 128
   2EBF 90                  516 	.db #0x90	; 144
   2EC0 40                  517 	.db #0x40	; 64
   2EC1 C0                  518 	.db #0xc0	; 192
   2EC2 C0                  519 	.db #0xc0	; 192
   2EC3 C0                  520 	.db #0xc0	; 192
   2EC4 00                  521 	.db #0x00	; 0
   2EC5 80                  522 	.db #0x80	; 128
   2EC6 40                  523 	.db #0x40	; 64
   2EC7 C0                  524 	.db #0xc0	; 192
   2EC8 C0                  525 	.db #0xc0	; 192
   2EC9                     526 _enemy3_sp_6:
   2EC9 C0                  527 	.db #0xc0	; 192
   2ECA C0                  528 	.db #0xc0	; 192
   2ECB D0                  529 	.db #0xd0	; 208
   2ECC E0                  530 	.db #0xe0	; 224
   2ECD C0                  531 	.db #0xc0	; 192
   2ECE C0                  532 	.db #0xc0	; 192
   2ECF C0                  533 	.db #0xc0	; 192
   2ED0 80                  534 	.db #0x80	; 128
   2ED1 F5                  535 	.db #0xf5	; 245
   2ED2 FA                  536 	.db #0xfa	; 250
   2ED3 C0                  537 	.db #0xc0	; 192
   2ED4 C0                  538 	.db #0xc0	; 192
   2ED5 C0                  539 	.db #0xc0	; 192
   2ED6 C0                  540 	.db #0xc0	; 192
   2ED7 50                  541 	.db #0x50	; 80	'P'
   2ED8 A0                  542 	.db #0xa0	; 160
   2ED9 C0                  543 	.db #0xc0	; 192
   2EDA C0                  544 	.db #0xc0	; 192
   2EDB C0                  545 	.db #0xc0	; 192
   2EDC 80                  546 	.db #0x80	; 128
   2EDD 7E                  547 	.db #0x7e	; 126
   2EDE BD                  548 	.db #0xbd	; 189
   2EDF C0                  549 	.db #0xc0	; 192
   2EE0 C0                  550 	.db #0xc0	; 192
   2EE1 C0                  551 	.db #0xc0	; 192
   2EE2 C0                  552 	.db #0xc0	; 192
   2EE3 95                  553 	.db #0x95	; 149
   2EE4 6A                  554 	.db #0x6a	; 106	'j'
   2EE5 C0                  555 	.db #0xc0	; 192
   2EE6 C0                  556 	.db #0xc0	; 192
   2EE7 C0                  557 	.db #0xc0	; 192
   2EE8 C4                  558 	.db #0xc4	; 196
   2EE9 FF                  559 	.db #0xff	; 255
   2EEA FF                  560 	.db #0xff	; 255
   2EEB C8                  561 	.db #0xc8	; 200
   2EEC C0                  562 	.db #0xc0	; 192
   2EED C0                  563 	.db #0xc0	; 192
   2EEE 89                  564 	.db #0x89	; 137
   2EEF 3C                  565 	.db #0x3c	; 60
   2EF0 94                  566 	.db #0x94	; 148
   2EF1 EA                  567 	.db #0xea	; 234
   2EF2 C0                  568 	.db #0xc0	; 192
   2EF3 C0                  569 	.db #0xc0	; 192
   2EF4 EA                  570 	.db #0xea	; 234
   2EF5 FF                  571 	.db #0xff	; 255
   2EF6 6E                  572 	.db #0x6e	; 110	'n'
   2EF7 C8                  573 	.db #0xc8	; 200
   2EF8 C0                  574 	.db #0xc0	; 192
   2EF9 C0                  575 	.db #0xc0	; 192
   2EFA 6A                  576 	.db #0x6a	; 106	'j'
   2EFB 3C                  577 	.db #0x3c	; 60
   2EFC 3C                  578 	.db #0x3c	; 60
   2EFD C0                  579 	.db #0xc0	; 192
   2EFE C0                  580 	.db #0xc0	; 192
   2EFF C0                  581 	.db #0xc0	; 192
   2F00 C0                  582 	.db #0xc0	; 192
   2F01 D1                  583 	.db #0xd1	; 209
   2F02 E2                  584 	.db #0xe2	; 226
   2F03 C0                  585 	.db #0xc0	; 192
   2F04 C0                  586 	.db #0xc0	; 192
   2F05 C0                  587 	.db #0xc0	; 192
   2F06 C0                  588 	.db #0xc0	; 192
   2F07 30                  589 	.db #0x30	; 48	'0'
   2F08 30                  590 	.db #0x30	; 48	'0'
   2F09 C0                  591 	.db #0xc0	; 192
   2F0A C0                  592 	.db #0xc0	; 192
   2F0B C0                  593 	.db #0xc0	; 192
   2F0C C0                  594 	.db #0xc0	; 192
   2F0D 40                  595 	.db #0x40	; 64
   2F0E 80                  596 	.db #0x80	; 128
   2F0F C0                  597 	.db #0xc0	; 192
   2F10 C0                  598 	.db #0xc0	; 192
   2F11 C0                  599 	.db #0xc0	; 192
   2F12 80                  600 	.db #0x80	; 128
   2F13 40                  601 	.db #0x40	; 64
   2F14 80                  602 	.db #0x80	; 128
   2F15 40                  603 	.db #0x40	; 64
   2F16 C0                  604 	.db #0xc0	; 192
   2F17                     605 _enemy3_sp_7:
   2F17 C0                  606 	.db #0xc0	; 192
   2F18 C0                  607 	.db #0xc0	; 192
   2F19 D0                  608 	.db #0xd0	; 208
   2F1A E0                  609 	.db #0xe0	; 224
   2F1B C0                  610 	.db #0xc0	; 192
   2F1C C0                  611 	.db #0xc0	; 192
   2F1D C0                  612 	.db #0xc0	; 192
   2F1E 80                  613 	.db #0x80	; 128
   2F1F F5                  614 	.db #0xf5	; 245
   2F20 FA                  615 	.db #0xfa	; 250
   2F21 C0                  616 	.db #0xc0	; 192
   2F22 C0                  617 	.db #0xc0	; 192
   2F23 C0                  618 	.db #0xc0	; 192
   2F24 C0                  619 	.db #0xc0	; 192
   2F25 50                  620 	.db #0x50	; 80	'P'
   2F26 A0                  621 	.db #0xa0	; 160
   2F27 C0                  622 	.db #0xc0	; 192
   2F28 C0                  623 	.db #0xc0	; 192
   2F29 C0                  624 	.db #0xc0	; 192
   2F2A 80                  625 	.db #0x80	; 128
   2F2B 7E                  626 	.db #0x7e	; 126
   2F2C BD                  627 	.db #0xbd	; 189
   2F2D C0                  628 	.db #0xc0	; 192
   2F2E C0                  629 	.db #0xc0	; 192
   2F2F 95                  630 	.db #0x95	; 149
   2F30 C0                  631 	.db #0xc0	; 192
   2F31 95                  632 	.db #0x95	; 149
   2F32 6A                  633 	.db #0x6a	; 106	'j'
   2F33 C0                  634 	.db #0xc0	; 192
   2F34 6A                  635 	.db #0x6a	; 106	'j'
   2F35 81                  636 	.db #0x81	; 129
   2F36 BE                  637 	.db #0xbe	; 190
   2F37 55                  638 	.db #0x55	; 85	'U'
   2F38 FF                  639 	.db #0xff	; 255
   2F39 7D                  640 	.db #0x7d	; 125
   2F3A 42                  641 	.db #0x42	; 66	'B'
   2F3B C0                  642 	.db #0xc0	; 192
   2F3C 89                  643 	.db #0x89	; 137
   2F3D 28                  644 	.db #0x28	; 40
   2F3E 28                  645 	.db #0x28	; 40
   2F3F 46                  646 	.db #0x46	; 70	'F'
   2F40 C0                  647 	.db #0xc0	; 192
   2F41 C0                  648 	.db #0xc0	; 192
   2F42 C0                  649 	.db #0xc0	; 192
   2F43 AA                  650 	.db #0xaa	; 170
   2F44 55                  651 	.db #0x55	; 85	'U'
   2F45 48                  652 	.db #0x48	; 72	'H'
   2F46 C0                  653 	.db #0xc0	; 192
   2F47 C0                  654 	.db #0xc0	; 192
   2F48 C0                  655 	.db #0xc0	; 192
   2F49 28                  656 	.db #0x28	; 40
   2F4A 3C                  657 	.db #0x3c	; 60
   2F4B C0                  658 	.db #0xc0	; 192
   2F4C C0                  659 	.db #0xc0	; 192
   2F4D C0                  660 	.db #0xc0	; 192
   2F4E C0                  661 	.db #0xc0	; 192
   2F4F D1                  662 	.db #0xd1	; 209
   2F50 E2                  663 	.db #0xe2	; 226
   2F51 C0                  664 	.db #0xc0	; 192
   2F52 C0                  665 	.db #0xc0	; 192
   2F53 C0                  666 	.db #0xc0	; 192
   2F54 40                  667 	.db #0x40	; 64
   2F55 30                  668 	.db #0x30	; 48	'0'
   2F56 30                  669 	.db #0x30	; 48	'0'
   2F57 80                  670 	.db #0x80	; 128
   2F58 C0                  671 	.db #0xc0	; 192
   2F59 C0                  672 	.db #0xc0	; 192
   2F5A 80                  673 	.db #0x80	; 128
   2F5B 40                  674 	.db #0x40	; 64
   2F5C 80                  675 	.db #0x80	; 128
   2F5D 40                  676 	.db #0x40	; 64
   2F5E C0                  677 	.db #0xc0	; 192
   2F5F C0                  678 	.db #0xc0	; 192
   2F60 80                  679 	.db #0x80	; 128
   2F61 40                  680 	.db #0x40	; 64
   2F62 80                  681 	.db #0x80	; 128
   2F63 40                  682 	.db #0x40	; 64
   2F64 C0                  683 	.db #0xc0	; 192
   2F65                     684 _enemy3_sp_8:
   2F65 C0                  685 	.db #0xc0	; 192
   2F66 C0                  686 	.db #0xc0	; 192
   2F67 C0                  687 	.db #0xc0	; 192
   2F68 F0                  688 	.db #0xf0	; 240
   2F69 C0                  689 	.db #0xc0	; 192
   2F6A C0                  690 	.db #0xc0	; 192
   2F6B C0                  691 	.db #0xc0	; 192
   2F6C C0                  692 	.db #0xc0	; 192
   2F6D 40                  693 	.db #0x40	; 64
   2F6E C0                  694 	.db #0xc0	; 192
   2F6F E0                  695 	.db #0xe0	; 224
   2F70 C0                  696 	.db #0xc0	; 192
   2F71 C0                  697 	.db #0xc0	; 192
   2F72 C0                  698 	.db #0xc0	; 192
   2F73 C0                  699 	.db #0xc0	; 192
   2F74 C0                  700 	.db #0xc0	; 192
   2F75 C0                  701 	.db #0xc0	; 192
   2F76 C0                  702 	.db #0xc0	; 192
   2F77 C0                  703 	.db #0xc0	; 192
   2F78 C0                  704 	.db #0xc0	; 192
   2F79 C0                  705 	.db #0xc0	; 192
   2F7A C0                  706 	.db #0xc0	; 192
   2F7B C0                  707 	.db #0xc0	; 192
   2F7C C0                  708 	.db #0xc0	; 192
   2F7D C0                  709 	.db #0xc0	; 192
   2F7E 6A                  710 	.db #0x6a	; 106	'j'
   2F7F C0                  711 	.db #0xc0	; 192
   2F80 C0                  712 	.db #0xc0	; 192
   2F81 C0                  713 	.db #0xc0	; 192
   2F82 95                  714 	.db #0x95	; 149
   2F83 C0                  715 	.db #0xc0	; 192
   2F84 42                  716 	.db #0x42	; 66	'B'
   2F85 C0                  717 	.db #0xc0	; 192
   2F86 C0                  718 	.db #0xc0	; 192
   2F87 90                  719 	.db #0x90	; 144
   2F88 EA                  720 	.db #0xea	; 234
   2F89 C0                  721 	.db #0xc0	; 192
   2F8A 84                  722 	.db #0x84	; 132
   2F8B 12                  723 	.db #0x12	; 18
   2F8C C0                  724 	.db #0xc0	; 192
   2F8D 81                  725 	.db #0x81	; 129
   2F8E 48                  726 	.db #0x48	; 72	'H'
   2F8F C0                  727 	.db #0xc0	; 192
   2F90 C0                  728 	.db #0xc0	; 192
   2F91 D5                  729 	.db #0xd5	; 213
   2F92 03                  730 	.db #0x03	; 3
   2F93 EA                  731 	.db #0xea	; 234
   2F94 C0                  732 	.db #0xc0	; 192
   2F95 C0                  733 	.db #0xc0	; 192
   2F96 C0                  734 	.db #0xc0	; 192
   2F97 C4                  735 	.db #0xc4	; 196
   2F98 57                  736 	.db #0x57	; 87	'W'
   2F99 C8                  737 	.db #0xc8	; 200
   2F9A C0                  738 	.db #0xc0	; 192
   2F9B C0                  739 	.db #0xc0	; 192
   2F9C 80                  740 	.db #0x80	; 128
   2F9D F0                  741 	.db #0xf0	; 240
   2F9E 44                  742 	.db #0x44	; 68	'D'
   2F9F 00                  743 	.db #0x00	; 0
   2FA0 C0                  744 	.db #0xc0	; 192
   2FA1 C0                  745 	.db #0xc0	; 192
   2FA2 D0                  746 	.db #0xd0	; 208
   2FA3 50                  747 	.db #0x50	; 80	'P'
   2FA4 AA                  748 	.db #0xaa	; 170
   2FA5 20                  749 	.db #0x20	; 32
   2FA6 C0                  750 	.db #0xc0	; 192
   2FA7 C0                  751 	.db #0xc0	; 192
   2FA8 D0                  752 	.db #0xd0	; 208
   2FA9 50                  753 	.db #0x50	; 80	'P'
   2FAA AA                  754 	.db #0xaa	; 170
   2FAB 40                  755 	.db #0x40	; 64
   2FAC C0                  756 	.db #0xc0	; 192
   2FAD C0                  757 	.db #0xc0	; 192
   2FAE 80                  758 	.db #0x80	; 128
   2FAF F0                  759 	.db #0xf0	; 240
   2FB0 44                  760 	.db #0x44	; 68	'D'
   2FB1 00                  761 	.db #0x00	; 0
   2FB2 C0                  762 	.db #0xc0	; 192
                            763 	.area _INITIALIZER
                            764 	.area _CABS (ABS)
