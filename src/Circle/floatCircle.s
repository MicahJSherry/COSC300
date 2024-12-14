.data
pi: .float 3.14159265359
r:  .float 12.123456789
p1: .asciiz "pi = "
p2: .asciiz "\nradius = "
o1: .asciiz "\narea = "


.text
.globl main
main:




#printer for p1
la $a0, p1
li $v0, 4
syscall

#load and print pi
l.s $f12, pi
li $v0, 2
syscall
mov.s $f2, $f12

#printer for p2
la $a0, p2
li $v0, 4
syscall

#printer for r
l.s $f12, r
li $v0, 2
syscall
mov.s $f4, $f12

#printer for o1
la $a0, o1
li $v0, 4
syscall

mul.s $f12, $f4, $f4
mul.s $f12, $f12, $f2
li $v0, 2
syscall

li $v0, 10
syscall


