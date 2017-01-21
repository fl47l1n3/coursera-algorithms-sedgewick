TITLE Шаблон программы

INCLUDE Irvine32.inc

.data
source  BYTE    "This is source string",0
target  BYTE    SIZEOF source DUP(0)

.code
main PROC

    mov     esi,LENGTHOF source-1
    mov     ecx,SIZEOF source

L1:
    mov     al,source[esi]
    mov     target[esi],al
    dec     esi
    loop L1

    mov     esi,OFFSET target
    mov     ebx,1
    mov     ecx,SIZEOF target-1
    call    DumpMem

exit
main ENDP

END main
