        .model  tiny
        .code
        .386
        org             100h

start:                  
        ; Очищаем экран
        mov     ax,0003h
        int     10h

        cld     ; Обработка в прямом направлении для команд stos*
        
        mov     eax,1F201F00h       ; Первый символ с пробелом
        mov     bx,0F20h            ; Пробел
        mov     cx,255              ; Счетчик
        mov     di,offset ctable    ; Устанавливаем начало для заполнения ES:DI

cloop:
        stosd   ; Копируем очередной символ в нашу таблику (EAX по адресу ES:DI)
        
        inc     al              ; В AL у нас харнится символ, в AH пробел, увеличиваем AL
        test    cx,0Fh          ; Если не 16 -
        jnz     continue_loop   ; Продолжаем   
        
        push    cx                          
        
        ; Типа заполняем оставшееся место пробелами
        mov     cx,80-32
        xchg    ax,bx
        rep     stosw
        xchg    bx,ax
        
        pop     cx        

continue_loop:
        loop    cloop
        stosd

        ; ES:DI - Адрес, откуда копировать
        ; DS:SI - Адрес, куда копировать
        ; CX - Сколько раз повторять операцию
        ; movsw в итоге копирует из ES:DI в DS:SI CX раз по DWORD
        mov     ax,0B800h
        mov     es,ax
        mov     di,di
        mov     si,offset ctable
        mov     cx,15*80+32
        rep     movsw        
        
        ret

ctable:

end     start