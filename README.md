#DEPRECATED!!!

Please use the new [TiConstructor](https://github.com/HeronErin/TiConstructor) instead of this! It May have a bit less features, but is overall less bloated and allows for building as both flash apps and programs dynamicly.



LibTI84
=====

LibTI84 is a C library for TI-based calculators. It relies on SDCC and a bunch of tools to compile to the TI-84+. Its meant to be a "CE C/C++ Toolchain" for the ti-84+ non CE.

Many useful functions are available, and many graphics libraries. But this project has been me adding to it as I learn something new about the TI-84, so its not that organized and I need to write some documentation. If you want to use this, look at the src, It is a mess. I plan on doing some reorganization but don't rely on it. Look in games/ for examples if you want to know how to use my functions.


If you want to play my completed games goto releases.

Required preprocesser settings
-----------

To save storage space use #define to tell what function you wish to use. Include the setting.h for automatic defining dependancies required by other moduels. And remember to #define before all the includes. 

I'm not going to state them all here so look at the src for all the functions avalible. 




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
* [Some usefull bcalls](http://jgmalcolm.com/z80/intermediate/romc)
* [wikiti for almost all bcalls and ram addresses](https://wikiti.brandonw.net/index.php?title=Calculator_Documentation)
* [Hub of ti dev community](https://www.cemetech.net/tools/ti84p)
* [The original LibTi I build from.](https://github.com/azertyfun/LibTI)








_I am not the origin of this tool, I stole the base of this from the original [LibTi](https://github.com/azertyfun/LibTI)_
