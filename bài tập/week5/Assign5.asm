#Laboratory Exercise 5, Home Assignment 5
.data
input_buffer: .space 21       # Allocate a buffer to store the input string (20 characters + null terminator)

.text
.globl main
main:
    li $v0, 8                   # Service code 8: Read string
    la $a0, input_buffer        # Load address of the input buffer
    li $a1, 21                  # Maximum number of characters to read (including null terminator)
    syscall                     # Read the string input

    # Find the length of the input string
    li $t0, 0                   # Initialize counter to 0
    la $t1, input_buffer        # Load address of the input buffer

    loop_length:
        lb $t2, ($t1)           # Load a character from the buffer
        beqz $t2, reverse_string # If the character is null, jump to reverse_string
        addi $t0, $t0, 1        # Increment the counter
        addi $t1, $t1, 1        # Increment the buffer address
        blt $t0, 20, loop_length # If counter < 20, repeat the loop
        j reverse_string

    reverse_string:
    subi $t1, $t1, 2            # Adjust the buffer address to the last character (before null terminator)


    loop_print:
        li $v0, 4                   # Service code 4: Print string
        lb $a0, ($t1)           # Load a character from the buffer
        beqz $a0, exit          # If the character is null, exit the loop
        syscall                 # Print the character
        subi $t1, $t1, 1        # Decrement the buffer address
        j loop_print

    exit:    
    li $v0, 10                  # Service code 10: Exit program
    syscall                     # Terminate the program
