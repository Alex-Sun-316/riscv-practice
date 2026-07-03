.globl mergeLinkedLists

mergeLinkedLists:
    addi sp, sp, -20
    sw   ra, 16(sp)
    sw   s0, 12(sp)
    sw   s1, 8(sp)
    sw   s2, 4(sp)
    sw   s3, 0(sp)

    mv   s0, a0          # HEAD_A
    mv   s1, a1          # HEAD_B

    lw   s2, 0(s1)       # first node of B

merge_traverse:

    beq  s2, zero, merge_done

    lw   a1, 0(s2)       # key from B
    lw   s3, 4(s2)       # save next B node

    mv   a0, s0          # HEAD_A
    jal  ra, insertSorted

    mv   s2, s3
    j    merge_traverse

merge_done:
    lw   s3, 0(sp)
    lw   s2, 4(sp)
    lw   s1, 8(sp)
    lw   s0, 12(sp)
    lw   ra, 16(sp)
    addi sp, sp, 20

    ret