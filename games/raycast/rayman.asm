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
	.globl _FixAng
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
	.globl _pdy
	.globl _pdx
	.globl _pa
	.globl _py
	.globl _px
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
_px::
	.ds 2
_py::
	.ds 2
_pa::
	.ds 2
_pdx::
	.ds 4
_pdy::
	.ds 4
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
;main.c:47: int FixAng(int a){ if(a>359){ a-=360;} if(a<0){ a+=360;} return a;}
;	---------------------------------
; Function FixAng
; ---------------------------------
_FixAng::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	a, #0x67
	cp	a, 4 (ix)
	ld	a, #0x01
	sbc	a, 5 (ix)
	jp	PO, 00117$
	xor	a, #0x80
00117$:
	jp	P, 00102$
	ld	a, 4 (ix)
	add	a, #0x98
	ld	4 (ix), a
	ld	a, 5 (ix)
	adc	a, #0xfe
	ld	5 (ix), a
00102$:
	bit	7, 5 (ix)
	jr	Z,00104$
	ld	a, 4 (ix)
	add	a, #0x68
	ld	4 (ix), a
	ld	a, 5 (ix)
	adc	a, #0x01
	ld	5 (ix), a
00104$:
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	pop	ix
	ret
;main.c:52: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-86
	add	hl, sp
	ld	sp, hl
;main.c:57: px=150; py=400; pa=90;
	ld	hl, #_pa
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;main.c:58: pdx=((float)getCos(pa))/100; pdy= ( (float) (-getSin(pa)))/100; 
	ld	hl, #0x005a
	push	hl
	call	_getCos
	ex	(sp),hl
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x42c8
	push	hl
	ld	hl, #0x0000
	push	hl
	push	de
	push	bc
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #_pdx
	ld	(hl), c
	inc	hl
	ld	(hl), b
	inc	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, (_pa)
	push	hl
	call	_getSin
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x0000
	cp	a, a
	sbc	hl, bc
	push	hl
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x42c8
	push	hl
	ld	hl, #0x0000
	push	hl
	push	de
	push	bc
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #_pdy
	ld	(hl), c
	inc	hl
	ld	(hl), b
	inc	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;main.c:60: char map[] = {
	ld	hl, #4
	add	hl, sp
	ld	-40 (ix), l
	ld	-39 (ix), h
	ld	(hl), #0x01
	ld	l, -40 (ix)
	ld	h, -39 (ix)
	inc	hl
	ld	(hl), #0x01
	ld	l, -40 (ix)
	ld	h, -39 (ix)
	inc	hl
	inc	hl
	ld	(hl), #0x01
	ld	l, -40 (ix)
	ld	h, -39 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x04
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x05
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x06
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x07
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x08
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x09
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x0b
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x0c
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x0d
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x0e
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x0f
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x10
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x11
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x12
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x13
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x14
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x15
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x16
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x17
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x18
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x19
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x1a
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x1b
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x1c
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x1d
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x1e
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x1f
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x20
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x21
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x22
	ld	c, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	ld	a, -40 (ix)
	add	a, #0x23
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x24
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x25
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x26
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x27
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x28
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	ld	a, -40 (ix)
	add	a, #0x29
	ld	l, a
	ld	a, -39 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
;main.c:73: clearscreen();
	call	_clearscreen
;main.c:74: init_graphics();
	call	_init_graphics
;main.c:75: badclr();
	call	_badclr
;main.c:77: ra=FixAng(pa+30);   
	ld	hl, #_pa
	ld	a, (hl)
	add	a, #0x1e
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	push	bc
	call	_FixAng
	ex	(sp),hl
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	-38 (ix), c
	ld	-37 (ix), b
	ld	-36 (ix), e
	ld	-35 (ix), d
;main.c:79: for(r=0;r<60;r++)
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
00134$:
;main.c:82: dof=0; side=0; disV=100000;
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
	ld	-26 (ix), #0x00
	ld	-25 (ix), #0x50
	ld	-24 (ix), #0xc3
	ld	-23 (ix), #0x47
;main.c:83: float Tan=getTan(ra);
	ld	l, -36 (ix)
	ld	h, -35 (ix)
	push	hl
	ld	l, -38 (ix)
	ld	h, -37 (ix)
	push	hl
	call	___fs2sint
	pop	af
	pop	af
	ld	-22 (ix), l
	ld	-21 (ix), h
	push	hl
	call	_getTan
	ex	(sp),hl
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	-14 (ix), c
	ld	-13 (ix), b
	ld	-12 (ix), e
	ld	-11 (ix), d
;main.c:84: if( getCos(ra) > 0.001){ rx=(((int)px>>6)<<6)+64;      ry=(px-rx)*Tan+py; xo= 64; yo=-xo*Tan;}//looking left
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	push	hl
	call	_getCos
	pop	af
	ld	c, l
	ld	b, h
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00242$
	xor	a, #0x80
00242$:
	jp	P, 00105$
	xor	a, a
	ld	-18 (ix), a
	ld	-17 (ix), a
	ld	-16 (ix), #0x40
	ld	-15 (ix), #0x43
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	hl, #0xc228
	push	hl
	ld	hl, #0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x43c8
	push	hl
	ld	hl, #0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-8 (ix), c
	ld	-7 (ix), b
	ld	-6 (ix), e
	ld	-5 (ix), d
	xor	a, a
	ld	-34 (ix), a
	ld	-33 (ix), a
	ld	-32 (ix), #0x80
	ld	-31 (ix), #0x42
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	hl, #0xc280
	push	hl
	ld	hl, #0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-30 (ix), c
	ld	-29 (ix), b
	ld	-28 (ix), e
	ld	-27 (ix), d
	jp	00112$
00105$:
;main.c:85: else if( getCos(ra) <-0.001){ rx=(((int)px>>6)<<6) -0.0001; ry=(px-rx)*Tan+py; xo=-64; yo=-xo*Tan;}//looking right
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	push	hl
	call	_getCos
	pop	af
	ld	c, l
	ld	b, h
	bit	7, b
	jp	Z, 00102$
	ld	-18 (ix), #0xf3
	ld	-17 (ix), #0xff
	ld	-16 (ix), #0xff
	ld	-15 (ix), #0x42
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	hl, #0x41b0
	push	hl
	ld	hl, #0x0034
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x43c8
	push	hl
	ld	hl, #0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-8 (ix), c
	ld	-7 (ix), b
	ld	-6 (ix), e
	ld	-5 (ix), d
	xor	a, a
	ld	-34 (ix), a
	ld	-33 (ix), a
	ld	-32 (ix), #0x80
	ld	-31 (ix), #0xc2
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	hl, #0x4280
	push	hl
	ld	hl, #0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-30 (ix), c
	ld	-29 (ix), b
	ld	-28 (ix), e
	ld	-27 (ix), d
	jr	00112$
00102$:
;main.c:86: else { rx=px; ry=py; dof=8;}                                                  //looking up or down. no hit  
	xor	a, a
	ld	-18 (ix), a
	ld	-17 (ix), a
	ld	-16 (ix), #0x16
	ld	-15 (ix), #0x43
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
	ld	-6 (ix), #0xc8
	ld	-5 (ix), #0x43
	ld	-2 (ix), #0x08
	xor	a, a
	ld	-1 (ix), a
;main.c:88: while(dof<8) 
00112$:
	ld	a, -2 (ix)
	sub	a, #0x08
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00114$
;main.c:90: mx=(int)(rx)>>6; my=(int)(ry)>>6; mp=my*mapX+mx;                     
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	push	hl
	call	___fs2sint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	push	bc
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	call	___fs2sint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	-10 (ix), l
	ld	-9 (ix), h
;main.c:91: if(mp>0 && mp<mapX*mapY && map[mp]==1){ dof=8; disV=getCos(ra)*(rx-px)-getSin(ra)*(ry-py);}//hit         
	xor	a, a
	cp	a, -10 (ix)
	sbc	a, -9 (ix)
	jp	PO, 00243$
	xor	a, #0x80
00243$:
	jp	P, 00108$
	ld	a, -10 (ix)
	sub	a, #0x2a
	ld	a, -9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00108$
	ld	a, -40 (ix)
	add	a, -10 (ix)
	ld	c, a
	ld	a, -39 (ix)
	adc	a, -9 (ix)
	ld	b, a
	ld	a, (bc)
	dec	a
	jp	NZ,00108$
	ld	-2 (ix), #0x08
	xor	a, a
	ld	-1 (ix), a
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	push	hl
	call	_getCos
	ex	(sp),hl
	ld	hl, #0x4316
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-26 (ix), l
	ld	-25 (ix), h
	ld	-24 (ix), e
	ld	-23 (ix), d
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	l, -24 (ix)
	ld	h, -23 (ix)
	push	hl
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	push	hl
	push	de
	push	bc
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-86 (ix), l
	ld	-85 (ix), h
	ld	-84 (ix), e
	ld	-83 (ix), d
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	push	hl
	call	_getSin
	ex	(sp),hl
	ld	hl, #0x43c8
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-26 (ix), l
	ld	-25 (ix), h
	ld	-24 (ix), e
	ld	-23 (ix), d
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	l, -24 (ix)
	ld	h, -23 (ix)
	push	hl
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	push	hl
	push	de
	push	bc
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	push	de
	push	hl
	ld	l, -84 (ix)
	ld	h, -83 (ix)
	push	hl
	ld	l, -86 (ix)
	ld	h, -85 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-26 (ix), c
	ld	-25 (ix), b
	ld	-24 (ix), e
	ld	-23 (ix), d
	jp	00112$
00108$:
;main.c:92: else{ rx+=xo; ry+=yo; dof+=1;}                                               //check next horizontal
	ld	l, -32 (ix)
	ld	h, -31 (ix)
	push	hl
	ld	l, -34 (ix)
	ld	h, -33 (ix)
	push	hl
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-18 (ix), c
	ld	-17 (ix), b
	ld	-16 (ix), e
	ld	-15 (ix), d
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	push	hl
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-8 (ix), c
	ld	-7 (ix), b
	ld	-6 (ix), e
	ld	-5 (ix), d
	inc	-2 (ix)
	jp	NZ,00112$
	inc	-1 (ix)
	jp	00112$
00114$:
;main.c:97: dof=0; disH=100000;
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
	ld	-10 (ix), #0x00
	ld	-9 (ix), #0x50
	ld	-8 (ix), #0xc3
	ld	-7 (ix), #0x47
;main.c:98: Tan=1.0/Tan; 
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	hl, #0x3f80
	push	hl
	ld	hl, #0x0000
	push	hl
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-86 (ix), c
	ld	-85 (ix), b
	ld	-84 (ix), e
	ld	-83 (ix), d
;main.c:99: if(getSin(ra)> 0.001){ ry=(((int)py>>6)<<6) -0.0001; rx=(py-ry)*Tan+px; yo=-64; xo=-yo*Tan;}//looking up 
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	push	hl
	call	_getSin
	pop	af
	ld	c, l
	ld	b, h
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00247$
	xor	a, #0x80
00247$:
	jp	P, 00119$
	ld	-20 (ix), #0xfd
	ld	-19 (ix), #0xff
	ld	-18 (ix), #0xbf
	ld	-17 (ix), #0x43
	ld	l, -84 (ix)
	ld	h, -83 (ix)
	push	hl
	ld	l, -86 (ix)
	ld	h, -85 (ix)
	push	hl
	ld	hl, #0x4180
	push	hl
	ld	hl, #0x0034
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x4316
	push	hl
	ld	hl, #0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-16 (ix), c
	ld	-15 (ix), b
	ld	-14 (ix), e
	ld	-13 (ix), d
	xor	a, a
	ld	-30 (ix), a
	ld	-29 (ix), a
	ld	-28 (ix), #0x80
	ld	-27 (ix), #0xc2
	ld	l, -84 (ix)
	ld	h, -83 (ix)
	push	hl
	ld	l, -86 (ix)
	ld	h, -85 (ix)
	push	hl
	ld	hl, #0x4280
	push	hl
	ld	hl, #0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-34 (ix), c
	ld	-33 (ix), b
	ld	-32 (ix), e
	ld	-31 (ix), d
	jp	00126$
00119$:
;main.c:100: else if(getSin(ra)<-0.001){ ry=(((int)py>>6)<<6)+64;      rx=(py-ry)*Tan+px; yo= 64; xo=-yo*Tan;}//looking down
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	push	hl
	call	_getSin
	pop	af
	ld	-6 (ix), l
	ld	-5 (ix), h
	bit	7, -5 (ix)
	jp	Z, 00116$
	xor	a, a
	ld	-20 (ix), a
	ld	-19 (ix), a
	ld	-18 (ix), #0xe0
	ld	-17 (ix), #0x43
	ld	l, -84 (ix)
	ld	h, -83 (ix)
	push	hl
	ld	l, -86 (ix)
	ld	h, -85 (ix)
	push	hl
	ld	hl, #0xc240
	push	hl
	ld	hl, #0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x4316
	push	hl
	ld	hl, #0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-16 (ix), c
	ld	-15 (ix), b
	ld	-14 (ix), e
	ld	-13 (ix), d
	xor	a, a
	ld	-30 (ix), a
	ld	-29 (ix), a
	ld	-28 (ix), #0x80
	ld	-27 (ix), #0x42
	ld	l, -84 (ix)
	ld	h, -83 (ix)
	push	hl
	ld	l, -86 (ix)
	ld	h, -85 (ix)
	push	hl
	ld	hl, #0xc280
	push	hl
	ld	hl, #0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-34 (ix), l
	ld	-33 (ix), h
	ld	-32 (ix), e
	ld	-31 (ix), d
	jr	00126$
00116$:
;main.c:101: else{ rx=px; ry=py; dof=8;}                                                   //looking straight left or right
	xor	a, a
	ld	-16 (ix), a
	ld	-15 (ix), a
	ld	-14 (ix), #0x16
	ld	-13 (ix), #0x43
	xor	a, a
	ld	-20 (ix), a
	ld	-19 (ix), a
	ld	-18 (ix), #0xc8
	ld	-17 (ix), #0x43
	ld	-2 (ix), #0x08
	xor	a, a
	ld	-1 (ix), a
;main.c:103: while(dof<8) 
00126$:
	ld	a, -2 (ix)
	sub	a, #0x08
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00128$
;main.c:105: mx=(int)(rx)>>6; my=(int)(ry)>>6; mp=my*mapX+mx;                          
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	call	___fs2sint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	push	bc
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	push	hl
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	push	hl
	call	___fs2sint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	-6 (ix), l
	ld	-5 (ix), h
;main.c:106: if(mp>0 && mp<mapX*mapY && map[mp]==1){ dof=8; disH=getCos(ra)*(rx-px)-getSin(ra)*(ry-py);}//hit         
	xor	a, a
	cp	a, -6 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00248$
	xor	a, #0x80
00248$:
	jp	P, 00122$
	ld	a, -6 (ix)
	sub	a, #0x2a
	ld	a, -5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00122$
	ld	a, -40 (ix)
	add	a, -6 (ix)
	ld	c, a
	ld	a, -39 (ix)
	adc	a, -5 (ix)
	ld	b, a
	ld	a, (bc)
	dec	a
	jp	NZ,00122$
	ld	-2 (ix), #0x08
	xor	a, a
	ld	-1 (ix), a
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	push	hl
	call	_getCos
	ex	(sp),hl
	ld	hl, #0x4316
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	-6 (ix), e
	ld	-5 (ix), d
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	push	de
	push	bc
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	-10 (ix), e
	ld	-9 (ix), d
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	push	hl
	call	_getSin
	ex	(sp),hl
	ld	hl, #0x43c8
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	push	hl
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	-6 (ix), e
	ld	-5 (ix), d
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	push	de
	push	bc
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	push	de
	push	hl
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-10 (ix), c
	ld	-9 (ix), b
	ld	-8 (ix), e
	ld	-7 (ix), d
	jp	00126$
00122$:
;main.c:107: else{ rx+=xo; ry+=yo; dof+=1;}                                               //check next horizontal
	ld	l, -32 (ix)
	ld	h, -31 (ix)
	push	hl
	ld	l, -34 (ix)
	ld	h, -33 (ix)
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-16 (ix), c
	ld	-15 (ix), b
	ld	-14 (ix), e
	ld	-13 (ix), d
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	push	hl
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	push	hl
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	push	hl
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-20 (ix), c
	ld	-19 (ix), b
	ld	-18 (ix), e
	ld	-17 (ix), d
	inc	-2 (ix)
	jp	NZ,00126$
	inc	-1 (ix)
	jp	00126$
00128$:
;main.c:112: if(disV<disH){ rx=vx; ry=vy; disH=disV;}                  //horizontal hit first
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	ld	l, -24 (ix)
	ld	h, -23 (ix)
	push	hl
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
;main.c:115: int ca=FixAng(pa-ra); disH=disH*getCos(ca);                            //fix fisheye 
	ld	hl, (_pa)
	push	hl
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	l, -36 (ix)
	ld	h, -35 (ix)
	push	hl
	ld	l, -38 (ix)
	ld	h, -37 (ix)
	push	hl
	push	de
	push	bc
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	push	de
	push	hl
	call	___fs2sint
	pop	af
	ex	(sp),hl
	call	_FixAng
	ex	(sp),hl
	call	_getCos
;main.c:121: ra=FixAng(ra-1);                                                              //go to next ray
	ld	hl, #0x3f80
	ex	(sp),hl
	ld	hl, #0x0000
	push	hl
	ld	l, -36 (ix)
	ld	h, -35 (ix)
	push	hl
	ld	l, -38 (ix)
	ld	h, -37 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	push	de
	push	hl
	call	___fs2sint
	pop	af
	ex	(sp),hl
	call	_FixAng
	ex	(sp),hl
	call	___sint2fs
	pop	af
	ld	c, l
	ld	b, h
	ld	-38 (ix), c
	ld	-37 (ix), b
	ld	-36 (ix), e
	ld	-35 (ix), d
;main.c:79: for(r=0;r<60;r++)
	inc	-4 (ix)
	jr	NZ,00252$
	inc	-3 (ix)
00252$:
	ld	a, -4 (ix)
	sub	a, #0x3c
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00134$
;main.c:133: swap();
	call	_swap
;main.c:136: getKey();
	call	_getKey
;main.c:140: }
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
