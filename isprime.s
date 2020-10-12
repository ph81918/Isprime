.data
argument: .word 19
str1: .string " is a prime number."
str2: .string " is not a prime number."
.text
prologue:
       addi	sp,sp,-12    #prologue
	sw	s0,8(sp)     #prologue
	addi	s0,sp,12     #prologue
	lw	a5,argument  #n
	sw	a5,-4(s0)    #store n in -4(s0)
	li	a5,1         #prime = 1
	sw	a5,-8(s0)    #store prime in -8(s0)
	li	a5,2         #i = 2
	sw	a5,0(s0)     #store i in -0(s0)
        lw	a4,-4(s0)    #a4 = n
	j	for

if:	
	lw	a5,0(s0)     #a5 = i
	rem	a5,a4,a5     #n%i
	bne	a5,zero,i++  #whether n is divided by i
	sw	zero,-8(s0)  #if n can be divided by i, prime = 0
	j	epilogue
i++:
	lw	a5,0(s0)     #a5 = i
	addi	a5,a5,1      
	sw	a5,0(s0)
for:
	lw	a5,0(s0)     #a5 = i
	mul	a5,a5,a5     #a5 = i*i	
	bge	a4,a5,if     #for loop condition
epilogue:
        lw     a0,argument    #a5 = n (for print)        
        lw     a4,-8(s0)      #a4 = prime
        lw     s0,8(sp)       #epilogue
        addi   sp,sp,12       #epilogue
        bne    a4,zero,print1 #if(prime)      
        li     a7, 1          #print "n"
        ecall
        la     a0,str2        #print " is not a prime number."
        li     a7, 4
        ecall    
        li     a7, 10         #end
        ecall        
        
print1:
        li     a7, 1 
        ecall
        la     a0,str1
        li     a7, 4          #print " is a prime number."
        ecall        
        li     a7, 10         
        ecall
