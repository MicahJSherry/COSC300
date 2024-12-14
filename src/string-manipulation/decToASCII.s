.data
p1: .asciiz "enter a decimal number"
array: .space 100 

.text
.globl main
main: 

la $a0, p1
li $v0, 4

li $v0, 5 
add $t0, $v0, $zero

la $t1, array
loop:
rem $t2, $t0, $t1


j loop 


li $v0, 10 
syscall 