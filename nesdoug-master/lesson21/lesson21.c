/*	simple Hello World, for cc65, for NES
 *  writing to the screen with rendering disabled
 *	using neslib
 *	Doug Fraker 2017
 */	


#include "neslib.h"
#include "lesson21.h"


const unsigned char TEXT[]={
"Hello World!"}; // 12 chars

const unsigned char PALETTE[]={
0x0f, 0x00, 0x10, 0x30, //	black, gray, lt gray, white
0,0,0,0,
0,0,0,0,
0,0,0,0
}; 
// there's some oddities in the palette code, black must be 0x0f, white must be 0x30


	

void main (void) {
	
	// rendering is disabled at the startup
	
	// the init code set the palette brightness to
	// pal_bright(4); // normal
	
	//	load the palette
	pal_bg(PALETTE);
		
	// load the text
	// vram_adr(NTADR_A(x,y));
	vram_adr(NTADR_A(10,14)); // screen is 32 x 30 tiles
	// this sets a start position on the BG, where to draw the text, left to right
	
	vram_write((unsigned char*)TEXT,sizeof(TEXT));
	// this draws the array to the screen	
	// this function only works with rendering off, and should come after vram_adr()
	
	//	normally, I would reset the scroll position
	//  but the next function waits till v-blank and scroll is set automatically in the nmi routine
	//  since the RAM was blanked to 0 in init code, scroll will be x = 0, y = 0
	
	//	turn on screen
	ppu_on_all();
	
	//	infinite loop
	while (1){
		
		// game code will go here.
		
	}
};
	
	