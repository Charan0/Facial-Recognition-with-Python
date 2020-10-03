.data
msg: .asciiz "Enter a number: "
msg1: .asciiz " is greater than "
msg2: .asciiz " is same as "
msg3: .asciiz ", no difference."
.text
main:
la $a0, msg
la $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0

la $a0, msg
la $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0


bne $t2, $t0, nequal

beq $t2, $t0, equal

nequal:
  bgt $t2, $t0, next

  blt $t2, $t0, after
  next: li $v0, 1
    move $a0, $t2
    syscall
    la $a0, msg1
    la $v0, 4
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
    syscall

  after: li $v0, 1
    move $a0, $t0
    syscall
    la $a0, msg1
    la $v0, 4
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
    syscall

equal: li $v0, 1
  move $a0, $t2
  syscall
  la $a0, msg2
  la $v0, 4
  syscall
  li $v0, 1
  move $a0, $t0
  syscall
  la $a0, msg3
  la $v0, 4
  syscall

  li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
  syscall
