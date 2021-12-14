.section .data
#	    0  1  2 3 4 5
niz: .long 12,32,5,1,7,43
n: .long 6
suma: .long 0

.section .text
	/*
		int suma=0;
		for(int i=0; i<n; i++)
		{
			suma=suma+niz[i];
		}
	*/
	
	/*
		int suma=0;
		int* p;
		p=&niz[0];
		for(int i=0; i<n; i++)
		{
			suma=suma+*p;
			p++;
		}
	
	*/


.global main



main:
	xorl %eax,%eax #suma
	xorl %esi,%esi #i
petlja:
	cmpl n,%esi
	jge kraj
	addl niz(,%esi,4),%eax
	incl %esi
	jmp petlja
	##################################################
	xorl %eax,%eax #suma
	xorl %esi,%esi
	movl $niz,%ebx
petlja2:
	cmpl n,%esi
	jge kraj
	addl (%ebx) ,%eax
	addl $4,%ebx
	incl %esi
	jmp petlja2
	
kraj:
	movl $1,%eax
	movl $0,%ebx
	int $0x80


