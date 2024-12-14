.data
prompt: .asciiz "enter a number: "
output: .asciiz "the largest of the three is = "
 
.text
.globl main
main:

# first number t0
la $a0, prompt
li $v0, 4
syscall 

li $v0, 5
syscall
move $t0, $v0

#second number in t1 
la $a0, prompt
li $v0, 4
syscall 

li $v0, 5
syscall
move $a1, $v0

# third number in t2
la $a0, prompt
li $v0, 4
syscall 

li $v0, 5
syscall
move $a2, $v0

la $a0, output
li $v0, 4
syscall 


move $a0, $t0
jal max

move $a0, $v0
li $v0, 1
syscall

#end
li $v0, 10
syscall

max:
addi $sp $sp -16
sw $a0, 0($sp)
sw $a1, 4($sp)
sw $a2, 8($sp)
sw $ra, 12($sp)

jal max2 

move $a0, $v0
move $a1, $a2

jal max2

lw $a0, 0($sp)
lw $a1, 4($sp)
lw $a2, 8($sp)
lw $ra, 12($sp)
addi $sp, $sp, 16

jr $ra

max2:

bge $a0, $a1, true
move $v0, $a1
jr $ra 

true:
move $v0, $a0

jr $ra
