; Execute programs through execve in Assembly
; Author: pop3ret

; The _start directive defines the start of our program
global _start

_start: 

; .text segment, where our code resides
section .text:

	xor eax,eax ; Zero out the register
	push eax ; put 0x0 into the stack
	
	; Put ////bin/bash into the Stack, remember that this value needs to be
	; multiple of 4 to align the stack. (First argument)
	push 0x68736162 ; /bin (Inversed)
	push 0x2f6e6962 ; bash (Inversed)
	push 0x2f2f2f2f ; ////

	; Puts the other arguments into the stack

	mov ebx, esp ; EBX will now point to the string ////bin/bash,0x0 (First argument). Each push, esp = esp - 4
	push eax ; PUSH 0

	mov edx,esp ; EDX now points to null (Third argument)
	push ebx ; EBX contains a pointer to /bin/bash
	mov ecx,esp ; ECX points to the address of /bin/bash (Second argument)

	; Calling execve (Syscall 11)
	mov al,11
	int 0x80
