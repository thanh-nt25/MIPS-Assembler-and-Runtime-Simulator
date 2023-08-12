#------------------------------------------------------
# col 0x1 col 0x2 col 0x4 col 0x8
#
# row 0x1 0 1 2 3
# 0x11 0x21 0x41 0x81
#
# row 0x2 4 5 6 7
# 0x12 0x22 0x42 0x82
#
# row 0x4 8 9 a b
# 0x14 0x24 0x44 0x84
#
# row 0x8 c d e f
# 0x18 0x28 0x48 0x88
#
#------------------------------------------------------
# command row number of hexadecimal keyboard (bit 0 to 3)
# Eg. assign 0x1, to get key button 0,1,2,3
# assign 0x2, to get key button 4,5,6,7
# NOTE must reassign value for this address before reading,
# eventhough you only want to scan 1 row
.eqv IN_ADRESS_HEXA_KEYBOARD 0xFFFF0012
# receive row and column of the key pressed, 0 if not key pressed
# Eg. equal 0x11, means that key button 0 pressed.
# Eg. equal 0x28, means that key button D pressed.
.eqv OUT_ADRESS_HEXA_KEYBOARD 0xFFFF0014
.text
main: 	li $t3, IN_ADRESS_HEXA_KEYBOARD
	li $t4, OUT_ADRESS_HEXA_KEYBOARD
	li $t5, 0x1 # check row 4 with key C, D,E, F
	li $t6, 0x2
	li $t7, 0x4 
	
polling: 
	sb $t5, 0($t3 ) # must reassign expected row
	lb $a0, 0($t4) # read scan code of key button
	bnez $a0, first_row_call
	
	sb $t6, 0($t3 ) # must reassign expected row
	lb $a0, 0($t4) # read scan code of key button
	bnez $a0, second_row_call

	sb $t7, 0($t3 ) # must reassign expected row
	lb $a0, 0($t4) # read scan code of key button
	bnez $a0, thrird_row_call

back_to_polling: j polling # continue polling

# ================ call function ================
first_row_call: li $a0, 1
		li $v0, 1
		syscall
		j end

second_row_call: li $a0, 2
		li $v0, 1
		syscall
		j end

thrird_row_call: li $a0, 3
		li $v0, 1
		syscall
		j end

end: li  $v0, 10
	syscall
	
# =================================== more function =========================
print: li $v0, 34 # print integer (hexa)
	syscall
sleep: li $a0, 100 # sleep 100ms
	li $v0, 32
	syscall