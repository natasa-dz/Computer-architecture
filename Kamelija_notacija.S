#Kamelija notacija---> primer: oVo JE nEkI TEKST, postaje Ovo Je Neki Tekst
.section .data

str1: .ascii "Unesite string: \0"
str1_len= . - str1

str2: .ascii "Resenje je: \0"
str2_len= .- str2

max=50
unos: .fill max, 1, 0
duzina: .long 0
usao_u_rec: .long 0 #0 nismo usl, 1 jesmo

.section .text

.globl main

main:
	movl $4,%eax
	movl $1, %ebx
	leal str1, %ecx
	movl $str1_len, %edx
	int $0x80
	
	movl $3, %eax
	movl $1, %ebx
	leal unos, %ecx
	movl $max, %edx
	int $0x80
	
	movl %eax, duzina
	leal unos, %esi
petlja:
	cmpb $0, (%esi)
	je kraj_petlje
	cmpb $' ', (%esi)
	je razmak
	
	cmpb $'A', (%esi)
	jl preskoci
	cmpb $'Z', (%esi)
	jle veliko_slovo
	cmpb $'a',(%esi)
	jl preskoci
	cmpb $'z', (%esi)
	jle malo_slovo
razmak:
	movl $0, usao_u_rec
	incl %esi
	jmp petlja
malo_slovo:
	cmpl $0, usao_u_rec
	je povecaj_slovo
	incl %esi
	jmp petlja
povecaj_slovo:
	subb $32, (%esi)
	movl $1, usao_u_rec
	incl %esi
	jmp petlja

veliko_slovo:
	cmpl $0, usao_u_rec
	je nasli_prvo_slovo
	addb $32,(%esi)
	incl %esi
	jmp petlja
nasli_prvo_slovo:
	movl $1, usao_u_rec
	incl %esi
	jmp petlja
preskoci:
	incl %esi
	jmp petlja
kraj_petlje:
	movl $4, %eax
	movl $1, %ebx
	leal str2, %ecx
	movl $str2_len, %edx
	int $0x80
	
	movl $4, %eax
	movl $1, %ebx
	leal unos, %ecx
	movl duzina, %edx
	int $0x80	
	jmp kraj
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

