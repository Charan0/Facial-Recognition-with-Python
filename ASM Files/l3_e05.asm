.data
msg1: .asciiz "Integer product = "
msg2: .asciiz "\nSingle precision product = "
msg3: .asciiz "\nDouble precision product = "
msg4: .asciiz "\nDifference between single and double products = "

.text
main:
addi $s0, $zero, 32767
addi $s1, $zero, 32333
la $a0, msg1
la $v0, 4
syscall
mul $t0, $s0, $s1
li $v0, 1
move $a0, $t0
syscall

#single precision

mtc1 $s0, $f0
cvt.s.w $f8, $f0
mtc1 $s1, $f1
cvt.s.w $f6, $f1
mul.s $f10, $f8, $f6
cvt.w.s $f10, $f10
mfc1 $t2, $f10
la $a0, msg2
la $v0, 4
syscall
li $v0, 1
move $a0, $t2
syscall

#double precision

cvt.d.w $f8, $f0
cvt.d.w $f6, $f1
mul.d $f10, $f8, $f6
cvt.w.d $f10, $f10
mfc1 $t4, $f10
la $a0, msg3
la $v0, 4
syscall
li $v0, 1
move $a0, $t4
syscall

la $a0, msg4
la $v0, 4
syscall
li $v0, 1
sub $a0, $t2, $t4
syscall

li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
syscall
