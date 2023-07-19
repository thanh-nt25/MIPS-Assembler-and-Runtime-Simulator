.data
# "settled" "adjourned" "dabe" 
word: .asciiz "adjourned"

is_cyclone: .asciiz "This is a cyclone word"
not_cyclone: .asciiz "This is NOT a cyclone word"

.text
.globl main
main:
    la $s0, word            # Load address of the word into $s0
	
    addi $sp, $sp, -8       # Allocate space for 2 pointers on the stack
    sw $ra, 4($sp)          # Save the first return address
    jal strlen
    lw $ra, 4($sp)          # Restore the first return address
    jal is_cyclone_word     # Call the is_cyclone_word function
    addi $sp, $sp, 8        # Deallocate space from the stack
    
    li $v0, 4		#print string
    bne $v1, 1, false           
    la $a0, is_cyclone
    j exit
    false: la $a0, not_cyclone
exit:  
    syscall  
    li $v0, 10          # Exit program
    syscall

is_cyclone_word:
    addi $sp, $sp, -4      # Allocate space for 1 pointer on the stack   
    sw $ra, 0($sp)         # Save the second return address

    li $v1, 1              # khoi tao $v0 = 1 (dung)    

# above                    
    li $t0, 0              # left = 0
    sub $t1, $s1, 1        # right = length - 1
    cyclone_above_loop:
        blt $t0, $t1, check_above    # Branch to check_order if left < right
        j under                # Otherwise, end the loop
    
    check_above:
        add $t3, $t0, $s0            #addr of word[left] in $t3
        lb $a0, 0($t3)               #$a0 = word[left]
        add $t4, $t1, $s0	     #addr of word[right] in $t4
        lb $a1, 0($t4)		     #$a1 = word[right]	
        
        bgt $a0, $a1, cyclone_failure # Branch to cyclone_failure if left > right
        
        addi $t0, $t0, 1              # Increment left pointer
        subi $t1, $t1, 1              # Decrement right pointer
            
        j cyclone_above_loop                # Continue the loop
under:
    li $t0, 1              # left = 0
    sub $t1, $s1, 1        # right = length - 1
    cyclone_under_loop:
        blt $t0, $t1, check_under    # Branch to check_order if left < right
        j cyclone_end                # Otherwise, end the loop
    
    check_under:
        add $t5, $t0, $s0            #addr of word[left] in $t3
        lb $a0, 0($t5)               #$a0 = word[left]
        add $t6, $t1, $s0	     #addr of word[right] in $t4
        lb $a1, 0($t6)		     #$a1 = word[right]	
        
        blt $a0, $a1, cyclone_failure # Branch to cyclone_failure if left > right
        
        addi $t0, $t0, 1              # Increment left pointer
        subi $t1, $t1, 1              # Decrement right pointer
            
        j cyclone_under_loop                # Continue the loop
#failure
    cyclone_failure:
        li $v1, 0                # Set $v0 to 0 (indicating failure)
        j cyclone_end
        
    cyclone_end:    
        lw $ra, 0($sp)         # Restore the second return address
        addi $sp, $sp, 4       # Deallocate space from the stack
        jr $ra                         # Return
strlen:    
    li $s1, 0                   # Initialize counter to 0, luu tru strlen
    la $t6, word                # luu dia chi cua word vao $t6	
    loop:
        lb $t5, 0($t6)          # Load a byte from the string
        beqz $t5, done          # If the byte is zero, end of string reached
        addi $t6, $t6, 1        # Move to the next byte of the string
        addi $s1, $s1, 1        # Increment the counter
    j loop                      # Repeat the loop

    done:
        jr $ra                  # Return from the function    
