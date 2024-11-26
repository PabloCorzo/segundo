.text 

.globl main 
main:		 
	li $v0,4		#syscall to print a string 
	la $a0, prompt		#address of string to print 
	syscall			#print the string 
	li $v0,1		#syscall to print an integer 
	lb $a0, val		#load the integer to print to $a0 
	syscall			#print it 
	addi $t0, $t0, 1	#increment the value of $t0 
	li $v0, 10		#sys call for exit 
	syscall 
.data 
	prompt:.asciiz "tu codigo es: " 
	val:.byte 20