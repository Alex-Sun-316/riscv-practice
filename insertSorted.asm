# insertSorted.asm
# a0 = address of HEAD, a1 = key to insert
# insertSorted calls newNode, so we must save/restore registers

.globl insertSorted
insertSorted:
    addi sp, sp, -16
    sw   ra,  12(sp)
    sw   s0,   8(sp)
    sw   s1,   4(sp)
    sw   s2,   0(sp)
    mv   s0, a0
    mv   s1, a1
    mv   a0, s1
    jal  ra, newNode
    mv   s2, a0
    lw   t0, 0(s0)
    beq  t0, x0, insert_head
    lw   t1, 0(t0)
    bgt  s1, t1, insert_head
    mv   t2, t0
traverse:
    lw   t3, 4(t2)
    beq  t3, x0, insert_tail
    lw   t4, 0(t3)
    bgt  s1, t4, insert_middle
    mv   t2, t3
    j    traverse
insert_head:
    lw   t0, 0(s0)
    sw   t0, 4(s2)
    sw   s2, 0(s0)
    j    done
insert_middle:
    sw   t3, 4(s2)
    sw   s2, 4(t2)
    j    done
insert_tail:
    sw   x0, 4(s2)
    sw   s2, 4(t2)
done:
    lw   s2,   0(sp)
    lw   s1,   4(sp)
    lw   s0,   8(sp)
    lw   ra,  12(sp)
    addi sp, sp, 16
    jr   ra