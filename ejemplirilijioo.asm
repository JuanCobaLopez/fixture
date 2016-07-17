org  100h	; set location counter to 100h
inicio:
    mov SI, offset var1 
    mov cx,0
    mov cx,10
    mov ah,7
ciclo: int 21h
    mov [SI], al
    inc SI
    loop ciclo
    mov cx,1
    mov ah,2
    mov SI, offset var1
otrociclo: mov dl, [SI]
    int 21h
    inc SI
    loop otrociclo
fin: int 20h        
var1 db ?