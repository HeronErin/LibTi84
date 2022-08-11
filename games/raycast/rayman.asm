;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _badfill
	.globl _badclr
	.globl _setpix
	.globl _pixpos
	.globl _getSin
	.globl _getCos
	.globl _getTan
	.globl _absint
	.globl _sins
	.globl _cosses
	.globl _tans
	.globl ___cio__current_line
	.globl _Vtrack
	.globl _buff
	.globl ___cio__buffer
	.globl ___cio__j
	.globl ___cio__i
	.globl ___cio__returnValue
	.globl _returnValue
	.globl ___clib__c
	.globl ___clib__returnval
	.globl ___clib__j
	.globl ___clib__i
	.globl _clearscreen
	.globl _resetcursor
	.globl _newline
	.globl _setPenCol
	.globl _setPenRow
	.globl _getKey
	.globl _assignAToVar
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
___clib__i::
	.ds 2
___clib__j::
	.ds 2
___clib__returnval::
	.ds 2
___clib__c::
	.ds 1
_returnValue::
	.ds 2
___cio__returnValue::
	.ds 2
___cio__i::
	.ds 2
___cio__j::
	.ds 2
___cio__buffer::
	.ds 16
_buff::
	.ds 2
_Vtrack::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
___cio__current_line::
	.ds 1
_tans::
	.ds 72
_cosses::
	.ds 36
_sins::
	.ds 36
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../../src/cio.c:4: void clearscreen(){
;	---------------------------------
; Function clearscreen
; ---------------------------------
_clearscreen::
;../../src/cio.c:5: bcall(_clrlcdf);
	rst	40 
	.dw #0x4540 
;../../src/cio.c:6: resetcursor();
;../../src/cio.c:7: }
	jp	_resetcursor
;../../src/cio.c:9: void resetcursor() {
;	---------------------------------
; Function resetcursor
; ---------------------------------
_resetcursor::
;../../src/cio.c:11: __cio__current_line = 0;
	ld	hl, #___cio__current_line
	ld	(hl), #0x00
;../../src/cio.c:12: setPenRow(0);
	xor	a, a
	push	af
	inc	sp
	call	_setPenRow
	inc	sp
;../../src/cio.c:13: setPenCol(0);
	xor	a, a
	push	af
	inc	sp
	call	_setPenCol
	inc	sp
;../../src/cio.c:14: }
	ret
;../../src/cio.c:16: void newline() {
;	---------------------------------
; Function newline
; ---------------------------------
_newline::
;../../src/cio.c:17: __cio__current_line += 6;
	ld	hl, #___cio__current_line
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
;../../src/cio.c:18: setPenCol(0);
	xor	a, a
	push	af
	inc	sp
	call	_setPenCol
	inc	sp
;../../src/cio.c:19: }
	ret
;../../src/cio.c:21: void setPenCol(char col) {
;	---------------------------------
; Function setPenCol
; ---------------------------------
_setPenCol::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:26: __endasm;
	ld	a, 4(ix)
	ld	(#0x86D7), a
;../../src/cio.c:27: }
	pop	ix
	ret
;../../src/cio.c:29: void setPenRow(char row) {
;	---------------------------------
; Function setPenRow
; ---------------------------------
_setPenRow::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:34: __endasm;
	ld	a, 4(ix)
	ld	(#0x86D8), a
;../../src/cio.c:35: }
	pop	ix
	ret
;../../src/cio.c:95: int getKey() {
;	---------------------------------
; Function getKey
; ---------------------------------
_getKey::
;../../src/cio.c:96: bcall(_getkey);
	rst	40 
	.dw #0x4972 
;../../src/cio.c:97: assignAToVar(&__cio__returnValue);
	ld	hl, #___cio__returnValue
	push	hl
	call	_assignAToVar
	pop	af
;../../src/cio.c:98: return __cio__returnValue;
	ld	hl, (___cio__returnValue)
;../../src/cio.c:99: }
	ret
;../../src/libti.c:6: void assignAToVar(int* var) {
;	---------------------------------
; Function assignAToVar
; ---------------------------------
_assignAToVar::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/libti.c:16: __endasm;
	ld	d,4 (ix)
	ld	e,5 (ix)
	ld	l, d
	ld	h, e
	ld	(hl),a
	inc	hl
	ld	(hl),#0x00
;../../src/libti.c:17: }
	pop	ix
	ret
;../../src/crapmath.c:63: int absint(int x){
;	---------------------------------
; Function absint
; ---------------------------------
_absint::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:64: if (x<0){
	bit	7, 5 (ix)
	jr	Z,00102$
;../../src/crapmath.c:65: return 0-x;
	xor	a, a
	sub	a, 4 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	b, a
	ld	l, c
	ld	h, b
	jr	00103$
00102$:
;../../src/crapmath.c:67: return x;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
00103$:
;../../src/crapmath.c:68: }
	pop	ix
	ret
;../../src/crapmath.c:73: int getTan(int deg){
;	---------------------------------
; Function getTan
; ---------------------------------
_getTan::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:74: int adeg = absint(deg);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_absint
	pop	af
	ex	de,hl
;../../src/crapmath.c:75: return (deg/adeg)*tans[adeg%360/10];
	push	de
	push	de
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	pop	de
	push	bc
	ld	hl, #0x0168
	push	hl
	push	de
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ex	de,hl
	add	hl, hl
	ld	de, #_tans
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	push	bc
	call	__mulint
	pop	af
	pop	af
;../../src/crapmath.c:76: }
	pop	ix
	ret
;../../src/crapmath.c:80: int getCos(int deg){
;	---------------------------------
; Function getCos
; ---------------------------------
_getCos::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:81: return cosses[absint(deg)%360/10];
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_absint
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x0168
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__divsint
	pop	af
	pop	af
	ld	bc,#_cosses
	add	hl,bc
	ld	a, (hl)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
;../../src/crapmath.c:82: }
	pop	ix
	ret
;../../src/crapmath.c:86: int getSin(int deg){
;	---------------------------------
; Function getSin
; ---------------------------------
_getSin::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:87: int adeg = absint(deg);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_absint
	pop	af
	ex	de,hl
;../../src/crapmath.c:88: return (deg/adeg)*((int)sins[adeg%360/10]);
	push	de
	push	de
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	pop	de
	push	bc
	ld	hl, #0x0168
	push	hl
	push	de
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	hl, #_sins
	add	hl, de
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	push	de
	push	bc
	call	__mulint
	pop	af
	pop	af
;../../src/crapmath.c:89: }
	pop	ix
	ret
;../../src/graphics.c:15: int pixpos(int x, int y){
;	---------------------------------
; Function pixpos
; ---------------------------------
_pixpos::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/graphics.c:16: return (x/8) + (y*12);
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	bit	7, d
	jr	Z,00103$
	ld	hl, #0x0007
	add	hl, de
	ex	de, hl
00103$:
	ld	c, e
	ld	b, d
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	l, c
	ld	h, b
	add	hl, de
;../../src/graphics.c:17: }
	pop	ix
	ret
;../../src/graphics.c:21: void setpix(int x, int y ){
;	---------------------------------
; Function setpix
; ---------------------------------
_setpix::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;../../src/graphics.c:22: buff[pixpos(x, y)] |= 1<<(7-(x%8));
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_pixpos
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	ld	a, (de)
	ld	-1 (ix), a
	push	de
	ld	hl, #0x0008
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	pop	de
	ld	a, #0x07
	sub	a, c
	ld	b, a
	ld	c, #0x01
	inc	b
	jr	00104$
00103$:
	sla	c
00104$:
	djnz	00103$
	ld	a, -1 (ix)
	or	a, c
	ld	(de), a
;../../src/graphics.c:23: }
	inc	sp
	pop	ix
	ret
;../../src/graphics.c:83: void badclr(){
;	---------------------------------
; Function badclr
; ---------------------------------
_badclr::
;../../src/graphics.c:84: for (int x = 0; x < 768; x+=1){
	ld	bc, #0x0000
00103$:
	ld	a, b
	xor	a, #0x80
	sub	a, #0x83
	ret	NC
;../../src/graphics.c:85: buff[x] = 0;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	xor	a, a
	ld	(de), a
;../../src/graphics.c:84: for (int x = 0; x < 768; x+=1){
	inc	bc
;../../src/graphics.c:87: }
	jr	00103$
;../../src/graphics.c:88: void badfill(){
;	---------------------------------
; Function badfill
; ---------------------------------
_badfill::
;../../src/graphics.c:89: for (int x = 0; x < 768; x+=1){
	ld	bc, #0x0000
00103$:
	ld	a, b
	xor	a, #0x80
	sub	a, #0x83
	ret	NC
;../../src/graphics.c:90: buff[x] = 0xFF;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	ld	a, #0xff
	ld	(de), a
;../../src/graphics.c:89: for (int x = 0; x < 768; x+=1){
	inc	bc
;../../src/graphics.c:92: }
	jr	00103$
;../../src/graphics.c:170: void swap(){
;	---------------------------------
; Function swap
; ---------------------------------
_swap::
;../../src/graphics.c:171: bcall(0x486A);
	rst	40 
	.dw 0x486A 
;../../src/graphics.c:174: }
	ret
;../../src/graphics.c:176: int getKeyId(){
;	---------------------------------
; Function getKeyId
; ---------------------------------
_getKeyId::
;../../src/graphics.c:177: bcall(0x4015);
	rst	40 
	.dw 0x4015 
;../../src/graphics.c:178: return (int)(*((char*)(0x843F)));}
	ld	hl, #0x843f
	ld	l, (hl)
	ld	h, #0x00
	ret
;../../src/graphics.c:184: void init_graphics(){
;	---------------------------------
; Function init_graphics
; ---------------------------------
_init_graphics::
;../../src/graphics.c:185: buff = (char*)(SCREEN_BUFFER);
	ld	hl, #_buff
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x93
;../../src/graphics.c:186: }
	ret
;main.c:50: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-42
	add	hl, sp
	ld	sp, hl
;main.c:55: char map[] = {
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a, #0x01
	ld	(de), a
	ld	l, e
	ld	h, d
	inc	hl
	ld	(hl), #0x01
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x01
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x000b
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x000c
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x000d
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x000f
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0010
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0011
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0012
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0013
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0014
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0015
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0016
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0017
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0018
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0019
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x001a
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x001b
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x001c
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x001d
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x001e
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x001f
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0020
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0021
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0022
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0023
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0024
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0025
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0026
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0027
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0028
	add	hl, de
	ld	(hl), #0x01
	ld	hl, #0x0029
	add	hl, de
	ld	(hl), #0x01
;main.c:68: clearscreen();
	call	_clearscreen
;main.c:69: init_graphics();
	call	_init_graphics
;main.c:70: badclr();
	call	_badclr
;main.c:77: swap();
	call	_swap
;main.c:80: getKey();
	call	_getKey
;main.c:84: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
__xinit__tans:
	.dw #0x0000
	.dw #0x0011
	.dw #0x0024
	.dw #0x0039
	.dw #0x0053
	.dw #0x0077
	.dw #0x00ad
	.dw #0x0112
	.dw #0x0237
	.dw #0x03e8
	.dw #0xfdc9
	.dw #0xfeee
	.dw #0xff53
	.dw #0xff89
	.dw #0xffad
	.dw #0xffc7
	.dw #0xffdc
	.dw #0xffef
	.dw #0x0000
	.dw #0x0011
	.dw #0x0024
	.dw #0x0039
	.dw #0x0053
	.dw #0x0077
	.dw #0x00ad
	.dw #0x0112
	.dw #0x0237
	.dw #0x03e8
	.dw #0xfdc9
	.dw #0xfeee
	.dw #0xff53
	.dw #0xff89
	.dw #0xffad
	.dw #0xffc7
	.dw #0xffdc
	.dw #0xffef
__xinit__cosses:
	.db #0x64	;  100	'd'
	.db #0x62	;  98	'b'
	.db #0x5d	;  93
	.db #0x56	;  86	'V'
	.db #0x4c	;  76	'L'
	.db #0x40	;  64
	.db #0x32	;  50	'2'
	.db #0x22	;  34
	.db #0x11	;  17
	.db #0x00	;  0
	.db #0xef	; -17
	.db #0xde	; -34
	.db #0xcf	; -49
	.db #0xc0	; -64
	.db #0xb4	; -76
	.db #0xaa	; -86
	.db #0xa3	; -93
	.db #0x9e	; -98
	.db #0x9c	; -100
	.db #0x9e	; -98
	.db #0xa3	; -93
	.db #0xaa	; -86
	.db #0xb4	; -76
	.db #0xc0	; -64
	.db #0xce	; -50
	.db #0xde	; -34
	.db #0xef	; -17
	.db #0x00	;  0
	.db #0x11	;  17
	.db #0x22	;  34
	.db #0x32	;  50	'2'
	.db #0x40	;  64
	.db #0x4c	;  76	'L'
	.db #0x56	;  86	'V'
	.db #0x5d	;  93
	.db #0x62	;  98	'b'
__xinit__sins:
	.db #0x00	;  0
	.db #0x11	;  17
	.db #0x22	;  34
	.db #0x31	;  49	'1'
	.db #0x40	;  64
	.db #0x4c	;  76	'L'
	.db #0x56	;  86	'V'
	.db #0x5d	;  93
	.db #0x62	;  98	'b'
	.db #0x64	;  100	'd'
	.db #0x62	;  98	'b'
	.db #0x5d	;  93
	.db #0x56	;  86	'V'
	.db #0x4c	;  76	'L'
	.db #0x40	;  64
	.db #0x31	;  49	'1'
	.db #0x22	;  34
	.db #0x11	;  17
	.db #0x00	;  0
	.db #0xef	; -17
	.db #0xde	; -34
	.db #0xce	; -50
	.db #0xc0	; -64
	.db #0xb4	; -76
	.db #0xaa	; -86
	.db #0xa3	; -93
	.db #0x9e	; -98
	.db #0x9c	; -100
	.db #0x9e	; -98
	.db #0xa3	; -93
	.db #0xaa	; -86
	.db #0xb4	; -76
	.db #0xc0	; -64
	.db #0xce	; -50
	.db #0xde	; -34
	.db #0xef	; -17
	.area _CABS (ABS)
