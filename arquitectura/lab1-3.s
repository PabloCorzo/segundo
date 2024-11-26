
.text 

.globl main 
 

main:		 

	li $v0,10 

	syscall 

 

.data 

nums:	.byte  8,7,6,5 
	.half  4,3,2,1 
	.word  1,2,3,4 
	.space 1 	
	.word  0x12 

letters:	.asciiz "ABC" 
		.ascii  "abc" 

neg1s:	.byte  -1,-1 

	.word  15 