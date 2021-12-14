.section .data
.section .text
.globl izbaci
#int ista(char* str):
izbaci:

	pushl %ebp
	movl %esp, %ebp
	pushl %esi
	pushl %edi
	pushl %ebx
	
	movl 8(%ebp), %esi
	movl $0, %ebx #brojac za izbacena slova
petlja:
	cmpb $0, (%esi)
	je kraj_petlje
	cmpb $'A', (%esi)
	je izbaci_samoglasnik
	cmpb $'E', (%esi)
	je izbaci_samoglasnik
	cmpb $'I', (%esi)
	je izbaci_samoglasnik
	cmpb $'O', (%esi)
	je izbaci_samoglasnik
	cmpb $'U', (%esi)
	je izbaci_samoglasnik
	cmpb $'a', (%esi)
	je izbaci_samoglasnik
	cmpb $'e', (%esi)
	je izbaci_samoglasnik
	cmpb $'i', (%esi)
	je izbaci_samoglasnik
	cmpb $'o', (%esi)
	je izbaci_samoglasnik
	cmpb $'u', (%esi)
	je izbaci_samoglasnik
	incl %esi
	jmp petlja
izbaci_samoglasnik:
	movl %esi, %edi
	incl %ebx
	jmp petlja_izbaci
petlja_izbaci:
	cmpb $0, (%edi)
	je petlja
	movb 1(%edi), %bl
	movb %bl, (%edi)
	incl %edi
	jmp petlja_izbaci
kraj_petlje:
	movl %ebx, %eax
	popl %ebx
	popl %edi
	popl %esi
	movl %ebp, %esp
	popl %ebp
	ret
