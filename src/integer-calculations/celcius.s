.data
p1: .asciiz "enter celcius: "
p2: .asciiz "c converted to f is="
.text
.globl main

main:
la $a0, p1
li $v0,4
syscall

li $v0,5
syscall

move $a0, $v0
li $v0,1
syscall

mul $t0, $v0, 9
div $t0, $t0, 5
addi $t0, $t0, 32

la $a0, p2
li $v0,4
syscall

move $a0, $t0
li $v0,1
syscall

li $v0, 10
syscall


