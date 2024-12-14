.data
.text
.globl main
main:
lui $a0, 125
ori $a0, $a0,  2304

li $v0, 1
syscall
li $v0 ,10
syscall