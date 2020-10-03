.data
theStr : .space 11
isPal : .asciiz "It is a Palindrome"
notPal : .asciiz "It is not a Palindrome"
newLine : .asciiz "\n"
input_msg : .asciiz "Enter a string of atmost 10 length: "
.text
main :
li $v0, 4
la $a0, input_msg
syscall
lb $t4, newLine
li $v0, 8
la $a0, theStr
li $a1, 11
syscall
add $t2, $a0, $zero
strlen :
lb $t3, ($t2)
addi $t2, $t2, 1
beq $t3, $t4, next
bne $t3, $zero, strlen
next :
add $t1, $a0, $zero
addi $t2, $t2, -2
test_loop :
bge $t1, $t2, is_pal
lb $t3, 0($t1)
lb $t4, 0($t2)
bne $t3, $t4, not_pal
addi $t1, $t1, 1
addi $t2, $t2, -1
j test_loop
is_pal :
li $v0, 1
la $a0, newLine
syscall
li $v0, 1
la $a0, isPal
syscall
j exit
not_pal :
li $v0, 1
la $a0, newLine
syscall
li $v0, 1
la $a0, notPal
syscall
exit :
li $v0,10
syscall
