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
	.globl _fltA
	.globl _FixAng
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _badfill
	.globl _badclr
	.globl _setpix
	.globl _pixpos
	.globl _getSin
	.globl ___sinBypass
	.globl _getCos
	.globl ___cosBypass
	.globl _getTan
	.globl ___tanBypass
	.globl _absint
	.globl _mapp
	.globl _sins
	.globl _cosses
	.globl _tans
	.globl ___cio__current_line
	.globl _pdy
	.globl _pdx
	.globl _pa
	.globl _py
	.globl _px
	.globl _map
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
_map::
	.ds 2
_px::
	.ds 4
_py::
	.ds 4
_pa::
	.ds 4
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
_mapp::
	.ds 64
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
;../../src/crapmath.c:120: int absint(int x){
;	---------------------------------
; Function absint
; ---------------------------------
_absint::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:121: if (x<0){
	bit	7, 5 (ix)
	jr	Z, 00102$
;../../src/crapmath.c:122: return 0-x;
	xor	a, a
	sub	a, 4 (ix)
	ld	e, a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	d, a
	ex	de, hl
	jr	00103$
00102$:
;../../src/crapmath.c:124: return x;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
00103$:
;../../src/crapmath.c:125: }
	pop	ix
	ret
;../../src/crapmath.c:132: short int __tanBypass(int index){
;	---------------------------------
; Function __tanBypass
; ---------------------------------
___tanBypass::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:147: __endasm;
	ld	hl, #0 + 4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	ld	de, #__xinit__tans
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
;../../src/crapmath.c:148: }
	pop	ix
	ret
;../../src/crapmath.c:149: int getTan(int deg){
;	---------------------------------
; Function getTan
; ---------------------------------
_getTan::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:150: int adeg = absint(deg);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_absint
	pop	af
	ex	de, hl
;../../src/crapmath.c:151: return (deg/adeg)*__tanBypass(adeg%360/10);
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
	ex	de, hl
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divsint
	pop	af
	ex	(sp),hl
	call	___tanBypass
	pop	af
	ex	de, hl
	pop	bc
	push	de
	push	bc
	call	__mulint
	pop	af
	pop	af
;../../src/crapmath.c:152: }
	pop	ix
	ret
;../../src/crapmath.c:156: signed char __cosBypass(int index){
;	---------------------------------
; Function __cosBypass
; ---------------------------------
___cosBypass::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:166: __endasm;
	ld	a, #<(__xinit__cosses)
	add	a, 4 (ix)
	ld	c, a
	ld	a, #>(__xinit__cosses)
	adc	a, 5 (ix)
	ld	l, c
	ld	h, a
	ld	l, (hl)
;../../src/crapmath.c:167: }
	pop	ix
	ret
;../../src/crapmath.c:168: int getCos(int deg){
;	---------------------------------
; Function getCos
; ---------------------------------
_getCos::
	push	ix
;../../src/crapmath.c:169: return __cosBypass(absint(deg)%360/10);
	ld	hl, #0 + 4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_absint
	pop	af
	ex	de, hl
	ld	hl, #0x0168
	push	hl
	push	de
	call	__modsint
	pop	af
	pop	af
	ex	de, hl
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divsint
	pop	af
	ex	(sp),hl
	call	___cosBypass
	pop	af
	ld	a,l
	rla
	sbc	a, a
	ld	h, a
;../../src/crapmath.c:170: }
	pop	ix
	ret
;../../src/crapmath.c:175: signed char __sinBypass(int index){
;	---------------------------------
; Function __sinBypass
; ---------------------------------
___sinBypass::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:185: __endasm;
	ld	a, #<(__xinit__sins)
	add	a, 4 (ix)
	ld	c, a
	ld	a, #>(__xinit__sins)
	adc	a, 5 (ix)
	ld	l, c
	ld	h, a
	ld	l, (hl)
;../../src/crapmath.c:186: }
	pop	ix
	ret
;../../src/crapmath.c:187: int getSin(int deg){
;	---------------------------------
; Function getSin
; ---------------------------------
_getSin::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:188: int adeg = absint(deg);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_absint
	pop	af
	ex	de, hl
;../../src/crapmath.c:189: return (deg/adeg)*((int)__sinBypass(adeg%360/10));
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
	ex	de, hl
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divsint
	pop	af
	ex	(sp),hl
	call	___sinBypass
	pop	af
	ld	a, l
	pop	bc
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	push	de
	push	bc
	call	__mulint
	pop	af
	pop	af
;../../src/crapmath.c:190: }
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
;main.c:30: int FixAng(int a){
;	---------------------------------
; Function FixAng
; ---------------------------------
_FixAng::
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:31: if(a>359) 
	ld	a, #0x67
	cp	a, 4 (ix)
	ld	a, #0x01
	sbc	a, 5 (ix)
	jp	PO, 00117$
	xor	a, #0x80
00117$:
	jp	P, 00102$
;main.c:32: a-=360;
	ld	a, 4 (ix)
	add	a, #0x98
	ld	4 (ix), a
	ld	a, 5 (ix)
	adc	a, #0xfe
	ld	5 (ix), a
00102$:
;main.c:33: if(a<0)
	bit	7, 5 (ix)
	jr	Z, 00104$
;main.c:34: a+=360;
	ld	a, 4 (ix)
	add	a, #0x68
	ld	4 (ix), a
	ld	a, 5 (ix)
	adc	a, #0x01
	ld	5 (ix), a
00104$:
;main.c:35: return a;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
;main.c:36: }
	pop	ix
	ret
;main.c:114: float fltA(int ang){
;	---------------------------------
; Function fltA
; ---------------------------------
_fltA::
	push	ix
;main.c:115: return ((float)ang)/100;
	ld	hl, #0 + 4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
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
	ld	c,l
;main.c:116: }
	pop	ix
	ret
;main.c:117: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:118: px=150; py=400; pa=100;
	ld	hl, #_px
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x16
	inc	hl
	ld	(hl), #0x43
	ld	hl, #_py
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0xc8
	inc	hl
	ld	(hl), #0x43
	ld	hl, #_pa
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0xc8
	inc	hl
	ld	(hl), #0x42
;main.c:119: pdx=fltA(getCos(pa)); pdy=-fltA(getSin(pa)); 
	ld	hl, #0x0064
	push	hl
	call	_getCos
	ex	(sp),hl
	call	_fltA
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
	ld	hl, (_pa + 2)
	push	hl
	ld	hl, (_pa)
	push	hl
	call	___fs2sint
	pop	af
	ex	(sp),hl
	call	_getSin
	ex	(sp),hl
	call	_fltA
	pop	af
	ld	c, l
	ld	b, h
	ld	a, d
	xor	a,#0x80
	ld	hl, #_pdy + 3
	ld	(hl), a
	ld	a, c
	ld	(_pdy), a
	ld	a, b
	ld	(_pdy + 1), a
	ld	a, e
	ld	(_pdy + 2), a
;main.c:126: __endasm;
	ld	hl, #_map
	ld	(hl), #<(__xinit__mapp)
	inc	hl
	ld	(hl), #>(__xinit__mapp)
;main.c:129: clearscreen();
	call	_clearscreen
;main.c:130: resetcursor();
	call	_resetcursor
;main.c:131: init_graphics();
	call	_init_graphics
;main.c:133: getKey();
;main.c:136: }
	jp	_getKey
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
__xinit__mapp:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.area _CABS (ABS)
