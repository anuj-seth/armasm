	@ Program 6:  Hello World Revisited
	@ https://www.armasm.com/docs/branches-and-conditionals/sticky-keyboard/
	@
	@ My keyboard sucks. Thanks Apple. The keys stick badly. (They don't really)
	@ Write a program that takes a string and removes the duplicate letters. 
	@
	@

	.include "write_null_terminated_string.s" 

	.global _start 

_start:
 	ldr r0, =instr
	ldr r1, =outstr

_copy:	
	ldrb r3, [r0], #1
	cmp r3, #0
	beq _write_output
	strb r3, [r1], #1
_remove_duplicate:	
	ldrb r4, [r0]
	cmp r4, r3
	bne _copy
	add r0, #1
	b _remove_duplicate
	
_write_output:	
	write_null_terminated_string instr
	write_null_terminated_string outstr	

_zero_exit_code:
        mov r0, #0
        
_exit:  
        mov r7, #1
        svc 0
        
	.data 
instr:      .ascii      "I jjjjust   waaaaant thhhis stuppppid " 
            .asciz      "tttthinggggg tooooo wwwwworrrrrrrk!!!!!!!\n"
outstr:     .fill       128, 1, 0     @ Reserve 128 bytes
