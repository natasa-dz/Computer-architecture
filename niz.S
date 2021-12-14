.section .data
rezultat: .long 0
.section .text
.globl main
saberi:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	movl 8(%ebp),%eax
	addl 12(%ebp), %eax
	movl 16(%ebp), %ebx
	movl %eax, (%ebx)
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
	
main:
	pushl $rezultat
	pushl $123
	pushl $456
	call saberi
	addl $12, %esp
kraj:
	movl $1,%eax
	movl $0, %ebx
	int $0x80
	
