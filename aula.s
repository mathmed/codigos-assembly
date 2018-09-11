# Exemplo de um laço de repetição para somar valores #

.text
    main:
        
        la $s1, vetor # registrador 1 guarda o vetor
        lw $s2, valor # registrador 2 guarda 0
        lw $t2, controlador
        li $t1, 0

        # preenchendo o vetor

        li $t0, 10
        sw $t0, 0($s1)

        li $t0, 20
        sw $t0, 4($s1)

        li $t0, 30
        sw $t0, 8($s1)

        li $t0, 40
        sw $t0, 12($s1)

        li $t0, 50
        sw $t0, 16($s1)


        li $t0, 0 # zerando o auxiliar

        For: # laço de repetição
            
            beq $t1, $t2, EXIT   # condição para sair do laço 
            
            sll $t3, $t1, 2 # multiplicando o indice por 4 (offset)
            add $t3, $t3, $s1 # adicinando o endereço de memoria ao offset do indice

            lw $t4, 0($t3) # guardando valor da posicao v[i]
            
            add $s2, $s2, $t4 # adicionando o valor

            addi $t1, $t1, 1 # incrementando o laço

            j For # voltando para o inicio

        EXIT: # fim do laço

    syscall

.data
    controlador: .word 5 # iniciando constante com valor 5
    valor: .word 0 # iniciando constante com valor 0
    vetor: .word 0, 0, 0, 0, 0 # V[5]