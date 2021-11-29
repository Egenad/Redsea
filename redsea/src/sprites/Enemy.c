#include "Enemy.h"
// Data created with Img2CPC - (c) Retroworks - 2007-2017
// Tile enemy_sc_sp: 22x22 pixels, 11x22 bytes.
const u8 enemy_sc_sp[11 * 22] = {
	0xb5, 0x3f, 0x3f, 0x3f, 0x2a, 0x00, 0x00, 0x15, 0x3f, 0x3f, 0x3f,
	0x2a, 0xf0, 0x3f, 0x2a, 0x50, 0xf0, 0xf0, 0xa0, 0x15, 0x3f, 0x3f,
	0x2a, 0x50, 0x3f, 0x50, 0xf0, 0xf0, 0xf0, 0xf0, 0xa0, 0x3f, 0x3f,
	0x3f, 0x2a, 0x00, 0xf0, 0xf0, 0xff, 0xff, 0xf0, 0xf0, 0x00, 0x3f,
	0xf0, 0x00, 0xf0, 0xf0, 0xf0, 0xff, 0xff, 0xf0, 0xf0, 0xf0, 0x15,
	0x00, 0x2a, 0xf0, 0xf0, 0xf0, 0xff, 0xff, 0xf0, 0xf0, 0xf0, 0x15,
	0x15, 0x2a, 0xf0, 0xf0, 0xf5, 0xf5, 0xfa, 0xfa, 0xf0, 0xf0, 0x15,
	0x3f, 0x2a, 0xf0, 0xf0, 0xf0, 0xfa, 0xf5, 0xf0, 0xf0, 0xf0, 0x15,
	0x3f, 0x2a, 0xf0, 0xf0, 0xf5, 0xf0, 0xf0, 0xfa, 0xf0, 0xf0, 0x15,
	0x3f, 0x2a, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0x15,
	0x3f, 0x2a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15,
	0x3f, 0x6a, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x95,
	0x3f, 0x6a, 0x57, 0xea, 0xd5, 0xff, 0xff, 0xea, 0xd5, 0xab, 0x95,
	0x3f, 0x6a, 0xff, 0xea, 0xc0, 0xff, 0xff, 0xc0, 0xd5, 0xff, 0x95,
	0x3f, 0x6a, 0xff, 0xff, 0xc0, 0xff, 0xff, 0xc0, 0xff, 0xff, 0x95,
	0x3f, 0x3f, 0xc0, 0xff, 0xff, 0xea, 0xd5, 0xff, 0xff, 0xc0, 0x3f,
	0x3f, 0x3f, 0x3f, 0xd5, 0xff, 0xff, 0xff, 0xff, 0xea, 0x3f, 0x3f,
	0x3f, 0x3f, 0x3f, 0x81, 0xff, 0xff, 0xff, 0xff, 0x42, 0x3f, 0x3f,
	0x3f, 0x3f, 0x3f, 0x6a, 0xff, 0xd5, 0xea, 0xff, 0x95, 0x3f, 0x3f,
	0x3f, 0x3f, 0x3f, 0x6a, 0x57, 0xd5, 0xea, 0xab, 0x95, 0x3f, 0x3f,
	0x3f, 0x3f, 0x3f, 0x6a, 0x57, 0xd5, 0xea, 0xab, 0x95, 0x3f, 0x3f,
	0x3f, 0x3f, 0x3f, 0x3f, 0xc0, 0xc0, 0xc0, 0xc0, 0x3f, 0x3f, 0x3f
};
