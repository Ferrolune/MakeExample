SHELL=/bin/sh
ORIGIN= .


#Compilers
CCOMPILER     := gcc
CXXCOMPILER   := g++


#Essential Settings
WALL          := -Wall			 #enable all compiler warning messages
WEXTRA        := -Wextra		 #enable extra compiler warnings that Wall doesn't
ESSENTIAL_OPT := $(WALL) $(WEXTRA)


#Common Settings
WERROR        := -Werror		 #make all warnings into errors
PEDANTIC      := -pedantic		 #point out some things as warnings, such as forbidden extensions
EPEDANTIC     := -pedantic-errors	 #turns said warnings above into errors instead, don't use with PEDANTIC
COMMON_OPT    := $(WERROR) $(PEDANTIC)


#Useful Settings
WFLOATEQ      := -Wfloat-equal		 #warn about float equality tests
WUNDEF	      := -Wundef		 #warn about evaluation of uninitialized macros in #if directives
WSHADOW       := -Wshadow		 #warns about variable shadowing
USEFUL_OPT    := $(WFLOATEQ) $(WUNDEF) $(WSHADOW)


#Pointer Settings
WPTRARITH     := -Wpointer-arith	 #warns about questionable pointer arithmetics
WPTRCASTALIGN := -Wcast-align=strict	 #warns about casts where a required alignment is increased, i.e. char* tries to modify an int*
WPTRNULLDREF  := -Wnull-dereference	 #warn when the compiler detects paths that dereferences a null pointer
WCASTQUAL     := -Wcast-qual		 #warn when a pointer is cast as to remove a type qualifier like const
POINTER_OPT   := $(WPTRARITH) $(WPTRCASTALIGN) $(WPTRNULLDREF) $(WCASTQUAL)


#Optimization Settings
O_LV0         := -O0
O_LV1         := -O1			 #optimize code size and execution time without compilation time reduction cuts
O_LV2         := -O2			 #optimize both compiliation, size, and execution further, almost all supported optimizations
O_LV3         := -O3			 #optimize further by using O2 including a few ignored optimizations
O_LV4         := -Ofast			 #YOLO, maximum optimization but disregard strict standard compliance, not recommended
O_S           := -Os			 #optimize for code size
O_G           := -Og		 	 #recommended optimization for debugging
WOPTERROR     := -Wdisabled-optimization #warn if the compiler optimization fails to handle the code effectively
DEBUG_OPT     := $(WOPTERROR) $(O_G)
OPTIMIZE_OPT  := $(WOPTERROR) $(O_LV2)


#Logic Settings
WDUPC         := -Wduplicated-cond	 #warn about duplicate conditions in if-else chains
WDUPB         := -Wduplicated-branches	 #warn about duplicate branches in if-else chains and conditional operators
WLOGIC        := -Wlogical-op		 #warn about the use of logical operators where bitwise may be intended
WJUMPMISS     := -Wjump-misses-init      #warn if goto statement or switch jumps over variable initialization causing problems later
C_LOGIC_OPT   := $(WDUPC) $(WDUPB) $(WLOGIC) $(WJUMPMISS)
CXX_LOGIC_OPT := $(WDUPC) $(WDUPB) $(WLOGIC) 


#Variable Settings
WUNNUSED      := -Wunused		 #warn if unused variable
WDUBPROM      := -Wdouble-promotion      #warn if float is promoted to double
CNO_LL        := -Wno-long-long		 #warn when using long long in C
CXXNO_LL      := -Wlong-long		 #warn when using long long in C++
WCONVERSION   := -Wconversion 		 #warn if data can be lost in an implicit conversion
WOLDCAST      := -Wold-style-cast        #warn if a C-type cast is used in a C++ program
VAR_OPTC      := $(WUNNUSED) $(WDUBPROM) $(CNO_LL)
VAR_OPTCXX    := $(WUNNUSED) $(WDUBPROM) $(CXXNO_LL)


#Extra Error Settings
WRESTRICT     := -Wrestrict		 #warn when the compiler detects a passed argument to a __restrict qualified parameter alias
WUSELESS      := -Wuseless-cast          #warn when an expression is cast to its own type in a C++ program
WFORMAT       := -Wformat=2              #warn if calls to printf, scanf or similar functions for having incorrectly formated strings
WMISSPROTO    := -Wmissing-prototypes    #warn if no prototypes are found
WAGGRET       := -Waggregate-return      #warn if a function returns structures, arrays, or unions are called
WDIVZERO      := -Wdiv-by-zero		 #warn if division by zero
CPP_EXTRA_OPT := $(WRESTRICT) $(WUSELESS) $(WFORMAT) $(WAGGRET) $(WDIVZERO)
C_EXTRA_OPT   := $(WRESTRICT) $(WFORMAT) $(WMISSPROTO) $(WAGGRET) $(WDIVZERO)


#C++ Standard Library Versions
STD_VERGNU    := -std=gnu++
STD_VER20     := -std=c++20
STD_VER17     := -std=c++17
STD_VER14     := -std=c++14
STD_VER11     := -std=c++11
SELECTEDVER   := $(STD_VER20)


#GCC Specific Settings
C_LINKER_OPT  := -L/usr/lib -lstdc++ -lm

#Finalized Options
CXX_OPT_SET_REL  := $(ESSENTIAL_OPT) $(COMMON_OPT) $(USEFUL_OPT) $(POINTER_OPT) $(OPTIMIZE_OPT) $(CXX_LOGIC_OPT) $(VAR_OPTCXX) $(CPP_EXTRA_OPT)
CXX_OPT_SET_DBG  := $(ESSENTIAL_OPT) $(COMMON_OPT) $(USEFUL_OPT) $(POINTER_OPT) $(DEBUG_OPT) $(CXX_LOGIC_OPT) $(VAR_OPTCXX) $(CPP_EXTRA_OPT)

C_OPT_SET_REL    := $(ESSENTIAL_OPT) $(COMMON_OPT) $(USEFUL_OPT) $(POINTER_OPT) $(OPTIMIZE_OPT) $(C_LOGIC_OPT) $(VAR_OPTC) $(C_EXTRA_OPT)
C_OPT_SET_DBG    := $(ESSENTIAL_OPT) $(COMMON_OPT) $(USEFUL_OPT) $(POINTER_OPT) $(DEBUG_OPT) $(C_LOGIC_OPT) $(VAR_OPTC) $(C_EXTRA_OPT)

#G++ Compile Settings for C++
CXX_RELEASE  := $(CXXCOMPILER) $(SELECTEDVER) $(CXX_OPT_SET_REL)
CXX_DEBUG    := $(CXXCOMPILER) $(SELECTEDVER) $(CXX_OPT_SET_DBG)


#GCC Compile Settings for C
C_RELEASE    := $(CCOMPILER) $(C_OPT_SET_REL)
C_DEBUG      := $(CCOMPILER) $(C_OPT_SET_DBG)




#Directories
BIN_DIR     := bin/
BUILD_DIR   := build/
SRC_DIR     := src/
INCLUDE_DIR := inc/
LIB_DIR     := lib/

#Output Name
EXECUTABLE  := $(BIN_DIR)main


#Subdirectories
OBJ_DIR     := $(BUILD_DIR)obj/
OBJ_DIR_LC   := $(OBJ_DIR)libs/c/
OBJ_DIR_LXX   := $(OBJ_DIR)libs/cxx/

OBJ_DIR_C   := $(OBJ_DIR)prog/c/
OBJ_DIR_CXX := $(OBJ_DIR)prog/cxx/

C_DIR       := $(SRC_DIR)c/
C_H_DIR     := $(INCLUDE_DIR)c/h/
C_TMP       := $(C_DIR)tmp/

CXX_DIR     := $(SRC_DIR)cxx/
CXX_H_DIR   := $(INCLUDE_DIR)cxx/h/
CXX_TMP     := $(CXX_DIR)tmp/


#Files
CSRC        := $(wildcard $(C_DIR)*.c)
CINC        := $(wildcard $(C_H_DIR)*.h)
COBJS  	    := $(notdir $(CSRC:.c=.o))

CLIB        := $(wildcard $(C_DIR)*.clib)
CLIB_OBJ    := $(notdir $(CLIB:.clib=.o))
CLIBTOC     := $($(CLIB:.clib=.c)

#COBJS      := $(patsubst %.c,%.o,$(CSRC))

CXXSRC      := $(wildcard $(CXX_DIR)*.cpp)
CXXINC      := $(wildcard $(CXX_H_DIR)*.h)
CXXOBJS     := $(notdir $(CXXSRC:.cpp=.o))



#CXXOBJS    := $(patsubst %.cpp,%.o,$(CXXSRC))


#TODO: include so library support

LIB_SO_DIR   := $(LIB_DIR)so/
LIB_A_DIR    := $(LIB_DIR)a/

ALIBS        := $(notdir $(wildcard $(LIB_A_DIR)*.a))
ALIBS        := $(patsubst %,-l:%,$(ALIBS))
SOLIBS       := $(wildcard $(LIB_SO_DIR)*.so)
SOLIBS       := $(patsubst %,-l:%,$(SOLIBS))

LINKER_OPT   := -L $(LIB_A_DIR) $(ALIBS) -L $(LIB_SO_DIR) $(SOLIBS)

#-L/usr/lib -lstdc++ -lm


#Commands

$(OBJ_DIR_CXX)$(CXXOBJS): $(CXXINC) $(CXXSRC)
	@echo $(shell echo "$(MAKECMDGOALS)" | grep "cxxrel")
	mkdir -p $(BUILD_DIR)
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR_CXX)
ifeq ($(shell echo "$(MAKECMDGOALS)" | grep "cxxrel"),cxxrel)
		@echo Building release for the C++ Project!
		$(CXX_RELEASE) -c $(CXXSRC) -I $(CXX_H_DIR)
else
		@echo Building debug for the C++ Project!
		$(CXX_DEBUG) -c $(CXXSRC) -I $(CXX_H_DIR)
endif
	mv *.o $(OBJ_DIR_CXX)


$(OBJ_DIR_C)$(COBJS): $(CINC) $(CSRC)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR_C)
ifeq ($(shell echo "$(MAKECMDGOALS)" | grep "crel"),crel)
	@echo Building release for the C Project!
	$(C_RELEASE) -c $(CSRC) -I $(C_H_DIR)
else
	$(C_DEBUG) -c $(CSRC) -I $(C_H_DIR)
	@echo Building debug for the C Project!
endif
	mv *.o $(OBJ_DIR_C)


#C++ Rules
cxxdbg: $(OBJ_DIR_CXX)$(CXXOBJS)
	mkdir -p $(BIN_DIR)
	@echo "Linking Debug for the C++ Project!"
	$(CXX_DEBUG) $(patsubst %,$(OBJ_DIR_CXX)%,$(CXXOBJS)) $(LINKER_OPT) -o $(EXECUTABLE)
	@echo "Done"

cxxrel: $(OBJ_DIR_CXX)$(CXXOBJS)
	mkdir -p $(BIN_DIR)
	@echo "Linking Release for the C++ Project!"
	$(CXX_RELEASE) $(patsubst %,$(OBJ_DIR_CXX)%,$(CXXOBJS)) $(LINKER_OPT) -o $(EXECUTABLE)
	@echo "Done"


#C Rules
crel: $(OBJ_DIR_C)$(COBJS)
	mkdir -p $(BIN_DIR)
	@echo "Linking Release for the C Project!"
	$(C_RELEASE) $(patsubst %,$(OBJ_DIR_C)%,$(COBJS)) $(LINKER_OPT) -o $(EXECUTABLE)
	@echo "Done"

cdbg: $(OBJ_DIR_C)$(COBJS)
	mkdir -p $(BIN_DIR)
	@echo "Linking Release for the C Project!"
	$(C_DEBUG) $(patsubst %,$(OBJ_DIR_C)%,$(COBJS)) $(LINKER_OPT) -o $(EXECUTABLE)
	@echo "Done"


$(OBJ_DIR_LC)$(CLIB_OBJ): $(CINC) $(CLIB)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR)libs/
	mkdir -p $(OBJ_DIR_LC)

	@echo "Compiling C Library Code..."
	$(C_DEBUG) -x c -c $(CLIB) -I $(C_H_DIR)
	mv *.o $(OBJ_DIR_LC)


#CXXSRC      := $(wildcard $(CXX_DIR)*.cpp)
LIBXX        := $(wildcard $(CXX_DIR)*.libxx)
LIBXX_OBJ    := $(notdir $(LIBXX:.libxx=.o))

$(OBJ_DIR_LXX)$(LIBXX_OBJ): $(CXXINC) $(LIBXX)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR)libs/
	mkdir -p $(OBJ_DIR_LXX)
	@echo $(LIBXX)

	@echo "Compiling C++ Library Code..."
	$(CXX_DEBUG) -x c++ -c $(LIBXX) -I $(CXX_H_DIR)
	mv *.o $(OBJ_DIR_LXX)


#Library Rules
#todo: expand functionality with ifeq to allow compiling to shared or static libraries using for example "make libxx static" or "make libxx shared"
libxx: $(OBJ_DIR_LXX)$(LIBXX_OBJ)
	@echo "Creating C++ Library..."
	ar rcs a.a $(OBJ_DIR_LXX)$(LIBXX_OBJ)
	mkdir -p $(BIN_DIR)
	mv a.a $(BIN_DIR)
	@echo "Done"

clib: $(OBJ_DIR_LC)$(CLIB_OBJ)
	@echo "Creating C++ Library..."
	ar rcs a.a $(OBJ_DIR_LC)$(CLIB_OBJ)
	mkdir -p $(BIN_DIR)
	mv a.a $(BIN_DIR)
	@echo "Done"

#Utils
.PHONY: clean
clean:
	rm -rf $(BIN_DIR)
	rm -rf $(BUILD_DIR)
	@echo "Cleaning Finished!"
