TITLE Packed number to ASCII number

INCLUDE Irvine32.inc

.data
    packed      DWORD   12345678h
    result      BYTE    10 DUP(?),0

.code
main PROC
    mov     eax,packed
    mov     esi,OFFSET result
    call    P2A
    mov     edx,OFFSET result
    call    WriteString
    call    CrLf
    exit
main ENDP

P2A PROC
; EAX - packed number
; ESI - pointer to result
    mov     cl,28
L:
    mov     ebx,eax
    call    DumpRegs
    call    WriteBin
    shr     ebx,CL
    and     ebx,0fh
    call    DumpRegs

    add     ebx,30h
    mov     [esi],bl

    inc     esi
    sub     cl,4

    cmp     cl,0
    jge     L

    ret
P2A ENDP

END main
