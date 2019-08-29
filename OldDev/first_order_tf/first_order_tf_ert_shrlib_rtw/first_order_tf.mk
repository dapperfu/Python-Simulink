###########################################################################
## Makefile generated for Simulink model 'first_order_tf'. 
## 
## Makefile     : first_order_tf.mk
## Generated on : Fri May 19 11:26:30 2017
## MATLAB Coder version: 3.0 (R2015b)
## 
## Build Info:
## 
## Final product: $(RELATIVE_PATH_TO_ANCHOR)\first_order_tf_win64.dll
## Product type : shared library
## Build type   : Shared Library Target
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# COMPUTER                Computer type. See the MATLAB "computer" command.
# MODELREF_LINK_RSPFILE   Include paths for the model reference build
# PERL                    PERL Tool
# GEN_LNK_SCRIPT          Perl script to generate the command file
# CMD_FILE                Command file
# DEF_FILE                Definition file

PRODUCT_NAME              = first_order_tf
MAKEFILE                  = first_order_tf.mk
COMPUTER                  = PCWIN64
MATLAB_ROOT               = C:\PROGRA~1\MATLAB\R2015b
MATLAB_BIN                = C:\PROGRA~1\MATLAB\R2015b\bin
MATLAB_ARCH_BIN           = C:\PROGRA~1\MATLAB\R2015b\bin\win64
MASTER_ANCHOR_DIR         = 
START_DIR                 = C:\Users\C3038028\WinPython-64bit-3.5.3.0Qt5\notebooks\SimulinkDLL\first_order_tf
ARCH                      = win64
SOLVER                    = 
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
TGT_FCN_LIB               = None
MODELREF_LINK_RSPFILE_NAME = first_order_tf_ref.rsp
RELATIVE_PATH_TO_ANCHOR   = ..
MODELREF_LINK_RSPFILE     = first_order_tf_ref.rsp
PERL                      = $(MATLAB_ROOT)\sys\perl\win32\bin\perl.exe
GEN_LNK_SCRIPT            = $(MATLAB_ROOT)\rtw\c\tools\mkvc_lnk.pl
CMD_FILE                  = $(PRODUCT_NAME).lnk
DEF_FILE                  = $(PRODUCT_NAME).def
NODEBUG                   = 1

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          Microsoft Windows SDK v7.1 | nmake (64-bit Windows)
# Supported Version(s):    7.1
# ToolchainInfo Version:   R2015b
# Specification Revision:  1.0
# 

!include <ntwin32.mak>


#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# NODEBUG
# cvarsdll
# cvarsmt
# conlibsmt
# ldebug
# conflags
# cflags

#-----------
# MACROS
#-----------

MEX_OPTS_FILE       = $(MATLAB_ROOT)\bin\$(ARCH)\mexopts\mssdk71opts.bat
MW_EXTERNLIB_DIR    = $(MATLAB_ROOT)\extern\lib\win64\microsoft
MW_LIB_DIR          = $(MATLAB_ROOT)\lib\win64
MEX_ARCH            = -win64
CPU                 = AMD64
APPVER              = 5.02
CVARSFLAG           = $(cvarsmt)
CFLAGS_ADDITIONAL   = -D_CRT_SECURE_NO_WARNINGS
CPPFLAGS_ADDITIONAL = -EHs -D_CRT_SECURE_NO_WARNINGS
LIBS_TOOLCHAIN      = $(conlibs)

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = 

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# C Compiler: Microsoft Visual C Compiler
CC = cl

# Linker: Microsoft Visual C Linker
LD = link

# C++ Compiler: Microsoft Visual C++ Compiler
CPP = cl

# C++ Linker: Microsoft Visual C++ Linker
CPP_LD = link

# Archiver: Microsoft Visual C/C++ Archiver
AR = lib

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_BIN)
MEX = $(MEX_PATH)\mex

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: NMAKE Utility
MAKE = nmake


#-------------------------
# Directives/Utilities
#-------------------------

CDEBUG              = -Zi
C_OUTPUT_FLAG       = -Fo
LDDEBUG             = /DEBUG
OUTPUT_FLAG         = -out:
CPPDEBUG            = -Zi
CPP_OUTPUT_FLAG     = -Fo
CPPLDDEBUG          = /DEBUG
OUTPUT_FLAG         = -out:
ARDEBUG             =
STATICLIB_OUTPUT_FLAG = -out:
MEX_DEBUG           = -g
RM                  = @del
ECHO                = @echo
MV                  = @ren
RUN                 = @cmd /C

#--------------------------------------
# "Faster Runs" Build Configuration
#--------------------------------------

ARFLAGS              = /nologo
CFLAGS               = $(cflags) $(CVARSFLAG) $(CFLAGS_ADDITIONAL) \
                       /O2 /Oy-
CPPFLAGS             = /TP $(cflags) $(CVARSFLAG) $(CPPFLAGS_ADDITIONAL) \
                       /O2 /Oy-
CPP_LDFLAGS          = $(ldebug) $(conflags) $(LIBS_TOOLCHAIN)
CPP_SHAREDLIB_LDFLAGS  = $(ldebug) $(conflags) $(LIBS_TOOLCHAIN) \
                         -dll -def:$(DEF_FILE)
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              = $(ldebug) $(conflags) $(LIBS_TOOLCHAIN)
MEX_CFLAGS           = $(MEX_ARCH) OPTIMFLAGS="/O2 /Oy- $(MDFLAG) $(DEFINES)" $(MEX_OPTS_FLAG)
MEX_LDFLAGS          = LDFLAGS=='$$LDFLAGS'
MAKE_FLAGS           = -f $(MAKEFILE)
SHAREDLIB_LDFLAGS    = $(ldebug) $(conflags) $(LIBS_TOOLCHAIN) \
                       -dll -def:$(DEF_FILE)

#--------------------
# File extensions
#--------------------

H_EXT               = .h
OBJ_EXT             = .obj
C_EXT               = .c
EXE_EXT             = .exe
SHAREDLIB_EXT       = .dll
HPP_EXT             = .hpp
OBJ_EXT             = .obj
CPP_EXT             = .cpp
EXE_EXT             = .exe
SHAREDLIB_EXT       = .dll
STATICLIB_EXT       = .lib
MEX_EXT             = .mexw64
MAKE_EXT            = .mk


###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = $(RELATIVE_PATH_TO_ANCHOR)\first_order_tf_win64.dll
PRODUCT_TYPE = "shared library"
BUILD_TYPE = "Shared Library Target"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = $(START_DIR)\first_order_tf_ert_shrlib_rtw;$(START_DIR);$(MATLAB_ROOT)\extern\include;$(MATLAB_ROOT)\simulink\include;$(MATLAB_ROOT)\rtw\c\src;$(MATLAB_ROOT)\rtw\c\src\ext_mode\common;$(MATLAB_ROOT)\rtw\c\ert

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_BUILD_ARGS = -DONESTEPFCN=1 -DTERMFCN=1 -DMAT_FILE=0 -DMULTI_INSTANCE_CODE=0 -DINTEGER_CODE=0 -DMT=0 -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0
DEFINES_OPTS = -DTID01EQ=1
DEFINES_STANDARD = -DMODEL=first_order_tf -DNUMST=2 -DNCSTATES=1 -DHAVESTDIO

DEFINES = $(DEFINES_BUILD_ARGS) $(DEFINES_OPTS) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(START_DIR)\first_order_tf_ert_shrlib_rtw\first_order_tf.c

MAIN_SRC = $(START_DIR)\first_order_tf_ert_shrlib_rtw\ert_main.c

ALL_SRCS = $(SRCS) $(MAIN_SRC)

###########################################################################
## OBJECTS
###########################################################################

OBJS = first_order_tf.obj

MAIN_OBJ = ert_main.obj

ALL_OBJS = $(OBJS) $(MAIN_OBJ)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = 

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = 

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_BASIC = $(DEFINES) 

CFLAGS = $(CFLAGS) $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_BASIC = $(DEFINES) 

CPPFLAGS = $(CPPFLAGS) $(CPPFLAGS_BASIC)

###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build clean info prebuild download execute set_environment_variables


all : build
	@cmd /C "@echo ### Successfully generated all binary outputs."


build : set_environment_variables prebuild $(PRODUCT)


prebuild : 


download : build


execute : download


set_environment_variables : 
	@set INCLUDE=$(INCLUDES);$(INCLUDE)
	@set LIB=$(LIB)


###########################################################################
## FINAL TARGET
###########################################################################

#----------------------------------------
# Create a shared library
#----------------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS)
	$(PERL) $(GEN_LNK_SCRIPT) $(CMD_FILE) $(OBJS)
	@cmd /C "@echo ### Creating shared library "$(PRODUCT)" ..."
	$(CPP_LD) $(CPP_SHAREDLIB_LDFLAGS) -out:$(PRODUCT) @$(CMD_FILE) $(SYSTEM_LIBS) $(TOOLCHAIN_LIBS)
	@cmd /C "@echo ### Created: $(PRODUCT)"
	$(RM) $(CMD_FILE)


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

.c.obj :
	$(CC) $(CFLAGS) -Fo"$@" "$<"


.cpp.obj :
	$(CPP) $(CPPFLAGS) -Fo"$@" "$<"


{$(RELATIVE_PATH_TO_ANCHOR)}.c.obj :
	$(CC) $(CFLAGS) -Fo"$@" "$<"


{$(RELATIVE_PATH_TO_ANCHOR)}.cpp.obj :
	$(CPP) $(CPPFLAGS) -Fo"$@" "$<"


{$(START_DIR)\first_order_tf_ert_shrlib_rtw}.c.obj :
	$(CC) $(CFLAGS) -Fo"$@" "$<"


{$(START_DIR)\first_order_tf_ert_shrlib_rtw}.cpp.obj :
	$(CPP) $(CPPFLAGS) -Fo"$@" "$<"


{$(START_DIR)}.c.obj :
	$(CC) $(CFLAGS) -Fo"$@" "$<"


{$(START_DIR)}.cpp.obj :
	$(CPP) $(CPPFLAGS) -Fo"$@" "$<"


{$(MATLAB_ROOT)\rtw\c\src}.c.obj :
	$(CC) $(CFLAGS) -Fo"$@" "$<"


{$(MATLAB_ROOT)\rtw\c\src}.cpp.obj :
	$(CPP) $(CPPFLAGS) -Fo"$@" "$<"


{$(MATLAB_ROOT)\simulink\src}.c.obj :
	$(CC) $(CFLAGS) -Fo"$@" "$<"


{$(MATLAB_ROOT)\simulink\src}.cpp.obj :
	$(CPP) $(CPPFLAGS) -Fo"$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : $(MAKEFILE) rtw_proj.tmw


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@cmd /C "@echo ### PRODUCT = $(PRODUCT)"
	@cmd /C "@echo ### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@cmd /C "@echo ### BUILD_TYPE = $(BUILD_TYPE)"
	@cmd /C "@echo ### INCLUDES = $(INCLUDES)"
	@cmd /C "@echo ### DEFINES = $(DEFINES)"
	@cmd /C "@echo ### ALL_SRCS = $(ALL_SRCS)"
	@cmd /C "@echo ### ALL_OBJS = $(ALL_OBJS)"
	@cmd /C "@echo ### LIBS = $(LIBS)"
	@cmd /C "@echo ### MODELREF_LIBS = $(MODELREF_LIBS)"
	@cmd /C "@echo ### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@cmd /C "@echo ### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@cmd /C "@echo ### CFLAGS = $(CFLAGS)"
	@cmd /C "@echo ### LDFLAGS = $(LDFLAGS)"
	@cmd /C "@echo ### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@cmd /C "@echo ### CPPFLAGS = $(CPPFLAGS)"
	@cmd /C "@echo ### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@cmd /C "@echo ### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@cmd /C "@echo ### ARFLAGS = $(ARFLAGS)"
	@cmd /C "@echo ### MEX_CFLAGS = $(MEX_CFLAGS)"
	@cmd /C "@echo ### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@cmd /C "@echo ### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@cmd /C "@echo ### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@cmd /C "@echo ### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files..."
	@if exist $(PRODUCT) $(RM) $(PRODUCT)
	$(RM) $(ALL_OBJS)
	$(ECHO) "### Deleted all derived files."


