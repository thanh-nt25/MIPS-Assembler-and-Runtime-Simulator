#Laboratory Exercise 7, Home Assignment 2
.text
main:
    li $a0,2 #load test input
    li $a1,6
    li $a2,9
    jal max #call max procedure
    nop
endmain:
#---------------------------------------------------------------------
#-
#Procedure max: find the largest of three integers
#param[in] $a0 integers
#param[in] $a1 integers
#param[in] $a2 integers
#return $v0 the largest value
#---------------------------------------------------------------------
-
max: add $v0,$a0,$zero #copy (a0) in v0; largest so far
sub $t0,$a1,$v0 #compute (a1)-(v0)