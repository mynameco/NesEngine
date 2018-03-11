/*	example code for cc65, for NES
 *   16 room, omnidirectional scrolling, with BG collisions
 *	using neslib
 *	Doug Fraker 2017
 */	


#include "neslib.h"
#include "lesson28.h"
#include "Sprites.c"



#include "BGDATA/00.h"
#include "BGDATA/01.h"
#include "BGDATA/02.h"
#include "BGDATA/03.h"
#include "BGDATA/04.h"
#include "BGDATA/05.h"
#include "BGDATA/06.h"
#include "BGDATA/07.h"

#include "BGDATA/08.h"
#include "BGDATA/09.h"
#include "BGDATA/10.h"
#include "BGDATA/11.h"
#include "BGDATA/12.h"
#include "BGDATA/13.h"
#include "BGDATA/14.h"
#include "BGDATA/15.h"

#include "BGDATA/16.h"
#include "BGDATA/17.h"
#include "BGDATA/18.h"
#include "BGDATA/19.h"
#include "BGDATA/20.h"
#include "BGDATA/21.h"
#include "BGDATA/22.h"
#include "BGDATA/23.h"

#include "BGDATA/24.h"
#include "BGDATA/25.h"
#include "BGDATA/26.h"
#include "BGDATA/27.h"
#include "BGDATA/28.h"
#include "BGDATA/29.h"
#include "BGDATA/30.h"
#include "BGDATA/31.h"

#include "BGDATA/32.h"
#include "BGDATA/40.h"
#include "BGDATA/48.h"
#include "BGDATA/56.h"
#include "BGDATA/BGX.h"

#include "BGDATA/DB1.h"
#include "BGDATA/DB2.h"

const unsigned char * const BG_TABLE[] = {
BG00, BG01, BG02, BG03, BG04, BG05, BG06, BG07,
BG08, BG09, BG10, BG11, BG12, BG13, BG14, BG15,

BG16, BG17, BG18, BG19, BG20, BG21, BG22, BG23,
BG24, BG25, BG26, BG27, BG28, BG29, BG30, BG31,

BG32, DB1, BGX, BGX, BGX, BGX, BGX, DB2,
BG40, BGX, BGX, BGX, BGX, BGX, BGX, DB2,

BG48, DB1, BGX, BGX, BGX, BGX, BGX, DB2,
BG56, BGX, BGX, BGX, BGX, BGX, BGX, BGX
};	


const unsigned char PALETTE_BG[]={
0x29,0x0f,0x06,0x16, //	gray, gray, lt gray, white
0x29,0x0f,0x1c,0x2c,
0,0,0,0,
0,0,0,0
}; 


const unsigned char PALETTE_SP[]={
0x29,0x0f,0x1c,0x2c, //	gray, gray, lt gray, white
0,0,0,0,
0,0,0,0,
0,0,0,0
}; 






#pragma bss-name(push, "BSS")




	

void main (void) {
	
	//	load the palette
	pal_bg(PALETTE_BG);
	pal_spr(PALETTE_SP);
	
	
	// use the second set of tiles for sprites
	bank_spr(1);
	
	direction = GoRight;
	direction2 = GoDown;
	
	// decompress 2+ full nametables
	// just loops on CSV2NT_ROW_FILL a few times
	CSV2NT_FULL();

	//  

	//	turn on screen
	ppu_on_all();

	// set some initial values
	Guy.X = 0x80;
	Guy.Y = 0x80;
	Guy.width = 16;
	Guy.height = 16;

	
	
	//	infinite loop
	while (1){
		ppu_wait_nmi();
		pad_poll(0); // read controller 1
		pad_poll(1); // read controller 2
		oam_clear();
		sprid = 0;

		if (direction == GoRight){
			sprid = oam_meta_spr(Guy.X, Guy.Y-1, sprid, BlueGuyR);
		}
		else{
			sprid = oam_meta_spr(Guy.X, Guy.Y-1, sprid, BlueGuyL);
		}
		
		
		// move the Guy X
		if(PAD_STATE & PAD_LEFT){
			if (direction == GoLeft){
				if (Guy.X > MAXLEFT){
					Guy.X -= 1;
				}
				else if (masterX > 0){
					masterX -= 1;
				}
				else if (Guy.X > 0){
					Guy.X -= 1;
				}
			}
			else {
				direction = GoLeft;
			}
		}
		else if (PAD_STATE & PAD_RIGHT){
			if (direction == GoRight){
				if (Guy.X < MAXRIGHT){
					Guy.X += 1;
				}
				else if (masterX < MAX_SCROLL_X){
					masterX += 1;
				}
				else if (Guy.X < MAXRIGHT2){
					Guy.X += 1;
				}
			}
			else {
				direction = GoRight;
			}
		}
		
		
		// check collisions, eject X
		if (direction == GoRight){
			tempX = masterX + Guy.X + 15;
			tempB = (masterY & 0xff) + Guy.Y; // check if overflow, adjust by 0x10 if yes
			if (tempB >= 0xf0){
				tempY = masterY + Guy.Y + 0x10;
			}
			else {
				tempY = masterY + Guy.Y;
			}
			collision = BGCollisionRL();
			if ((collision)&&(Guy.X != 0)) Guy.X -= 1; //collision, shift left
		}
		else { // direction = GoLeft
			tempX = masterX + Guy.X;
			tempB = (masterY & 0xff) + Guy.Y; // check if overflow, adjust by 0x10 if yes
			if (tempB >= 0xf0){
				tempY = masterY + Guy.Y + 0x10;
			}
			else {
				tempY = masterY + Guy.Y;
			}
			collision = BGCollisionRL();
			if ((collision)&&(Guy.X < MAXRIGHT2)) Guy.X += 1; //collision, shift right
		}
		
		
		// move the Guy Y
		if(PAD_STATE & PAD_UP){
			if(direction2 == GoUp){
				if ((Guy.Y > MAXUP)&&(Guy.Y > 1)){
					Guy.Y -= 1;
				}
				else if (masterY > 0){
					masterY -= 1;
					if ((masterY & 0xff) > 0xef) { // screen is only 240 pixels tall, 0xf0-0xff doesn't work right
						masterY -= 0x10;
					}
				}
				else if (Guy.Y > 1){
					Guy.Y -= 1;
				}
			}
			else {
				direction2 = GoUp;
			}
		}
		else if (PAD_STATE & PAD_DOWN){
			if(direction2 == GoDown){
				if (Guy.Y < MAXRIGHT){
					Guy.Y += 1;
				}
				else if (masterY < MAX_SCROLL_Y){
					masterY += 1;
					if ((masterY & 0xff) > 0xef) { // screen is only 240 pixels tall, 0xf0-0xff doesn't work right
						masterY += 0x10;
					}
				}
				else if (Guy.Y < MAXDOWN2){
					Guy.Y += 1;
				}
			}
			else {
				direction2 = GoDown;
			}
		}
		
		
		// check collisions, eject Y
		if (direction2 == GoUp){
			tempX = masterX + Guy.X;

			tempB = (masterY & 0xff) + Guy.Y; // check if overflow, adjust by 0x10 if yes
			if (tempB >= 0xf0){
				tempY = masterY + Guy.Y + 0x10;
			}
			else {
				tempY = masterY + Guy.Y;
			}
			
			collision = BGCollisionUD();
			if ((collision)&&(Guy.Y < MAXDOWN2)) Guy.Y += 1; // collision, shift down
		}
		else { // direction = GoDown
			tempX = masterX + Guy.X;
			
			tempB = (masterY & 0xff) + Guy.Y + 14; // check if overflow, adjust by 0x10 if yes
			if (tempB >= 0xf0){
				tempY = masterY + Guy.Y + 14 + 0x10;
			}
			else {
				tempY = masterY + Guy.Y + 14;
			}
			
			collision = BGCollisionUD();
			if ((collision)&&(Guy.Y != 0)) Guy.Y -= 1; // collision, shift up
		}

		
		// set scroll position
		scrollX = masterX & 0x1ff;
		scrollY = masterY & 0x1ff;
		
		scroll(scrollX, scrollY);
		
		
		// fill tile buffers
		if (direction2 == GoDown){
			tempX = masterX;
			tempY = masterY + 0x100;
			CSV2NT_ROW_FILL();
		}
		else { // direction2 = GoUp
			tempX = masterX;
			tempY = masterY - 0x10;
			if ((tempY & 0xff) >= 0xf0){ // low byte can't be f0-ff
				tempY -= 0x10;
			}
			
			CSV2NT_ROW_FILL();
		}
		
		if (direction == GoRight){
			tempX = masterX + 0x100;
			tempY = masterY;
			CSV2NT_COL_FILL();
		}
		else {
			tempX = masterX - 0x10;
			tempY = masterY;
			CSV2NT_COL_FILL();
		}
	}
};
	
	