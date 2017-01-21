TITLE Demonstrate LEA command

INCLUDE Irvine32.inc

.data

.code
main PROC
    call    FillString
    exit
main ENDP

FillString PROC USES eax esi
    LOCAL   string[20]:BYTE
    lea     esi,string
    mov     ecx,20
L1:
    mov     eax,10
    call    RandomRange
    add     al,30h
    mov     [esi],al
    add     esi,1
    loop    L1
    ret
FillString ENDP

END main
