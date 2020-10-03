.globl main
.data
myMsg: .asciiz "Enter a positive number: "
msg: .asciiz " is odd."
msg1: .asciiz " is even."
even: .word 2
odd: .word 1
.text
main:
la $a0, myMsg
la $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0

lw $t2, even
lw $t1, odd

div $t4, $t0, $t2

mul $t6, $t4, $t2

sub $t8, $t0, $t6

beq $t8, $zero, evenno
beq $t8, $t1, oddno

oddno: li $v0, 1
  move $a0, $t0
  syscall
  la $a0, msg
  la $v0, 4
  syscall
  li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
  syscall


evenno: li $v0, 1
  move $a0, $t0
  syscall
  la $a0, msg1
  la $v0, 4
  syscall
  li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
  syscall
