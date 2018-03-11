/*	example code for cc65, for NES
 *  PONG, without a score
 *	using neslib
 *	Doug Fraker 2017
 */	


#include "neslib.h"
#include "lesson26.h"
#include "Sprites.c"
#include "BG_RLE.h"


const unsigned char MAP[]={
	1,1,1,1, 1,0,0,0,  0,0,0,1, 1,1,1,1,
	1,1,1,1, 1,0,0,0,  0,0,0,1, 1,1,1,1,
	
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	1,1,0,0, 0,0,0,0,  0,0,0,0, 0,0,1,1,
	
	1,1,1,1, 1,0,0,0,  0,0,0,1, 1,1,1,1,
	1,1,1,1, 1,0,0,0,  0,0,0,1, 1,1,1,1,
	
	0,0,0,0, 0,0,0,0,  0,0,0,0, 0,0,0,0
	
};



const unsigned char PALETTE_BG[]={
0x0f, 0x00, 0x10, 0x30, //	gray, gray, lt gray, white
0,0,0,0,
0,0,0,0,
0,0,0,0
}; 

const unsigned char PALETTE_SP[]={
0x0f, 0x00, 0x10, 0x30, //	gray, gray, lt gray, white
0,0,0,0,
0,0,0,0,
0,0,0,0
}; 


const unsigned char CLEAR[]={
MSB(NTADR_A(10,12))|NT_UPD_HORZ, // where to write, repeat horizontally
LSB(NTADR_A(10,12)),
12, // length of write
0,0,0,0, // what to write there
0,0,0,0, // data needs to be exactly the size of length
0,0,0,0,
NT_UPD_EOF}; // data must end in EOF 



#pragma bss-name(push, "BSS")

static unsigned char v_ram_buffer[256];


	

void main (void) {
	
	// rendering is disabled at the startup
	
	// the init code set the palette brightness to
	// pal_bright(4); // normal
	
	//	load the palette
	pal_bg(PALETTE_BG);
	pal_spr(PALETTE_SP);
	
	
	// use the second set of tiles for sprites
	bank_spr(1);
	
	
	vram_adr(NTADR_A(0,0)); // top left of nametable A
	
	vram_unrle(BG_RLE); // push the BG data to the PPU

	//	turn on screen
	ppu_on_all();

	// set some initial values
	Paddle1.X = 0x70;
	Paddle2.X = 0x70;
	Paddle1.Y = 0xca;
	Paddle2.Y = 0x20;
	Paddle1.width = 32;
	Paddle1.height = 4;
	Paddle2.width = 32;
	Paddle2.height = 4;
	
	
	while (!pad_poll(0)){
		// just waits until player 1 presses any button
		// this will tick upward to a random point
		++Seedy;
	}

	set_rand(Seedy); // seed the random number
	
	Ball.X = (rand8() / 2) + 0x40;
	Ball.Y = 0x80;
	Ball_X_Speed = (rand8() & 4) - 2;
	Ball_Y_Speed = (rand8() & 4) - 2;
	
	// clear the words "Press Start" off the screen
	memcpy(v_ram_buffer,CLEAR,sizeof(CLEAR)); // copy from the ROM to the RAM
	set_vram_update(v_ram_buffer);
	
	//	infinite loop
	while (1){
		// wait till beginning of the frame
		ppu_wait_nmi();
		
		pad_poll(0); // read controller 1
		pad_poll(1); // read controller 2
		// originally, you had to do something like, pad=pad_poll(i);
		// I changed it, so you don't have to waste a RAM address for pad
		// you can access PAD_STATE, PAD_STATE2, PAD_STATET, and PAD_STATET2 directly
		
		// clear all sprites from buffer
		oam_clear();
		
		// reset index into the buffer
		sprid = 0;
		
		// push the ball sprite
		// oam_spr(unsigned char x,unsigned char y,unsigned char chrnum,unsigned char attr,unsigned char sprid);
		sprid = oam_spr(Ball.X, Ball.Y, 1, 0, sprid);
		
		// push 2 metasprites
		// oam_meta_spr(unsigned char x,unsigned char y,unsigned char sprid,const unsigned char *data);
		sprid = oam_meta_spr(Paddle1.X, Paddle1.Y, sprid, Paddle);
		
		sprid = oam_meta_spr(Paddle2.X, Paddle2.Y, sprid, Paddle);
		
		
		// move the paddles
		if(PAD_STATE & PAD_LEFT){
			Paddle1.X -= 4;
			if (Paddle1.X < 0x50) Paddle1.X = 0x50;
		}
		else if (PAD_STATE & PAD_RIGHT){
			Paddle1.X += 4;
			if (Paddle1.X > 0x90) Paddle1.X = 0x90;
		}

		
		if(PAD_STATE2 & PAD_LEFT){
			Paddle2.X -= 4;
			if (Paddle2.X < 0x50) Paddle2.X = 0x50;
		}
		else if (PAD_STATE2 & PAD_RIGHT){
			Paddle2.X += 4;
			if (Paddle2.X > 0x90) Paddle2.X = 0x90;
		}

		
		// After the ball goes off screen, there is a short 'pause', which skips the ball movement code.
		
		if (!Pause){
			// move the ball L/R
			
			KeepIt = Ball.X;
			Ball.X += Ball_X_Speed;
			
			// collide with walls L/R
			
			index = (Ball.Y & 0xf0) + (Ball.X >> 4);
			
			if (MAP[index]){
				Ball_X_Speed = 0 - Ball_X_Speed;
				Ball.X = KeepIt;
			}
			
			// move the ball U/D
			
			KeepIt = Ball.Y;
			Ball.Y += Ball_Y_Speed;
			
			// collide with walls U/D
			
			index = (Ball.Y & 0xf0) + (Ball.X >> 4);
			
			if (MAP[index]){
				Ball_Y_Speed = 0 - Ball_Y_Speed;
				Ball.Y = KeepIt;
			}
			
			// collide with paddle
			
			collision = CheckCollision(&Paddle1, &Ball);
			if (collision){
				Ball_Y_Speed = 0 - Ball_Y_Speed;
				Ball.Y = KeepIt;
			}
			
			collision = CheckCollision(&Paddle2, &Ball);
			if (collision){
				Ball_Y_Speed = 0 - Ball_Y_Speed;
				Ball.Y = KeepIt;
			}
			
			
			
			// end it if too far up or down
			if ((Ball.Y > 0xe8) || (Ball.Y < 0x8)){
				Ball.Y = 0xf8; // keep it off screen
				Ball_Y_Speed = 0;
				Pause = 0x80; // wait 2 seconds
			}
		}
		
		// can't use an 'else' because the pause state could have changed
		if(Pause){
			--Pause;
			
			if(!Pause){ // on last loop, when pause counts to zero
				Ball.X = (rand8() / 2) + 0x40; // restart the ball
				Ball.Y = 0x80;
				Ball_X_Speed = (rand8() & 4) - 2;
				Ball_Y_Speed = (rand8() & 4) - 2;
			}
		}


	}
};
	
	