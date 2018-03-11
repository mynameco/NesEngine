/*	example code, for cc65, for NES
 *  this will draw the text slowly, with rendering ON
 *
 *	using neslib
 *	Doug Fraker 2017
 */	


#include "neslib.h"
#include "lesson22.h"


const unsigned char TEXT[]={
"Hello World!"}; // 12 chars

// example of non-sequential vram data
const unsigned char TWOLETTERS[]={
MSB(NTADR_A(10,17)),
LSB(NTADR_A(10,17)),	
'A',
MSB(NTADR_A(18,5)),
LSB(NTADR_A(18,5)),	
'B',
NT_UPD_EOF}; // data must end in EOF

// example of sequential vram data
const unsigned char CLEAR[]={
MSB(NTADR_A(10,14))|NT_UPD_HORZ, // where to write, repeat horizontally
LSB(NTADR_A(10,14)),
12, // length of write
0,0,0,0, // what to write there
0,0,0,0, // data needs to be exactly the size of length
0,0,0,0,
NT_UPD_EOF}; // data must end in EOF


const unsigned char PALETTE[]={
0x0f, 0x00, 0x10, 0x30, //	black, gray, lt gray, white
0,0,0,0,
0,0,0,0,
0,0,0,0
}; 
// there's some oddities in the palette code, black must be 0x0f, white must be 0x30


#pragma bss-name(push, "ZEROPAGE")

unsigned char text_Position;
unsigned int address; // 2 bytes, for 2 byte math
unsigned char high;
unsigned char low;
unsigned char data;


#pragma bss-name(push, "BSS")

static unsigned char v_ram_buffer[256];


void main (void) {
	
	//	load the palette
	pal_bg(PALETTE);
		
	// set some initial values
	
	text_Position = 0;
	
	//	turn on screen
	ppu_on_all();
	
	//  load some non-sequential vram data, during rendering
	
	memcpy(v_ram_buffer,TWOLETTERS,sizeof(TWOLETTERS)); // copy from the ROM to the RAM
	set_vram_update(v_ram_buffer); // this just sets a pointer to the data, and sets a flag to draw it next v-blank
	// works only when NMI is on
	
	//	infinite loop
	while (1){

		delay(30); // wait 30 frames

		address = NTADR_A(10,14) + text_Position; // 2 bytes wide
		high = (char)(address >> 8); // get just the upper byte
		low = (char)(address & 0xff); // get just the lower byte
		
		v_ram_buffer[0] = high;
		v_ram_buffer[1] = low;
		
		data = TEXT[text_Position]; // get 1 letter of the text
		v_ram_buffer[2] = data;
		
		v_ram_buffer[3] = NT_UPD_EOF;
		
		++text_Position;
		
		if (text_Position >= sizeof(TEXT)){
			text_Position = 0;
			ppu_wait_frame();
			memcpy(v_ram_buffer,CLEAR,sizeof(CLEAR)); // if at end, clear screen
				// by overwriting zeros over the text
		}

		set_vram_update(v_ram_buffer); // set a pointer to the buffer	
			// it will auto-update during v-blank
		
	}
};
	
	