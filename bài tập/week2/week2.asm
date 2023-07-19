	
#Laboratory Exercise 2, Assignment 1
	#.text
	#addi $s0, $zero, 0x2110003d 	# $s0 = 0 + 0x3007 = 0x3007 ;I-type
	#add $s0, $zero, $0 		# $s0 = 0 + 0 = 0 ;R-type
#Laboratory Exercise 2, Assignment 2
	#.text
	#lui $s0,0x2110 			#put upper half of pattern in $s0
	#ori $s0,$s0,0x003d 		#put lower half of pattern in $s0
#Laboratory Exercise 2, Assignment 3
	#.text
	#li $s0,0x2110003d 		#pseudo instruction=2 basic instructions
	#li $s1,0x2 			#but if the immediate value is small, one ins
#Laboratory Exercise 2, Assignment 4
	#.text
	# Assign X, Y
	#addi $t1, $zero, 5 		# X = $t1 = ?
	#addi $t2, $zero, -1 		# Y = $t2 = ?
# Expression Z = 2X + Y
	#add $s0, $t1, $t1 		# $s0 = $t1 + $t1 = X + X = 2X
	#add $s0, $s0, $t2 		# $s0 = $s0 + $t2 = 2X + Y
#Laboratory Exercise 2, Assignment 5
	#.text
	# Assign X, Y
	#addi $t1, $zero, 4 # X = $t1 = ?
	#addi $t2, $zero, 5 # Y = $t2 = ?
	# Expression Z = 3*XY
	#mul $s0, $t1, $t2 # HI-LO = $t1 * $t2 = X * Y ; $s0 = LO
	#mul $s0, $s0, 3 # $s0 = $s0 * 3 = 3 * X * Y
	# Z' = Z
	#mflo $s1	
#Laboratory Exercise 2, Assignment 6
	.data # DECLARE VARIABLES
	X : .word 5 # Variable X, word type, init value =
	Y : .word -1 # Variable Y, word type, init value =
	Z : .word # Variable Z, word type,
	.text
	# Load X, Y to registers
	la $t8, X # Get the address of X in Data Segment
	la $t9, Y # Get the address of Y in Data Segment
	lw $t1, 0($t8) # $t1 = X
	lw $t2, 0($t9) # $t2 = Y
	# Calcuate the expression Z = 2X + Y with registers only
	add $s0, $t1, $t1 # $s0 = $t1 + $t1 = X + X = 2X
	add $s0, $s0, $t2 # $s0 = $s0 + $t2 = 2X + Y
	# Store result from register to variable Z
	la $t7, Z # Get the address of Z in Data Segment
	sw $s0, 0($t7) # Z = $s0 = 2X + Y
	
