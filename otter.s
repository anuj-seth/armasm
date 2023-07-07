	@ Program 3:  Find the Otter 
	@ https://www.armasm.com/docs/registers-and-memory/find-the-otter/
	@
	@ Reads pre-loaded values in the registers and writes 
	@ OTTER to STDOUT

	.global _start
	
_start: 
	@@@@@@@@@@@@@@@@ Begin Register Preload
	mov r0, #'P'
	mov r1, #'O'
	mov r2, #'I'
	mov r3, #'U'
	mov r4, #'Y'
	mov r5, #'T'
	mov r6, #'R'
	mov r7, #'E'
	mov r8, #'W'
	mov r9, #'Q'
	
	@@@@@@@@@@@@@@@@ End Register Preload
	
	@ Write your program here!!!

	ldr r10, =otter
	strb r1, [r10] 		@ store O
	add r10, #1		@ increment address
	strb r5, [r10]		@ store T
	add r10, #1		@ increment address
	strb r5, [r10]		@ store T
	add r10, #1		@ increment address
	strb r7, [r10]		@ store E
	add r10, #1		@ increment address
	strb r6, [r10]		@ store R

_write_to_stdout:	
	mov r7, #4              @ write syscall = 0x900004
        mov r0, #1              @ write to stdout
        ldr r1, =otter          @ address of our string
        mov r2, #6          	@ length of our string
        svc 0                   @ execute syscall

_zero_exit_code:
        mov r0, #0
        
_exit:  
        mov r7, #1
        svc 0
        
	.data
otter:	.ascii 	"     \n"
	
