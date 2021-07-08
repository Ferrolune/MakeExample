#MakeExample

understand that the design of this uses the following layout as seen in the folder view
the makefile expects files to exist in their proper folder.

supported file types is 
 .c and .clib in src/c
 
 .cxx and .libxx in src/cxx

 .h in inc/c/h and inc/cxx/h

 .a in lib/a
 .so is not supported yet

 

ruleset that is included for make

cxxrel: compiles to a C++ release build
cxxdbg: compiles to a C++ debug build
libxx : compiles to a C++ library

crel: compiles to a C release build
cdbg: compiles to a C debug build
clib: compiles to a C library

clean: removes bin and obj folders created during build.




