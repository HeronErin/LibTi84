#include <stdbool.h>
#define RENDER_NUMS
#define USE_DRAW_BITMAP
#define USE_GET_INFO
#define RENDER_NUMSs
#define USE_ARCHIVE


#include "imgs.c"

#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"

#include "../../src/assetManager.c"






void main() {

    int loc = getInfo("datatale\0")+2;
    
    int* hwidth = (int*)(loc+HEART_WIDTH_OFF);
    int* hheight = (int*)(loc+HEART_HEIGHT_OFF);
    int* hlen = (int*)(loc+HEART_LENGTH_OFF);

    init_graphics();
    clearscreen();

    drawBitmap(0, 0, *hwidth, *hheight, (char*)(loc+HEART_LENGTH_OFF+4));

    swap();
    // number(*hwidth);
    // newline();
    // number(*hheight);


    getKey();
}