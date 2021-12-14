.section .data

str1: .ascii "Unesite string: \0"
str1_len= . - str1

str2: .ascii "Obrnuti redosled je: \0"
str2_len= .- str2
str_len=21
max=50
unos: .fill str_len*max, 1, 0
duzina: .long 0

.section .text

.globl main
main:
unosi:
	cmpl $11, %esi
	jge dalje
	
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
	incl %esi
	addl $str_len,%edi
	jmp unosi
dalje:
	movl $4,%eax
	movl $1, %ebx
	leal str2, %ecx
	movl $str2_len, %edx
	int $0x80
	subl $str_len, %edi
	decl %esi
obrnuti_ispis:
	cmpl $0, %esi
	je kraj
	movl $4,%eax
	movl $1, %ebx
	movl %edi, %ecx
	movl $str_len, %edx
	int $0x80
	subl $str_len, %edi
	decl %esi
	jmp obrnuti_ispis
	
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
