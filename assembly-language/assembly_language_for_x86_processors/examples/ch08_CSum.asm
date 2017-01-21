TITLE Recursive sum calculation

INCLUDE Irvine32.inc

.data

.code
main PROC
    mov     ecx,5
    mov     eax,0
    call    CalcSum
    call    WriteDec
    call    CrLf
    exit
main ENDP

CalcSum PROC
    cmp     ecx,0
    jz      L2
    add     eax,ecx
    dec     ecx
    call    CalcSum
L2:
    ret
CalcSum ENDP

END main
