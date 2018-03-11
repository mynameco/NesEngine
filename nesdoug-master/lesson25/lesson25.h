// I'm working on still this, bear with me, it will change...
// Doug Fraker 2017

#pragma bss-name(push, "ZEROPAGE")

unsigned char PAD_STATE; // controller 1, any presses
unsigned char PAD_STATE2; // controller 2, any presses
unsigned char PAD_STATET; // controller 1, new press, not held
unsigned char PAD_STATET2; // controller 2, new press, not held

#pragma bss-name(push, "BSS")


struct BoxGuy {
	unsigned char X;
	unsigned char Y;
	unsigned char width;
	unsigned char height;
};

struct BoxGuy BoxGuy1;
struct BoxGuy BoxGuy2;

unsigned char collision;
unsigned char sprid;

unsigned char __fastcall__ CheckCollision(struct BoxGuy* one, struct BoxGuy* two);
	


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
 
 
