.section .data
#	    0  1  2 3 4 5
niz: .long 12,32,5,1,7,43
n: .long 6

dg: .long 10
gg: .long 40

#izbrojati koliko elemenata niza se nalazi u intervalu [dg,gg]


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
		
		int brojac=0;
		for(int i=0; i<n; i++)
		{
			if(niz[i]>dg && niz[i]<gg)
			{
				brojac++;
			}
		}
	
	*/
.global main

main:
	xorl %eax,%eax #rez=0
	xorl %ebx, %ebx #i
petlja:
	cmpl %ebx, n #poredimo n i i
	jge kraj
	movl niz ( ,%ebx, 4), %ecx
	cmpl dg,%ecx
	jl dalje
	cmpl gg,%ecx
	jg dalje
	addl %ecx,%eax

dalje:
	incl %ebx
	jmp petlja	
kraj:
movl $1, %eax
movl $0, %ebx
int $0x80
	
	
