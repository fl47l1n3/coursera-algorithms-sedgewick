TITLE GCD

INCLUDE Irvine32.inc

.data

.code
main PROC
    mov     eax,560
    mov     ebx,320
    call    GCD
    call    WriteDec
    exit
main ENDP

GCD PROC
; EAX - x
; EBX - y
; EAX - result

; if y == 0 - return x
    cmp     ebx,0
    je      quit

    mov     edx,0
    div     ebx

    xchg    eax,ebx
    mov     ebx,edx
    call    GCD

quit:
    ret
GCD ENDP

END main
