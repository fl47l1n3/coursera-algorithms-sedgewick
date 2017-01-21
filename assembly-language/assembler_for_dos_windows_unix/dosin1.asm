    .model  tiny
    .code
    org     100h
    
start:                        
    ; Печатаем приглащение                               
    mov     dx,offset message1
    mov     ah,9
    int     21h           
               
    ; Считать в buffer пользовательский ввод
    mov     dx,offset buffer
    mov     ah,0Ah
    int     21h

    ; Перевод строки                           
    mov     dx,offset crlf
    mov     ah,9
    int     21h      
    
    ; Перевод числа из символьного представления в бинарное число
    ; DI - номер байта в буфере
    ; AX - текущее значение результата
    ; SI - длина буфера
    ; CL - множитель для MUL
    xor     di,di
    xor     ax,ax
    mov     cl,blength
    xor     ch,ch
    xor     bx,bx
    mov     si,cx
    mov     cl,10     
    
asc2hex:             
    ; Очередной символ
    mov     bl,byte ptr bcontents[di]
    
    ; Делаем проверки
    sub     bl,'0'
    jb      asc_error
    cmp     bl,9
    ja      asc_error                    
                   
    ; Собственно сам перевод числа  
    mul     cx
    add     ax,bx
    inc     di
    cmp     di,si
    jb      asc2hex
                   
    ; Выводим результат
    push    ax
    mov     ah,9
    mov     dx,offset message2
    int     21h
    pop     ax
                 
    ; Печатаем AX
    push    ax
    xchg    ah,al
    call    print_al
    pop     ax
    call    print_al                   
    
    ret           
    
asc_error:
    mov     dx,offset err_msg
    mov     ah,9
    int     21h
    ret          
    
print_al:
    mov     dh,al
    and     dh,0Fh
    shr     al,4
    call    print_nibble
    mov     al,dh
print_nibble:
    cmp     al,10
    sbb     al,69h
    das
    mov     dl,al
    mov     ah,2
    int     21h
    ret
    
message1    db  "Enter number: $"
message2    db  "HEX number is: $"
err_msg     db  "Input error"
crlf        db  0Dh,0Ah,'$'
buffer      db  6
blength     db  ?   ; Содержимое буфера располагается за концом файла
bcontents:
    
end    start