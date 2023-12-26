.model small
.stack 100h
.data
    input db 'Enter a character: $'
    result_vowel db 'The entered character is a vowel.$'
    result_consonant db 'The entered character is not a vowel.$'

.code
main proc
    mov ax,@data
    mov ds,ax
    

    mov ah, 9        
    lea dx,input     
    int 21h      

    mov ah, 1          
    int 21h            
    mov dl, al

   
    cmp dl, 'a'         
    jl not_vowel         
    cmp dl, 'u'         
    jg not_vowel         

  
    mov ah, 9            
    lea dx, result_vowel 
    int 21h              
    jmp exit     

not_vowel:

    mov ah, 9            
    lea dx, result_consonant 
    int 21h              
    jmp exit     

exit:
    mov ah, 4Ch      
    int 21h
    main endp
end main
