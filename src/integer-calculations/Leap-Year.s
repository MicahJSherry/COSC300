.data
p1: .asciiz "enter a year: "
f: .asciiz " is not a leap year"
t: .asciiz " is a leap year"

.text

.globl main

main:

la $a0, p1
li $v0, 4
syscall

li $v0, 5
syscall


add $t0, $v0, $zero

add $a0, $v0, $zero
li $v0, 1
syscall

# year % 400
li $t2, 400 
rem $t1, $t0, $t2

beqz $t1, true 

# year % 100
li $t2, 100 
rem $t1, $t0, $t2

beqz $t1, false

li $t2, 4
rem $t1, $t0, $t2

beqz $t1, true

j false

true:
la $a0, t
li $v0, 4
syscall
j end

false:
la $a0, f
li $v0, 4
syscall
j end

end: 
li $v0, 10
syscall 