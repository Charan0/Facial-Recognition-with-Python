.data
myMsg: .asciiz "Enter 2 decimals: "
add1: .asciiz "\nSum is "
sub1: .asciiz "\nDifference is "
neg1: .asciiz "\nAddition with Negation is "

.text
main:
la $a0, myMsg
la $v0, 4
syscall
li $v0, 6
syscall
mov.s $f1, $f0
li $v0, 6
syscall

la $a0, add1
la $v0, 4
syscall
add.s $f2, $f1, $f0
li $v0, 2
mov.s $f12, $f2
syscall

la $a0, sub1
la $v0, 4
syscall
sub.s $f2, $f1, $f0
li $v0, 2
mov.s $f12, $f2
syscall

la $a0, neg1
la $v0, 4
syscall
neg.s $f0,$f0
add.s $f2, $f1, $f0
li $v0, 2
mov.s $f12, $f2
syscall

la $a0, add1
la $v0, 4
syscall
cvt.d.s $f4, $f1
add.d $f2, $f4, $f0
li $v0, 2
mov.d $f12, $f2
syscall

la $a0, sub1
la $v0, 4
syscall
sub.d $f2, $f4, $f0
li $v0, 2
mov.d $f12, $f2
syscall
li $v0, 10
syscall
