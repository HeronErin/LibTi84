#pragma once

#ifdef USE_SQRT
// int isqrt(int numb )
// {
//     int root = 0, bit = 0x04000;
//     while ( bit != 0 )
//     {
//         if ( numb >= root + bit )
//         {
//             numb = numb - root - bit;
//             root = root / 2 + bit;
//         }
//         else
//             root = root / 2;
//         bit = bit / 4;
//     }
//     return root;
// }
unsigned long isqrt(unsigned int x){
    for (unsigned long i = 0; i < x; i+=10){
        
        unsigned long b = (i/10)*(i/10);
        
        if (b == x)
            return i;
        
        if (b > x){
            // printf("%lu\n", b);            
            unsigned long c = (i-10);
            
            // return x2;
 
   

            for (unsigned int per = 1; per < 10; ++per){
                
                unsigned long d = c+(per*10*100);
               
                

                d=d*d/10000;

                if (d > x){
                    c += ((per-1)*10*100);
                    // printf("%d\n", c);
                    break;
                }
            }

            
            return c/10;
        }
    }
}
#endif



#define slong signed long
#ifdef USE_DEG_2_RAD
slong deg2rad(slong r){
    return (3141/18)*r/10;
}

#endif

#ifdef  USE_FACT
slong factorial(slong n){
    slong n2 = n;
    n=1;
    while (n2!=0){
        n*=n2;
        n2--;
    }
    return n;
}
#endif
#ifdef USE_POWWW
slong poww(slong base, slong power){
    slong base2 = base;
    while (power != 1){
        base2*=base;
        power-=1;
    }
    return base2;
}
#endif
#ifdef USE_SIN_COS
slong sine(slong x){
    while (x < -314)
        x+=628;
    while (x > 314)
        x -= 628;
    
    if (x > 0)
        return ( (-41*(x*x)/100) ) + (131*x) -500;
    else{
        x = 0-x;
        return 0-(( (-41*(x*x)/100) ) + (131*x) -500);
    }
}
slong coss(slong x){
    while (x < -314)
        x+=628;
    while (x > 314)
        x -= 628;
    return sine(157-(x));
}
#endif
#ifdef USE_ABS_VAL
slong absVal(slong x){
    if (x<0){
        return 0-x;
    }
    return x;
}
#endif
#ifdef USE_ABS_INT
int absint(int x){
    if (x<0){
        return 0-x;
    }
    return x;
}
#endif

#ifdef TANS_PRE
short int tans[] = {0, 17, 36, 57, 83, 119, 173, 274, 567, 1000, -567, -274, -173, -119, -83, -57, -36, -17, 0, 17, 36, 57, 83, 119, 173, 274, 567, 1000, -567, -274, -173, -119, -83, -57, -36, -17};
int getTan(int deg){
    int adeg = absint(deg);
    return (deg/adeg)*tans[adeg%360/10];
}
#endif
#ifdef COS_PRE
signed char cosses[] = {100, 98, 93, 86, 76, 64, 50, 34, 17, 0, -17, -34, -49, -64, -76, -86, -93, -98, -100, -98, -93, -86, -76, -64, -50, -34, -17, 0, 17, 34, 50, 64, 76, 86, 93, 98};
int getCos(int deg){
    return cosses[absint(deg)%360/10];
}
#endif
#ifdef SIN_PRE
signed char sins[] = {0, 17, 34, 49, 64, 76, 86, 93, 98, 100, 98, 93, 86, 76, 64, 49, 34, 17, 0, -17, -34, -50, -64, -76, -86, -93, -98, -100, -98, -93, -86, -76, -64, -50, -34, -17};
int getSin(int deg){
    int adeg = absint(deg);
    return (deg/adeg)*((int)sins[adeg%360/10]);
}
#endif



#ifdef MIN_MAX
int max(int x, int y){
    if (x<y){
        return y;
    }
    return x;
}
int min(int x, int y){
    if (x<y){
        return x;
    }
    return y;
}
#endif



#ifdef USE_VEC
struct Vec3{
    slong x;
    slong y;
    slong z;
};
struct Vec2{
    slong x;
    slong y;
};
#endif
#ifdef PROJ_NO_ROT
void projectNoRot(slong x, slong z, slong y, struct Vec2 *out){
    x = camPos->x - x;
    y = camPos->y - y;
    z = camPos->z - z;
    out->x = -69420;
    if (z < 0){
        out->x = (x*30)/(z) + (96/2);
        out->y = (y*30)/(z);
    }
}
#endif
#ifdef ROT_PROJ
void project(slong x, slong z, slong y, struct Vec2 *out){
    x = camPos->x - x;
    y = camPos->y - y;
    z = camPos->z - z;
    slong deg = deg2rad(1);
    slong sx = sine(deg)/100;
    slong sy = sx;
    slong sz = sx;
    
    
    slong cx = coss(deg)/10;

    slong cy = cx;
    slong  cz = cx;
    // out->y = (int)cx;

    slong  temp1 = (cy * z/100 + sy *(sz*y+cz*x)/1000000 );
    slong  temp2 = (cz * y - sz*x);
    slong dx = (cy * (sz * y + cz * x)*100 - sy*z)/10000;
    slong dy = (sx * temp1 + cx * temp2/100);
    slong dz = (cx * temp1 - sx * temp2/100);

    out->x = (dx*4)/dz;
    out->y = (dy*4)/dz;
    // out->x = sx;
    // out->y = cx;
    // printf("x%li y%li z%li : x%li y%li", dx, dy, dz, dx/dz, dy/dz);
}
#endif