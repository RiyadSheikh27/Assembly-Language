.model small
.stack 100h
.data
 number db "Input Number: $ "
 display1 db "It is a even number $" 
 display2 db "It is a odd number $" 
      
.code
main proc
    mov ax,@data
    mov ds,ax
     
    mov ah,9
    lea dx,number
    int 21h
     
    mov ah,1
    int 21h
    mov bl,al  
    test bl, 1      ; Test the least significant bit (LSB)
    jz even         ; Jump to even if the LSB is 0
    jmp odd

even: 
   mov ah,9
   lea dx,display1
   int 21h
   jmp exit 
   
odd:    
   mov ah,9
   lea dx,display2
   int 21h
   jmp exit 

   exit:
   mov ah,4ch
   int 21h
   main endp
end main
   




