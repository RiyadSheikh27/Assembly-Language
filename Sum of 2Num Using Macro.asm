.MODEL SMALL
.STACK 100H

.DATA

value1 DW 10
value2 DW 20
A DB "The values are equal $"
B DB "The values are not equal $"

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    MOV AX, value1
    MOV BX, value2

    CMP AX, BX

    JE Equal

    JMP NotEqual

Equal:
    MOV AH, 9
    LEA DX, A
    INT 21H

    JMP Exit

NotEqual:
    MOV AH, 9
    LEA DX, B
    INT 21H

Exit:
    MOV AH, 4CH
    INT 21H

MAIN ENDP

END MAIN