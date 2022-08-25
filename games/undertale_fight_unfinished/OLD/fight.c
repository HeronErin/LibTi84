

char boolpos = 0;
bool iscursing;
int fscore;
bool renderFight(int k){

	if (k==0x09&holdingKey==false){
		if (iscursing){
			fscore=30-boolpos;
			if (fscore<0)
				fscore=0-fscore;
			reviveScreenFromAppBackup();
			sanScore-= 10 - ((100*fscore)/30)/10;


			renderSansHealth(10, 10, sanScore/10);
			swap();
			wait(16);
			firstrun=false;
			state = SELECT_STATE;
			boolpos=0;
			holdingKey=true;
			return true;
		}
	}
	int lp = YMAX-30;
	if (firstscreen){
		badclr();
		drawbitmap(0, YMAX-31, 12, 28, gui1);
		drawbitmap(0, lp, 12, 15, attack);
		drawbitmap(XMAX/2, 7, 3, 21, sanHead);
		saveScreenToAppBackup();
		firstscreen=false;
	}
	reviveScreenFromAppBackup();
	if (iscursing){

		boolpos+=2;
		if (boolpos>60){
			boolpos=0;
		}
		vline(15+boolpos, lp, 15);
		vline(15+boolpos+1, lp, 15);
		vline(15+boolpos+2, lp, 15);
	}

	swap();

	return false;
}