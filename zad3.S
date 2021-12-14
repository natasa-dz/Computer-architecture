.section .data
#	    0  1  2 3 4 5
niz: .long 12,32,5,1,7,43
n: .long 6
x: .long 13
#naci najveci element niza


.section .text
	/*
		int maks=niz[0];
		for(int i=1; i<n; i++)
		{
			if(niz[i]>maks)
			{
				maks=niz[i];
			}
		}
	*/
	
	/*
	
	
	*/
.global main

main:

xorl %ebx,%ebx #i
movl niz(,%ebx,4),%eax #maks
petlja:
incl %ebx
cmpl n, %ebx
jge kraj
cmpl niz(,%ebx,4),%eax
jg petlja
movl niz(,%ebx,4),%eax
jmp petlja
kraj:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
	
