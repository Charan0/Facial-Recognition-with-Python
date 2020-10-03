.data
arr: .word 1, 12, 0, -3, 99, 48, -17, -9, 20, 15
newLine : .asciiz "\n"
maxi: .asciiz "Maximum in the array is "
mini: .asciiz "Minimum in the array is "
.text
main: li $t0, 0
      li $t2, 0
      li $s2, 100
      li $s0, 0

loop: beq $t0, 40, exit

      lw $t6, arr($t0)
      addi $t0, $t0, 4

      slt $t3, $s2, $t6
      beq $t3, $zero, min

      j loop

min: move $s2, $t6
     beq $s0, 0, loop


exit: li $t0, 0

loop2:beq $t0, 40, exit2

      lw $t6, arr($t0)
      addi $t0, $t0, 4

      slt $t3, $t6, $t2
      beq $t3, $zero, max

      j loop2

max: move $t2, $t6
     beq $s0, 0, loop2

exit2: li $v0, 4
       la $a0, maxi
       syscall
       li $v0, 1
       move $a0, $t2
       syscall
       li $v0, 4
       la $a0, newLine
       syscall
       li $v0, 4
              la $a0, mini
              syscall
              li $v0, 1
              move $a0, $s2
              syscall
              li $v0, 10
              syscall
