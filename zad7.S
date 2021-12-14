#prebaci mala slova u velika
.section .data

recenica:  .ascii "Ana voli Milovana\0"
.section .text

.global .main

main:
	xorl %ebx, %ebx
	xorl %esi, %esi #i
petlja:
	cmpb $0, recenica (,%esi,1)
	je kraj
	cmpb $'a', recenica ( ,%esi, 1)
	jb dalje
	cmpb $'z', recenica ( ,%esi, 1)
	ja dalje
	subb $32,recenica(,%esi,1)
dalje:
	incl %esi
	jmp petlja
	
kraj:
	movl $0, %eax
	movl $1, %ebx
	int $0x80


