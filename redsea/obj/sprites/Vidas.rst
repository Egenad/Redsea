                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Vidas
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _lifes_1
                             12 	.globl _lifes_0
                             13 ;--------------------------------------------------------
                             14 ; special function registers
                             15 ;--------------------------------------------------------
                             16 ;--------------------------------------------------------
                             17 ; ram data
                             18 ;--------------------------------------------------------
                             19 	.area _DATA
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _INITIALIZED
                             24 ;--------------------------------------------------------
                             25 ; absolute external ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DABS (ABS)
                             28 ;--------------------------------------------------------
                             29 ; global & static initialisations
                             30 ;--------------------------------------------------------
                             31 	.area _HOME
                             32 	.area _GSINIT
                             33 	.area _GSFINAL
                             34 	.area _GSINIT
                             35 ;--------------------------------------------------------
                             36 ; Home
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _HOME
                             40 ;--------------------------------------------------------
                             41 ; code
                             42 ;--------------------------------------------------------
                             43 	.area _CODE
                             44 	.area _CODE
   1BC9                      45 _lifes_0:
   1BC9 3F                   46 	.db #0x3f	; 63
   1BCA 3F                   47 	.db #0x3f	; 63
   1BCB 3F                   48 	.db #0x3f	; 63
   1BCC 3F                   49 	.db #0x3f	; 63
   1BCD 3F                   50 	.db #0x3f	; 63
   1BCE 3F                   51 	.db #0x3f	; 63
   1BCF 3F                   52 	.db #0x3f	; 63
   1BD0 3F                   53 	.db #0x3f	; 63
   1BD1 3F                   54 	.db #0x3f	; 63
   1BD2 3F                   55 	.db #0x3f	; 63
   1BD3 3F                   56 	.db #0x3f	; 63
   1BD4 3F                   57 	.db #0x3f	; 63
   1BD5 3F                   58 	.db #0x3f	; 63
   1BD6 3F                   59 	.db #0x3f	; 63
   1BD7 6A                   60 	.db #0x6a	; 106	'j'
   1BD8 C0                   61 	.db #0xc0	; 192
   1BD9 C0                   62 	.db #0xc0	; 192
   1BDA C0                   63 	.db #0xc0	; 192
   1BDB 95                   64 	.db #0x95	; 149
   1BDC 3F                   65 	.db #0x3f	; 63
   1BDD 3F                   66 	.db #0x3f	; 63
   1BDE 3F                   67 	.db #0x3f	; 63
   1BDF 3F                   68 	.db #0x3f	; 63
   1BE0 3F                   69 	.db #0x3f	; 63
   1BE1 6A                   70 	.db #0x6a	; 106	'j'
   1BE2 C0                   71 	.db #0xc0	; 192
   1BE3 C0                   72 	.db #0xc0	; 192
   1BE4 FF                   73 	.db #0xff	; 255
   1BE5 C0                   74 	.db #0xc0	; 192
   1BE6 C0                   75 	.db #0xc0	; 192
   1BE7 95                   76 	.db #0x95	; 149
   1BE8 3F                   77 	.db #0x3f	; 63
   1BE9 3F                   78 	.db #0x3f	; 63
   1BEA 3F                   79 	.db #0x3f	; 63
   1BEB 3F                   80 	.db #0x3f	; 63
   1BEC C0                   81 	.db #0xc0	; 192
   1BED C0                   82 	.db #0xc0	; 192
   1BEE C0                   83 	.db #0xc0	; 192
   1BEF FF                   84 	.db #0xff	; 255
   1BF0 C0                   85 	.db #0xc0	; 192
   1BF1 C0                   86 	.db #0xc0	; 192
   1BF2 C0                   87 	.db #0xc0	; 192
   1BF3 3F                   88 	.db #0x3f	; 63
   1BF4 3F                   89 	.db #0x3f	; 63
   1BF5 3F                   90 	.db #0x3f	; 63
   1BF6 6A                   91 	.db #0x6a	; 106	'j'
   1BF7 C0                   92 	.db #0xc0	; 192
   1BF8 C0                   93 	.db #0xc0	; 192
   1BF9 D5                   94 	.db #0xd5	; 213
   1BFA C0                   95 	.db #0xc0	; 192
   1BFB EA                   96 	.db #0xea	; 234
   1BFC C0                   97 	.db #0xc0	; 192
   1BFD C0                   98 	.db #0xc0	; 192
   1BFE 95                   99 	.db #0x95	; 149
   1BFF 3F                  100 	.db #0x3f	; 63
   1C00 6A                  101 	.db #0x6a	; 106	'j'
   1C01 C0                  102 	.db #0xc0	; 192
   1C02 C0                  103 	.db #0xc0	; 192
   1C03 C0                  104 	.db #0xc0	; 192
   1C04 C0                  105 	.db #0xc0	; 192
   1C05 FF                  106 	.db #0xff	; 255
   1C06 C0                  107 	.db #0xc0	; 192
   1C07 C0                  108 	.db #0xc0	; 192
   1C08 C0                  109 	.db #0xc0	; 192
   1C09 C0                  110 	.db #0xc0	; 192
   1C0A 95                  111 	.db #0x95	; 149
   1C0B C0                  112 	.db #0xc0	; 192
   1C0C C0                  113 	.db #0xc0	; 192
   1C0D C0                  114 	.db #0xc0	; 192
   1C0E C0                  115 	.db #0xc0	; 192
   1C0F D5                  116 	.db #0xd5	; 213
   1C10 C0                  117 	.db #0xc0	; 192
   1C11 EA                  118 	.db #0xea	; 234
   1C12 C0                  119 	.db #0xc0	; 192
   1C13 C0                  120 	.db #0xc0	; 192
   1C14 C0                  121 	.db #0xc0	; 192
   1C15 C0                  122 	.db #0xc0	; 192
   1C16 C0                  123 	.db #0xc0	; 192
   1C17 C0                  124 	.db #0xc0	; 192
   1C18 C0                  125 	.db #0xc0	; 192
   1C19 C0                  126 	.db #0xc0	; 192
   1C1A C0                  127 	.db #0xc0	; 192
   1C1B C0                  128 	.db #0xc0	; 192
   1C1C C0                  129 	.db #0xc0	; 192
   1C1D C0                  130 	.db #0xc0	; 192
   1C1E C0                  131 	.db #0xc0	; 192
   1C1F C0                  132 	.db #0xc0	; 192
   1C20 C0                  133 	.db #0xc0	; 192
   1C21 C0                  134 	.db #0xc0	; 192
   1C22 C0                  135 	.db #0xc0	; 192
   1C23 C0                  136 	.db #0xc0	; 192
   1C24 C0                  137 	.db #0xc0	; 192
   1C25 C0                  138 	.db #0xc0	; 192
   1C26 C0                  139 	.db #0xc0	; 192
   1C27 C0                  140 	.db #0xc0	; 192
   1C28 C0                  141 	.db #0xc0	; 192
   1C29 C0                  142 	.db #0xc0	; 192
   1C2A C0                  143 	.db #0xc0	; 192
   1C2B C0                  144 	.db #0xc0	; 192
   1C2C 3F                  145 	.db #0x3f	; 63
   1C2D C1                  146 	.db #0xc1	; 193
   1C2E C3                  147 	.db #0xc3	; 195
   1C2F C3                  148 	.db #0xc3	; 195
   1C30 C3                  149 	.db #0xc3	; 195
   1C31 C0                  150 	.db #0xc0	; 192
   1C32 C3                  151 	.db #0xc3	; 195
   1C33 C3                  152 	.db #0xc3	; 195
   1C34 C3                  153 	.db #0xc3	; 195
   1C35 C2                  154 	.db #0xc2	; 194
   1C36 3F                  155 	.db #0x3f	; 63
   1C37 6A                  156 	.db #0x6a	; 106	'j'
   1C38 95                  157 	.db #0x95	; 149
   1C39 3F                  158 	.db #0x3f	; 63
   1C3A C0                  159 	.db #0xc0	; 192
   1C3B 3F                  160 	.db #0x3f	; 63
   1C3C 6B                  161 	.db #0x6b	; 107	'k'
   1C3D C0                  162 	.db #0xc0	; 192
   1C3E C0                  163 	.db #0xc0	; 192
   1C3F C0                  164 	.db #0xc0	; 192
   1C40 C0                  165 	.db #0xc0	; 192
   1C41 95                  166 	.db #0x95	; 149
   1C42 C1                  167 	.db #0xc1	; 193
   1C43 95                  168 	.db #0x95	; 149
   1C44 6A                  169 	.db #0x6a	; 106	'j'
   1C45 AE                  170 	.db #0xae	; 174
   1C46 95                  171 	.db #0x95	; 149
   1C47 3F                  172 	.db #0x3f	; 63
   1C48 C0                  173 	.db #0xc0	; 192
   1C49 C0                  174 	.db #0xc0	; 192
   1C4A C1                  175 	.db #0xc1	; 193
   1C4B C2                  176 	.db #0xc2	; 194
   1C4C C2                  177 	.db #0xc2	; 194
   1C4D C1                  178 	.db #0xc1	; 193
   1C4E 95                  179 	.db #0x95	; 149
   1C4F 3F                  180 	.db #0x3f	; 63
   1C50 CC                  181 	.db #0xcc	; 204
   1C51 95                  182 	.db #0x95	; 149
   1C52 3F                  183 	.db #0x3f	; 63
   1C53 6A                  184 	.db #0x6a	; 106	'j'
   1C54 C0                  185 	.db #0xc0	; 192
   1C55 95                  186 	.db #0x95	; 149
   1C56 C2                  187 	.db #0xc2	; 194
   1C57 C2                  188 	.db #0xc2	; 194
   1C58 95                  189 	.db #0x95	; 149
   1C59 C2                  190 	.db #0xc2	; 194
   1C5A 3F                  191 	.db #0x3f	; 63
   1C5B 3F                  192 	.db #0x3f	; 63
   1C5C 3F                  193 	.db #0x3f	; 63
   1C5D 3F                  194 	.db #0x3f	; 63
   1C5E 3F                  195 	.db #0x3f	; 63
   1C5F 3F                  196 	.db #0x3f	; 63
   1C60 3F                  197 	.db #0x3f	; 63
   1C61 C1                  198 	.db #0xc1	; 193
   1C62 6A                  199 	.db #0x6a	; 106	'j'
   1C63 6A                  200 	.db #0x6a	; 106	'j'
   1C64 C2                  201 	.db #0xc2	; 194
   1C65 3F                  202 	.db #0x3f	; 63
   1C66 3F                  203 	.db #0x3f	; 63
   1C67 3F                  204 	.db #0x3f	; 63
   1C68 C3                  205 	.db #0xc3	; 195
   1C69 3F                  206 	.db #0x3f	; 63
   1C6A 3F                  207 	.db #0x3f	; 63
   1C6B 3F                  208 	.db #0x3f	; 63
   1C6C C1                  209 	.db #0xc1	; 193
   1C6D 95                  210 	.db #0x95	; 149
   1C6E 3F                  211 	.db #0x3f	; 63
   1C6F C0                  212 	.db #0xc0	; 192
   1C70 3F                  213 	.db #0x3f	; 63
   1C71 3F                  214 	.db #0x3f	; 63
   1C72 3F                  215 	.db #0x3f	; 63
   1C73 3F                  216 	.db #0x3f	; 63
   1C74 3F                  217 	.db #0x3f	; 63
   1C75 3F                  218 	.db #0x3f	; 63
   1C76 3F                  219 	.db #0x3f	; 63
   1C77 C0                  220 	.db #0xc0	; 192
   1C78 3F                  221 	.db #0x3f	; 63
   1C79 3F                  222 	.db #0x3f	; 63
   1C7A 6A                  223 	.db #0x6a	; 106	'j'
   1C7B 95                  224 	.db #0x95	; 149
   1C7C 3F                  225 	.db #0x3f	; 63
   1C7D 6A                  226 	.db #0x6a	; 106	'j'
   1C7E C0                  227 	.db #0xc0	; 192
   1C7F 95                  228 	.db #0x95	; 149
   1C80 3F                  229 	.db #0x3f	; 63
   1C81 6A                  230 	.db #0x6a	; 106	'j'
   1C82 95                  231 	.db #0x95	; 149
   1C83 3F                  232 	.db #0x3f	; 63
   1C84 3F                  233 	.db #0x3f	; 63
   1C85 6A                  234 	.db #0x6a	; 106	'j'
   1C86 95                  235 	.db #0x95	; 149
   1C87 3F                  236 	.db #0x3f	; 63
   1C88 95                  237 	.db #0x95	; 149
   1C89 3F                  238 	.db #0x3f	; 63
   1C8A 6A                  239 	.db #0x6a	; 106	'j'
   1C8B 3F                  240 	.db #0x3f	; 63
   1C8C 6A                  241 	.db #0x6a	; 106	'j'
   1C8D 95                  242 	.db #0x95	; 149
   1C8E 3F                  243 	.db #0x3f	; 63
   1C8F 3F                  244 	.db #0x3f	; 63
   1C90 6A                  245 	.db #0x6a	; 106	'j'
   1C91 C0                  246 	.db #0xc0	; 192
   1C92 95                  247 	.db #0x95	; 149
   1C93 3F                  248 	.db #0x3f	; 63
   1C94 3F                  249 	.db #0x3f	; 63
   1C95 3F                  250 	.db #0x3f	; 63
   1C96 6A                  251 	.db #0x6a	; 106	'j'
   1C97 C0                  252 	.db #0xc0	; 192
   1C98 95                  253 	.db #0x95	; 149
   1C99 3F                  254 	.db #0x3f	; 63
   1C9A 3F                  255 	.db #0x3f	; 63
   1C9B 6A                  256 	.db #0x6a	; 106	'j'
   1C9C C0                  257 	.db #0xc0	; 192
   1C9D C0                  258 	.db #0xc0	; 192
   1C9E C0                  259 	.db #0xc0	; 192
   1C9F C0                  260 	.db #0xc0	; 192
   1CA0 C0                  261 	.db #0xc0	; 192
   1CA1 C0                  262 	.db #0xc0	; 192
   1CA2 C0                  263 	.db #0xc0	; 192
   1CA3 95                  264 	.db #0x95	; 149
   1CA4 3F                  265 	.db #0x3f	; 63
   1CA5 3F                  266 	.db #0x3f	; 63
   1CA6 3F                  267 	.db #0x3f	; 63
   1CA7 C0                  268 	.db #0xc0	; 192
   1CA8 C0                  269 	.db #0xc0	; 192
   1CA9 C0                  270 	.db #0xc0	; 192
   1CAA C0                  271 	.db #0xc0	; 192
   1CAB C0                  272 	.db #0xc0	; 192
   1CAC C0                  273 	.db #0xc0	; 192
   1CAD C0                  274 	.db #0xc0	; 192
   1CAE 3F                  275 	.db #0x3f	; 63
   1CAF 3F                  276 	.db #0x3f	; 63
   1CB0 3F                  277 	.db #0x3f	; 63
   1CB1 3F                  278 	.db #0x3f	; 63
   1CB2 6A                  279 	.db #0x6a	; 106	'j'
   1CB3 C0                  280 	.db #0xc0	; 192
   1CB4 C0                  281 	.db #0xc0	; 192
   1CB5 C0                  282 	.db #0xc0	; 192
   1CB6 C0                  283 	.db #0xc0	; 192
   1CB7 C0                  284 	.db #0xc0	; 192
   1CB8 95                  285 	.db #0x95	; 149
   1CB9 3F                  286 	.db #0x3f	; 63
   1CBA 3F                  287 	.db #0x3f	; 63
   1CBB                     288 _lifes_1:
   1CBB 3F                  289 	.db #0x3f	; 63
   1CBC 3F                  290 	.db #0x3f	; 63
   1CBD 3F                  291 	.db #0x3f	; 63
   1CBE 3F                  292 	.db #0x3f	; 63
   1CBF 3F                  293 	.db #0x3f	; 63
   1CC0 3F                  294 	.db #0x3f	; 63
   1CC1 3F                  295 	.db #0x3f	; 63
   1CC2 3F                  296 	.db #0x3f	; 63
   1CC3 3F                  297 	.db #0x3f	; 63
   1CC4 3F                  298 	.db #0x3f	; 63
   1CC5 3F                  299 	.db #0x3f	; 63
   1CC6 3F                  300 	.db #0x3f	; 63
   1CC7 3F                  301 	.db #0x3f	; 63
   1CC8 3F                  302 	.db #0x3f	; 63
   1CC9 6A                  303 	.db #0x6a	; 106	'j'
   1CCA C0                  304 	.db #0xc0	; 192
   1CCB C0                  305 	.db #0xc0	; 192
   1CCC C0                  306 	.db #0xc0	; 192
   1CCD 95                  307 	.db #0x95	; 149
   1CCE 3F                  308 	.db #0x3f	; 63
   1CCF 3F                  309 	.db #0x3f	; 63
   1CD0 3F                  310 	.db #0x3f	; 63
   1CD1 3F                  311 	.db #0x3f	; 63
   1CD2 3F                  312 	.db #0x3f	; 63
   1CD3 6A                  313 	.db #0x6a	; 106	'j'
   1CD4 C0                  314 	.db #0xc0	; 192
   1CD5 C0                  315 	.db #0xc0	; 192
   1CD6 FF                  316 	.db #0xff	; 255
   1CD7 C0                  317 	.db #0xc0	; 192
   1CD8 C0                  318 	.db #0xc0	; 192
   1CD9 95                  319 	.db #0x95	; 149
   1CDA 3F                  320 	.db #0x3f	; 63
   1CDB 3F                  321 	.db #0x3f	; 63
   1CDC 3F                  322 	.db #0x3f	; 63
   1CDD 3F                  323 	.db #0x3f	; 63
   1CDE C0                  324 	.db #0xc0	; 192
   1CDF C0                  325 	.db #0xc0	; 192
   1CE0 C0                  326 	.db #0xc0	; 192
   1CE1 FF                  327 	.db #0xff	; 255
   1CE2 C0                  328 	.db #0xc0	; 192
   1CE3 C0                  329 	.db #0xc0	; 192
   1CE4 C0                  330 	.db #0xc0	; 192
   1CE5 3F                  331 	.db #0x3f	; 63
   1CE6 3F                  332 	.db #0x3f	; 63
   1CE7 3F                  333 	.db #0x3f	; 63
   1CE8 6A                  334 	.db #0x6a	; 106	'j'
   1CE9 C0                  335 	.db #0xc0	; 192
   1CEA C0                  336 	.db #0xc0	; 192
   1CEB D5                  337 	.db #0xd5	; 213
   1CEC C0                  338 	.db #0xc0	; 192
   1CED EA                  339 	.db #0xea	; 234
   1CEE C0                  340 	.db #0xc0	; 192
   1CEF C0                  341 	.db #0xc0	; 192
   1CF0 95                  342 	.db #0x95	; 149
   1CF1 3F                  343 	.db #0x3f	; 63
   1CF2 6A                  344 	.db #0x6a	; 106	'j'
   1CF3 C0                  345 	.db #0xc0	; 192
   1CF4 C0                  346 	.db #0xc0	; 192
   1CF5 C0                  347 	.db #0xc0	; 192
   1CF6 C0                  348 	.db #0xc0	; 192
   1CF7 FF                  349 	.db #0xff	; 255
   1CF8 C0                  350 	.db #0xc0	; 192
   1CF9 C0                  351 	.db #0xc0	; 192
   1CFA C0                  352 	.db #0xc0	; 192
   1CFB C0                  353 	.db #0xc0	; 192
   1CFC 95                  354 	.db #0x95	; 149
   1CFD C0                  355 	.db #0xc0	; 192
   1CFE C0                  356 	.db #0xc0	; 192
   1CFF C0                  357 	.db #0xc0	; 192
   1D00 C0                  358 	.db #0xc0	; 192
   1D01 D5                  359 	.db #0xd5	; 213
   1D02 C0                  360 	.db #0xc0	; 192
   1D03 EA                  361 	.db #0xea	; 234
   1D04 C0                  362 	.db #0xc0	; 192
   1D05 C0                  363 	.db #0xc0	; 192
   1D06 C0                  364 	.db #0xc0	; 192
   1D07 C0                  365 	.db #0xc0	; 192
   1D08 C0                  366 	.db #0xc0	; 192
   1D09 C0                  367 	.db #0xc0	; 192
   1D0A C0                  368 	.db #0xc0	; 192
   1D0B C0                  369 	.db #0xc0	; 192
   1D0C C0                  370 	.db #0xc0	; 192
   1D0D C0                  371 	.db #0xc0	; 192
   1D0E C0                  372 	.db #0xc0	; 192
   1D0F C0                  373 	.db #0xc0	; 192
   1D10 C0                  374 	.db #0xc0	; 192
   1D11 C0                  375 	.db #0xc0	; 192
   1D12 C0                  376 	.db #0xc0	; 192
   1D13 C0                  377 	.db #0xc0	; 192
   1D14 C0                  378 	.db #0xc0	; 192
   1D15 C0                  379 	.db #0xc0	; 192
   1D16 C0                  380 	.db #0xc0	; 192
   1D17 C0                  381 	.db #0xc0	; 192
   1D18 C0                  382 	.db #0xc0	; 192
   1D19 C0                  383 	.db #0xc0	; 192
   1D1A C0                  384 	.db #0xc0	; 192
   1D1B C0                  385 	.db #0xc0	; 192
   1D1C C0                  386 	.db #0xc0	; 192
   1D1D C0                  387 	.db #0xc0	; 192
   1D1E 3F                  388 	.db #0x3f	; 63
   1D1F 81                  389 	.db #0x81	; 129
   1D20 03                  390 	.db #0x03	; 3
   1D21 03                  391 	.db #0x03	; 3
   1D22 03                  392 	.db #0x03	; 3
   1D23 C0                  393 	.db #0xc0	; 192
   1D24 03                  394 	.db #0x03	; 3
   1D25 03                  395 	.db #0x03	; 3
   1D26 03                  396 	.db #0x03	; 3
   1D27 42                  397 	.db #0x42	; 66	'B'
   1D28 3F                  398 	.db #0x3f	; 63
   1D29 3F                  399 	.db #0x3f	; 63
   1D2A D5                  400 	.db #0xd5	; 213
   1D2B FF                  401 	.db #0xff	; 255
   1D2C C0                  402 	.db #0xc0	; 192
   1D2D D5                  403 	.db #0xd5	; 213
   1D2E AB                  404 	.db #0xab	; 171
   1D2F C0                  405 	.db #0xc0	; 192
   1D30 C0                  406 	.db #0xc0	; 192
   1D31 C0                  407 	.db #0xc0	; 192
   1D32 C0                  408 	.db #0xc0	; 192
   1D33 3F                  409 	.db #0x3f	; 63
   1D34 3F                  410 	.db #0x3f	; 63
   1D35 D5                  411 	.db #0xd5	; 213
   1D36 FF                  412 	.db #0xff	; 255
   1D37 C0                  413 	.db #0xc0	; 192
   1D38 D5                  414 	.db #0xd5	; 213
   1D39 FF                  415 	.db #0xff	; 255
   1D3A C0                  416 	.db #0xc0	; 192
   1D3B C0                  417 	.db #0xc0	; 192
   1D3C 81                  418 	.db #0x81	; 129
   1D3D 42                  419 	.db #0x42	; 66	'B'
   1D3E 3F                  420 	.db #0x3f	; 63
   1D3F 3F                  421 	.db #0x3f	; 63
   1D40 D5                  422 	.db #0xd5	; 213
   1D41 FF                  423 	.db #0xff	; 255
   1D42 C0                  424 	.db #0xc0	; 192
   1D43 D5                  425 	.db #0xd5	; 213
   1D44 FF                  426 	.db #0xff	; 255
   1D45 EA                  427 	.db #0xea	; 234
   1D46 C0                  428 	.db #0xc0	; 192
   1D47 D5                  429 	.db #0xd5	; 213
   1D48 42                  430 	.db #0x42	; 66	'B'
   1D49 3F                  431 	.db #0x3f	; 63
   1D4A 3F                  432 	.db #0x3f	; 63
   1D4B 6A                  433 	.db #0x6a	; 106	'j'
   1D4C D5                  434 	.db #0xd5	; 213
   1D4D FF                  435 	.db #0xff	; 255
   1D4E FF                  436 	.db #0xff	; 255
   1D4F C0                  437 	.db #0xc0	; 192
   1D50 FF                  438 	.db #0xff	; 255
   1D51 FF                  439 	.db #0xff	; 255
   1D52 EA                  440 	.db #0xea	; 234
   1D53 95                  441 	.db #0x95	; 149
   1D54 3F                  442 	.db #0x3f	; 63
   1D55 3F                  443 	.db #0x3f	; 63
   1D56 3F                  444 	.db #0x3f	; 63
   1D57 6A                  445 	.db #0x6a	; 106	'j'
   1D58 FF                  446 	.db #0xff	; 255
   1D59 FF                  447 	.db #0xff	; 255
   1D5A FF                  448 	.db #0xff	; 255
   1D5B FF                  449 	.db #0xff	; 255
   1D5C FF                  450 	.db #0xff	; 255
   1D5D 95                  451 	.db #0x95	; 149
   1D5E 3F                  452 	.db #0x3f	; 63
   1D5F 3F                  453 	.db #0x3f	; 63
   1D60 3F                  454 	.db #0x3f	; 63
   1D61 3F                  455 	.db #0x3f	; 63
   1D62 6A                  456 	.db #0x6a	; 106	'j'
   1D63 57                  457 	.db #0x57	; 87	'W'
   1D64 FF                  458 	.db #0xff	; 255
   1D65 FF                  459 	.db #0xff	; 255
   1D66 FF                  460 	.db #0xff	; 255
   1D67 AB                  461 	.db #0xab	; 171
   1D68 95                  462 	.db #0x95	; 149
   1D69 3F                  463 	.db #0x3f	; 63
   1D6A 3F                  464 	.db #0x3f	; 63
   1D6B 3F                  465 	.db #0x3f	; 63
   1D6C 3F                  466 	.db #0x3f	; 63
   1D6D 3F                  467 	.db #0x3f	; 63
   1D6E D5                  468 	.db #0xd5	; 213
   1D6F FF                  469 	.db #0xff	; 255
   1D70 FF                  470 	.db #0xff	; 255
   1D71 FF                  471 	.db #0xff	; 255
   1D72 EA                  472 	.db #0xea	; 234
   1D73 3F                  473 	.db #0x3f	; 63
   1D74 3F                  474 	.db #0x3f	; 63
   1D75 3F                  475 	.db #0x3f	; 63
   1D76 3F                  476 	.db #0x3f	; 63
   1D77 3F                  477 	.db #0x3f	; 63
   1D78 3F                  478 	.db #0x3f	; 63
   1D79 81                  479 	.db #0x81	; 129
   1D7A EA                  480 	.db #0xea	; 234
   1D7B FF                  481 	.db #0xff	; 255
   1D7C D5                  482 	.db #0xd5	; 213
   1D7D 42                  483 	.db #0x42	; 66	'B'
   1D7E 3F                  484 	.db #0x3f	; 63
   1D7F 3F                  485 	.db #0x3f	; 63
   1D80 3F                  486 	.db #0x3f	; 63
   1D81 3F                  487 	.db #0x3f	; 63
   1D82 3F                  488 	.db #0x3f	; 63
   1D83 3F                  489 	.db #0x3f	; 63
   1D84 81                  490 	.db #0x81	; 129
   1D85 EA                  491 	.db #0xea	; 234
   1D86 FF                  492 	.db #0xff	; 255
   1D87 D5                  493 	.db #0xd5	; 213
   1D88 42                  494 	.db #0x42	; 66	'B'
   1D89 3F                  495 	.db #0x3f	; 63
   1D8A 3F                  496 	.db #0x3f	; 63
   1D8B 3F                  497 	.db #0x3f	; 63
   1D8C 3F                  498 	.db #0x3f	; 63
   1D8D 3F                  499 	.db #0x3f	; 63
   1D8E 3F                  500 	.db #0x3f	; 63
   1D8F 6A                  501 	.db #0x6a	; 106	'j'
   1D90 C0                  502 	.db #0xc0	; 192
   1D91 C0                  503 	.db #0xc0	; 192
   1D92 C0                  504 	.db #0xc0	; 192
   1D93 95                  505 	.db #0x95	; 149
   1D94 3F                  506 	.db #0x3f	; 63
   1D95 3F                  507 	.db #0x3f	; 63
   1D96 3F                  508 	.db #0x3f	; 63
   1D97 3F                  509 	.db #0x3f	; 63
   1D98 3F                  510 	.db #0x3f	; 63
   1D99 3F                  511 	.db #0x3f	; 63
   1D9A 3F                  512 	.db #0x3f	; 63
   1D9B 3F                  513 	.db #0x3f	; 63
   1D9C 3F                  514 	.db #0x3f	; 63
   1D9D 3F                  515 	.db #0x3f	; 63
   1D9E 3F                  516 	.db #0x3f	; 63
   1D9F 3F                  517 	.db #0x3f	; 63
   1DA0 3F                  518 	.db #0x3f	; 63
   1DA1 3F                  519 	.db #0x3f	; 63
   1DA2 3F                  520 	.db #0x3f	; 63
   1DA3 3F                  521 	.db #0x3f	; 63
   1DA4 3F                  522 	.db #0x3f	; 63
   1DA5 3F                  523 	.db #0x3f	; 63
   1DA6 3F                  524 	.db #0x3f	; 63
   1DA7 3F                  525 	.db #0x3f	; 63
   1DA8 3F                  526 	.db #0x3f	; 63
   1DA9 3F                  527 	.db #0x3f	; 63
   1DAA 3F                  528 	.db #0x3f	; 63
   1DAB 3F                  529 	.db #0x3f	; 63
   1DAC 3F                  530 	.db #0x3f	; 63
                            531 	.area _INITIALIZER
                            532 	.area _CABS (ABS)
