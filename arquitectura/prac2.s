.data 

	X:	.word 1,2,6,8,9,3,5,10 

	Y:	.word 10,20,35,11,99,30,5,100 

 

.text 

.globl main 

	main: 

	la	$a0, X 

	#li	$a1, 5 
	li	$v0,5
	syscall
	addi	$a1,$v0, 0 
	
	li	$a2, 8 

	jal	CountGreaterThan 

	addi	$s0, $v0, 0 

 

	la	$a0, Y 

	#li	$a1, 50
	li	$v0,5
	syscall
	addi	$a1,$v0, 0

	li	$a2, 8 

	jal	CountGreaterThan 

	addi	$s1, $v0, 0 

 

# End 

	li	$v0, 10 

	syscall 

 

# Contar numero de valores mayores que el argumento 

# a0 – direccion del array 

# a1 – numero para comparar 

# a2 – numbero de elementos del array 

# Return – numero contado 

# Usa - t1, t2, t3 

CountGreaterThan: 
# Guardar $ra 
	addi	$sp, $sp, -4 
	sw	$ra, 0($sp) 
# Inicializar 

	addi	$t1, $a0, 0 

	addi	$t2, $a2, 0 

	li	$t3, 0 

 

# Bucle 

loopGreaterThan: 

	lw	$a0, 0($t1) 

	slt      $v0, $a0,$a1 #Mycode
	#jal	IsGreaterThan 

	bne	$v0, $zero, updateAddress 

	addi	$t3, $t3, 1 

updateAddress: 

addi	$t1, $t1, 4 

addi	$t2, $t2, -1 

bne	$t2, $zero, loopGreaterThan 

 

# Recuperar $ra 

lw	$ra, 0($sp) 

addi	$sp, $sp, 4 

 

# Return 

addi	$v0, $t3, 0 

jr	$ra 

 

# Comprobar si a0 > a1 

# a0 - numero 

# a1 - numero 

# Return - 1 si es mayor 

# Usa - t0 

IsGreaterThan: 

	addi	$t0, $a0, -1 

	slt	$v0, $t0, $a1 	

	xori	$v0, $v0, 1	# Not(a <= b) === a > b 

	jr	$ra 