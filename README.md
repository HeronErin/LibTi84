LibTI
=====

LibTI is a C library for TI-based calculators. It relies on SDCC and a bunch of tools to compile to the TI-84+.

The library itself consists of useful functions I'll add over time. Standard algorithms will stay close to the C stdlib, but glue functions (such as the IO ones in src/cio.h) most probably won't!

It also has some functions for graphics in src/graphics.c that have been added. But graphics.c is a bad name for it as it also contains the wait function that waits int multiples of 1/8th of a secound.


If you want to play my horrible tetris clone you can download it [here](https://github.com/HeronErin/LibTi84/raw/master/games/tetris/tetris.8xp)


Make it work
------------

In case you happen to want to make it work, here's some tips:

* It only works for linux now, in games/tetris you can find my build.sh file and make it work for you.
* It is meant to run on the TI-84+, but you can probably make it run on any related z80-based calculator. Replace binpac8x program by its equivalent, check the tios_crt0.s file (especially the .org directives, I don't know if you are supposed to have the same offset on other calculators. Make sure the second org directive is equals to the first one plus 8) and create another mapping file from your calculator's assembly library (like ti83plus.inc). Oh, and did I mention courage?
* Wabbitemu happens to have a very decent debugger, so if you managed to compile some stuff but it doesn't work, check that ! (tip: on the 84+, your assembled code will start at 0x9D9B)
* If you run your code on a real calculater always back up your programs and variables. In the making of my tetris game I was constantly having to reset the ram.




Some useful resource
------------
* [Best guide to z80 asm](https://taricorp.gitlab.io/83pa28d/index.html)
* [wikiti for almost all bcalls and ram addresses](https://wikiti.brandonw.net/index.php?title=Calculator_Documentation)
* [Hub of ti dev community](https://www.cemetech.net/tools/ti84p)
* [The original LibTi I build from.](https://github.com/azertyfun/LibTI)
