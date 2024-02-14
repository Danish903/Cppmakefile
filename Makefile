# Makefile for a C++ project with a library
CC = g++ # Compiler

# Compiler flags
CFLAGS = -Wall -Werror -std=c++17 -Iinclude -MMD -MP 

# Debug and release flags
DEBUG_FLAGS = -g
RELEASE_FLAGS = -O2

# Linker flags
LFLAGS = -Llib
LIBS = -ldataStructures

# Directories
OBJDIR = obj
SRCDIR = src
INCDIR = include
LIBDIR = lib
BINDIR = bin

# Executable
EXEC = bin/myapp

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cc)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cc=$(OBJDIR)/%.o)
DEPS = $(OBJECTS:.o=.d)

# Collect all object files for the library, excluding main.o
LIB_OBJECTS = $(filter-out $(OBJDIR)/main.o, $(OBJECTS))

# Targets
all: $(EXEC)

# Debug build
debug: clean
	$(MAKE) CFLAGS="$(CFLAGS) $(DEBUG_FLAGS)" all

# Release build
release: clean
	$(MAKE) CFLAGS="$(CFLAGS) $(RELEASE_FLAGS)" all

# Rule for making the executable
$(EXEC): $(OBJECTS) $(LIBDIR)/libdataStructures.a
	$(CC) $(LFLAGS) $(OBJECTS) -o $@ $(LIBS)

# Rule for making the library
$(LIBDIR)/libdataStructures.a: $(LIB_OBJECTS)
	ar rcs $@ $^
	ranlib $@

# Pattern rule for object files
$(OBJDIR)/%.o: $(SRCDIR)/%.cc
	$(CC) $(CFLAGS) -c $< -o $@

-include $(DEPS)

# Create necessary directories
directories:
	mkdir -p $(OBJDIR) $(LIBDIR) $(BINDIR)

# Clean rule
clean:
	rm -f $(OBJDIR)/* $(LIBDIR)/libdataStructures.a $(EXEC)

.PHONY: all debug release clean directories
