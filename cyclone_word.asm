.data
# "settled" "adjourned"
word: .asciiz "acefdb"

is_cyclone: .asciiz "This is a cyclone word"
not_cyclone: .asciiz "This is NOT a cyclone word"

.text
.globl main
main:
    la $s0, word        # Load address of the word into $s0

    jal strlen
    jal is_cyclone_word # Call the is_cyclone_word function
    
    li $v0, 4
    bne $v1, 1, false           
    la $a0, is_cyclone
    j exit
    false: la $a0, not_cyclone
exit:  
    syscall  
    li $v0, 10          # Exit program
    syscall

is_cyclone_word:
    addi $sp, $sp, -8      # Allocate space for 2 pointers on the stack
    sw $ra, 4($sp)         # Save the return address
    
    li $t0, 0              # left = 0
    sub $t1, $s1, 1        # right = length - 1
    
    li $v1, 1       # khoi tao $v0 = 1 (dung)
    cyclone_loop:
        blt $t0, $t1, check_order    # Branch to check_order if left < right
        j cyclone_end                # Otherwise, end the loop
    
    check_order:
        add $t3, $t0, $s0
        lbu $a0, 0($t3)
        add $t4, $t1, $s0
        lbu $a1, 0($t4)
        
        bgt $a0, $a1, cyclone_failure # Branch to cyclone_failure if left > right
        
        addi $t0, $t0, 1              # Increment left pointer
        subi $t1, $t1, 1              # Decrement right pointer
        
        # cyclone_skip_nonalpha_left:   # Skip non-alphabetic characters on the left
        #    addi $t0, $t0, 1
        #    lb $a0, 0($s0)
        #    beqz $a0, cyclone_skip_nonalpha_left
            
        # cyclone_skip_nonalpha_right:  # Skip non-alphabetic characters on the right
        #    subi $t1, $t1, 1
        #    lb $a1, 0($s0)
        #    beqz $a1, cyclone_skip_nonalpha_right
            
        j cyclone_loop                # Continue the loop
    
    cyclone_failure:
        li $v1, 0                # Set $v0 to 0 (indicating failure)
        j cyclone_end
    
    # addi $v0, $v0, 1	
    
    cyclone_end:    
        lw $ra, 4($sp)                 # Restore the return address
        addi $sp, $sp, 8               # Deallocate space from the stack
        jr $ra                         # Return
strlen:
    li $s1, 0       # Initialize counter to 0
    la $t6, word	
    loop:
    lb $t5, 0($t6)  # Load a byte from the string
    beqz $t5, done  # If the byte is zero, end of string reached
    addi $t6, $t6, 1    # Move to the next byte of the string
    addi $s1, $s1, 1    # Increment the counter
    j loop          # Repeat the loop

    done:
    jr $ra          # Return from the function    


