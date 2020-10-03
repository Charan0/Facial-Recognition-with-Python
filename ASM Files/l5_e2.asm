.data
char: .byte 'y'
vowels: .asciiz "institute of technology and sciences"
found_it: .asciiz "\nThe character is found"
no_luck: .asciiz "\nNot present"
.text
main:
lb $t0, char
li $t1, 0
la $s0, vowels
lb $s1, ($s0)
loop:
beq $s1, $zero, lost
seq $t1, $s1, $t0
bgt $t1, $zero, found
addi $s0, $s0, 1
lb $s1, ($s0)
b loop
found: li $v0, 4
la $a0, found_it
syscall
li $v0, 10
syscall
lost: li $v0, 4
la $a0, no_luck
syscall
li $v0, 10
syscall
