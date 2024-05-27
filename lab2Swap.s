# program written by Micah Sherry
# Program written on 9/16/23

.data 
str: .asciiz "If GM had kept up with technology like the computer industry has, we would all be driving $25 cars that got 1,000 MPG. -Bill Gates"
#str: .asciiz "hello"
prompt: .asciiz "the given string is = "
ans: .asciiz "\n\nthe given string reversed is = "


.text
.globl main

main:
#prints string
la $a0, prompt
li $v0, 4
syscall

la $a0, str
li $v0, 4
syscall

# gets 2 copies of the address of str
la $t0, str 
add $t1, $zero, $t0

# puts a counter in reg $t2 
 
Loop:
lb $t3, 0($t1) # load character
beqz $t3, swapLoop # if $t3 contains null char branch to swapLoop 
addi $t1, 1 #increment address in reg $t1 
j Loop

swapLoop:
addi $t1, -1 #decrements address of in reg $t1
lb $t3, 0($t0)
lb $t4, 0($t1)
sb $t3, 0($t1)
sb $t4, 0($t0) 

beq $t0, $t1, end
addi $t0, 1
beq $t0, $t1, end

j swapLoop

end:
la $a0, ans
li $v0, 4
syscall

la $a0, str
li $v0, 4
syscall

li $v0, 10
syscall