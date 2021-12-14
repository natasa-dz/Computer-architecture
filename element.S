#poredi k-ti i k-ti +2 clan niza, ukoliko su ista u drugi niz staviti 0, ako je k manje 1, ,ako je vece -1, niz2 ima 2 clana manje od niza 1

.section .data
	niz1: .long 1,2,3,4,2,5
	niz1_len= 6
	niz2_len=4
	niz2: .fill niz2_len,4,0
.section .text
.globl main
main:
	movl $0, %esi
	movl $2, %edi
poredi:
	cmpl $niz2_len, %esi
	jmp kraj
	movl niz1(,%esi,4),%eax
	cmpl %eax,niz1(,%edi,4)
	jg veci
	jl manji
	incl %esi
	incl %edi
	jmp poredi
veci:
	incl niz2(,%esi,4)
	incl %esi
	incl %edi
	jmp kraj
manji:
	decl niz2(,%esi,4)
	incl %esi
	incl %edi
	jmp poredi
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

