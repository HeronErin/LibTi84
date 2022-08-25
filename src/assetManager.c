#pragma once
#pragma disable_warning 59

#ifdef USE_NULLCP
void nullcp(char* to, char* from){
	to[0] = '\x15';
	for (int i =1; i < 10; ++i){
		to[i] = from[i-1];
		if (from[i] == 0)
			break;
	}
}
#endif
#ifdef USE_GET_INFO
int getInfo(char* name){
	
    nullcp((char*)(0x8478), name);
    char br = name[0];
    
    bcall(0x42F1);
	__asm
    	ld a, b
    __endasm;
    
    if (br != 0)
    	return br;
    else{
    	// return 0;
    	__asm
			ld h, d
			ld l, e
    	__endasm;
    }

}
#endif
#ifdef USE_ARCHIVE
void archiveToggle(char* name){	
    nullcp((char*)(0x8478), name);
    bcall(0x4FD8);
}
#endif
#ifdef USE_MKVAR
unsigned int makeVar(short size, char* name){
	size;
	nullcp((char*)(0x8478), name);
    
    __asm
		ld	l, 4 (ix)
		ld	h, 5 (ix)
    __endasm;
    // __asm
    // 	ld hl,(10)
    // __endasm;
    bcall(0x4E6A);
	__asm
		ld l, d
		ld h, e
	__endasm;
	// return t;
	// return 0x4E6A;
}
#endif


