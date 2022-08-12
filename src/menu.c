#pragma once

#ifdef MAKE_MENUS
void menu_putstr(char* str, int ind){
	newline();
	number(ind);
	print(". ");
	print(str);
}
int menu_loop(){
	int k = getKey()-0x8E;
	if (k < 0){
		k = 1;
	}else if (k > 30){
		k = 1;
	}
	resetcursor();
	return k;
}

#endif