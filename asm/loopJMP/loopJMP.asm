; Prints String n times using the stack and the JNZ instruction
; Author pop3ret 

global _start

section .text

_start:
	jmp Begin ; Unconditional JMP to the begin section

; This piece of code will never be executed
NeverExecute:
	mov eax, 0x10
	xor eax,eax

; Move the value 5 to eax
Begin:
	mov eax,0x5
	
PrintHW:
	push eax ; PUSH 5 to the stack
	mov eax, 0x04 ; write syscall
	mov ebx, 0x01 ; STDOUT
	mov ecx, message ; pointer to message
	mov edx, mlen ; Message lenght
	int 0x80 ; Execute syscall to print the message

	pop eax ; Put 5 from the stack in EAX
	dec eax ; Decrement EAX ( Not it contains 4 )
	jnz PrintHW ; JUMP NOT ZERO instruction, will execute till the ZF flag is set, in other words, till EAX contains 0

	; EXIT syscall
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

; Defining a random message to output
section .data:
	message: db "Hello World!"
	mlen equ $-message
	
