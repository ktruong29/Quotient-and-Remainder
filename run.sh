#!/bin/bash


#Author: Kien Truong
#Program name: Assignment 2
#Course ID: CPSC 240

rm *.o
rm *.out

echo "This is program <Finding quotient and remainder of two integers>"

echo "Assemble the module assignment2.asm"
nasm -f elf64 -l assignment2.lis -o assign2.o assignment2.asm

echo "Compile the C++ module assignment2.cpp"
gcc -c -m64 -Wall -l assignment2.lis -o assignment2.o assignment2.c -fno-pie -no-pie -std=c11

echo "Link the two object files already created"
gcc -m64 -o assignment2.out assignment2.o assign2.o -fno-pie -no-pie -std=c11

echo "The program will run"
./assignment2.out

echo "The bash script file is now closing."
