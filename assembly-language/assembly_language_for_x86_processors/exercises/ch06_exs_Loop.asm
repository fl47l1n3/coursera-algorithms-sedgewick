TITLE MASM loop directives

INCLUDE Irvine32.inc

.data
    op1     DWORD   10
    op2     DWORD   15
    op3     DWORD   20
    X       DWORD   ?

.code
main PROC
    mov     eax,op1
    mov     ebx,op2
    mov     ecx,op3

    .WHILE eax < ebx
        inc     eax
        .IF ebx == ecx
            mov     X,2
        .ELSE
            mov     X,3
        .ENDIF
    .ENDW

    mov     eax,X
    call    WriteDec
    exit
main ENDP

END main
