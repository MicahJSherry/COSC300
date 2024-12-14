.data
p1: .asciiz "enter a number (0 to Quit) => "
nl: .asciiz "\n"
o0: .asciiz "the count of numbers enter = "
o1: .asciiz "sum of the numbers entered = "
o2: .asciiz "sum of the numbers entered^2 = "
o3: .asciiz "the mean of the numbers = "
.text
.globl main

main:
li $t0, 5

# zero value to use for comparison.
li.s $f3, 0.0

# counter
li.s $f4, 0.0

# one to increment
li.s $f7, 1.0

# sum
li.s $f5, 0.0

# sum of squared
li.s $f6, 0.0

loop: 
#prompt
la $a0 p1
li $v0, 4
syscall

#get input (sp)
li $v0, 6
syscall

#compare
c.eq.s $f0, $f3
bc1t store

addi $sp, $sp, -4
s.s $f0, 0($sp)
add.s $f4, $f4, $f7

add.s $f5, $f5, $f0

mul.s $f0, $f0, $f0
add.s $f6, $f6, $f0

j loop

store:
addi $sp, $sp, -4
s.s $f4, 0($sp)

#print count 
la $a0, o0 
li $v0, 4
syscall
mov.s $f12, $f4
li $v0, 2
syscall
la $a0, nl 
li $v0, 4
syscall

addi $sp, $sp, -4
s.s $f5, 0($sp)

#print sum 
la $a0, o1 
li $v0, 4
syscall
mov.s $f12, $f5
li $v0, 2
syscall
la $a0, nl 
li $v0, 4
syscall

addi $sp, $sp, -4
s.s $f6, 0($sp)

#print sum ^2
la $a0, o2 
li $v0, 4
syscall
mov.s $f12, $f6
li $v0, 2
syscall
la $a0, nl 
li $v0, 4
syscall

div.s $f5, $f5, $f4
addi $sp, $sp, -4
s.s $f5, 0($sp)

#print mean
la $a0, o3 
li $v0, 4
syscall
mov.s $f12, $f5
li $v0, 2
syscall
la $a0, nl 
li $v0, 4
syscall

end:
#exit
li $v0, 10 
syscall 
