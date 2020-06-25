org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

;fila horizontal lado izquierdo
	mov 	si, 25d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_h

;fila horizontal lado derecho
	mov 	si, 175d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_h2

;linea vertical derecho
	mov	si, 215d ; X -> Columna
	mov di, 50d ; Y -> Fila
	call linea_v

;linea vertical izquierdo
	mov	si, 25d ; X -> Columna
	mov di, 50d ; Y -> Fila
	call 	linea_v


; segunda linea vertical izq
mov	si, 65d ; X -> Columna
mov di, 115d ; Y -> Fila
call 	linea_vp


; segunda linea vertical der
mov	si, 175d ; X -> Columna
mov di, 115d ; Y -> Fila
call 	linea_vp



; fila horizontal lado izquierda abajo
mov si, 25d ; X -> Columna  ; 135 original
mov di, 180d ; Y -> Fila
call 	linea_h


; fila horizontal lado derecha abajo
mov si, 175d ; X -> Columna  ; 135 original
mov di, 180d ; Y -> Fila
call 	linea_h2

;; diagonales;;
; diagonal izquierda
mov si, 65d ; X -> Columna ; 185 original
mov di, 50d ; Y -> Fila
call linea_di

;diagonal derecha
mov si, 175d ; X -> Columna
mov di, 50d ; Y -> Fila
call linea_dd  


; diagonal interior  izquierda
mov si, 65d ; X -> Columna ; 185 original
mov di, 115d ; Y -> Fila
call linea_di2

;diagonal interior  derecha
mov si, 175d ; X -> Columna
mov di, 115d ; Y -> Fila
call linea_dd2

call 	kb		; Utilizamos espera de alguna tecla
int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 0011b ; color CIAN
	int 	10h
	ret

linea_h: 
lupi_h:	mov cx, 0d ; Columna 
		add 	cx, si
		mov	dx, di ; Fila
		call 	pixel
		inc 	si
		cmp 	si, 65d
		jne 	lupi_h
		ret

linea_h2: 
lupi_h2:mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 215d
	jne 	lupi_h2
	ret



linea_v:
lupi_v:	mov 	cx, si ; Columna 
		mov		dx, 0d ; Fila
		add 	dx, di
		call 	pixel
		inc 	di
		cmp 	di, 180d
		jne 	lupi_v
		ret

linea_vp:
lupi_vp:mov cx, si ; Columna 
		mov	dx, 0d ; Fila
		add 	dx, di
		call 	pixel
		inc 	di
		cmp 	di, 180d
		jne 	lupi_vp
		ret

;; diagonales externas
linea_di:
lupi_di:mov cx, si ; Columna 
	mov	dx, 0d ; Fila
	add dx, di
	call pixel
	inc di
    inc	si
	cmp 	di, 70d  
	jne 	validadi
validadi:	cmp	si,120d 
	jne 	lupi_di	
	ret

linea_dd:
lupi_dd:mov cx, si ; Columna 
		mov	dx, 0d ; Fila
		add dx, di
		call pixel
		inc di
    	dec	si
		cmp di, 70d  
		jne valig

valig:cmp	si,120d  
	jne 	lupi_dd	
	ret

; diagonales internas 
linea_di2:  ;linea_adg2:
lupi_di2:mov cx, si ; Columna 
		mov	dx, 0d ; Fila
		add dx, di
		call pixel
		inc di
    	inc	si
		cmp di, 70d  
		jne validadi2
validadi2:cmp	si,120d 
		jne 	lupi_di2	
		ret

linea_dd2:   ;aig2
lupi_dd2:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    dec		si
	cmp 	di, 70d  
	jne 	validd2

validd2:cmp	si,120d  
		jne lupi_dd2	
		ret


kb: mov	ah, 00h
	int 16h
	ret

section .data