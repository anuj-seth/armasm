	@ Program 7: Cloning Myself
	@ https://www.armasm.com/docs/branches-and-conditionals/cloning-myself/
	@
	@ Having lived through quarantine, I have decided that I would like the last year 
	@ or so of my life back. In order to do this, I am going to clone myself and then 
	@ transfer my brain into a new body. However, since replication errors are a thing, 
	@ write a program that will show the expected pairs so I can double check.
	@ 
	@ In DNA strings, symbols “A” and “T” are complements of each other, as “C” and “G”.
	@

	.include "write_null_terminated_string.s" 

	.global _start 

_start:
	
_preload_registers:
	mov r0, #'A'
	mov r1, #'T'
	mov r2, #'C'
	mov r3, #'G'

	ldr r4, =instr
	
_clone:	
	ldrb r5, [r4]
	cmp r5, #0
	beq _write_output
_cmp_A:	
	cmp r5, #'A'
	bne _cmp_T
	strb r1, [r4], #1
	b _clone
_cmp_T:
	cmp r5, #'T'
	bne _cmp_G
	strb r0, [r4], #1
	b _clone
_cmp_G:
	cmp r5, #'G'
	bne _cmp_C
	strb r2, [r4], #1
	b _clone
_cmp_C:
	cmp r5, #'C'
	strb r3, [r4], #1
	b _clone

_write_output:	
	write_null_terminated_string instr

	.data 
instr:      .ascii      "GTATCGATCGATCGATCGATTATATTTTCGACGAGATTTAAATATATATA"
            .asciz      "TATACGAGAGAATACAGATAGACAGATTA" 
