.data

p1: .asciiz "enter a radius value: "

o1: .asciiz "\nthe surface area of the sphere = "

o2: .asciiz "\nthe volume of the sphere = "

pi: .double 3.141592653589793
four: .double 4.000000000000
three: .double 3.00000000000

.text
.globl main

main:
la $a0, p1
li $v0, 4
syscall

li $v0, 7
syscall
mov.d $f12, $f0

l.d $f14, pi

jal surface
mov.d $f2, $f0

jal volume

la $a0, o1
li $v0, 4
syscall

mov.d $f12, $f2
li $v0, 3
syscall

la $a0, o2
li $v0, 4
syscall

mov.d $f12, $f0
li $v0, 3
syscall



li $v0, 10
syscall

surface:
l.d $f4, four

mul.d $f0, $f12, $f12
mul.d $f0, $f4, $f0
mul.d $f0, $f14, $f0

jr $ra
volume:
l.d $f4, four

mul.d $f0, $f12, $f12
mul.d $f0, $f0, $f12
mul.d $f0, $f4, $f0
mul.d $f0, $f14, $f0

l.d $f4, three
div.d $f0, $f0, $f4

jr $ra






