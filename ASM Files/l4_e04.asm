.data
float1 : .asciiz "Enter first float:"
float2 : .asciiz "Enter second float:"
newLine : .asciiz "\n"
equal : .asciiz "both numbers are equal"
minimum : .asciiz "The minimum no. is : "
maximum : .asciiz "\nThe maximum no. is : "
.text
main:
la $a0, float1 #print string
li $v0,4
syscall
li $v0,6 #read float
syscall
mov.s $f1,$f0 #move float to f1
la $a0, float2 #print string
li $v0,4
syscall

li $v0,6 #read float
syscall
mov.s $f2,$f0 #move float to f2
c.lt.s $f1,$f2 #if f1<f2 set flag to 1
bc1f firstIsMax
secondIsMax:
la $a0,minimum #print string
li $v0,4
syscall
mov.s $f12,$f1 #print number
li $v0,2
syscall
la $a0,maximum #print string
li $v0,4
syscall
mov.s $f12,$f2 #print number
li $v0,2
syscall
j exit
firstIsMax:
la $a0,minimum
li $v0,4
syscall
mov.s $f12,$f2
li $v0,2
syscall
la $a0,maximum
li $v0,4
syscall
mov.s $f12,$f1
li $v0,2
syscall
exit:
li $v0,10
syscall
