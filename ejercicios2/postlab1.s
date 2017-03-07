.section .data 		
	cad1: 	.asciz "Hola Mundo , escriba algo para cerrar programa "
	cad2: 	.asciz "%s" 	
.section .bss 		
	.comm cadena,50,1

.section .text

.globl _start
_start: 		

	leal cad1, %eax
	pushl %eax
	call printf
	addl $4, %esp

	leal cadena, %eax
	pushl %eax
	leal cad2, %eax
	pushl %eax
	call scanf
	addl $8, %esp

	movl $1, %eax
	movl $0, %ebx
	int $0x80

