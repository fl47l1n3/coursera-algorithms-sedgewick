TITLE Шаблон программы

INCLUDE Irvine32.inc

.data
    source  BYTE    "Thi is source string for copy",0
    target  BYTE    SIZEOF source DUP(0)

.code
main PROC

    mov     esi,0
    mov     ecx,SIZEOF source

L1:
    mov     al,source[esi]
    mov     target[esi],al
    inc     esi
    loop    L1

exit
main ENDP

END main
