#napisati program koji sva mala slova pretvara u velika, sva velika u mala, a sve ostale karaktere menja karakterom _
.section .data

recenica:  .ascii "Ana voli Milovana\0"
.section .text

.global .main

main:
	xorl %esi, %esi #i

petlja:
	cmpb $0, recenica ( ,%esi, 1)
	je kraj
	cmpb $'A', recenica ( ,%esi, 1)
	jb upis
	cmpb $'Z', recenica ( ,%esi, 1 )
	jbe veliko_u_malo
	cmpb $'a', recenica ( ,%esi, 1 )
	jb upis
	cmpb $'z', recenica ( ,%esi, 1)
	jbe malo_u_veliko
	
upis:
	movb $'_',recenica(,%esi,1)
	jmp dalje
malo_u_veliko:


	subb $32,recenica(,%esi,1)
	jmp dalje

veliko_u_malo:

	addb $32,recenica(,%esi,1)
dalje:
	incl %esi
	jmp petlja
	

kraj:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
