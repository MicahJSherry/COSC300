# program written by Micah Sherry
# Program written on 9/5/23

.data
str: .asciiz "Education is the most powerful weapon which you can use to change the world -- Nelson Mandela"
#str: .asciiz "hello"
prompt: .asciiz "Given String is = "
ans: .asciiz "\n\nTotal Number of Letters in a givenString including Spaces is = "

.text
.globl main
main:

la $a0, prompt
li $v0, 4
syscall

la $a0, str
li $v0, 4
syscall

la $t1, str
li $t0, 0

Loop:
lb $t2, 0($t1)
beqz $t2, StringEnd
addi $t0, $t0, 1
addi $t1, $t1, 1
j Loop

StringEnd:
la $a0, ans
li $v0, 4
syscall
#move $a0, $t0
li $v0, 1
syscall

li $v0, 10
syscall
