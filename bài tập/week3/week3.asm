#Laboratory Exercise 3, Home Assignment 1
#start:
#	addi $s1, $zero, 2
#	addi $s2, $zero, 1
#	slt $t0,$s2,$s1 	# j<i
#	bne $t0,$zero,else 	# branch to else if j<i
#	addi $t1,$t1,1 		# then part: x=x+1
#	addi $t3,$zero,1 	# z=1
#	j endif 		# skip “else” part
#else: 	addi $t2,$t2,-1 	# begin else part: y=y-1
#	add $t3,$t3,$t3 	# z=2*z
#endif:

#Laboratory 3, Home Assigment 2
#.data
#	A: .word 1, 3, 2, 5, 10
#	la $t1, A
#.text
#	addi $s1, $zero, 0 #i=0
#	addi $s5, $zero, 0 #sum =0
#	addi $s3, $zero, 4 #n=5
#	addi $s4, $zero, 1 #step=1
#		
#loop: 	add $s1,$s1,$s4 #i=i+step
#	add $t1,$s1,$s1 #t1=2*s1
#	add $t1,$t1,$t1 #t1=4*s1
#	add $t1,$t1,$s2 #t1 store the address of A[i]
#	lw $t0,0($t1) #load value of A[i] in $t0
#	add $s5,$s5,$t0 #sum=sum+A[i]
#	bne $s1,$s3,loop #if i != n, goto loop
	
#Laboratory Exercise 3, Home Assignment 3
#.data
#	test: .word 1
#.text
#	addi $s2, $zero, 2
#	addi $s3, $zero, 3
#	la $s0, test #load the address of test variable
#	lw $s1, 0($s0) #load the value of test to register $t1
#	li $t0, 0 #load value for test case
#	li $t1, 1
#	li $t2, 2
#	beq $s1, $t0, case_0
#	beq $s1, $t1, case_1
#	beq $s1, $t2, case_2
#	j default
#case_0: addi $s2, $s2, 1 #a=a+1
#	j continue
#case_1: sub $s2, $s2, $t1 #a=a-1
#	j continue
#case_2: add $s3, $s3, $s3 #b=2*b
#	j continue
#default:
#	continue:

#Assignment 4
#a, i<j
start:
	addi $s1, $zero, 2
	addi $s2, $zero, 1
	slt $t0,$s2,$s1 	# j<i
	beq $t0,$zero,else 	# branch to else if j<i
	addi $t1,$t1,1 		# then part: x=x+1
	addi $t3,$zero,1 	# z=1
	j endif 		# skip “else” part
else: 	addi $t2,$t2,-1 	# begin else part: y=y-1
	add $t3,$t3,$t3 	# z=2*z
endif: