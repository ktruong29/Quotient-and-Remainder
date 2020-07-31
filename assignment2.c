
/**************************************
Author:        Kien Truong
Program name:  Assignment 2
Course ID:     CPSC 240
***************************************/

#include <stdio.h>
long int quotient_remainder_ints();

int main()
{
  long int return_code = 99;
  printf("%s", "This is assignment 2 programmed by Kien Truong\n");
  printf("%s", "I love programming\n\n");
  return_code = quotient_remainder_ints();

  printf("%s%ld%s\n","\nThe main driver received this number: ",return_code,
           "\nNext the main will return 0 to the operating system.\nBye");
  return 0;
}
