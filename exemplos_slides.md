
# EXEMPLO 1 #
## f = (g+h) - (i+j), $s1 = g, $s2 = h, $s3 = i, $s4 = j, $s5 = f;

add $t0, $s1, $s2
add $t1, $s3, $s4
sub $s5, $t0, $t1

*******************************************************************

# EXEMPLO 2 #
## g = h + a[8], $s1 = g, $s2 = h, $s3 = a

lw $t0,  32($s3)
add $s1, $s2, $t0

# EXEMPLO 3 #
## a[12] = h + a[8], $s2 = h, $s3 = a

lw $t0, 8($s3)
add $t1, $s2, $t0
sw $t1, 48($s3)

# EXEMPLO 4 #
## for(i=0,i<10,i++){ a[i]+=5; }, $s1 = i, $s6 = a

addi $t0, $t0, 10
addi $t1, $t1, 0

For:
    beq $t0, $t1, Exit  # verificação
    sll $t2, $t1, 2     # fazendo um offset da posição (mult por 4)
    add $t2, $t2, $s6   # pegando a posicao atual de memória e guardando em t2

    lw $t3, 0($t2)      # aux = a[i]
    addi $t3, $t3, 5    # aux += 5

    sw $t3, 0($t2)      # a[i] = aux

    addi $t1, $t1, 1    #i++

    j For
Exit:
    ...