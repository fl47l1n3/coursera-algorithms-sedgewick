; Выводим строку в STDERR

        .model  tiny
        .code
        org     100h
start:                        
        ; Системный вызов 40h - вывести в файл или устройство.
        ; BX - 1 для STDOUT, 2 для STDERR
        ; DX - адрес начала строки
        ; СЧ - длина строки
        mov     ah,40h
        mov     bx,2
        mov     dx,offset message
        mov     cx,message_length
        int     21h
        ret              
        
message db      "This function may print symbol $"
message_length = $-message

        end     start