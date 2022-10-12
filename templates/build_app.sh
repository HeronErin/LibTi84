# WORKS BUT BREAKS MOST FUNCTIONS
# USE ONLY IF YOU KNOW WHAT YOUR DOING
export MAINC="main.c"
export OUT_NAME="rapp" # NOT USED MODIFY tios_crt0_app.s AND KEEP THE NAME TO 8 CHARS!!!


sdasz80 -p -g -o tios_crt0.rel ../../tios_crt0_app.s
sdcc -Ilibti --no-std-crt0 --code-loc 16429 --data-loc 0 --std-sdcc99 -mz80 --reserve-regs-iy -o $OUT_NAME.ihx tios_crt0.rel $MAINC


objcopy -Iihex -Obinary $OUT_NAME.ihx $OUT_NAME.bin


rm $OUT_NAME.lk $OUT_NAME.lst $OUT_NAME.map $OUT_NAME.noi $OUT_NAME.rel $OUT_NAME.sym tios_crt0.rel


../../rabbitsign -t 8xk -g -f $OUT_NAME.bin
