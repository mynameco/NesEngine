; sprite object collision code, in ASM
; this would work with any size struct, as long as the first 4 bytes are...
; x, y, width, height

.export _CheckCollision


;note PTR is the same as TEMP and TEMP+1
;note2, I added a PTR2 (2 bytes) in crt0.s

_CheckCollision:

	sta PTR
	stx PTR+1 ;set up a pointer to the first object
	jsr popax
	sta PTR2
	stx PTR2+1 ;set up a pointer to the second object
	
	;move the stuct elements to TEMP+2...TEMP+9
	ldy #0
	lda (PTR),y
	sta TEMP+2
	lda (PTR2), y
	sta TEMP+6
	iny
	lda (PTR),y
	sta TEMP+3
	lda (PTR2), y
	sta TEMP+7
	iny
	lda (PTR),y
	sta TEMP+4
	lda (PTR2), y
	sta TEMP+8
	iny
	lda (PTR),y
	sta TEMP+5
	lda (PTR2), y
	sta TEMP+9
	
	;see if they are colliding
	
; struct BoxGuy {
	; unsigned char X;
	; unsigned char Y;
	; unsigned char width;
	; unsigned char height;
	
;first check if obj1 R (obj1 x + width) < obj2 L
	
	lda TEMP+2 ;X 1
	clc
	adc TEMP+4 ;width 1

	cmp TEMP+6 ;X 2
	bcc No_Collision
	
;now check if obj1 L > obj2 R (obj2 x + width)

	lda TEMP+6 ;X 2
	clc
	adc TEMP+8 ;width 2

	cmp TEMP+2 ;X 1
	bcc No_Collision

;now check if obj1 Bottom < obj2 Top

	lda TEMP+3 ;Y 1
	clc
	adc TEMP+5 ;Y height

	cmp TEMP+7 ;Y 2
	bcc No_Collision

;now check if obj1 Top > obj2 Bottom (T + height)

	lda TEMP+7 ;Y 2
	clc
	adc TEMP+9 ;height 2

	cmp TEMP+3 ;Y 1
	bcc No_Collision

;YES, collision
	lda #1
	rts
	
No_Collision:
	lda #0
	rts

	