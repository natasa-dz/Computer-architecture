#sortiraj niz
.section .data

niz1: .long 40, 8 ,9 -4, 0, -5
vel: .long 6

.section .text

.globl main

main:
	movl $0, %esi
	movl $1, %edi
	movl vel, %ebx
	cmpl $1, $ebx
	jmp kraj
sortiraj:
	cmpl %ebx, %edi
	jne petlja
	incl %esi
	movl %esi, %edi
	incl %edi
	cmpl %edi, vel
	je kraj
petlja:
	movl niz1(,%esi, 4), %eax
	cmpl %eax, niz1(, %edi, 4)
	jl zameni
	incl %edi
	jmp sortiraj
zameni:
	movl niz(,%edi, 4), %edx
	movl %eax, niz(, %di, 4)
	movl %edx, niz(,%esi,4)
	incl %edi
	jmp sortiraj
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

