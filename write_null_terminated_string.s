	.macro write_null_terminated_string outstr
	
	mov r3, #0 		@ register to hold length of string
	ldr r1, =\outstr	@ pointer to start of string
1:
	ldrb r2, [r1]
	cmp r2, #0
	beq 2f
	add r3, #1		@ increment count of characters
	add r1, #1		@ increment pointer to next character
	b 1b

2:
	mov r7, #4              @ write syscall = 0x900004
        mov r0, #1              @ write to stdout
        ldr r1, =\outstr         @ address of our string
        mov r2, r3             	@ length of our string
        svc 0                   @ execute syscall

	.endm
	
