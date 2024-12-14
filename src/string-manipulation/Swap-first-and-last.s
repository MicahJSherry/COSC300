.data
p1: .asciiz "the input is string is = "
str: .asciiz "charstr" 
o1: .asciiz "\n\n the output(first and last swapped) is = "

.text
.globl main
main:
la $a0, p1
li $v0, 4
syscall

la $a0, str
li $v0, 4
syscall

#t0 pointer to the start
la $t0, str

#t1 pointer to the end
add $t1, $t0, $zero
#t2 staring char
lb $t2, 0($t0)

loop:

lb $t3 0($t1)
beqz $t3, end
addi $t1, $t1, 1

j loop
end:

addi $t1, $t1 -1
#t3 ending char
lb $t3, 0($t1)
sb $t2, 0($t1)

sb $t3, 0($t0)

la $a0, o1
li $v0, 4
syscall
add $a0, $t0 $zero
syscall

li $v0, 10
syscall

