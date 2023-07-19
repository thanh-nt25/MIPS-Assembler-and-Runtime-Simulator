#Laboratory Exercise 5, Home Assignment 2
.data
	x: .asciiz "The sum of "
	y: .asciiz " and "
	z: .asciiz " is "
.text
	li $s0, 3
	li $s1, 4
	add $t0, $s0, $s1
	
	li $v0, 4
	la $a0, x
	syscall	
	
	li $v0, 1
	add $a0, $zero, $s0
	syscall

	li $v0, 4
	la $a0, y
	syscall	
	
	li $v0, 1
	add $a0, $zero, $s1
	syscall
	
	li $v0, 4
	la $a0, z
	syscall			
	
	li $v0, 1
	add $a0, $zero, $t0
	syscall
	