.data
myMsg: .asciiz "Enter the dividend."
myMsg2: .asciiz "Enter the divisor."
sum: .asciiz "The quotient is = "
diff: .asciiz "\nThe remainder is = "
.text
main:
la $a0, myMsg
la $v0, 4
syscall

li $v0, 5
syscall

move $t1, $v0
la $a0, myMsg2
la $v0, 4
syscall

li $v0, 5
syscall

move $t0, $v0
la $a0, sum
la $v0, 4
syscall

li $v0, 1
div $t3, $t1, $t0
move $a0, $t3
syscall

la $a0, diff
la $v0, 4
syscall

mul $t2, $t3, $t0
li $v0, 1
sub $a0, $t1, $t2
syscall
li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
syscall
