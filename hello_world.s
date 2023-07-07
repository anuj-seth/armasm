	@ this is a comment
	.global _start
_start:
	mov r7, #4		@ write syscall = 0x900004
	mov r0, #1 		@ write to stdout
	ldr r1, =hello		@ address of our string
	mov r2, #12		@ length of our string
	svc 0			@ execute syscall

_zero_exit_code:
	mov r0, #0
	
_exit:	
	mov r7, #1
	svc 0
	
	.data
hello:	.ascii "Hello World\n"


	
