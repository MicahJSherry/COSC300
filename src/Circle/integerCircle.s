.data
p1: .asciiz "enter radius: "

.text
.globl main
main:

la $a0, p1
li $v0, 4
syscall

li $v0, 5
syscall

mul $t0, $v0, $v0
mul $t0, $t0, 22
div $a0, $t0, 7


li $v0, 1
syscall

li $v0, 10
syscall
