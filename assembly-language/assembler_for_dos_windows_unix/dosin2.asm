line_length = 3
number_of_lines = 3

        .model  tiny
        .code
        org     100h
    
start:     
        cld        
        ; Текстовый режим 03
        mov     ax,0B800h
        mov     es,ax
        mov     ax,0003h
        int     10h         
        ; Убираем курсор за пределы экрана
        mov     ah,02h
        mov     bh,0
        mov     dh,26
        mov     dl,1
        int     10h
        
        call    update_screen

main_loop:
        mov     ah,08h
        int     21h
        test    al,al
        jz      eASCII_entered
        cmp     al,1Bh
        je      key_ESC
        cmp     al,'Z'
        je      key_Z     
        cmp     al,'z'
        je      key_Z     
        cmp     al,'X'
        je      key_X     
        cmp     al,'x'
        je      key_X 
        jmp     short main_loop
eASCII_entered:
        int     21h
        cmp     al,48h
        je      key_UP
        cmp     al,50h
        je      key_DOWN
        cmp     al,4Bh
        je      key_LEFT
        cmp     al,4Dh
        je      key_RIGHT
        jmp     short main_loop          

; Обработка нажатий клавишь
key_ESC:
        ret
        
key_UP:
        cmp     byte ptr start_row,0
        jna     main_loop
        dec     byte ptr start_row
        call    update_screen
        jmp     short main_loop
                                    
key_DOWN:
        cmp     byte ptr start_row,25-number_of_lines
        jnb     main_loop
        inc     byte ptr start_row
        call    update_screen
        jmp     short main_loop
    
key_LEFT:
        cmp     byte ptr start_col,0
        jna     main_loop
        dec     byte ptr start_col
        call    update_screen
        jmp     short main_loop
    
key_RIGHT:
        cmp     byte ptr start_col,80-line_length
        jnb     main_loop
        inc     byte ptr start_col
        call    update_screen
        jmp     short main_loop

key_Z:
        mov     ax,current_screen
        dec     ax
        jns     key_Z_ok
        mov     ax,3

key_Z_ok:
        mov     current_screen,ax
        call    update_screen
        jmp     main_loop

key_X:
        mov     ax,current_screen
        inc     ax
        cmp     ax,4
        jne     key_X_ok
        xor     ax,ax
    
key_X_ok:
        mov     current_screen,ax
        call    update_screen   
        jmp     main_loop

; Очищает экран и выводит изображение
; Модифицирует AX, BX, CX, DX, SI, DI
update_screen:  
        mov     cx,25*80
        mov     ax,0F20h
        xor     di,di
        rep     stosw
        
        mov     bx,current_screen
        shl     bx,1
        mov     si,screens[bx]
        mov     ax,start_row
        mul     row_length
        add     ax,start_col
        shl     ax,1
        mov     di,ax
        mov     ah,0Fh
        mov     dx,number_of_lines   
copy_lines:
        mov     cx,line_length
copy_1: lodsb
        stosw
        loop    copy_1
        add     di,(80-line_length)*2
        dec     dx
        jnz     copy_lines
        ret 

screen1 db  " XX"
        db  "XX "
        db  " X "

screen2 db  " X "
        db  "XXX"
        db  "  X"
        
screen3 db  " X "
        db  " XX"
        db  "XX "
        
screen4 db  "X  "
        db  "XXX"
        db  " X "
        
screens         dw  screen1,screen2,screen3,screen4
current_screen  dw  0
start_row       dw  10
start_col       dw  37
row_length      db  80
    
end     start