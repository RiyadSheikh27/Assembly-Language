.model
.stack 100h
.data

a db 'Enter First Digit $'
b db 'Enter Second Digit $'
c db 'Sum of the Numbers $'
d db 'Sub of the Numberd $'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,9
    lea dx,b
    int 21h  
    
    mov ah,1
    int 21h
    mov bh,al 
    
    mov ah,9
    lea dx,c
    int 21h
    
    add bl,bh
    sub bl,48
    mov ah,2
    mov dl,bl
    int 21h 
    
     mov ah,9
    lea dx,d
    int 21h
    
    sub bl,bh
    add bl,48
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main