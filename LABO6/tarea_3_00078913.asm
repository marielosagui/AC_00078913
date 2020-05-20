org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase1 
	call 	phrase2
	call	phrase3
	call 	phrase4
	call	phrase5
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
		mov	al, 03h
		int 	10h
		ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
			;IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
		mov 	al, cl
		mov 	bh, 0h
		mov 	bl, 00001111b
		mov 	cx, 1h
		int 	10h
		ret

kbwait: mov 	ax, 0000h
		int 	16h
		ret

m_cursr1:mov 	ah, 02h
		mov 	dx, di  ; columna
		mov 	dh, 2d ; fila
		mov 	bh, 0h
		int 	10h
		ret


m_cursr2:mov 	ah, 02h
		mov 	dx, di  ; columna
		mov 	dh, 6d ; fila
		mov 	bh, 0h
		int 	10h
		ret


m_cursr3:mov 	ah, 02h
		mov 	dx, di  ; columna
		mov 	dh, 10d ; fila
		mov 	bh, 0h
		int 	10h
		ret		

m_cursr4:mov 	ah, 02h
		mov 	dx, di  ; columna
		mov 	dh, 14d ; fila
		mov 	bh, 0h
		int 	10h
		ret		

m_cursr5:mov 	ah, 02h
		mov 	dx, di  ; columna
		mov 	dh, 18d ; fila
		mov 	bh, 0h
		int 	10h
		ret		


phrase1:mov 	di, 8d
lupi1:	mov 	cl, [msg1+di-8d]
		call    m_cursr1
		call 	w_char
		inc	di
		cmp 	di, len1
		jb	lupi1
		ret

phrase2:mov 	di, 18d
lupi2:	mov 	cl, [msg2+di-18d]
		call    m_cursr2
		call 	w_char
		inc	di
		cmp 	di, len2
		jb	lupi2
		ret

phrase3:mov 	di, 28d
lupi3:	mov 	cl, [msg3+di-28d]
		call    m_cursr3
		call 	w_char
		inc	di
		cmp 	di, len3
		jb	lupi3
		ret

phrase4:mov 	di, 38d
lupi4:	mov 	cl, [msg4+di-38d]
		call    m_cursr4
		call 	w_char
		inc	di
		cmp 	di, len4
		jb	lupi4
		ret


phrase5:mov 	di, 48d
lupi5:	mov 	cl, [msg5+di-48d]
		call    m_cursr5
		call 	w_char
		inc	di
		cmp 	di, len5
		jb	lupi5
		ret




section .data
msg1	db 	"QUE LE DOY? "
len1 	equ	$-msg1+8d

msg2	db 	"QUE VA QUERER? "
len2 	equ	$-msg2+18d

msg3	db 	"QUE VA LLEVAR?"
len3 	equ	$-msg3+28d

msg4	db 	"PARA ESO ESTOY "
len4 	equ	$-msg4+38d

msg5	db 	"PARA SERVIRLE! "
len5 	equ	$-msg5+48d