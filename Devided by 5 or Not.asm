.model small
.stack 100h
.data
    input db 'Enter a number: $'
    result_divisible db 'The entered number is divisible by 5.$'
    result_not_divisible db 'The entered number is not divisible by 5.$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, input
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'     ; Convert ASCII character to numeric value
    mov bl, al      ; Move the numeric value to BL

    test bl, 1
    jnz not_divisible ; Jump if not zero
    mov bl, 5
    div bl
    cmp ah, 0
    jnz not_divisible ; Jump if not zero

    mov ah, 9
    lea dx, result_divisible
    int 21h
    jmp exit

not_divisible:
    mov ah, 9
    lea dx, result_not_divisible
    int 21h

exit:
    mov ah, 4Ch
    int 21h
    main endp
end main
