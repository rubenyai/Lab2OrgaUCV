.section .data		
	v1:	.asciz "Primer valor es: "
	v2:	.asciz "Segundo valor es: "
	rel:	.asciz "El resultado es: %d\n"	
	ent:	.asciz "%d"	
.section .bss		
	A:			.space 4
	B:			.space 4
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

	leal v2, %eax	
	pushl %eax	
	call printf	
	addl $4, %esp	

	leal B, %eax	
	pushl %eax	
	leal ent, %eax	
	pushl %eax	
	call scanf	
	addl $8, %esp	
	
	movl A, %eax	
	addl B, %eax	
	movl %eax, resultado
		
	pushl resultado	
	leal rel, %eax	
	pushl %eax	
	call printf	
	addl $8, %esp
fin:
	movl $1, %eax	
	movl $0, %ebx	
	int $0x80	
