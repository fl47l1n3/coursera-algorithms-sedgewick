; Сложение
mov ax,2
mov bx,3
mov cx,bx
add cx,ax
               
; Вычитаем и результат пишем по адресу
mov 0x0000,5
mov al,4
sub [0x0000],al
        
