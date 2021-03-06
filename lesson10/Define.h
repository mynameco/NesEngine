// let's define some stuff
#ifndef __DEFINE_H__
#define __DEFINE_H__

#ifndef __fastcall__
#define __fastcall__
#endif

typedef unsigned char byte;

#define PPU_CTRL *((byte*)0x2000)
#define PPU_MASK *((byte*)0x2001)
#define PPU_STATUS *((byte*)0x2002)
#define OAM_ADDRESS *((byte*)0x2003)
#define SCROLL *((byte*)0x2005)
#define PPU_ADDRESS *((byte*)0x2006)
#define PPU_DATA *((byte*)0x2007)
#define OAM_DMA *((byte*)0x4014)

#define RIGHT 0x01
#define LEFT 0x02
#define DOWN 0x04
#define UP 0x08
#define START 0x10
#define SELECT 0x20
#define B_BUTTON 0x40
#define A_BUTTON 0x80

#define SPRITE_FLIP_V 0x80
#define SPRITE_FLIP_H 0x40
#define SPRITE_PRIORITY 0x20
#define SPRITE_EOF 0xFF

/*struct Tile
{
};

struct Metatile
{
	byte count;
	Tile tiles[];
};*/

// Globals
// our startup code initialized all values to zero
#pragma bss-name(push, "ZEROPAGE")
byte NMI_flag;
byte Frame_Count;
byte index;
byte index4;
byte X1;
byte Y1;
byte state;
byte state4;
byte joypad1;
byte joypad1old;
byte joypad1test;
byte joypad2;
byte joypad2old;
byte joypad2test;
byte Horiz_scroll;
byte Horiz_scroll_Old;
unsigned int Scroll_Adjusted_X;
// got rid of Vert_scroll, now always 0
byte Nametable;
byte NametableB;
byte walk_count; // changes the animation
signed char X_speed; // signed char = -128 to 127
signed char Y_speed; // signed char = -128 to 127
byte direction; // 0 = R, 1 = L
byte collision_Index;
byte high_byte;
byte collision;
byte temp;

#define MAX_WALK_COUNT 31

#pragma bss-name(push, "OAM")
byte Sprites[256];
// OAM equals ram addresses 200-2ff

#pragma bss-name(push, "MAP")
byte map1[256];
byte map2[256];
// MAP equals ram addresses 300-4ff, collision map, metatiles

#include "BG/N1.h"
#include "BG/N2.h"
#include "BG/N1.csv"
#include "BG/N2.csv"

// collision maps called C1 and C2
// now their value is 0-11, which will index to this array...

// which metatiles act like platforms
const byte Platform[] =
{
	0, 1, 1, 1, 1, 1,
	0, 0, 0, 0, 0, 0, 0
};

const byte Palette[] =
{
	0x22, 0x16, 0x36, 0x0f,  0, 8, 0x18, 0x39,  0, 0, 0x10, 0x20,  0, 0x0a, 0x1a, 0x2a,
	0x22, 0x37, 0x16, 0x0f,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 5, 0x15
};

// just a way to reuse the #0 state tiles
const byte Walk_Moves[] = { 0, 1, 0, 2 };

// relative y coordinates
const byte MetaSprite_Y[] = { 0, 0, 8, 8 };
// relative x coordinates
const byte MetaSprite_X[] = { 0, 8, 0, 8 };

// tile numbers, right
const byte MetaSprite_Tile_R[] =
{
	0, 1, 0x10, 0x11, // walk 0, 2
	2, 3, 0x12, 0x13, // walk 1
	4, 5, 0x14, 0x15, // walk 3
	6, 7, 0x16, 0x17 // jump
};

// tile numbers, left
const byte MetaSprite_Tile_L[] =
{
	1, 0, 0x11, 0x10, // walk 0, 2
	3, 2, 0x13, 0x12, // walk 1
	5, 4, 0x15, 0x14, // walk 3
	7, 6, 0x17, 0x16 // jump
};

// attributes = not flipped
const byte MetaSprite_Attrib_R[] = { 0, 0, 0, 0 };
//attributes = H flipped
const byte MetaSprite_Attrib_L[] = { SPRITE_FLIP_H, SPRITE_FLIP_H, SPRITE_FLIP_H, SPRITE_FLIP_H };

// Prototypes
void AllOff(void);
void AllOn(void);
void ResetScroll(void);
void LoadPalette(void);
void UpdateSprites(void);
void CollisionDown(void);
void MoveLogic(void);
void ComputeAnimation(void);
void DrawBackground(void);

void __fastcall__ memcpy(void* dest, const void* src, int count);
void Wait_Vblank(void);
void __fastcall__ UnRLE(const byte *data);
void Get_Input(void);

#endif
