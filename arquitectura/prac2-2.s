li	$t0, 16 

li	$t1, 0x100234 

lw   $t2, 4($t1) 

bne  $t2, $t0, different 

addi $s0, $t0, -2 

j    endIf 

different: 

add	$s0, $t0, $t2 

endIf: 

sw   $s0, 4($t1)