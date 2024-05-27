.data
p1: .asciiz "enter the radius: "
o1: .asciiz "\nthe surface area is = "
o2: .asciiz "\nthe volume is = "
.text
.globl main
main:

la $a0, p1
li $v0, 4
syscall

li $v0, 5
syscall

add $t0, $zero, $v0

#r^2
mul $t1, $t0, $t0

mul $t2, $t1, 22
mul $t2, $t2, 4
div $t2, $t2, 7


#r^3
mul $t1, $t1, $t0

mul $t3, $t1, 22
mul $t3, $t3, 4
div $t3, $t3, 7
div $t3, $t3, 3

la $a0, o1
li $v0, 4
syscall

add $a0, $t2, $zero
li $v0, 1
syscall

la $a0, o2
li $v0, 4
syscall

add $a0, $t3, $zero
li $v0, 1
syscall

li $v0, 10
syscall 