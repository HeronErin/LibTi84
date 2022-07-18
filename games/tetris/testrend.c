    memmk(coords, struct Vec2);
    coords->x = 2;
    coords->y = 1;
    int r = 0;
    while (true){
        badclr();
        if (getKeyId()==15)
            break;

        coords->x = 2;
        coords->y = 1;
    
        renderPiece(coords, 0, r);


        coords->x = 6;

        renderPiece(coords, 1, r);

        coords->x = 10;
        renderPiece(coords, 2, r);
        coords->x = 2;
        coords->y = 5;
        renderPiece(coords, 3, r);

        coords->x = 6;
        renderPiece(coords, 4, r);

        coords->x = 11;
        coords->y += 2;
        
        renderPiece(coords, 6, r);

        swap();
        r+=1;
    // // wait(64);
    // getKey();
        wait(8);
    }