TITLE Recursuve factorial

INCLUDE Irvine32.inc

.data
    startTime   DWORD   ?

.code
Factorial PROC,
        num:DWORD
    mov     ecx,num
    mov     eax,1

L:
    mul     ecx
    loop    L

    ret
Factorial ENDP

FactorialR PROC,
        num:DWORD
    mov     eax,num
    cmp     eax,0
    ja      L1
    mov     eax,1
    jmp     L2
L1:
    dec     eax
    push    eax
    call    Factorial
    mov     ebx,num
    mul     ebx

L2:
    ret
FactorialR ENDP

main PROC
    call    GetMSeconds
    mov     startTime,eax

    INVOKE  Factorial,1000000
    call    WriteDec
    call    CrLf

    call    GetMSeconds
    sub     eax,startTime
    call    WriteDec

    exit
main ENDP

END main
