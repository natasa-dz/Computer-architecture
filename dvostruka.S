.section .data
a: .quad 100000001
b: .quad 111111111
c: .quad 222222222
zbir: .quad 0
minimum: .quad 0
.section .text

.globl main
main:
	movl $a, %eax
	movl (%eax), %ebx #nizi deo a
	movl 4(%eax), %ecx #visi deo a
	movl $c, %edx
	movl $b, %eax
	
	cmpl %ebx, (%eax) #nizi delovi
	jg a_manji
	jl b_manji
	cmpl %ecx,4(%eax) #visi delovi
	jg a_manji
	jl b_manji
a_manji:
	cmpl %ebx, (%edx)
	jl c_min
	jg a_min
	cmpl %ecx, 4(%edx)
	jl c_min
	jg a_min
a_min:
	movl %ebx, minimum
	movl %ecx, minimum+4
	movl %edi, zbir
	movl (%edx), %ebx
	movl 4(%edx), %ecx
	addl %ebx, zbir
	movl %esi, zbir
	addl %ecx, zbir+4
	jmp kraj
	
c_min:
	movl $0, %eax
	movl (%edx), %eax
	movl %eax, minimum
	movl 4(%edx), %eax
	movl %eax, minimum+4
	movl %edi, zbir
	addl %ebx, zbir
	movl %esi, zbir
	addl %ecx, zbir+4
	jmp kraj
b_manji:
	movl (%eax), %edi #nizi ddeo b
	movl 4(%eax), %esi #visi deo b
	cmpl %edi, (%edx)
	jl c_min
	jg b_min
	cmpl %esi, 4(%edx)
	jl c_min
	jg b_min
b_min:
	movl %edi, minimum
	movl %esi, minimum+4
	movl (%edx), %edi
	movl 4(%edx), %esi
	movl %edi, zbir
	addl %ebx, zbir
	movl %esi, zbir
	addl %ecx, zbir+4
	jmp kraj
	
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
