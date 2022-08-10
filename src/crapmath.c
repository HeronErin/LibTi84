#pragma once

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