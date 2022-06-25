#!/bin/bash

#############################################
# Simple compiler and linker for nasm (x86) #
# Author: pop3ret                           #
# Usage: ./compiler.sh asm_name             #
#############################################

## @ Main

# Compiling
nasm $1.asm -f elf32 -o $1.o

# Linking
ld -m elf_i386 $1.o -o $1
