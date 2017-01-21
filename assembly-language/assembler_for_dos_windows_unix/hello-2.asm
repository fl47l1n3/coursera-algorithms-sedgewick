; Hello Workd! в виде EXE

        .model  small   ; Код и данные в одном сегменте.
        .stack  100h    ; Сегмент стека рамером 256 байт.

        .code
start:
        mov     ax,@data            ; Надо установить адрес сегмента данных в регистр ds.
        mov     ds,ax               ; Напрямую нельзя (???) поэтому загружаем через ax.
        
        mov     dx,offset message   ; offset берет смещение, относительно сегмента данных.
        mov     ah,9
        int     21h     

        mov     ax,4C00H            ; exe DOS программы завершаются этим системным вызовом.
        int     21h

        .data
message db      "Hello World!",0Dh,0Ah,'$'
        end     start