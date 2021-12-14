#napisati program koji ce od dva niza formirati treci niz na sledeci nacin niz1[i]>niz2[i] ==> niz[3]=1,niz1[i]<niz2[i] ==> niz[3]=-1
#niz1[i]==niz2[i] ==> niz[3]=0 
#	    0  1  2 3 4 5
.section .data
niz1: .long 12,32,5,1,7,43
n: .long 6
niz2: .long 14,32,15,12,73,43

rez: .long 0,0,0,0,0,0
.section .text
.global main
main:
	xorl %eax,%eax #i
petlja:
	cmpl n,%eax
	jge kraj
	movl niz1( ,%eax, 4), %ebx
	movl niz2 ( ,%eax, 4), %ecx
	cmpl %ecx,%ebx
	jg clan_n1
	jl clan_n2
	movl $0, rez( ,%eax,4)
	jmp dalje
clan_n1:
	movl $1, rez ( ,%eax,4)
	jmp dalje
clan_n2:
	movl $-1, rez ( ,%eax, 4)
	jmp dalje
dalje:
	incl %eax
	jmp petlja
kraj:
	movl $1,%eax
	movl $0,%ebx
	int $0x80

