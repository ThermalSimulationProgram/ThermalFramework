######################## DEFINITIONS ##################

#Main compiler/linker variables
CXX=g++
CFLAGS=-Wall  -g -std=c++11
CARG=-lrt 
LFLAGS= -lm 
LARG=-ldl -lpthread -lrt 
M_FLAGS=-Wall -pthread -c -g 


#Architecture dependent variable, 32bit or 64bit
ARCH := $(shell getconf LONG_BIT)


#Libraries
XML=xml/pugixml.cpp
MATHGL= -rdynamic /usr/local/lib/libmgl.so.7.0.0

#SOURCE FILES
MAIN=main.cpp



APPNAME := main
SOURCES := $(wildcard *.cpp)
OBJECTS := $(patsubst %.cpp, %.o, $(SOURCES))

INCLUDE := 
LIBPATH := 
LIBS    := -ldl -lpthread -lrt  -lm

#FLAGS    := -O3 -Wall -g 
FLAGS    := -Wall -g 
CCFLAGS  := $(FLAGS)
CXXFLAGS := $(FLAGS) -std=c++11 -lrt 

GENCODE_FLAGS := 
NVCCFLAGS     := 

CC   := g++
CXX  := g++


f1:$(SOURCES)
	@echo $(SOURCES)

f2:
	@echo $(OBJECTS)

all: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(INCLUDE) $(OBJECTS) -o $(APPNAME) $(LIBPATH) $(LIBS)

# warming: $(OBJECTS)
# 	$(CXX) $(CXXFLAGS) $(INCLUDE) $(OBJECTS) -o $warming $(LIBPATH) $(LIBS)

# cooling: $(OBJECTS)
# 	$(CXX) $(CXXFLAGS) $(INCLUDE) $(OBJECTS) -o $cooling $(LIBPATH) $(LIBS)

# obj/cmdline.o: src/cmdline.c
#   $(CC) -Wno-unused-but-set-variable -c $< -o $@

# src/cmdline.c: src/cmdline.ggo
#   gengetopt --input=src/cmdline.ggo --output-dir=src --include-getopt

# %.o: ../src/%.c
#   $(CC) $(CCFLAGS) $(INCLUDE) -c $< -o $@

%.o: %.cpp 
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

# %.device.o: ../src/%.cu
#   $(NVCC) $(NVCCFLAGS) -c $< -o $@
  
clean:
	rm -rf $(OBJECTS)
	rm -f $(APPNAME)



##########################################original copy ###############################################


# APPNAME := bin/app
# SOURCES := $(wildcard src/*.cpp src/*.cu src/*.c)
# OBJECTS := $(patsubst src%,obj%, $(patsubst %.cu,%.device.o, $(patsubst %.cpp,%.o, $(patsubst %.c,%.o, $(SOURCES)))))

# INCLUDE := -I/usr/local/cuda/include
# LIBPATH := -L/usr/local/cuda/lib64
# LIBS    := -lcudart -lGL -lglut

# FLAGS    := -O3 -ffast-math -Wall -Werror -fopenmp
# CCFLAGS  := $(FLAGS)
# CXXFLAGS := $(FLAGS) -std=c++0x

# GENCODE_FLAGS := -gencode arch=compute_20,code=sm_20 -gencode arch=compute_30,code=sm_30 -gencode arch=compute_35,code=sm_35
# NVCCFLAGS     := $(GENCODE_FLAGS) --compiler-options -fno-strict-aliasing -lineinfo -use_fast_math -Xptxas -dlcm=cg

# CC   := mpicc
# CXX  := mpicxx
# NVCC := /usr/local/cuda/bin/nvcc

# all: $(OBJECTS)
#   $(CXX) $(CXXFLAGS) $(INCLUDE) $(OBJECTS) -o $(APPNAME) $(LIBPATH) $(LIBS)

# obj/cmdline.o: src/cmdline.c
#   $(CC) -Wno-unused-but-set-variable -c $< -o $@

# src/cmdline.c: src/cmdline.ggo
#   gengetopt --input=src/cmdline.ggo --output-dir=src --include-getopt

# %.o: ../src/%.c
#   $(CC) $(CCFLAGS) $(INCLUDE) -c $< -o $@

# %.o: ../src/%.cpp
#   $(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

# %.device.o: ../src/%.cu
#   $(NVCC) $(NVCCFLAGS) -c $< -o $@
  
# clean:
#   rm -rf obj/*
#   rm -f $(APPNAME)
