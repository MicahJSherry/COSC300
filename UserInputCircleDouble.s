.data
p1: .asciiz "enter radius: "
p2: .asciiz "enter PI value: "
o1: .asciiz "area of the circle = "
.text
.globl main

main:
la $a0, p1 
li $v0, 4
syscall

li $v0, 7
syscall 
mov.d $f4, $f0

la $a0, p2 
li $v0, 4
syscall

li $v0, 7
syscall 
mov.d $f2, $f0

la $a0, o1 
li $v0, 4
syscall

mul.d $f12, $f4, $f4
mul.d $f12, $f12, $f2
li $v0, 3
syscall

li $v0, 10
syscall


