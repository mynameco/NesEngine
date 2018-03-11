/*	example code for cc65, for NES
 *  Controllers, and Sprite Collisions
 *	using neslib
 *	Doug Fraker 2017
 */	


#include "neslib.h"
#include "lesson25.h"
#include "Sprites.c"





const unsigned char TEXT[]={
"Sprite Collision"};

const unsigned char PALETTE_BG[]={
0x00, 0x00, 0x10, 0x30, //	gray, gray, lt gray, white
0,0,0,0,
0,0,0,0,
0,0,0,0
}; 
const unsigned char PALETTE_SP[]={
0x0f, 0x0f, 0x0f, 0x28, //	black, black, yellow
0x0f, 0x0f, 0x0f, 0x12, // black, black, blue
0,0,0,0,
0,0,0,0
}; 


	

void main (void) {
	
	// rendering is disabled at the startup
	
	// the init code set the palette brightness to
	// pal_bright(4); // normal
	
	//	load the palette
	pal_bg(PALETTE_BG);
	pal_spr(PALETTE_SP);
	
	
	// use the second set of tiles for sprites
	bank_spr(1);
	
		
	// load the text
	// vram_adr(NTADR_A(x,y));
	vram_adr(NTADR_A(7,14)); // screen is 32 x 30 tiles
	// this sets a start position on the BG, where to draw the text, left to right
	
	vram_write((unsigned char*)TEXT,sizeof(TEXT));
	// this draws the array to the screen	
	// this function only works with rendering off, and should come after vram_adr()
	
	//	normally, I would reset the scroll position
	//  but the next function waits till v-blank and scroll is set automatically in the nmi routine
	//  since the RAM was blanked to 0 in init code, scroll will be x = 0, y = 0
	
	//	turn on screen
	ppu_on_all();
	
	
	
	
	// set some initial values
	BoxGuy1.X = 16;
	BoxGuy1.Y = 16;
	BoxGuy2.X = 48;
	BoxGuy2.Y = 16;
	BoxGuy1.width = 16;
	BoxGuy1.height = 16;
	BoxGuy2.width = 16;
	BoxGuy2.height = 16;
	
	
	//	infinite loop
	while (1){
		// wait till beginning of the frame
		ppu_wait_nmi();
		
		pad_poll(0); // read controller 1
		pad_poll(1); // read controller 2
		// originally, with neslib, you had to do something like, pad=pad_poll(i);
		// I changed it, so you don't have to waste a RAM address for pad
		// you can access PAD_STATE, PAD_STATE2, PAD_STATET, and PAD_STATET2 directly
		
		// clear all sprites from buffer
		oam_clear();
		
		// reset index into the buffer
		sprid = 0;
		
		// push 2 metasprites
		// oam_meta_spr(unsigned char x,unsigned char y,unsigned char sprid,const unsigned char *data);
		sprid = oam_meta_spr(BoxGuy1.X, BoxGuy1.Y, sprid, Yellow);
		
		sprid = oam_meta_spr(BoxGuy2.X, BoxGuy2.Y, sprid, Blue);
		
		
		// move the guys
		if(PAD_STATE & PAD_LEFT){
			BoxGuy1.X -= 1;
		}
		else if (PAD_STATE & PAD_RIGHT){
			BoxGuy1.X += 1;
		}
		if(PAD_STATE & PAD_UP){
			BoxGuy1.Y -= 1;
		}
		else if (PAD_STATE & PAD_DOWN){
			BoxGuy1.Y += 1;
		}
		
		if(PAD_STATE2 & PAD_LEFT){
			BoxGuy2.X -= 1;
		}
		else if (PAD_STATE2 & PAD_RIGHT){
			BoxGuy2.X += 1;
		}
		if(PAD_STATE2 & PAD_UP){
			BoxGuy2.Y -= 1;
		}
		else if (PAD_STATE2 & PAD_DOWN){
			BoxGuy2.Y += 1;
		}
		
		


		collision = CheckCollision(&BoxGuy1, &BoxGuy2);
		
		// change the BG color, if sprites are touching
		if (collision){
			pal_col(0,0x30); 
		}
		else{
			pal_col(0,0x00);
		}
	}
};
	
	