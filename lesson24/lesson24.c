/*	example code for cc65, for NES
 *  3 sprite objects
 *	using neslib
 *	Doug Fraker 2017
 */

#include "neslib.h"
#include "lesson24.h"
#include "Sprites.c"

const unsigned char Test[] =
{
	"Sprites"
};

const unsigned char PaletteBackgroud[] =
{
	0x0f, 0x00, 0x10, 0x30,
	0,0,0,0,
	0,0,0,0,
	0,0,0,0
};

const unsigned char PaletteSprites[] =
{
	0x0f, 0x00, 0x10, 0x30,
	0,0,0,0,
	0,0,0,0,
	0,0,0,0
};

unsigned char sprite_index = 0;
unsigned char sprite_delay = 0;
unsigned char sprite_delay_count = 0;
const unsigned char* metasprite = 0;
const unsigned char* const* metasprite_list = 0;
const unsigned char* metasprite_delay_list = 0;

void main(void)
{
	// rendering is disabled at the startup

	// the init code set the palette brightness to
	// pal_bright(4); // normal

	//	load the palette
	pal_bg(PaletteBackgroud);
	pal_spr(PaletteSprites);


	// use the second set of tiles for sprites
	bank_spr(1);


	// load the text
	// vram_adr(NTADR_A(x,y));
	vram_adr(NTADR_A(7, 14)); // screen is 32 x 30 tiles
	// this sets a start position on the BG, where to draw the text, left to right

	vram_write((unsigned char*)Test, sizeof(Test));
	// this draws the array to the screen	
	// this function only works with rendering off, and should come after vram_adr()

	//	normally, I would reset the scroll position
	//  but the next function waits till v-blank and scroll is set automatically in the nmi routine
	//  since the RAM was blanked to 0 in init code, scroll will be x = 0, y = 0

	//	turn on screen
	ppu_on_all();

	// set some initial values
	Y_position = 0x80;
	X_position = 0x88;
	X_position2 = 0xa0;
	X_position3 = 0xc0;

	sprite_index = 0;
	sprite_delay = 0;
	metasprite_list = metasprite_list1;
	metasprite_delay_list = metasprite_delay_list1;
	metasprite = metasprite_list[sprite_index];
	sprite_delay_count = metasprite_delay_list[sprite_index];

	//	infinite loop
	while (1)
	{
		// wait till beginning of the frame
		ppu_wait_nmi();

		pad_poll(0); // read controller 1
		pad_poll(1); // read controller 2

		// clear all sprites from buffer
		oam_clear();

		// reset index into the buffer
		sprid = 0;

		sprite_delay++;
		if (sprite_delay > sprite_delay_count)
		{
			sprite_delay = 0;
			sprite_index++;

			metasprite = metasprite_list[sprite_index];
			sprite_delay_count = metasprite_delay_list[sprite_index];

			if (metasprite == 0)
			{
				sprite_index = 0;
				metasprite = metasprite_list[sprite_index];
				sprite_delay_count = metasprite_delay_list[sprite_index];
			}
		}

		sprid = oam_meta_spr(X_position2, Y_position, sprid, metasprite);

		if ((PAD_STATET & PAD_UP) != 0)
		{
			sprite_index = 0;
			sprite_delay = 0;
			metasprite_list = metasprite_list1;
			metasprite_delay_list = metasprite_delay_list1;
			metasprite = metasprite_list[sprite_index];
			sprite_delay_count = metasprite_delay_list[sprite_index];
		}
		else if ((PAD_STATET & PAD_DOWN) != 0)
		{
			sprite_index = 0;
			sprite_delay = 0;
			metasprite_list = metasprite_list2;
			metasprite_delay_list = metasprite_delay_list2;
			metasprite = metasprite_list[sprite_index];
			sprite_delay_count = metasprite_delay_list[sprite_index];
		}

		//Y_position++;
	}
};

