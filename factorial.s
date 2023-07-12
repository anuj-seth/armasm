	@ A version of factorial without using functions
	@ The factorial is returned as the exit code of this program,
	@ which is most likely not a very good way of doing things.

	.global _start

	@ r0 : input number of which we want to find factorial,
	@      this is mutated and when it hits zero we return
	@ r1 : running value, initialized to 1 since factorial of
	@      0 is 1

_factorial:
	mov 	r1, #1
_recur:
	cmp 	r0, #0
	beq	_result
	mul	r1, r0, r1
	sub	r0, #1
	b	_recur

_start:
	ldr	r0, =factorial_of
	ldr	r0, [r0]
	b	_factorial
_result:
	mov 	r0, r1
	
_exit:  
        mov 	r7, #1
        svc 	0

	.data 
factorial_of:	.word 	5
