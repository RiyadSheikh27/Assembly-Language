.model small
.stack 100h
.data
num db ?
msg db 'Enter a digit:$'
string db 5 dup(?)
.code
main proc
mov ax, @data
mov ds, ax

lea dx, msg     
mov ah, 9
int 21h
mov ah, 1          
int 21h
sub al, 48    
mov num, al

xor bx, bx
mov bl, 1
mov cx, 10
top:
mov al, num         
mul bl
push bx                
push cx
lea si, string

mov bx, 10         
xor cx, cx
division: xor dx,dx
div bx
push dx
inc cx
cmp ax, 0
jne division
store: pop dx
add dl, 48
mov [si], dl
inc si
loop store
mov [si], '$ '

pop cx
pop bx
mov dl, 13             
mov ah, 2
int 21h
mov dl, 10
mov ah, 2
int 21h

lea dx, string     
mov ah, 9
int 21h

inc bl
loop top                

mov ah, 4ch            
int 21h
main endp
end