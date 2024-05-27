.data
prompt1: .asciiz "enter a radius value: "
out1: .asciiz "\narea of circle = "
pi: .double 3.141592653589793

.text
.globl main
main:

la $a0, prompt1
li $v0, 4
syscall

li $v0, 7
syscall

mul.d $f2, $f0, $f0
l.d $f4, pi

la $a0, out1
li $v0, 4
syscall


mul.d $f12, $f2, $f4

li $v0, 3
syscall

li $v0, 10
syscall