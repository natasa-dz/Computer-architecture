.section .data

recenica:  .ascii "Ana voli Milovana\0"
#prebrojati mala slova

.section .text



.global main



main:
	xorl %ebx,%ebx # broj malih slova, n
	xorl %esi,%esi # index=i
petlja:
	cmpb $0,recenica(,%esi,1)
	je kraj
	cmbp $'a',recenica(,%esi,1)
	jb dalje
	cmpb $'z',recenica(,%esi,1)
	ja dalje
	incl %ebx
dalje:
	incl %esi
	jmp petlja
	



	
