%include "boot.inc"
section test vstart=LOADER_BASE_ADDR
	mov byte [gs:0x00],'2'
	jmp jmptest
hello:
	mov byte [gs:0x00],'6'
times 60 dq 0
jmptest:
	mov byte [gs:0x00],'5'
	jmp $

