// I'm working on still this, bear with me, it will change...
// Doug Fraker 2017

#define MAXLEFT 0x40
#define MAXRIGHT 0xb0
#define MAXUP 0x30
#define MAXDOWN 0xb0
#define ROOMS_WIDE 8
#define ROOMS_HIGH 8
#define MAX_SCROLL_X ((ROOMS_WIDE - 1) * 256)
#define MAX_SCROLL_Y ((ROOMS_HIGH - 1) * 256)
#define MAXRIGHT2 0xf0
#define MAXDOWN2 0xe0

#pragma bss-name(push, "ZEROPAGE")

unsigned char PAD_STATE; // controller 1, any presses
unsigned char PAD_STATE2; // controller 2, any presses
unsigned char PAD_STATET; // controller 1, new press, not held
unsigned char PAD_STATET2; // controller 2, new press, not held

#pragma bss-name(push, "BSS")

static unsigned char v_ram_buffer[256];


struct SprObj {
	unsigned char X;
	unsigned char Y;
	unsigned char width;
	unsigned char height;
};

struct SprObj Guy;

unsigned int masterX; // 0 to 0x7ff
unsigned int masterY; // 0 to 0x7ff

unsigned int scrollX; // master & 0x1ff
unsigned int scrollY; // master & 0x1ff

unsigned int tempX;
unsigned int tempY;

//unsigned int keepX;
//unsigned int keepY;

unsigned char direction; // L or R
# define GoLeft 0
# define GoRight 1

unsigned char direction2; // U or D
# define GoUp 0
# define GoDown 1

unsigned char collision;
unsigned char sprid;
unsigned char index;


//unsigned char debug;
unsigned int tempB;
const unsigned char * bgPointer;

unsigned char Col_Buffer_Ready;
unsigned char Row_Buffer_Ready;

unsigned char __fastcall__ CheckCollision(struct SprObj* one, struct SprObj* two);
void CSV2NT_FULL(void); // calls fill and row 15 times, before the start
void CSV2NT_COL_FILL(void); // sets Col_Buffer_Ready, args tempX, tempY are used, don't need to pass
void CSV2NT_ROW_FILL(void); // sets Row_Buffer_Ready, args tempX, tempY are used, don't need to pass
void CSV2NT_COL_DRAW(void);
void CSV2NT_ROW_DRAW(void);
unsigned char BGCollisionRL(void);
unsigned char BGCollisionUD(void);

unsigned char Col_Buffer[124];
//address, 30 bytes // 30 bytes
//address, 30 bytes // 30 bytes


unsigned char AT_Buffer1[20]; //up to down, attribute table
//address, 8 ...x 2

unsigned char Row_Buffer[134];
//address, 64 bytes // address, 64 bytes


unsigned char AT_Buffer2[20]; //left to right, attribute table
//address, 8 ...x 2


/*	this is so you have to type less
 *	cut and paste from this list
 
// any time button pressed or held 

(PAD_STATE & PAD_A)
(PAD_STATE & PAD_B)
(PAD_STATE & PAD_SELECT)
(PAD_STATE & PAD_START)
(PAD_STATE & PAD_UP)
(PAD_STATE & PAD_DOWN)
(PAD_STATE & PAD_LEFT)
(PAD_STATE & PAD_RIGHT)	

(PAD_STATE2 & PAD_A)
(PAD_STATE2 & PAD_B)
(PAD_STATE2 & PAD_SELECT)
(PAD_STATE2 & PAD_START)
(PAD_STATE2 & PAD_UP)
(PAD_STATE2 & PAD_DOWN)
(PAD_STATE2 & PAD_LEFT)
(PAD_STATE2 & PAD_RIGHT)	


// only on button down, not hold

(PAD_STATET & PAD_A)
(PAD_STATET & PAD_B)
(PAD_STATET & PAD_SELECT)
(PAD_STATET & PAD_START)
(PAD_STATET & PAD_UP)
(PAD_STATET & PAD_DOWN)
(PAD_STATET & PAD_LEFT)
(PAD_STATET & PAD_RIGHT)	

(PAD_STATET2 & PAD_A)
(PAD_STATET2 & PAD_B)
(PAD_STATET2 & PAD_SELECT)
(PAD_STATET2 & PAD_START)
(PAD_STATET2 & PAD_UP)
(PAD_STATET2 & PAD_DOWN)
(PAD_STATET2 & PAD_LEFT)
(PAD_STATET2 & PAD_RIGHT)

 */
 
 
