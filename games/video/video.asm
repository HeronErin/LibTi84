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
	.globl _run
	.globl _loadNode
	.globl _getByte
	.globl _getBit
	.globl _lind
	.globl _imgind
	.globl _archiveToggle
	.globl _getInfo
	.globl _nullcp
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _wait128
	.globl _numberslong
	.globl _number
	.globl _badfill
	.globl _badclr
	.globl _setpix
	.globl _pixpos
	.globl _printc
	.globl ___cio__current_line
	.globl _bitc
	.globl _curr
	.globl _boff
	.globl _fsize
	.globl _ichuncks
	.globl _cchunck
	.globl _loc
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
_Vtrack::
	.ds 2
_loc::
	.ds 2
_cchunck::
	.ds 2
_ichuncks::
	.ds 2
_fsize::
	.ds 1
_boff::
	.ds 2
_curr::
	.ds 2
_bitc::
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
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:68: print(s);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
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
	jr	Z,00113$
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
	ex	de,hl
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
	jr	NZ,00110$
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
	jr	NZ,00132$
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
	jr	NZ,00101$
;../../src/graphics.c:119: i--;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	dec	bc
00106$:
;../../src/graphics.c:120: for(;i>=0; i--){
	bit	7, b
	jr	NZ,00108$
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
;../../src/graphics.c:149: void wait128(unsigned char x){ // Wait for amount of time (1/128th of sec)
;	---------------------------------
; Function wait128
; ---------------------------------
_wait128::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/graphics.c:166: __endasm;
	di
	ld	a,#0x46 ;128 hz
	out	(#0x30),a
	ld	a,#0x00 ; no loop, no interrupt
	out	(#0x31),a
	ld	a,4(ix)
	out	(#0x32),a
	    wait2:
	in	a,(4)
	bit	5,a ;bit 5 tells if timer 1
	jr	z,wait2 ;is done
	xor	a
	out	(#0x30),a ;Turn off the timer.
	out	(#0x31),a
;../../src/graphics.c:167: }
	pop	ix
	ret
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
;main.c:28: void nullcp(char* to, char* from){
;	---------------------------------
; Function nullcp
; ---------------------------------
_nullcp::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;main.c:29: for (int i =0; i < 10; ++i){
	ld	bc, #0x0000
00105$:
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00107$
;main.c:30: to[i] = from[i];
	ld	a, 4 (ix)
	add	a, c
	ld	-2 (ix), a
	ld	a, 5 (ix)
	adc	a, b
	ld	-1 (ix), a
	ld	a, 6 (ix)
	add	a, c
	ld	e, a
	ld	a, 7 (ix)
	adc	a, b
	ld	d, a
	ld	a, (de)
	pop	hl
	push	hl
	ld	(hl), a
;main.c:31: if (from[i] == 0)
	ld	a, (de)
	or	a, a
	jr	Z,00107$
;main.c:29: for (int i =0; i < 10; ++i){
	inc	bc
	jr	00105$
00107$:
;main.c:34: }
	ld	sp, ix
	pop	ix
	ret
;main.c:37: int getInfo(char* name){
;	---------------------------------
; Function getInfo
; ---------------------------------
_getInfo::
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:39: nullcp((char*)(0x8478), name);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	hl, #0x8478
	push	hl
	call	_nullcp
	pop	af
	pop	af
;main.c:40: char br = name[0];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, (bc)
;main.c:42: bcall(0x42F1);
	rst	40 
	.dw 0x42F1 
;main.c:45: __endasm;
	ld	a, b
;main.c:47: if (br != 0)
	or	a, a
	jr	Z,00102$
;main.c:48: return br;
	ld	l, a
	ld	h, #0x00
	jr	00104$
00102$:
;main.c:53: __endasm;
	ld	h, d
	ld	l, e
00104$:
;main.c:56: }
	pop	ix
	ret
;main.c:57: void archiveToggle(char* name){	
;	---------------------------------
; Function archiveToggle
; ---------------------------------
_archiveToggle::
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:58: nullcp((char*)(0x8478), name);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	hl, #0x8478
	push	hl
	call	_nullcp
	pop	af
	pop	af
;main.c:59: bcall(0x4FD8);
	rst	40 
	.dw 0x4FD8 
;main.c:60: }
	pop	ix
	ret
;main.c:66: char imgind(int x){
;	---------------------------------
; Function imgind
; ---------------------------------
_imgind::
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:67: return cchunck[1+(fsize*4)+x];
	ld	hl, #_fsize
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	inc	hl
	ld	c,l
	ld	b,h
	ld	a, c
	add	a, 4 (ix)
	ld	c, a
	ld	a, b
	adc	a, 5 (ix)
	ld	b, a
	ld	hl, #_cchunck
	ld	a, (hl)
	add	a, c
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	b, a
	ld	a, (bc)
	ld	l, a
;main.c:68: }
	pop	ix
	ret
;main.c:72: unsigned lind(int x){
;	---------------------------------
; Function lind
; ---------------------------------
_lind::
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:73: return ichuncks[x*2];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, #_ichuncks
	ld	a, (hl)
	add	a, c
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	b, a
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
;main.c:87: }
	pop	ix
	ret
;huffman.c:11: char getBit(){
;	---------------------------------
; Function getBit
; ---------------------------------
_getBit::
;huffman.c:12: char r = BIT(imgind(bitc/8 + boff), 7-(bitc%8));
	ld	bc, (_bitc)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	de, (_boff)
	ex	de,hl
	add	hl, bc
	push	hl
	call	_imgind
	pop	af
	ld	c, l
	ld	a, (#_bitc)
	and	a, #0x07
	ld	b, a
	ld	a, #0x07
	sub	a, b
	inc	a
	jr	00104$
00103$:
	srl	c
00104$:
	dec	a
	jr	NZ, 00103$
	ld	a, c
	and	a, #0x01
	ld	c, a
;huffman.c:14: ++bitc;
	ld	hl, (_bitc)
	inc	hl
	ld	(_bitc), hl
;huffman.c:15: return r;
	ld	l, c
;huffman.c:16: }
	ret
;huffman.c:17: unsigned char getByte(){
;	---------------------------------
; Function getByte
; ---------------------------------
_getByte::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;huffman.c:18: unsigned char out = 0;
	xor	a, a
	ld	-2 (ix), a
;huffman.c:19: int bpos = bitc/8;
	ld	de, (_bitc)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
;huffman.c:20: char st = bitc%8;
	ld	a, (#_bitc)
	and	a, #0x07
	ld	-1 (ix), a
;huffman.c:21: for (int i = 7; i >= 0; --i){
	ld	bc, #0x0007
00107$:
	bit	7, b
	jr	NZ,00105$
;huffman.c:22: if (st == 8){
	ld	a, -1 (ix)
	sub	a, #0x08
	jr	NZ,00102$
;huffman.c:23: st = 0;
	xor	a, a
	ld	-1 (ix), a
;huffman.c:24: ++bpos;
	inc	de
00102$:
;huffman.c:26: char b = BIT(imgind(bpos+boff), 7-(st));
	ld	a, e
	ld	hl, #_boff
	add	a, (hl)
	ld	-4 (ix), a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	-3 (ix), a
	push	bc
	push	de
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	_imgind
	pop	af
	ld	-3 (ix), l
	pop	de
	pop	bc
	ld	a, #0x07
	sub	a, -1 (ix)
	ld	l, -3 (ix)
	inc	a
	jr	00135$
00134$:
	srl	l
00135$:
	dec	a
	jr	NZ, 00134$
	ld	a, l
	and	a, #0x01
;huffman.c:27: if (b == 1){
	cp	a, #0x01
	jr	NZ,00104$
;huffman.c:29: out|=b<<(i);
	ld	l, a
	ld	a, c
	inc	a
	jr	00139$
00138$:
	sla	l
00139$:
	dec	a
	jr	NZ,00138$
	ld	a, l
	or	a, -2 (ix)
	ld	-2 (ix), a
00104$:
;huffman.c:33: ++bitc;
	ld	hl, (_bitc)
	inc	hl
	ld	(_bitc), hl
;huffman.c:34: ++st;
	inc	-1 (ix)
;huffman.c:21: for (int i = 7; i >= 0; --i){
	dec	bc
	jr	00107$
00105$:
;huffman.c:36: return out;
	ld	l, -2 (ix)
;huffman.c:37: }
	ld	sp, ix
	pop	ix
	ret
;huffman.c:38: struct huffman_node *loadNode(){
;	---------------------------------
; Function loadNode
; ---------------------------------
_loadNode::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;huffman.c:39: char bt = getBit();
	call	_getBit
	ld	-1 (ix), l
;huffman.c:41: memmk(ret, struct huffman_node);
	ld	bc, (_Vtrack)
	ld	hl, #_Vtrack
	ld	a, (hl)
	add	a, #0x05
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;huffman.c:42: ret->data = 0;
	xor	a, a
	ld	(bc), a
;huffman.c:43: ret->left = 0;
	ld	e, c
	ld	d, b
	inc	de
	ld	l, e
	ld	h, d
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;huffman.c:44: ret->right = 0;
	ld	hl, #0x0003
	add	hl, bc
	ex	(sp), hl
	pop	hl
	push	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;huffman.c:46: if (bt == 1){
	ld	a, -1 (ix)
	dec	a
	jr	NZ,00102$
;huffman.c:47: ret->left = loadNode();
	push	bc
	push	de
	call	_loadNode
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	bc
	ld	a, -2 (ix)
	ld	(de), a
	inc	de
	ld	a, -1 (ix)
	ld	(de), a
;huffman.c:48: ret->right = loadNode();
	push	bc
	call	_loadNode
	ex	de,hl
	pop	bc
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jr	00103$
00102$:
;huffman.c:50: ret->data = getByte();
	push	bc
	call	_getByte
	ld	a, l
	pop	bc
	ld	(bc), a
00103$:
;huffman.c:52: return ret;
	ld	l, c
	ld	h, b
;huffman.c:54: }
	ld	sp, ix
	pop	ix
	ret
;huffman.c:55: void run()
;	---------------------------------
; Function run
; ---------------------------------
_run::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;huffman.c:57: bitc=0;
	ld	hl, #_bitc
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;huffman.c:58: char off = getByte();
	call	_getByte
	ld	a, l
;huffman.c:59: if (off !=0){
	or	a, a
	jr	Z,00102$
;huffman.c:60: bitc+=8-off;
	ld	c, a
	ld	b, #0x00
	ld	a, #0x08
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #_bitc
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
00102$:
;huffman.c:64: struct huffman_node *ret = loadNode();
	call	_loadNode
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	bc
;huffman.c:65: off = getByte();
	call	_getByte
	ld	a, l
;huffman.c:66: if (off !=0){
	or	a, a
	jr	Z,00104$
;huffman.c:67: bitc+=8-off;
	ld	c, a
	ld	b, #0x00
	ld	a, #0x08
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #_bitc
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
00104$:
;huffman.c:69: struct huffman_node *cnode = ret;
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
;huffman.c:73: while (bitc < lind(curr)*8){
	ld	bc, #0x0000
00112$:
	push	bc
	ld	hl, (_curr)
	push	hl
	call	_lind
	pop	af
	ex	de,hl
	pop	bc
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl, #_bitc
	ld	a, (hl)
	sub	a, e
	inc	hl
	ld	a, (hl)
	sbc	a, d
	jr	NC,00115$
;huffman.c:74: char b = getBit();
	push	bc
	call	_getBit
	ld	a, l
	pop	bc
;huffman.c:75: if (b == 0){
	or	a, a
	jr	NZ,00106$
;huffman.c:76: cnode = cnode->left;
	pop	de
	pop	hl
	push	hl
	push	de
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	jr	00107$
00106$:
;huffman.c:79: cnode = cnode->right;   
	pop	de
	pop	hl
	push	hl
	push	de
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
00107$:
;huffman.c:82: if (cnode->left == 0){
	pop	de
	pop	hl
	push	hl
	push	de
	inc	hl
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	NZ,00112$
;huffman.c:83: buff[pos] = cnode->data;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	(de), a
;huffman.c:84: cnode = ret;
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
;huffman.c:85: ++pos;
	inc	bc
;huffman.c:86: if (pos > bsize)
	xor	a, a
	cp	a, c
	ld	a, #0x03
	sbc	a, b
	jp	PO, 00154$
	xor	a, #0x80
00154$:
	jp	P, 00112$
;huffman.c:87: return;
00115$:
;huffman.c:92: }
	ld	sp, ix
	pop	ix
	ret
;main.c:95: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-18
	add	hl, sp
	ld	sp, hl
;main.c:98: char *a[] = {"\x15TCK00\0", "\x15TCK01\0", "\x15TCK02\0", "\x15TCK03\0", "\x15TCK04\0", "\x15TCK05\0", "\x15TCK06\0"};
	ld	hl, #0
	add	hl, sp
	ld	c,l
	ld	b,h
	ld	(hl), #<(___str_0)
	inc	hl
	ld	(hl), #>(___str_0)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, #<(___str_1)
	ld	(de), a
	inc	de
	ld	a, #>(___str_1)
	ld	(de), a
	ld	hl, #0x0004
	add	hl, bc
	ex	de, hl
	ld	a, #<(___str_2)
	ld	(de), a
	inc	de
	ld	a, #>(___str_2)
	ld	(de), a
	ld	hl, #0x0006
	add	hl, bc
	ex	de, hl
	ld	a, #<(___str_3)
	ld	(de), a
	inc	de
	ld	a, #>(___str_3)
	ld	(de), a
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
	ld	a, #<(___str_4)
	ld	(de), a
	inc	de
	ld	a, #>(___str_4)
	ld	(de), a
	ld	hl, #0x000a
	add	hl, bc
	ex	de, hl
	ld	a, #<(___str_5)
	ld	(de), a
	inc	de
	ld	a, #>(___str_5)
	ld	(de), a
	ld	hl, #0x000c
	add	hl, bc
	ex	de, hl
	ld	a, #<(___str_6)
	ld	(de), a
	inc	de
	ld	a, #>(___str_6)
	ld	(de), a
;main.c:100: boff=0;
	ld	hl, #_boff
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:101: Vtrack = VARBIN;
	ld	hl, #_Vtrack
	ld	(hl), #0x72
	inc	hl
	ld	(hl), #0x98
;main.c:103: init_graphics();
	push	bc
	call	_init_graphics
	call	_clearscreen
	pop	bc
;main.c:105: archiveToggle(a[chunck]);
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	push	de
	call	_archiveToggle
	pop	af
	pop	bc
;main.c:106: loc = getInfo(a[chunck])+2;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	push	de
	call	_getInfo
	pop	af
	ld	e, l
	ld	d, h
	pop	bc
	inc	de
	inc	de
	ld	(_loc), de
;main.c:107: cchunck = (char*)(loc);
	push	hl
	ld	a, (#_loc)
	ld	(#_cchunck),a
	ld	a,(#_loc + 1)
	ld	(#_cchunck + 1),a
	pop	hl
;main.c:108: ichuncks = (int*)(loc+1);
	ld	de, (_loc)
	inc	de
	ld	(_ichuncks), de
;main.c:109: fsize = cchunck[0];
	ld	de, (_cchunck)
	ld	a, (de)
	ld	(#_fsize),a
;main.c:132: while (chunck < 7){
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00106$:
	ld	a, -2 (ix)
	sub	a, #0x07
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00112$
;main.c:133: for (curr = 0; curr < fsize; ++curr){
	ld	hl, #_curr
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
00110$:
	ld	hl, #_fsize
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_curr
	ld	a, (hl)
	sub	a, e
	inc	hl
	ld	a, (hl)
	sbc	a, d
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	jp	P, 00103$
;main.c:135: run();
	push	bc
	call	_run
	pop	bc
;main.c:136: Vtrack = VARBIN;
	ld	hl, #_Vtrack
	ld	(hl), #0x72
	inc	hl
	ld	(hl), #0x98
;main.c:137: swap();
	push	bc
	call	_swap
	ld	hl, (_curr)
	push	hl
	call	_lind
	pop	af
	ld	-4 (ix), l
	ld	-3 (ix), h
	pop	bc
	ld	de, (_boff)
	ld	a, e
	add	a, -4 (ix)
	ld	hl, #_boff
	ld	(hl), a
	ld	a, d
	adc	a, -3 (ix)
	inc	hl
	ld	(hl), a
;main.c:139: wait128(5);
	push	bc
	ld	a, #0x05
	push	af
	inc	sp
	call	_wait128
	inc	sp
	call	_getKeyId
	ex	de,hl
	pop	bc
	ld	a, e
	sub	a, #0x0f
	or	a, d
	jp	Z,00112$
	jr	00111$
;main.c:141: return;
	jp	00112$
00111$:
;main.c:133: for (curr = 0; curr < fsize; ++curr){
	ld	hl, (_curr)
	inc	hl
	ld	(_curr), hl
	jr	00110$
00103$:
;main.c:144: archiveToggle(a[chunck]);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	add	hl, hl
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	push	de
	call	_archiveToggle
	pop	af
	pop	bc
;main.c:145: chunck++;
	inc	-2 (ix)
	jr	NZ,00147$
	inc	-1 (ix)
00147$:
;main.c:146: if (chunck == 7)
	ld	a, -2 (ix)
	sub	a, #0x07
	or	a, -1 (ix)
	jr	Z,00112$
	jr	00105$
;main.c:147: return;
	jr	00112$
00105$:
;main.c:148: archiveToggle(a[chunck]);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	push	de
	push	hl
	call	_archiveToggle
	pop	af
	pop	de
	pop	bc
;main.c:150: loc = getInfo(a[chunck])+2;
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	push	de
	call	_getInfo
	pop	af
	ld	e, l
	ld	d, h
	pop	bc
	inc	de
	inc	de
	ld	(_loc), de
;main.c:151: cchunck = (char*)(loc);
	push	hl
	ld	a, (#_loc)
	ld	(#_cchunck),a
	ld	a,(#_loc + 1)
	ld	(#_cchunck + 1),a
	pop	hl
;main.c:152: ichuncks = (int*)(loc+1);
	ld	de, (_loc)
	inc	de
	ld	(_ichuncks), de
;main.c:153: fsize = cchunck[0];
	ld	de, (_cchunck)
	ld	a, (de)
	ld	(#_fsize),a
;main.c:154: Vtrack = VARBIN;
	ld	hl, #_Vtrack
	ld	(hl), #0x72
	inc	hl
	ld	(hl), #0x98
;main.c:155: boff=0;
	ld	hl, #_boff
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	jp	00106$
00112$:
;main.c:170: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.db 0x15
	.ascii "TCK00"
	.db 0x00
	.db 0x00
___str_1:
	.db 0x15
	.ascii "TCK01"
	.db 0x00
	.db 0x00
___str_2:
	.db 0x15
	.ascii "TCK02"
	.db 0x00
	.db 0x00
___str_3:
	.db 0x15
	.ascii "TCK03"
	.db 0x00
	.db 0x00
___str_4:
	.db 0x15
	.ascii "TCK04"
	.db 0x00
	.db 0x00
___str_5:
	.db 0x15
	.ascii "TCK05"
	.db 0x00
	.db 0x00
___str_6:
	.db 0x15
	.ascii "TCK06"
	.db 0x00
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
