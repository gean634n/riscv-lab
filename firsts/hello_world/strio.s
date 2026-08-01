.text
.global str_len, str_print


str_len:
    li          a1, 0           # zera o contador
1:
    lbu         t0, 0(a0)       # carrega o byte no ponteiro (lbu = load byte unsigned)
    beqz        t0, 2f          # se zero, ramifica(branch) para rotulo 2 adiante (2f = 2 foward)
    addi        a0, a0, 1       # incrementa o ponteiro
    addi        a1, a1, 1       # incrementa o contador
    j           1b              # salto incondicional para rotulo 1 anterior (1b = 1 backward)
2:
    mv          a0, a1          # retorna contagem em a0
    ret


str_print:
    mv          a2, a1          # a2 = len (argumento 3 da syscall write)
    mv          a1, a0          # a1 = ponteiro (argumento 2 da syscall write)
    li          a0, 1           # stdout (argumento 1 da syscall write; FD 1)
    li          a7, 64          # código da syscall write
    ecall                       # Chamada ao kernel
    ret

