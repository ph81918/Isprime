.data
argument: .word 19
str1: .string " is a prime number."
str2: .string " is not a prime number."
.text
main:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	lw	a5,argument  #n
	sw	a5,-24(s0)
	li	a5,1         #prime
	sw	a5,-28(s0)
	li	a5,2         #i
	sw	a5,-20(s0)
	j	.L2
.L5:
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	rem	a5,a4,a5
	bne	a5,zero,.L3
	sw	zero,-28(s0)
	j	.L4
.L3:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	mul	a5,a5,a5
	lw	a4,-24(s0)
	bge	a4,a5,.L5
.L4:
        lw      a5,argument
        lw	a4,-28(s0)
	lw	s0,28(sp)
	addi	sp,sp,32
        bne     a4,zero,print1
        j       print2
        
print1:
        mv      a0,a5
        li      a7, 1 
        ecall
        la      a0,str1
        li      a7, 4
        ecall        
        li      a7, 10
        ecall
print2:
        mv      a0,a5
        li      a7, 1 
        ecall
	la      a0,str2
        li      a7, 4
        ecall
        ret
        li      a7, 10
        ecall
