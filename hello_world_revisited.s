	.include "write_null_terminated_string.s"

        .global _start
_start:
	write_null_terminated_string hello
	write_null_terminated_string newline

_zero_exit_code:
        mov r0, #0
        
_exit:  
        mov r7, #1
        svc 0
        
        .data
hello:  	.asciz "Hello World!"
newline:	.asciz "\n"
