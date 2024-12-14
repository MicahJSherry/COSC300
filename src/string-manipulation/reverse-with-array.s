# program written by Micah Sherry
# Program written on 9/16/23

.data 
str: .asciiz "If GM had kept up with technology like the computer industry has, we would all be driving $25 cars that got 1,000 MPG. -Bill Gates"
#str: .asciiz "hello"
prompt: .asciiz "the given string is = "
ans: .asciiz "\n\nthe given string reversed is = "
array: .space 200
.text
.globl main 

main:
la $a0, prompt
li $v0, 4
syscall

la $a0, str
li $v0, 4
syscall

la $t0, str 	# pointer to str
la $t1, array	# pointer to array
li $t2, 0	# counter of str's length

ForwardsLoop: 
lb $t3, 0($t0)
beqz $t3, LLLL
sb $t3, 0($t1)
addi $t0, 1
addi $t1, 1
addi $t2, 1

j ForwardsLoop

LLLL:
la $t0, str 	# resets the pointer of str
addi $t1, -1

BackwardsLoop:
beq $t2, $zero, end
lb $t3, 0($t1)
sb $t3, 0($t0)
addi $t0, 1
addi $t1, -1
addi $t2, -1
j BackwardsLoop 


end:
la $a0, ans
li $v0, 4
syscall

la $a0, str
li $v0, 4
syscall

li $v0, 10
syscall