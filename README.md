# Quotient and remainder in X86
---
The purpose of this program is to become familiar with which registers that the
quotient and remainder of two integers are stored and which register
performs/handles the division of two integers in assembly language.

This program will do the following:
* Input 2 integers
* Computes and displays the quotient and remainder of two integers
* Computes and displays whether the remainder is positive or negative
* The remainder will be returned to the caller program

This program has three different source files:
* A driver file, which is written in C/C++ language.
* An X86 assembly file, which is a function written in X86 language and
is called from the driver program. This program inputs, computes the quotient
and remainder of two integers, and outputs the result.
* A bash script is used to compile the two previously mentioned files, link
them to create one executable file, and lastly load that newly created
executable file.

## Prerequisites
---
* A virtual machine
* Install g++ and nasm

## Instruction on how to run the program
---
1. chmod +x run.sh then ./run.sh              
2. sh run.sh
