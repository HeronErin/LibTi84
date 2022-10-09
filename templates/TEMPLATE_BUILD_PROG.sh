# create a folder in games/ for your program and copy this file in. Rename me to build.sh and change OUT_NAME to the name on the calc
export MAINC="main.c"
export OUT_NAME="NAME" # PUT YOUR PROG NAME HERE


sdasz80 -p -g -o tios_crt0.rel ../../tios_crt0.s
sdcc -Ilibti --no-std-crt0 --code-loc 40347 --data-loc 0 --std-sdcc99 -mz80 --reserve-regs-iy -o $OUT_NAME.ihx tios_crt0.rel $MAINC


objcopy -Iihex -Obinary $OUT_NAME.ihx $OUT_NAME.bin
python ../../binpac8x.py $OUT_NAME.bin -O $OUT_NAME

rm $OUT_NAME.asm $OUT_NAME.bin $OUT_NAME.ihx $OUT_NAME.lk $OUT_NAME.lst $OUT_NAME.map $OUT_NAME.noi $OUT_NAME.rel $OUT_NAME.sym tios_crt0.rel
# remove ^ the .asm remove for debuging  if you want to see the asm
