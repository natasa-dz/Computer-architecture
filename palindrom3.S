#palindrom
.section .data
recenica: .ascii "^%AnA %$V olI MiLoVana$%#\0"
palindrom: .byte 0

.section .text
.globl main

main:

	movl $recenica, %eax
	movb $0, palindrom
	movl $0, %esi #gornji pokazivac
	movl $0, %edi #donji pokazivac
	
nadji_kraj:
	cmpb $0, 1(%eax,%edi,1)
	je nadji_pocetak
	incl %edi
	jmp nadji_kraj
nadji_pocetak:
	movb (%eax,%esi,1),%bl
	cmpb $'a', %bl
	jb proveri_ponovo
	cmpb $'z', %bl
	ja proveri_ponovo
	addb $'A'-'a',%bl
proveri_ponovo:
	cmpb $'A',%bl
	jl nije_slovo
	cmpb $'Z', %bl
	ja nije_slovo
	jmp poslednji_provera
nije_slovo:
	incl %esi
	jmp nadji_pocetak
poslednji_provera:
	movb (%eax,%edi, 1), %bh
	cmpb $'a', %bh
	jb proveri_ponovo1
	cmpb $'z', %bh
	ja proveri_ponovo1
	addb $'A'-'a',%bh
proveri_ponovo1:
	cmpb $'A',%bh
	jl nije_slovo2
	cmpb $'Z', %bh
	ja nije_slovo2
	jmp provera_palindrom
nije_slovo2:
	decl %edi
	jmp poslednji_provera
provera_palindrom:
	cmpb %bh, %bl
	jne kraj
	incl %esi
	decl %edi
	cmpl %esi,%edi
	jae nadji_pocetak
	movb $1, palindrom
kraj:
	movl $1,%eax
	movl $0, %ebx
	int $0x80
	


