 

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
    
        cmp ax,6d
        je comentario

    int 20h

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

