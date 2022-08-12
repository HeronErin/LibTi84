int CURRENT_SEL;
bool renderSel(int k){
	badclr();
	if (k == 0x02 &holdingKey==false){
		holdingKey=true;
		if (CURRENT_SEL!=0)
			CURRENT_SEL-=1;
	}
	if (k == 0x03&holdingKey==false){
		holdingKey=true;
		if (CURRENT_SEL!=3)
			CURRENT_SEL+=1;
	}
	if (k == 0x09){
		if (CURRENT_SEL==0){
			holdingKey=true;
			firstrun=false;
			state = FIGHT_STATE;
		}
		if (CURRENT_SEL==3){
			return true;
		}
	}

	drawbitmap(0, YMAX-31, 12, 28, gui1);
	drawbitmap(XMAX/2, 7, 3, 21, sanHead);
	hline(6 + (23*CURRENT_SEL), YMAX-13 ,16);


	

	swap();
	if(firstrun){
		print("A wild sans has appeared...");
		resetcursor();
	}

	return false;
}