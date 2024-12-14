.data
p1: .asciiz "\nenter a number: "
o1: .asciiz "\nthe sum of the entered numbers is ="
o2: .asciiz "\nthe sum of the entered numbers squared is = "
o3: .asciiz "\nthe average of the entered numbers is = "
.text

.globl main

main:
#t0 counter
#t1 sum
#t2 sum of square
li $t0, 0
loop:

la $a0, p1
li $v0, 4
syscall

li $v0, 5
syscall
beqz $v0, end

addi $t0, $t0,1

add $t1, $t1, $v0
mul $t3, $v0, $v0
 
add $t2, $t2, $t3

j loop

end:
la $a0, o1
li $v0, 4
syscall

add $a0, $t1, $zero
li $v0,1
syscall

la $a0, o2
li $v0, 4
syscall

add $a0, $t2, $zero
li $v0,1
syscall

la $a0, o3
li $v0, 4
syscall

div $a0, $t1, $t0 
li $v0,1
syscall

li $v0, 10
syscall