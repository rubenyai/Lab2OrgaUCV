.section .data		
	v1:	.asciz "Valor es: "
	rel1:	.asciz "El resultado es Par" 
	rel2:	.asciz "El resultado es Impar"		
	ent:	.asciz "%d"	
.section .bss		
	A:			.space 4
	resultado:	.space 4
	
.section .text		
.globl _start	
_start:	

	leal v1, %eax	
	pushl %eax	
	call printf
	addl $4, %esp	

	leal A, %eax	
	pushl %eax	
	leal ent, %eax	
	pushl %eax	
	call scanf	
	addl $8, %esp	

	#pushl A
	#leal ent, %eax	
	#pushl %eax	
	#call printf	
	#addl $8, %esp	
	
	movl $1, %ebx
	movl A,%eax	
	andl %eax, %ebx	
	cmpl $0,%ebx
	movl %ebx, resultado
	jg impar

par:		
	pushl resultado	
	leal rel1, %eax	
	pushl %eax	
	call printf	
	addl $8, %esp
	jmp fin

impar:	
	pushl resultado	
	leal rel2, %eax	
	pushl %eax	
	call printf	
	addl $8, %esp
	jmp fin
	
	
fin:
	leal A, %eax	
	pushl %eax	
	leal ent, %eax	
	pushl %eax	
	call scanf	
	addl $8, %esp
	
	movl $1, %eax	
	movl $0, %ebx	
	int $0x80	
