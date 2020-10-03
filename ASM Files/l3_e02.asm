
.data
myMsg: .asciiz "Enter a decimal: "

.text
main:
la $a0, myMsg
la $v0, 4
syscall

li $v0, 6
syscall

cvt.d.s $f4, $f0
mov.d $f12, $f4
li $v0, 2
syscall

li $v0, 10
syscall
