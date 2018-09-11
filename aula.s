.text
main:

    For:
        lw $s1, controlador
        lw $s2, array
        sw valor, 4($s2) 

    syscall



.data
controlador: .word 10
valor: .word 8
array: .byte 40