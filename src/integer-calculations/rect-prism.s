.data
p1: .asciiz "enter the length of side a: "
p2: .asciiz "enter the length of side b: "
p3: .asciiz "enter the length of side c: "
o1: .asciiz "\nthe volume is = "
o2: .asciiz "\nthe surface area is = "

.text
.globl main

main:
#t0 = a 
#t1 = b
#t2 = c
#t3 = volume
#t4 = surface area

la $a0, p1
li $v0, 4
syscall

li $v0, 5
syscall

add $t0, $v0, $zero 

la $a0, p2
li $v0, 4
syscall

li $v0, 5
syscall
add $t1, $v0, $zero 

la $a0, p1
li $v0, 4
syscall

li $v0, 5
syscall
add $t2, $v0, $zero

mul $t3, $t0, $t1
mul $t3, $t3, $t2

mul $t5, $t0, $t1
add $t4, $zero, $t5

mul $t5, $t0, $t2
add $t4, $t4, $t5

mul $t5, $t1, $t2
add $t4, $t4, $t5
mul $t4, $t4, 2

la $a0, o1
li $v0, 4
syscall

add $a0, $zero, $t3
li $v0, 1
syscall

la $a0, o2
li $v0, 4
syscall

add $a0, $zero, $t4
li $v0, 1
syscall

li $v0, 10
syscall

  