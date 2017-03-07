.section .data
	lee: .asciz "Introduzca el numero de elementos del arreglo: \n"
	n:		.long 0
	leenum:	.asciz "Introduzca a %d: \t"
	 leen: .asciz "%d"
		x:		.long 0
	resul: .asciz "La suma de los elementos del arreglo es: %d\n"
	
.section .bss
	arreglo:	.space 400
	
.section .text		
.globl _start		
_start:		
		pushl $lee	# Imprime mensaje inicial
		call printf	
		leal n, %eax	
		pushl %eax	
		pushl $leen	
		call scanf
		
		xorl %esi, %esi	# %esi es el indice del arreglo (i)
		xorl %edi, %edi	# %edi es el acumulador

leesum:	
		cmpl n, %esi	# compara i con n
		je fin	
		pushl %esi	
		pushl $leenum	
		call printf	# imprime mensaje para lectura de a[i]
		leal x, %ebx	
		pushl %ebx	
		pushl $leen	
		call scanf	# lee a[i]
		addl x, %edi	# suma a[i] a %edi
		incl %esi	# incrementa %esi (i)
		jmp leesum	# vuelve a leer siguiente elemento
fin:	
		pushl %edi	
		pushl $resul	
		call printf
		movl $1, %eax
		movl $0, %ebx	
		int $0x80
