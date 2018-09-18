# EXEMPLO DE VETORES E FUNÇÕES MIPS #

# Trecho de texto #

.text
.ent main
main:

    la $s0, vetor # Carregando endereço do vetor

    jal Preencher # Chamando a função para preencher

    jal Somar # Chamando a função para somar

    syscall

.end main

################ FUNÇÃO QUE PREENCHE O VETOR #####################
.globl Preencher 
.ent Preencher
Preencher:

    # Carregando auxiliares da memória
    lw $t0, cont_for
    lw $t1, max
    lw $t4, val

    Loop: # Loop para preencher

        beq $t0, $t1, ExitLoop # Verificação para sair do Loop

        sll $t2, $t0, 2 # Multiplocando o index por 4 e guardando em t2
        add $t2, $t2, $s0  # Auxiliar 2 recebe a base do vetor mais o index

        lw $t3, 0($t2)

        add $t3, $t3, $t4

        sw $t3, 0($t2)  # Guardando o incremento do laço no vetor

        addi $t0, $t0, 1 # Incrementando o laço
        addi $t4, $t4, 1 # Incrementando o val    
    
        j Loop    

    ExitLoop:
        jr $ra # Retornando ao main

################ FUNÇÃO QUE SOMA ELEMENTOS DO VETOR #####################
Somar:


    # Carregando auxiliares da memória
    lw $t1, max
    addi $t0, $t0, -10 # Zerando o t10
    
    LoopSomar: # Loop para preencher

        beq $t0, $t1, ExitLoopSomar # Verificação para sair do Loop

        sll $t2, $t0, 2 # Multiplicando o index por 4 e guardando em t2
        add $t2, $t2, $s0  # Auxiliar 2 recebe a base do vetor mais o index

        lw $t3, 0($t2)  # Carregando o valor em um aux

        add $a1, $zero, $t3 # Adicionando o valor ao parâmetro

        addi $sp, $sp, -8 # Ajustando a pilha
        sw $ra, 0($sp) # Adicionando o contexto na pilha
        sw $a1, 4($sp)


        jal Add # Chamando a função add 
        
        add $s4, $s4, $v1 # Adicionando o valor de retorno à variável final

        lw  $ra, 0($sp)       # restaura $s0 para o valor anterior a chamada
        lw  $a1, 4($sp)       # restaura $s0 para o valor anterior a chamada        
        addi $sp, $sp, 8 # retira os itens da pilha

        addi $t0, $t0, 1 # Incrementando o laço    

    
        j LoopSomar    

    ExitLoopSomar:
        jr $ra # Retornando ao main


###################### FUNÇÃO PARA REALIZAR SOMA AUXILIAR #########################
Add: 
    # Restaurando a pilha
    add $v1, $zero, $a1
    jr $ra
    
.end Preencher
    

# Trecho de dados #

.data 
    vetor: .space 40
    cont_for: .word 0
    max: .word 10
    val: .word 1