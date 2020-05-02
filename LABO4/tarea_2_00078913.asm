 
    ;EJERCICIO 1
    ; Tomando como base los últimos 5 dígitos de su carnet,
    ;cada digito representa una de las notas de las evaluaciones que serán la nota del primer parcial
    ;de una materia ficticia, por medio de un promedio, calcule la nota de su primer parcial ficticio
    ; y escriba en la fila de celdas de memoria de 200h a 20Fh el comentario correspondiente.

    ; carne 00078913 7+8+9+1+3 = 28/5 = 5.6 aproximando 6
                        
    org   100h 

        mov     ax, 0000h ; limpiando basura en ax
        add     ax, 7d
        add     ax, 8d
        add     ax, 9d
        add     ax, 1d
        add     ax, 3d
        mov     cl, 5d
        div     cl
    





    ;-------------------------
        cmp ax,6d
        je comentario

; comentario segun nota:  peor es nada

comentario:     mov     cl, "P"
                mov [200h], cl
                mov     cl, "e"
                mov [201h], cl
                mov     cl, "o"
                mov [202h], cl
                mov     cl, "r"
                mov [203h], cl
                mov     cl, ""
                mov [204h], cl

                mov     cl, "e"
                mov [205h], cl
                mov     cl, "s"
                mov [206h], cl

                mov     cl, ""
                mov [207h], cl
                        
                mov     cl, "n"
                mov [208h], cl
                mov     cl, "a"     
                mov [209h], cl
                mov     cl, "d"
                mov [20Ah], cl
                mov     cl, "a"
                mov [20Bh], cl


;EJERCICIO 2
;El presidente Bayib Nukele, de un país ficticio, necesita presentar datos de una proyección
; de casos de la pandemia COVID-19, para lo cual su equipo de expertos ha encontrado la maravillosa 
;y precisa formula precisa: “comenzando con dos casos el día uno, cada tres días se duplica el número”.
;Usted es el encargado de las gráficas, tiene que dejar una buena impresión. De manera dinámica,
;coloque 11 estimaciones partiendo del día 3, de tres en tres es decir primera celda día 3, segunda día 6,
;y así; una estimación por cada una o dos celdas de memoria, desde la celda 210h llenando toda la fila,
;cuando pase de 255 necesitará usar dos celdas de memoria para guardar el número.


    mov	cx, 0000h
	mov	di, 0d
	mov	bx, 2d
	mov	ax, 2d
	mov	cl, 0Bh

e:  mul	bx
    cmp	ax, 0100h
    jbe	loop2
    inc	di

loop2:	mov	[di+210h], ax
            inc	di
            loop e



;EJERCICIO 3
;Escriba de manera dinámica los primeros 16 números de la sucesión de Fibonacci,
;cada uno en una o dos celda de memoria, desde la celda 220h llenando toda la fila,
;cuando pase de 255 necesitará usar dos celdas de memoria para guardar el número

    mov	bx, 0d	;Formula  F[n-2]
	mov	dx, 1d 	;Formula  F[n-1]
	mov	cx, 13 	
	mov	di, 2d 	

	mov	[220h], bl
	mov	[221h], dl

fibo:mov ax, bx
	 add ax, dx
	 mov bx, dx
	 mov dx, ax
	 cmp ax, 255d
	 ja	 salto

	;menores a 255d
	mov	[220h+di], ax
	inc	di
	loop 	fibo

	;mayores a 255d
salto:	mov	[220h+di], al
	inc 	di
	mov	[220h+di], ah
	inc 	di
	loop 	fibo



    int	20h