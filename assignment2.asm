;---------------------------------------------------------
;Author:        Kien Truong
;Program name:  Assignment 2
;Course ID:     CPSC 240
;---------------------------------------------------------

extern printf         ;External C++ function for writing to standard output device

extern scanf

global quotient_remainder_ints

segment .data

initialMess db "The X86 program has begun", 10,0

inputMess1  db "Please enter the first integer and press enter: ", 0

inputMess2  db "Please enter the second integer and press enter: ", 0

thanksMess  db "Thank you.", 10, 0

outputMess  db "The quotient of %ld divided by %ld is %ld with remainder equal to %ld",10 ,0

posRemain   db "The remainder is positive.", 10, 0

negRemain   db "The remainder is negative.", 10, 0

sucReturn   db "The remainder will be returned to the caller program. Have a nice day.", 10, 0

errorMess   db "Sorry: we do not handle zero here at Ubuntu dot com.", 10, 0

runAgMess   db "Please run this program again.", 10, 0

errorReturn db "Negative 1 will be returned to the caller program. Have a nice day." ,10, 0

stringFormat db "%s", 0

intFormat    db "%ld", 0

segment .bss
;empty

segment .text
quotient_remainder_ints:

  push rbp
  mov rbp, rsp
  push rbx
  push rcx
  push rdx
  push rdi
  push rsi
  push r8
  push r9
  push r10
  push r11
  push r12
  push r13
  push r14
  push r15

  ;=====Show the initial message=======
  mov qword  rax, 0                         ;No floating points
  mov        rdi, stringFormat              ;"%s"
  mov        rsi, initialMess               ;"The X86 program has begun"
  call       printf                         ;output

  ;=====Show the first prompt========
  mov qword rax, 0                          ;No floating points
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, inputMess1                 ;"Please enter the first integer and
                                            ;press enter: "
  call      printf                          ;output

  ;=====Obtain the first integer=======
  push qword  0                             ;Reserve 8 bytes of storage for the
                                            ;incoming number
  mov  qword  rax, 0                        ;No floating points
  mov         rdi, intFormat                ;"%ld"
  mov         rsi, rsp                      ;Give scanf a point to the reserved storage
  call        scanf                         ;input
  pop r15                                   ;store the first value in r15

  ;=====Show the second prompt=======
  mov qword rax, 0                          ;no floating point numbers
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, inputMess2                 ;"Please enter the second integer
                                            ;and press enter: "
  call      printf                          ;output

  ;======Obtain the second integer=====
  push qword 0                              ;Reserve 8 bytes of storage for the incoming number
  mov  qword rax, 0                         ;no floating points
  mov        rdi, intFormat                 ;"%ld"
  mov        rsi, rsp                       ;Give scanf a point to the reserved storage
  call       scanf                          ;input
  pop        r14                            ;store the second value in r14

  ;======Compare r14 with zero=========
  cmp r14, 0

  ;======A jump occurs when r14 is not zero=======
  jne notZero

  ;This will execute when the divisor == 0

  ;====Output error message========
  mov qword rax, 0                          ;no floating point numbers
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, errorMess                  ;"Sorry: we do not handle zero here
                                            ;at Ubuntu dot com."
  call      printf                          ;output

  ;=====Output run again message=====
  mov qword rax, 0                          ;no floating point numbers
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, runAgMess                  ;"Please run this program again."
  call      printf                          ;output

  ;=====Output return -1 to main=====
  mov qword rax, 0                          ;no floating point numbers
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, errorReturn                ;"Negative 1 will be returned to the
                                            ;caller program. Have a nice day."
  call      printf                          ;output

  mov rax, -1         ;returns -1 to main

  ;======This jmp prevents the execution of notZero======
  jmp continue

  ;======This will execute when the divisor is != 0====
  notZero:

  ;======Output thank you message=========
  mov qword rax, 0                          ;no floating point numbers
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, thanksMess                 ;"Thank you."
  call      printf                          ;output

  ;=======Calculate quotient===========
  mov rax, r15    ;Div occurs in rax => make a copy of r15 to rax
  cqo
  idiv r14         ;rax/r14
  mov  r13, rax    ;backup for quotient
  mov  r12, rdx    ;backup for remainder

  ;=======Output result=========
  mov qword  rax, 0                         ;No floating points
  mov        rdi, outputMess                ;"The quotient of %ld divided by %ld
                                            ;is %ld with remainder equal to %ld"
  mov        rsi, r15                       ;Make a copy of r15 to rsi
  mov        rdx, r14                       ;second numbers
  mov        rcx, r13                       ;quotient
  mov        r8,  r12                       ;remainder
  call       printf                         ;output

  ;=======Comparing neg/pos remainder======
  cmp r12, 0

  ;=======Jump if reminder is greater than 0=====
  jge greaterthanequal

  ;=======This will execute when remainder is less than 0=====

  ;======Output negative remainder message=========
  mov qword rax, 0                          ;no floating point numbers
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, negRemain                  ;"The remainder is negative."
  call      printf                          ;output

  jmp ifNegRemain

  ;=======Will execute when the remainder is positive=====
  greaterthanequal:

  ;======Output positive remainder message=========
  mov qword rax, 0                          ;no floating point numbers
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, posRemain                  ;"The remainder is positive."
  call      printf                          ;output

  ifNegRemain:

  ;=====Output successful return======
  mov qword rax, 0                          ;no floating point numbers
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, sucReturn                  ;"The remainder will be returned to
                                            ;the caller program. Have a nice day."
  call      printf                          ;output

  mov rax, r12                              ;return remainder to driver code

  continue:

  pop r15
  pop r14
  pop r13
  pop r12
  pop r11
  pop r10
  pop r9
  pop r8
  pop rsi
  pop rdi
  pop rdx
  pop rcx
  pop rbx
  pop rbp

  ret
