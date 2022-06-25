; Hello World in Assembly
; Author: pop3ret
; Compiler: NASM

global _start

; Define an area for our code, in this case the text section

section .text

; Define program entry point
_start:
	; Print the message on the screen
	mov eax, 0x04 ; Syscall number (Write = 4)
	mov ebx, 0x01 ; Function argument 1 (Stdout)
	mov ecx, message ; Function argument 2 (Pointer to the message)
	mov edx, mlen ; Function argument 3 (Message lenght)
	int 0x80 ; Invoke Interruption (syscall)
	
	; Exit the program
	mov eax, 0x01 ; Exit syscall number
	mov ebx, 0x01 ; Arbitrary return value
	int 0x80 ; 

; Define an are to initialized data (.data section)
section .data
	message: db "Hello World!" ; Here, we define a label with our string
 	mlen equ $-message ; Using the equ function to count the lenght of our message
