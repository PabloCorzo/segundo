.data
A: 1 1 1 5 6
#DECLARACION INUTIL
k: 1
.text
.globl main
main:
	la	$s6,A #A[0] address
	la	$t0,k #K address
	lw	$s5, 0($t0) #K pero en save
	
	add $t1, $s6, $zero #Guardar A[0] en t1
loop:
	lw	$t0, 0($t1) #Fetch
	bne	$t0, $s5, Exit
	addi	$s3, $s3, 1
	addi	$t1, $t1, 4
	j	loop
Exit: