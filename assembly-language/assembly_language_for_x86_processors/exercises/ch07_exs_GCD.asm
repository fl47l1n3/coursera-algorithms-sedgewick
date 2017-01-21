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
X:  neg     eax
    js      X
Y:  neg     ebx
    js      Y

L1:
    mov     edx,0
    div     ebx

    mov     eax,ebx
    mov     ebx,edx

    cmp     ebx,0
    ja      L1
    ret
GCD ENDP

END main
