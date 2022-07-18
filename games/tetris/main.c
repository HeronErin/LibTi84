#include "../../src/libti.c"

#include <stdbool.h>

#include "../../src/graphics.c"
int* pieces;
char* map;






#define VARBIN        0x9872

#define BLOCKSIZE      6
#define FALL_SPEED     6
#define MOVE_SPEED     3

#define YOFF 2


#define XLEN (XMAX/BLOCKSIZE)
#define YLEN (YMAX/BLOCKSIZE)

#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);



unsigned int Vtrack;


struct Vec2
{
    char x;
    char y;
};
void renderBlock(int x, int y){
    int x2 = BLOCKSIZE*x;
    int y2 = BLOCKSIZE*y;
    hline(x2, y2+YOFF, BLOCKSIZE);
    vline(x2, y2+YOFF, BLOCKSIZE);
    vline(x2+BLOCKSIZE, y2+YOFF, BLOCKSIZE);
    hline(x2, y2+BLOCKSIZE+YOFF, BLOCKSIZE);
}
void rotp(signed int *x, signed int *y, int r){
    r%=4;
    if (r == 1){
        int temp = *x;
        *x = 0-(*y);
        *y = temp;
    }else if (r == 2){
        *x = 0-(*x);
        *y = 0-(*y);
    }else if (r == 3){
        int temp = *x;
        *x = *y;
        *y = 0-temp;
    }
}
void renderPiece(struct Vec2 *piece, char num, int rot){
    for (int i =0; i<4; i++){
        int x = pieces[num*8+(i*2)];
        int y = pieces[num*8+(i*2)+1];

        if (num != 0)
            rotp(&x, &y, rot);

        renderBlock((piece->x)+x, (piece->y)+y);
    }
}
bool checkCol(struct Vec2 *piece,char num, int rot){
    for (int i =0; i<4; i++){
        int x = pieces[num*8+(i*2)];
        int y = pieces[num*8+(i*2)+1];

        if (num != 0)
            rotp(&x, &y, rot);
        y = (piece->y)+y;
        x = (piece->x)+x;
        if (y>=0){
            if (YLEN <=y | map[x+ (y*XLEN)]==0x01){
                return true;
            }
        }

    }
    return false;
}
bool checkSide(struct Vec2 *piece,char num, int rot){
    for (int i =0; i<4; i++){
        int x = pieces[num*8+(i*2)];
        int y = pieces[num*8+(i*2)+1];

        if (num != 0)
            rotp(&x, &y, rot);
        y = (piece->y)+y;
        x = (piece->x)+x;
        
        if (XLEN <=x |0>x){
            return true;
        }

    }
    return false;
}
bool addCoord(struct Vec2 *piece, int dx, int dy,char num, int rot){
    piece->x+=dx;
    piece->y+=dy;
    bool c = checkCol(piece, num,  rot);
    bool s = checkSide(piece, num,  rot);
    if (c){
        piece->x-=dx;
        piece->y-=dy;
    }
    if (s){
        piece->x-=dx;
    }
    return c;
}

void renderGround(){
    int yl = YLEN;
    int xl = XLEN;
    for (int y = 0; y<yl; y++){
        int py = (y*xl);
        for (int x = 0; x<xl; x++){
        
            // number(map[x+(y*yl)]);
            // return;
            if (map[x+py] == 0x01){
                renderBlock(x, y);
            }
        }   
    }
}
void solidif(struct Vec2 *piece,char num, int rot){
    for (int i =0; i<4; i++){
        int x = pieces[num*8+(i*2)];
        int y = pieces[num*8+(i*2)+1];

        if (num != 0)
            rotp(&x, &y, rot);

        map[((piece->x)+x) + (((piece->y)+y)*XLEN)] = 0x01;
    }
}
void moveup(int start){
    int xl = XLEN;
    int yl = YLEN;
    bool first = true;
    char* lrow=(char*)(Vtrack+1);
    for (int y =0; y<=start; y++){
        int ytime = y*xl;
        for (int x =0; x<xl; x++){
            char this = map[x+ytime];
            if (first==false){
                map[x+ytime]=lrow[x];
            }
            lrow[x]=this;
        }
        first=false;
    }
}
int getfull(){
    int xl = XLEN;
    int yl = YLEN;
    for (int y =0; y<yl; y++){
        int ytime = y*xl;
        bool emp = true;
        for (int x =0; x<xl; x++){
            if (map[x+ytime]==0x00)
                emp=false;
        }
        if (emp)
            return y;
    }
    return -1;
}
void main() {
    init_graphics();



    int ps[] = {
         0, 0,  1, 0,  0, 1,   1, 1 // 0 peice
        ,0, 0,  1, 0,  0, 1,  -1, 1 // S peice
        ,0, 0,  0, 1,  1, 1,  -1, 0 // Z peice
        ,0, 0,  0,-1, -1, 0,   1, 0 // T peice
        ,0, 0, -1, 0,  1, 0,   1,-1 // L peice
        ,0, 0, -1, 0,  1, 0,  -1,-1 // J peice
        ,0, 0, -1, 0,  1, 0,   2, 0 // I peice
    };
    int pc[] = {4, 2, 0, 5, 1, 3, 6};

    pieces = ps;
    Vtrack = VARBIN;
    
    int maplen = ( XLEN*YLEN )+1;
    map = (char*)Vtrack;

    Vtrack+=maplen;


    int ticker = 0;
    int o = pc[0];
    int R = 0;
    bool changeCurr = true;
    bool col = false;



    memmk(curr, struct Vec2);
    curr->x = XLEN/2;
    curr->y = 0;
    clearscreen();
    int lastmoved=0;
    int lastlastmoves = 0;
    int lastmovetime = 0;
    int lastsol = 0;
    bool holding = false;

    int score = 0;
    while (true){
        int x = getKeyId();

        if (x !=0){
            if (lastlastmoves != x | ticker-lastmovetime>MOVE_SPEED){  
                lastmoved=x;
                lastmovetime=ticker;
            }
            setPenCol(0);
            if (x == 15)
                break;
        }
        lastlastmoves = x;
        bool move = ticker%MOVE_SPEED==0;
        if (lastmoved==2 &move){
            col=addCoord(curr, -1, 0, 0, R);
            changeCurr=true;
            lastmoved=0;
        }
        else if (lastmoved==3 &move){
            
            col=addCoord(curr, 1, 0, o, R);
            changeCurr=true;
            lastmoved=0;
        }
        else if (lastmoved==0x09 &move){
            col=addCoord(curr, 1, 0, o, R);
            changeCurr=true;
            lastmoved=0;
        }
        else if (lastmoved==0x0A &move){
            R+=1;
            if (checkCol(curr, o, R)){
                R-=1;
            }
            changeCurr=true;
            lastmoved=0;
        }
        else if (lastmoved==0x0B &move){
            R-=1;
            if (checkCol(curr, o, R)){
                R+=1;
            }
            changeCurr=true;
            lastmoved=0;
        }
        else if (x==0x04){
            changeCurr=true;
            if (holding)
                holding = false;
            else
                holding = true;
        }
        else if (lastmoved==0x01){
            if (ticker==lastmovetime&ticker-lastsol>4){
                holding = false;
                changeCurr=true;
                while (col==false){
                    col=addCoord(curr, 0, 1, o, R);
                }
            }
        }
        else{
            if ((ticker%FALL_SPEED==0) & !holding){
                col=addCoord(curr, 0, 1, o, R);
                changeCurr=true;
            }

        }

        if (col){
            lastsol=ticker;
            
            solidif(curr, o, R);
            int gf = getfull();
            while (gf!=-1){
                moveup(gf);
                gf = getfull();
            }
            o = pc[ticker%7];
            curr->x = XLEN/2;
            curr->y = 0;
            col=false;
            R=0;
            if (checkCol(curr, o, R)){
                for (int i = 0; i<maplen; i++)
                    map[i] = 0x00;
                
                break;
            }
            score+=4;
            changeCurr=true;
        }
        ticker+=1;
        if (ticker>3000){ // attempt to fix theoretical signed 16 bit int rollover bugs
            ticker=0;
            lastmovetime=0;
            lastmoved=0;
            lastsol=0;
        }
        if (changeCurr){
            badclr();
            renderGround();
            renderPiece(curr, o, R);            
            swap();
            tprintf("Score: ");
            number(score);
            resetcursor();

            changeCurr=false;
        }
        
        
        
        wait(1);



    }



}
