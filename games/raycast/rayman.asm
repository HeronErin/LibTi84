;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _FXstr
	.globl __intstr
	.globl _FXabs
	.globl _FXdiv
	.globl _FXmult
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _numberslong
	.globl _number
	.globl _badfill
	.globl _badclr
	.globl _setpix
	.globl _pixpos
	.globl _printc
	.globl ___cio__current_line
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
	.globl _vputs
	.globl _vputc
	.globl _print
	.globl _println
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
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
___cio__current_line::
	.ds 1
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
;../../src/cio.c:37: void vputs(char* s) {
;	---------------------------------
; Function vputs
; ---------------------------------
_vputs::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:42: __endasm;
	ld	l, 4(ix)
	ld	h, 5(ix)
;../../src/cio.c:43: bcall(_vputs);
	rst	40 
	.dw #0x4561 
;../../src/cio.c:44: }
	pop	ix
	ret
;../../src/cio.c:46: void vputc(char c) {
;	---------------------------------
; Function vputc
; ---------------------------------
_vputc::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:51: __endasm;
	ld	a, 4(ix)
;../../src/cio.c:52: bcall(_vputmap);
	rst	40 
	.dw #0x455E 
;../../src/cio.c:53: }
	pop	ix
	ret
;../../src/cio.c:56: void printc(char c) {
;	---------------------------------
; Function printc
; ---------------------------------
_printc::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:57: setPenRow(__cio__current_line);
	ld	a, (#___cio__current_line)
	push	af
	inc	sp
	call	_setPenRow
	inc	sp
;../../src/cio.c:58: vputc(c);
	ld	a, 4 (ix)
	push	af
	inc	sp
	call	_vputc
	inc	sp
;../../src/cio.c:59: }
	pop	ix
	ret
;../../src/cio.c:61: void print(char* s) {
;	---------------------------------
; Function print
; ---------------------------------
_print::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:62: setPenRow(__cio__current_line);
	ld	a, (#___cio__current_line)
	push	af
	inc	sp
	call	_setPenRow
	inc	sp
;../../src/cio.c:64: vputs(s);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_vputs
	pop	af
;../../src/cio.c:65: }
	pop	ix
	ret
;../../src/cio.c:67: void println(char* s) {
;	---------------------------------
; Function println
; ---------------------------------
_println::
	push	ix
;../../src/cio.c:68: print(s);
	ld	hl, #0 + 4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_print
	pop	af
;../../src/cio.c:69: newline();
;../../src/cio.c:70: }
	pop	ix
	jp	_newline
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
	jr	Z, 00103$
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
	ex	de, hl
	ld	hl, #_buff
	ld	a, (hl)
	add	a, e
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	b, a
	ld	a, (bc)
	ld	-1 (ix), a
	push	bc
	ld	hl, #0x0008
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de, hl
	pop	bc
	ld	a, #0x07
	sub	a, e
	ld	e, a
	ld	a, #0x01
	inc	e
	jr	00104$
00103$:
	add	a, a
00104$:
	dec	e
	jr	NZ,00103$
	or	a, -1 (ix)
	ld	(bc), a
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
;../../src/graphics.c:94: void number(int x){
;	---------------------------------
; Function number
; ---------------------------------
_number::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-29
	add	hl, sp
	ld	sp, hl
;../../src/graphics.c:96: if (x<0){
	bit	7, 5 (ix)
	jr	Z, 00113$
;../../src/graphics.c:97: x=0-x;
	xor	a, a
	sub	a, 4 (ix)
	ld	4 (ix), a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	5 (ix), a
;../../src/graphics.c:98: printc('-');
	ld	a, #0x2d
	push	af
	inc	sp
	call	_printc
	inc	sp
;../../src/graphics.c:101: do {
00113$:
	ld	hl, #0
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	bc, #0x0000
00103$:
;../../src/graphics.c:102: out[i]=x % 10 + '0';
	ld	a, -4 (ix)
	add	a, c
	ld	e, a
	ld	a, -3 (ix)
	adc	a, b
	ld	d, a
	push	bc
	push	de
	ld	hl, #0x000a
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	bc
	ld	a, -2 (ix)
	add	a, #0x30
	ld	(de), a
;../../src/graphics.c:103: i+=1;
	inc	bc
;../../src/graphics.c:104: } while((x /= 10) > 0);
	push	bc
	ld	hl, #0x000a
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ex	de, hl
	pop	bc
	ld	4 (ix), e
	ld	5 (ix), d
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00139$
	xor	a, #0x80
00139$:
	jp	M, 00103$
;../../src/graphics.c:105: i--;
	dec	bc
00108$:
;../../src/graphics.c:106: for(;i>=0; i--){
	bit	7, b
	jr	NZ, 00110$
;../../src/graphics.c:107: printc(out[i]);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_printc
	inc	sp
	pop	bc
;../../src/graphics.c:106: for(;i>=0; i--){
	dec	bc
	jr	00108$
00110$:
;../../src/graphics.c:110: }
	ld	sp, ix
	pop	ix
	ret
;../../src/graphics.c:111: void numberslong(unsigned long x){
;	---------------------------------
; Function numberslong
; ---------------------------------
_numberslong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-31
	add	hl, sp
	ld	sp, hl
;../../src/graphics.c:115: do {
	ld	hl, #0
	add	hl, sp
	ld	-6 (ix), l
	ld	-5 (ix), h
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00101$:
;../../src/graphics.c:116: out[i]=x % 10 + '0';
	ld	a, -6 (ix)
	add	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, -1 (ix)
	ld	-3 (ix), a
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x000a
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modulong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a, l
	add	a, #0x30
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
;../../src/graphics.c:117: i+=1;
	inc	-2 (ix)
	jr	NZ, 00132$
	inc	-1 (ix)
00132$:
;../../src/graphics.c:118: } while((x /= 10) > 0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x000a
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__divulong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	4 (ix), c
	ld	5 (ix), b
	ld	6 (ix), e
	ld	7 (ix), d
	ld	a, d
	or	a, e
	or	a, b
	or	a, c
	jr	NZ, 00101$
;../../src/graphics.c:119: i--;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	dec	bc
00106$:
;../../src/graphics.c:120: for(;i>=0; i--){
	bit	7, b
	jr	NZ, 00108$
;../../src/graphics.c:121: printc(out[i]);
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_printc
	inc	sp
	pop	bc
;../../src/graphics.c:120: for(;i>=0; i--){
	dec	bc
	jr	00106$
00108$:
;../../src/graphics.c:124: }
	ld	sp, ix
	pop	ix
	ret
;../../src/graphics.c:171: void swap(){
;	---------------------------------
; Function swap
; ---------------------------------
_swap::
;../../src/graphics.c:172: bcall(0x486A);
	rst	40 
	.dw 0x486A 
;../../src/graphics.c:239: }
	ret
;../../src/graphics.c:241: int getKeyId(){
;	---------------------------------
; Function getKeyId
; ---------------------------------
_getKeyId::
;../../src/graphics.c:242: bcall(0x4015);
	rst	40 
	.dw 0x4015 
;../../src/graphics.c:243: return (int)(*((char*)(0x843F)));}
	ld	hl, #0x843f
	ld	l, (hl)
	ld	h, #0x00
	ret
;../../src/graphics.c:249: void init_graphics(){
;	---------------------------------
; Function init_graphics
; ---------------------------------
_init_graphics::
;../../src/graphics.c:250: buff = (char*)(SCREEN_BUFFER);
	ld	hl, #_buff
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x93
;../../src/graphics.c:251: }
	ret
;../../src/fixedpoint.h:38: fixedpt FXmult(fixedpt* a, fixedpt* b){
;	---------------------------------
; Function FXmult
; ---------------------------------
_FXmult::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;../../src/fixedpoint.h:39: return fixedpt_xmul(*a, *b);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	inc	sp
	inc	sp
	push	bc
	ld	-14 (ix), e
	ld	-13 (ix), a
	rla
	sbc	a, a
	ld	-12 (ix), a
	ld	-11 (ix), a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), c
	ld	-7 (ix), b
	ld	-6 (ix), e
	ld	-5 (ix), a
	rla
	sbc	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), a
	ld	l, a
	ld	h, a
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	ld	hl, #0x0018
	add	hl, sp
	push	hl
	call	__mullonglong
	ld	hl, #18
	add	hl, sp
	ld	sp, hl
	ld	b, #0x08
00103$:
	sra	-1 (ix)
	rr	-2 (ix)
	rr	-3 (ix)
	rr	-4 (ix)
	rr	-5 (ix)
	rr	-6 (ix)
	rr	-7 (ix)
	rr	-8 (ix)
	djnz	00103$
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	e, -6 (ix)
	ld	d, -5 (ix)
;../../src/fixedpoint.h:40: }
	ld	sp, ix
	pop	ix
	ret
;../../src/fixedpoint.h:41: fixedpt FXdiv(fixedpt* a, fixedpt* b){
;	---------------------------------
; Function FXdiv
; ---------------------------------
_FXdiv::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;../../src/fixedpoint.h:42: return fixedpt_xdiv(*a, *b);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), c
	ld	-7 (ix), b
	ld	-6 (ix), e
	ld	-5 (ix), a
	rla
	sbc	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), a
	ld	a, -8 (ix)
	ld	-15 (ix), a
	ld	a, -7 (ix)
	ld	-14 (ix), a
	ld	a, -6 (ix)
	ld	-13 (ix), a
	ld	a, -5 (ix)
	ld	-12 (ix), a
	ld	a, -4 (ix)
	ld	-11 (ix), a
	ld	a, -3 (ix)
	ld	-10 (ix), a
	ld	a, -2 (ix)
	ld	-9 (ix), a
	ld	-16 (ix), #0
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), c
	ld	-7 (ix), b
	ld	-6 (ix), e
	ld	-5 (ix), a
	rla
	sbc	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), a
	ld	l, a
	ld	h, a
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	ld	hl, #0x0018
	add	hl, sp
	push	hl
	call	__divslonglong
	ld	hl, #18
	add	hl, sp
	ld	sp, hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	e, -6 (ix)
	ld	d, -5 (ix)
;../../src/fixedpoint.h:43: }
	ld	sp, ix
	pop	ix
	ret
;../../src/fixedpoint.h:44: fixedpt FXabs(fixedpt a){
;	---------------------------------
; Function FXabs
; ---------------------------------
_FXabs::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/fixedpoint.h:45: return fixedpt_abs(a);
	bit	7, 7 (ix)
	jr	Z, 00103$
	xor	a, a
	sub	a, 4 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	b, a
	ld	a, #0x00
	sbc	a, 6 (ix)
	ld	e, a
	ld	a, #0x00
	sbc	a, 7 (ix)
	ld	d, a
	jr	00104$
00103$:
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
00104$:
	ld	l, c
	ld	h, b
;../../src/fixedpoint.h:46: }
	pop	ix
	ret
;../../src/fixedpoint.h:47: void _intstr(fixedpt* inp, char* out, char* ecount){
;	---------------------------------
; Function _intstr
; ---------------------------------
__intstr::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-19
	add	hl, sp
	ld	sp, hl
;../../src/fixedpoint.h:48: fixedpt inp2 = *inp;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	hl, #0x000a
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
;../../src/fixedpoint.h:50: char i = 0;
	ld	-5 (ix), #0
;../../src/fixedpoint.h:52: do {
	ld	hl, #0
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
00101$:
;../../src/fixedpoint.h:53: temp[i]=inp2 % 10 + '0';
	ld	a, -4 (ix)
	add	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x000a
	push	hl
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	push	hl
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	push	hl
	call	__modslong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a, l
	add	a, #0x30
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), a
;../../src/fixedpoint.h:54: i+=1;
	inc	-5 (ix)
;../../src/fixedpoint.h:55: } while((inp2 /= 10) > 0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x000a
	push	hl
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	push	hl
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	push	hl
	call	__divslong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-9 (ix), c
	ld	-8 (ix), b
	ld	-7 (ix), e
	ld	-6 (ix), d
	xor	a, a
	cp	a, c
	sbc	a, b
	ld	a, #0x00
	sbc	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	jp	M, 00101$
;../../src/fixedpoint.h:59: while (i != 0){
	ld	c, -5 (ix)
00104$:
	ld	a, c
	or	a, a
	jr	Z, 00107$
;../../src/fixedpoint.h:60: i--;
	dec	c
;../../src/fixedpoint.h:61: char v =*ecount;
	ld	e, 8 (ix)
	ld	d, 9 (ix)
	ld	a, (de)
	ld	b, a
;../../src/fixedpoint.h:62: out[ v ] = temp[i];
	ld	a, 6 (ix)
	add	a, b
	ld	-2 (ix), a
	ld	a, 7 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	a, -4 (ix)
	add	a, c
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), a
;../../src/fixedpoint.h:63: *ecount = v+1;
	ld	a, b
	inc	a
	ld	(de), a
	jr	00104$
00107$:
;../../src/fixedpoint.h:66: }
	ld	sp, ix
	pop	ix
	ret
;../../src/fixedpoint.h:67: void FXstr(fixedpt num, char* out){
;	---------------------------------
; Function FXstr
; ---------------------------------
_FXstr::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;../../src/fixedpoint.h:69: char i = 0;
	ld	-2 (ix), #0
;../../src/fixedpoint.h:70: fixedpt x = num>> FIXEDPT_FBITS;
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	ld	a, #0x08
00124$:
	sra	d
	rr	e
	rr	b
	rr	c
	dec	a
	jr	NZ, 00124$
	inc	sp
	inc	sp
	push	bc
	ld	-14 (ix), e
	ld	-13 (ix), d
;../../src/fixedpoint.h:73: if (x<0){
	bit	7, d
	jr	Z, 00102$
;../../src/fixedpoint.h:74: x=-x;
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #0x0000
	sbc	hl, de
	ex	de, hl
	inc	sp
	inc	sp
	push	bc
	ld	-14 (ix), e
	ld	-13 (ix), d
;../../src/fixedpoint.h:75: out[i] = '-';
	ld	c, 8 (ix)
	ld	b, 9 (ix)
	ld	a, #0x2d
	ld	(bc), a
;../../src/fixedpoint.h:76: i++;
	inc	-2 (ix)
00102$:
;../../src/fixedpoint.h:79: _intstr(&x, out, &i);
	ld	hl, #14
	add	hl, sp
	ex	de, hl
	ld	c, e
	ld	b, d
	ld	hl, #0
	add	hl, sp
	push	bc
	ex	de, hl
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
	push	de
	call	__intstr
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;../../src/fixedpoint.h:81: out[i] = '.';
	ld	a, 8 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, 9 (ix)
	adc	a, #0x00
	ld	l, c
	ld	h, a
	ld	(hl), #0x2e
;../../src/fixedpoint.h:82: i++;
	inc	-2 (ix)
;../../src/fixedpoint.h:83: fixedpt ten = FIXEDPT_TEN;
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x0a
	xor	a, a
	ld	-6 (ix), a
	ld	-5 (ix), a
;../../src/fixedpoint.h:85: while ((frac = num & ((1 << FIXEDPT_FBITS) - 1)) != 0 ){
	ld	a, -2 (ix)
	ld	-1 (ix), a
00103$:
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	de, #0x0000
	ld	-12 (ix), c
	ld	-11 (ix), b
	ld	-10 (ix), e
	ld	-9 (ix), d
;../../src/fixedpoint.h:88: out[i] = ( num>>FIXEDPT_FBITS )+'0';
	ld	a, 8 (ix)
	add	a, -1 (ix)
	ld	-4 (ix), a
	ld	a, 9 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
;../../src/fixedpoint.h:85: while ((frac = num & ((1 << FIXEDPT_FBITS) - 1)) != 0 ){
	ld	a, d
	or	a, e
	or	a, b
	or	a, c
	jr	Z, 00111$
;../../src/fixedpoint.h:86: num = FXmult(&frac, &ten);
	ld	hl, #8
	add	hl, sp
	ex	de, hl
	ld	c, e
	ld	b, d
	ld	hl, #4
	add	hl, sp
	push	bc
	push	hl
	call	_FXmult
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	4 (ix), c
	ld	5 (ix), b
	ld	6 (ix), e
	ld	7 (ix), d
;../../src/fixedpoint.h:88: out[i] = ( num>>FIXEDPT_FBITS )+'0';
	ld	a, b
	add	a, #0x30
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
;../../src/fixedpoint.h:89: i++;
	inc	-1 (ix)
	ld	a, -1 (ix)
	ld	-2 (ix), a
	jr	00103$
00111$:
	ld	a, -1 (ix)
	ld	-2 (ix), a
;../../src/fixedpoint.h:95: out[i] = 0;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), #0x00
;../../src/fixedpoint.h:97: }
	ld	sp, ix
	pop	ix
	ret
;main.c:25: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-50
	add	hl, sp
	ld	sp, hl
;main.c:26: clearscreen();
	call	_clearscreen
;main.c:32: , (char*)&out);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	c, e
	ld	b, d
	push	de
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x0524
	push	hl
	call	_FXstr
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	call	_print
	pop	af
;main.c:35: getKey();
	call	_getKey
;main.c:38: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
