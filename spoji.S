#spojite dva stringa
.section .data

str1: .ascii "Unesite string: \0"
str1_len= . - str1

str2: .ascii "Unesite drugi string: \0"
str2_len= .- str2

str3: .ascii "Resenje je: \0"
str3_len= . - str3

max=50
unos1: .fill max, 1,0

max1=50
unos2: .fill max1, 1,0

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
	leal unos1, %ecx
	movl $max, %edx
	int $0x80
	decl %eax
	movl %eax, %esi #duzina unosa1
	leal unos1,%edx #kraj prvog stringa
	
	movl $4,%eax
	movl $1, %ebx
	leal str2, %ecx
	movl $str2_len, %edx
	int $0x80
	
	movl $3, %eax
	movl $0, %ebx
	leal unos2, %ecx
	movl $max1, %edx
	int $0x80

	movl %eax, %ebx #duzina unosa 2
	leal unos2, %ecx 
	movl $0, %edi #brojac
petlja:
	movb (%ecx), %al
	cmpb $'0', %al
	je kraj_petlje
	cmpb $'\n', %al
	je kraj_petlje
	addb %al, %edx
	incl %ecx
	incl %edx
	jmp petlja
	
kraj_petlje:

	movl %esi, %edi
	
	movl $4,%eax
	movl $1, %ebx
	leal str3, %ecx
	movl $str3_len, %edx
	int $0x80
	
	movl $4, %eax
	movl $1, %ebx
	leal unos1, %ecx
	movl %edi, %edx
	int $0x80
