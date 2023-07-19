# bubble sort implementation in MIPS assembly

.data
A: .word 5, 2, 8, 1, 3
n: .word 5

.text
main:
    # initialize pointers
    la $s0, A    # pointer to start of array
    lw $t0, n    # number of elements
    sub $t0, $t0, 1  # index of last element

    # loop over elements
    loop:
        li $t1, 0    # flag to check if any swaps were made
        li $t2, 0    # index of current element
        li $t3, 1    # index of next element

        # loop over pairs of adjacent elements
        inner_loop:
            bge $t2, $t0, exit_inner_loop   # if index >= last element, exit inner loop

            # load current and next elements into $t4 and $t5
            sll $t6, $t2, 2
            add $t4, $s0, $t6
            addi $t5, $t4, 4
            lw $t4, 0($t4)
            lw $t5, 0($t5)

            # compare and swap if necessary
            ble $t4, $t5, no_swap
            sw $t5, 0($t4)
            sw $t4, 0($t5)
            li $t1, 1    # set flag to indicate swap was made

            no_swap:
            addi $t2, $t2, 1   # advance indices
            addi $t3, $t3, 1
            j inner_loop

        exit_inner_loop:
        beq $t1, 0, done     # if no swaps were made, sorting is complete
        addi $t0, $t0, -1    # decrement last element index
        j loop

    done:
    # sorting is complete
    li $v0, 10
    syscall
