# print_list.asm

.globl print_list

print_list:
    addi sp, sp, -8
    sw   ra, 4(sp)
    sw   s0, 0(sp)

    mv   s0, a1

loop:
    beq  s0, zero, end_of_list

    lw   a0, 0(s0)
    li   a7, 1
    ecall

    li   a0, 44        # comma
    li   a7, 11
    ecall

    li   a0, 32        # space
    li   a7, 11
    ecall

    lw   s0, 4(s0)
    j    loop

end_of_list:
    la   a0, endoflistmsg
    li   a7, 4
    ecall

    li   a0, 10
    li   a7, 11
    ecall

    lw   s0, 0(sp)
    lw   ra, 4(sp)
    addi sp, sp, 8

    ret