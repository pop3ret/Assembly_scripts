; Prints String n times using the stack and the loop instruction and procedures
; Author pop3ret 

global _start

section .text

HelloWorldProc:
	mov eax, 0x04 ; write syscall
	mov ebx, 0x01 ; STDOUT
	mov ecx, message ; pointer to message
	mov edx, mlen ; Message lenght
	int 0x80 ; Execute syscall to print the message
	ret ; The RET instruction will pop the stack value into EIP to continue the execution.

_start:
	mov ecx,0x5
	
PrintHW:
	push ecx
	call HelloWorldProc ; The CALL instruction will PUSH the EIP value into the stack ( In this case, the memory address of pop ecx) and jump to the procedure
	pop ecx
	loop PrintHW

	mov eax,1
	mov ebx,1
	int 0x80

; Defining a random message to output
section .data:
	message: db "Hello World!"
	mlen equ $-message
	
