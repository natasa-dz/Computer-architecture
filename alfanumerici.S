#izbaciti sve alfanumerike iz stringa, izracunati broj izbacenih
# Ov*(&*o j#@e ne%#@ki stri^%ng ----> Ovo je neki string
.section .data

str1: .ascii "Unesite neki string: \0"
str1_len= . - str1
str2: .ascii "Resenje je: \0"
str2_len= . - str2

max=50
unos: .fill max,1,0
duzina: .long 0
brojac: .long 0

.section .text
.globl main

main:
	movl $4,%eax
	movl $1, %ebx
	leal str1, %ecx
	movl $str1_len, %edx
	int $0x80
	
	movl $3, %eax
	movl $0, %ebx
	leal unos, %ecx
	movl $max, %edx
	int $0x80
	
	movl %eax, duzina
	
	leal unos, %esi
	
petlja:
	cmpb $0, (%esi)
	je kraj_petlje
	
	cmpb $' ',(%esi)
	jle preskoci
	
	cmpb $'0', (%esi)
	jl izbaci
	
	cmpb $'9', (%esi)
	jle preskoci
	
	cmpb $'A', (%esi)
	jl izbaci
	
	cmpb $'Z', (%esi)
	jle preskoci
	
	cmpb $'a', (%esi)
	jl izbaci
	cmpb $'z', (%esi)
	jle preskoci
	
	jmp izbaci
preskoci: 

	incl %esi
	jmp petlja
izbaci:
	incl brojac
	movl %esi, %edi
petlja_izbaci:
	cmpb $0,(%edi)
	je petlja
	movb 1(%edi), %bl
	movb %bl,(%edi)
	incl %edi
	jmp petlja_izbaci
	
kraj_petlje:
	movl $4, %eax
	movl $1, %ebx
	leal str2,%ecx
	movl $str2_len, %edx
	int $0x80
	
	movl brojac, %eax
	subl %eax, duzina


	movl $4, %eax
	movl $1, %ebx
	leal unos, %ecx
	movl duzina, %edx
	int $0x80
	
	jmp kraj
kraj:
	movl $1, %eax
	movl brojac, %ebx
	int $0x80
	
	
	


