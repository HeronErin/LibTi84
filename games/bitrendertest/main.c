#include "../../src/libti.c"

#include <stdbool.h>

#include "../../src/graphics.c"

char* eye_img;



#define IS_BIT_SET(value, pos) (value & (1U<< pos))
#define SET_BIT(value, pos) (value |= (1U<< pos))
#define CLEAR_BIT(value, pos) (value &= (~(1U<< pos)))

#define VARBIN        0x9872

#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);

void drawbitmap(int x, int y, int width, int height){
    for (int py =0; py<20; py++){
		for (int px = 0; px<3; px++){
			if((py+y)<YMAX){
				char pixbyte = eye_img[px+(py*3)];
				int tempY = ((py+y)*12);
				if (x%8==0){
					int pxb = px+(x/8);
					if (pxb<12)
						buff[tempY+pxb] |= pixbyte;
				}else{	
					for (char bp = 0; bp < 8; bp++){
						if (IS_BIT_SET(pixbyte, (7-bp))){
							int rx = bp+x+(px*8);
							if (rx<XMAX)
								buff[(rx/8) + tempY] |= 1<<(7-(rx%8));
						}
					}
				}

			}

		}
	}
}

void main() {
    init_graphics();
    clearscreen();
    // badclr();

    

    #include "imgs.c"
    eye_img = EYE_ARRAY;

    // 




    // swap();
    for (int x=0; x<XMAX; x++){
    	// wait128(6);
    	badclr();
    	drawbitmap(x, 5, 0, 0);
    	swap();
    }
    getKey();

}