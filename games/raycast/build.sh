export MAINC="main.c"
export OUT_NAME="rayman"


sdasz80 -p -g -o tios_crt0.rel tios_crt0.s
sdcc -Ilibti --no-std-crt0 --code-loc 40347 --data-loc 0 --std-sdcc99 -mz80 --reserve-regs-iy -o $OUT_NAME.ihx tios_crt0.rel $MAINC


objcopy -Iihex -Obinary $OUT_NAME.ihx $OUT_NAME.bin
python binpac8x.py $OUT_NAME.bin -O $OUT_NAME

rm $OUT_NAME.bin $OUT_NAME.ihx $OUT_NAME.lk $OUT_NAME.lst $OUT_NAME.map $OUT_NAME.noi $OUT_NAME.rel $OUT_NAME.sym tios_crt0.rel
