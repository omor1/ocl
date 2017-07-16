#----[Makefile]--------
#$@ Contains the target file name
#$< Contains the first dependency name
#=======================

#----[Directories]----
oPath = obj
sPath = src
iPath = include
#=====================

#----[Compiler]-------
compiler = g++
compilerFlags = -std=c++11
path = -I./$(iPath)
#=====================

#----[Variable Names]-
headers = $(wildcard $(iPath)/*.hpp)
sources = $(wildcard $(sPath)/*.cpp)
objects = $(subst $(sPath)/,$(oPath)/,$(sources:.cpp=.o))
#====================

#----[Compilation]---
main:$(objects) $(headers) main.cpp
	$(compiler) $(compilerFlags) -o main $(objects) main.cpp $(paths)

$(oPath)/%.o:$(sPath)/%.cpp $(subst $(sPath)/, $(iPath)/,$(<:.cpp=.hpp))
	@mkdir -o $(@D)
	$(compiler) $(compilerFlags) -o $@ -c $(paths) $<

#----[Clean up]-----
clean:
	rm main
	rm -rf $(oPath)/
