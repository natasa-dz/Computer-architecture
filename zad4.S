#napisati program koji nalazi sumu svih elemenata niza koji su veci od zadate vrednosti x
.section .data
#	    0  1  2 3 4 5
niz: .long 12,32,5,1,7,43
n: .long 6
x: .long 9

.section .text
.global main
main:
	xorl %ebx,%ebx #i
	xorl %ecx, %ecx #rez
petlja:
	cmpl n,%ebx
	jge kraj
	movl niz(,%ebx,4),%esi
	cmpl x,%esi #poredimo niz i x
	jl dalje
	addl %esi, %ecx
dalje:
	incl %ebx
	jmp petlja

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
		
	
