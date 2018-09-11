.text
main:
	addi $t1, $t1, 56
	addi $t2 $t2, 27
	add $s1, $t1, $t2
	sll $s2, $s1, 4 
	bne $s1, $s2, DIFERENTE
	j EXIT
	DIFERENTE:
		add $s3, $s1, $s2
	EXIT:
		syscall # efetua a chamada ao sistema
		li $v0, 10 # comando de exit
		syscall # efetua a chamada ao sistema