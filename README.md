#MakeExample
This Makefile is for basic local c/c++ programming

To get started, once cloned, run "make setup" to create the basic file structure

supported file types is 
 .c and .clib in src/c

 .cxx and .libxx in src/cxx

 .h in inc/c/h and inc/cxx/h

 .a in lib/a
 
 .so in lib/so

The following commands exist:
 help; shows this menu

 setup; create base folder structure

 crel; creates a release executable from c code

 cdbg; creates a debug executable from c code

 cxxrel; creates a release executable from c++ code

 cxxdbg; creates a debug executable from c++ code

 shared; required for shared library creation, used with clib or libxx

 static; required for static library creation, used with clib or libxx

 clib; creates a library from c code

 libxx; creates a library from c++ code
