#pragma once
#include <stdint.h>

typedef int32_t fixedpt;
typedef	int64_t	fixedptd;
typedef	uint64_t fixedptud;


#define FIXEDPT_BITS	16
#define FIXEDPT_WBITS	(FIXEDPT_BITS/2)

#define FIXEDPT_FBITS	(FIXEDPT_BITS - FIXEDPT_WBITS)
#define FIXEDPT_FMASK	(((fixedpt)1 << FIXEDPT_FBITS) - 1)
#define RMASK           (0xFFFF ^ FIXEDPT_FMASK)
#define fixedpt_rconst(R) ((fixedpt)((R) * FIXEDPT_ONE + ((R) >= 0 ? 0.5 : -0.5)))
#define fixedpt_fromint(I) ((fixedptd)(I) << FIXEDPT_FBITS)
#define fixedpt_toint(F) ((F) >> FIXEDPT_FBITS)
#define fixedpt_add(A,B) ((A) + (B))
#define fixedpt_sub(A,B) ((A) - (B))
#define fixedpt_xmul(A,B)						\
	((fixedpt)(((fixedptd)(A) * (fixedptd)(B)) >> FIXEDPT_FBITS))
#define fixedpt_xdiv(A,B)						\
	((fixedpt)(((fixedptd)(A) << FIXEDPT_FBITS) / (fixedptd)(B)))
#define fixedpt_fracpart(A) ((fixedpt)(A) & FIXEDPT_FMASK)

#define FIXEDPT_ONE	((fixedpt)((fixedpt)1 << FIXEDPT_FBITS))
#define FIXEDPT_TEN ((fixedpt)((fixedpt)10 << FIXEDPT_FBITS))
#define FIXEDPT_ONE_HALF (FIXEDPT_ONE >> 1)
#define FIXEDPT_TWO	(FIXEDPT_ONE + FIXEDPT_ONE)
#define FIXEDPT_PI	fixedpt_rconst(3.1415)
#define FIXEDPT_TWO_PI	fixedpt_rconst(2 * 3.1415)
#define FIXEDPT_HALF_PI	fixedpt_rconst(3.1415 / 2)
#define FIXEDPT_E	fixedpt_rconst(2.7182)


#define fixedpt_abs(A) ((A) < 0 ? -(A) : (A))

fixedpt FXmult(fixedpt* a, fixedpt* b){
	return fixedpt_xmul(*a, *b);
}
fixedpt FXdiv(fixedpt* a, fixedpt* b){
	return fixedpt_xdiv(*a, *b);
}
fixedpt FXabs(fixedpt a){
	return fixedpt_abs(a);
}
void _intstr(fixedpt* inp, char* out, char* ecount){
    fixedpt inp2 = *inp;
    char start = *ecount;
    char i = 0;
    char temp[10];
    do {
        temp[i]=inp2 % 10 + '0';
        i+=1;
    } while((inp2 /= 10) > 0);
    

    
    while (i != 0){
        i--;
        char v =*ecount;
        out[ v ] = temp[i];
        *ecount = v+1;
        
    }
}
void FXstr(fixedpt num, char* out){
    
    char i = 0;
    fixedpt x = num>> FIXEDPT_FBITS;
    fixedpt frac;

    if (x<0){
        x=-x;
        out[i] = '-';
        i++;
    }
    
    _intstr(&x, out, &i);
    
    out[i] = '.';
    i++;
    fixedpt ten = FIXEDPT_TEN;
    // number(num & ((1 << FIXEDPT_FBITS) - 1));
    while ((frac = num & ((1 << FIXEDPT_FBITS) - 1)) != 0 ){
        num = FXmult(&frac, &ten);
        
        out[i] = ( num>>FIXEDPT_FBITS )+'0';
        i++;

    }
    


    out[i] = 0;

}