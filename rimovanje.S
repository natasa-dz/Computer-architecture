.section .data

str1: .ascii "Unesite dva stringa\0"
str1_len= .-str1

max=52
string1: .fill max, 1, 0
string2: .fill max, 1, 0

iste: .ascii "Recenice su iste\0"
iste_reci= .- iste

rim: .ascii "Recenice se rimuju\0"
r= .- rim

nerim: .ascii "Recenice se ne rimuju\0"
n= .-nerim

d1: .long 0 #duzina prvog stringa
d2: .long 0 #duzina drugog stringa

.section .text
.globl main
main:
	movl $4, %eax
	movl $1, %ebx
	leal str1, %ecx
	movl $str1_len, %edx
	int $0x80
	
	movl $3, %eax
	movl $0, %ebx
	leal string1, %ecx
	movl $max, %edx
	int $0x80
	
	movl %eax, d1
	
	movl $3, %eax
	movl $0, %ebx
	leal string2, %ecx
	movl $max, %edx
	int $0x80
	
	movl %eax, d2
	
	subl $2, d1
	subl $2, d2
	
	movl d1, %esi #indeksi poslednjeg karaktera
	movl d2, %edi
	
	subl $3, %esi #za rimovanje proveravamo samo poslednja tri karaktera
	movl %esi, %eax #karakteri tri mesta iza kraja
	addl $3, %esi #vratio se na kraj
poslednja_rec:
	cmpl %esi, %eax
	je rimuju_se
	movb string1(,%esi,1),%bl #poslednji karakter u %bl
	cmpb $32, %bl
	je nista
	cmpb %bl, string2(,%edi,1)
	jne nista
	decl %edi
	decl %esi
	jmp poslednja_rec
nista:
	movl $4, %eax
	movl $1, %ebx
	leal nerim, %ecx
	movl $n, %edx
	int $0x80
rimuju_se:
	movl $4, %eax
	movl $1, %ebx
	leal rim, %ecx
	movl $r, %edx
	int $0x80
	jmp provera
provera:
	movb string1(,%esi,1), %bl
	cmpb %bl, string2(,%edi,1)
	je razmak
	jne kraj
razmak:
	cmpb $32, %bl
	je iste_reci
	decl %esi
	decl %edi
	jmp provera
iste_reci:
	movl $4, %eax
	movl $1, %ebx
	leal iste_reci, %ecx
	movl $iste, %edx
	int $0x80 
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
	


