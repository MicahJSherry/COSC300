.data 
p1: .asciiz "\nenter a staring value =>"
p2: .asciiz "\nenter a ending  value =>"
p3: .asciiz "\nenter a value for decrement =>"

v1: .asciiz "\nvalue1 = "
v2: .asciiz "\nvalue2 = "

o1: .asciiz "\ndecrement value = "
o2: .asciiz "\nnumber of iterations from value1 to value2 = "

.text
.globl main 
main:

la $a0, p1
li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f13, $f0

la $a0, p2
li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f14, $f0

la $a0, p1
li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f3, $f0

c.lt.s $f13, $f14
bc1t noswap
# swap
mov.s $f12, $f13
mov.s $f13, $f14
mov.s $f14, $f12

noswap:

la $a0, v1
li $v0, 4
syscall

li $v0, 2
mov.s $f12, $f13
syscall

la $a0, v2
li $v0, 4
syscall

li $v0, 2
mov.s $f12, $f14
syscall

la $a0, o1
li $v0, 4
syscall

li $v0, 2
mov.s $f12, $f3
syscall

li.s $f2, 0.0
li.s $f1, 1.0

loop: 
sub.s $f14, $f14, $f3
c.lt.s $f14, $f13
bc1t end
add.s $f2, $f2, $f1

j loop

end:

la $a0, o2
li $v0, 4
syscall
mov.s $f12, $f2
li $v0,2
syscall

li $v0, 10 
syscall 
