	@ Program 8: ITOA
	@ https://www.armasm.com/docs/arithmetic/itoa/
	@
	@ If you are going to print numbers to stdout, you need to come up with a way 
	@ to convert those numbers into an ASCII representation. For now, just worry 
	@ about unsigned numbers.
	@ 
	@ Write a program that loads the number 209867295 and writes it to stdout.


	@ input number 
	.equ    basenum, 209867295

	.global _start
	
	@ pow macro
	@
	@ r0: base
	@ r1: power
	@ r2: total
	@
	@ Output : r0
	
	.macro 	pow	base, exp
	mov 	r0, \base
	mov 	r1, \exp
	cmp 	r1, #0
	moveq	r2, #1
	beq	2f
	mov	r2, r0
	sub	r1, #1
1:	
	cmp 	r1, #0
	beq 	2f
	mul	r2, r0, r2
	sub	r1, #1
	b	1b
2:
	mov 	r0, r2
	.endm
	
	
_start:
	ldr 	r4, =outstr
	ldr 	r5, =basenum
	mov 	r7, #9		@ initial power of 10
	mov 	r8, #0

_find_start:
	pow 	#10, r7
	mov 	r6, r0
	cmp 	r6, r5
	ble	_find_digit
	sub	r7, #1
	b	_find_start
_find_digit:
	cmp	r5, r6
	blt	_write
	add	r8, r8, #1
	sub	r5, r6
	b	_find_digit

_write:
	add 	r8, #'0'
	strb	r8, [r4], #1
	sub 	r7, #1
	cmp 	r7, #0
	blt	_print_output
	pow	#10, r7
	mov	r6, r0
	mov	r8, #0
	b	_find_digit
_print_output:
	mov 	r8, #'\n'
	strb	r8, [r4]

	mov 	r7, #4
	mov 	r0, #1
	ldr	r1, =outstr
	mov 	r2, #11
	svc 	0
	
_zero_exit_code:
        mov 	r0, #0
        
_exit:  
        mov 	r7, #1
        svc 	0

	.data
outstr:     .fill 11, 1, 0        @ the max output size is 10 digits 
                            @ 11 for line ending 
