.data
theStr : .space 6
arr2 : .space 5
newLine : .asciiz "\n"
input_msg : .asciiz "Enter a string of length 5 'only': "
.text
main :
li $v0, 4
la $a0, input_msg
syscall
lb $t4, newLine
li $v0, 8
la $a0, theStr
li $a1, 6
syscall

li $t0, 0
li $t2, 4
li $v0, 4
la $a0, newLine
syscall
loop: lb $t4, theStr($t2)
      sb $t4, arr2($t0)
      beq $t2, 0, exit1
      addi $t0, $t0, 1
      addi $t2, $t2, -1
      j loop
exit1: li $t0, 0
li $v0, 4
la $a0, newLine
syscall
la $t6, theStr($t0)

        li $v0, 4
        move $a0, $t6
        syscall


       li $v0, 4
       la $a0, newLine
       syscall
 la $t6, arr2($t0)

        li $v0, 4
        move $a0, $t6
        syscall

li $v0, 10
       syscall
