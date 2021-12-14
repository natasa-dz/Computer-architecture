movb (%esi),%dl
cmpb %dl, "\n'
je kraj
cmpb (%esi), "!"
je povecaj
incl (%esi)
povecaj:
incl %edi

kraj:
cmpb $'3', %edi
jle kec
cmpb$'8',%edi
jle dva
cmpb $'9',%edi
jle trojka


 
	
	
