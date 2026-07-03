.text
.globl newNode

newNode:
    # input: a0 = key
    # output: a0 = pointer to new node

    mv   t0, a1      # save key

    li   a0, 8       # allocate 8 bytes
    li   a7, 9       # sbrk
    ecall

    sw   t0, 0(a0)   # node->key = key
    sw   zero, 4(a0) # node->next = NULL

    ret