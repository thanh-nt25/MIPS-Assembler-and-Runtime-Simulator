.eqv SEVENSEG_RIGHT 0xFFFF0010 # Dia chi cua den led 7 doan phai
.text

main:li $a0, 0xFD
 jal SHOW_7SEG_RIGHT
 jal delay
 nop
 li $a0, 0x3F
 jal SHOW_7SEG_RIGHT
 jal delay
 nop
 li $a0, 0x06 # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
 li $a0, 0x5B # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
 li $a0, 0x4F # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
 li $a0, 0x66 # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
 li $a0, 0x6D # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
 li $a0, 0x7D # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
 li $a0, 0x07 # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
 li $a0, 0x7F # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
 li $a0, 0x6F # set value for segments
 jal SHOW_7SEG_RIGHT # show 
 jal delay
 nop
j main
exit: li $v0, 10
 syscall
endmain:

SHOW_7SEG_RIGHT: 
li $t0, SEVENSEG_RIGHT # assign port's address
sb $a0, 0($t0) # assign new value
nop
jr $ra 
 nop
delay:
    li $t0, 300000   
    loop:
        subi $t0, $t0, 1   
        bne $t0,$zero, loop    
    jr $ra   
