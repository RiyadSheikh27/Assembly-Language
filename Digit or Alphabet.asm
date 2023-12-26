.model small
.stack 100h
.data
    input db 'Enter a character: $'
    alph db 'The entered character is an alphabet.$'
    dig db 'The entered character is a digit.$'
  .code
  main proc
    mov ax,@data
    mov ds,ax
   
    mov ah, 9          
    lea dx, input      
    int 21h           
   
    mov ah, 1         
    int 21h             
    mov dl, al 

    cmp dl, 'A'         
    jl digit     
    cmp dl, 'Z'         
    jbe digit     
    cmp dl, 'a'          
    jl digit     
    cmp dl, 'z'         
    jg digit
         
 alphabet:
    mov ah, 9             
    lea dx, alph
    int 21h                
    jmp exit      

 digit:
    mov ah, 9           
    lea dx, dig  
    int 21h              
    jmp exit                  

exit:

    mov ah, 4Ch      
    int 21h
    main endp
  end main
