.globl main
.data
myMsg: .asciiz "Enter a positive number: "
msg1: .asciiz "The sum of all natural nos. until '"
msg2: .asciiz "' is = "
.text
main:
la $a0, myMsg
la $v0, 4
syscall
li $v0, 5
syscall
move $s2, $v0


li $s1, 0
li $t2, 0



predicate:  slt $t0, $s1, $s2
            beq $s2, $s1, exit
consequent: addi $s1, $s1, 1
            add $t2, $t2, $s1
            j predicate
endwhile:

exit: la $a0, msg1
  la $v0, 4
  syscall
  li $v0, 1
  move $a0, $s2
  syscall
  la $a0, msg2
  la $v0, 4
  syscall
  li $v0, 1
  move $a0, $t2
  syscall

li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
syscall
