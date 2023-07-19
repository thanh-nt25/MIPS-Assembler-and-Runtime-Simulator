#Laboratory Exercise 3, Home Assignment 6

#.data
#array: .word 4, -7, 1, -9, 5, -3, 6, -8, 2, -10  # The array of integers
#n: .word 10                                    # The number of elements in the array

#.text
#main:
#    la $t0, array      
#    lw $t1, n          
#    addi $t1, $t1, -1  
#    lw $t2, 0($t0)     
#    abs $t2, $t2       
#    blez $t2, negative 

#    loop:
#        addi $t0, $t0, 4  
#        lw $t3, ($t0)    
#        abs $t3, $t3      

#        bgt $t3, $t2, max 
#        bne $t1, $zero, loop 

#    negative:
#        addi $t0, $t0, -4  
#        lw $t3, ($t0)      
#        abs $t3, $t3       
#        bgt $t3, $t2, max  
#
#    max:
#        move $t2, $t3       
#        bne $t1, $zero, loop 

    # Print the result
#    li $v0, 1
#    move $a0, $t2
#    syscall

    # Exit the program
#    li $v0, 10
#    syscall

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------

#Laboratory Exercise 4, Home Assignment 1
#.text
#start:
#	addi $s1, $zero, 2
#	addi $s2, $zero, 3
#	li $t0,0 #No Overflow is default status
#	addu $s3,$s1,$s2 # s3 = s1 + s2
#	xor $t1,$s1,$s2 #Test if $s1 and $s2 have the same sign
#	bltz $t1,EXIT #If not, exit
#	slt $t2,$s3,$s1
#	bltz $s1,NEGATIVE #Test if $s1 and $s2 is negative?
#	beq $t2,$zero,EXIT #s1 and $s2 are positive
#	# if $s3 > $s1 then the result is not overflow
#	j OVERFLOW
#NEGATIVE:
#	bne $t2,$zero,EXIT #s1 and $s2 are negative
	# if $s3 < $s1 then the result is not overflow
#OVERFLOW:
#	li $t0,1 #the result is overflow
#EXIT:

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------

#Laboratory Exercise 4, Home Assignment 2
#   .data
#s0: .word 0x12345678   # Initialize s0 to 0x12345678
    
#    .text
#    .globl main

#main:
#    lw $t0, s0          # Load s0 into $t0
#    srl $t0, $t0, 24    # Shift right by 24 to get MSB
#    andi $s0, $s0, 0xfffffffe  # Clear LSB
#    ori $s0, $s0, 0xff  # Set LSB to 0xff
#    li $s0, 0           # Clear s0 to 0
    
    # End of program
#    li $v0, 10          # Exit program
#    syscall
#Gi?i thích ch??ng trình: ??u tiên ch??ng trình n?p giá tr? c?a s0 vào $t0.
#Sau ?ó, nó trích xu?t MSB c?a s0 b?ng cách d?ch chuy?n $t0 sang ph?i 24 bit và l?u k?t qu? tr? l?i vào $t0.
#Ti?p theo, ch??ng trình xóa LSB c?a s0 b?ng cách th?c hi?n thao tác AND theo bit gi?a s0
#Sau ?ó, ch??ng trình ??t LSB c?a s0 thành 0xff b?ng cách th?c hi?n thao tác OR theo bit gi?a s0
#Cu?i cùng, ch??ng trình xóa s0 v? 0 b?ng cách n?p giá tr? t?c thì 0 vào s0.

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------

#Laboratory Exercise 4, Home Assignment 3
#a
#	slt $t0, $s1, $zero # if s1 < 0, set $t0 to 1, else 0
#	subu $s0, $zero, $s1 # if $t0 = 1, $s0 <= | $s1 |, else $s0 <= $s1
#b
#	add $s0,$s1,$zero
#c
#	nor $s0, $zero, $s0
#d
#	slt $at, $s1, $s2    # Set $at to 1 if $s1 is less than $s2, else 0
#	bne $at, $zero, L    # Branch to L if $at is not equal to 0 (i.e., $s1 <= $s2)

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------

#Laboratory Exercise 4, Home Assignment 4

#.text
#start:
#    li $t0,0        # No overflow is default status
#    addu $s3,$s1,$s2 # s3 = s1 + s2
#    # Test if $s1 and $s2 have the same sign
#    xor $t1,$s1,$s2
#    slti $t1,$t1,0   # Check if the result of xor is negative
    # If not, exit
#    beq $t1,$zero,EXIT
#    # Test if $s1 and $s2 are negative
#    bltz $s1,NEGATIVE
#    bltz $s2,NEGATIVE
    # s1 and s2 are positive
    # If $s3 > $s1 then the result is not overflow
#    bgt $s3,$s1,NO_OVERFLOW
    # s3 < s1, overflow
#    li $t0,1
#    j EXIT
#NEGATIVE:
    # s1 and s2 are negative
    # If $s3 < $s1 then the result is not overflow
#    blt $s3,$s1,NO_OVERFLOW
    # s3 > s1, overflow
#    li $t0,1
#NO_OVERFLOW:
    # Exit the program
#    EXIT:
#    jr $ra          # return to caller

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------

#Laboratory Exercise 4, Home Assignment 5
.text
main:
  sll $s1, $s0, 3   # multiply $s0 by 2^3 (i.e., 8)
                    # s1 = $s0 * 8
