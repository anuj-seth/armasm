	@ Program 4:  Memory Copy
	@ https://www.armasm.com/docs/registers-and-memory/memory-copy/
	@
	@ Reads data from one point in data, copies it, and then 
	@ outputs the result 

	.global _start 

_start:
	ldr r0, =instr		@ address of input string
	ldr r1, =outstr		@ address of output string
	
	ldrb r2, [r0]		@ load first input character to r2
	strb r2, [r1]           @ store r2 to outstr

	add r0, #1
	add r1, #1
	ldrb r2, [r0]		@ load input character to r2
	strb r2, [r1]           @ store r2 to outstr

	add r0, #1
	add r1, #1
	ldrb r2, [r0]		@ load input character to r2
	strb r2, [r1]           @ store r2 to outstr

	add r0, #1
	add r1, #1
	ldrb r2, [r0]		@ load input character to r2
	strb r2, [r1]           @ store r2 to outstr

	add r0, #1
	add r1, #1
	ldrb r2, [r0]		@ load input character to r2
	strb r2, [r1]           @ store r2 to outstr

	add r0, #1
	add r1, #1
	ldrb r2, [r0]		@ load input character to r2
	strb r2, [r1]           @ store r2 to outstr

	add r1, #1
	mov r2, #'\n'		@ load new to r2
	strb r2, [r1]           @ store newline at end of outstr

_write_to_stdout:       
        mov r7, #4              @ write syscall = 0x900004
        mov r0, #1              @ write to stdout
        ldr r1, =outstr         @ address of our string
        mov r2, #7              @ length of our string
        svc 0                   @ execute syscall

_zero_exit_code:
        mov r0, #0
        
_exit:  
        mov r7, #1
        svc 0

	.data
instr:      .ascii      "SUMMER"
outstr:     .fill       7, 1, 0
