TITLE Swap variables througth procedure pointer arguments

INCLUDE Irvine32.inc

Swap PROTO,
            pValX:PTR DWORD,
            pValY:PTR DWORD

.data
    Array   DWORD   3,4,5,1,2,9,6,4,2,34,62,1

.code
main PROC
    mov     esi,OFFSET Array
    mov     ecx,LENGTHOF Array
    mov     ebx,TYPE Array
    call    DumpMem

    push    ebx
    push    ecx
    push    esi

    mov     ebx,OFFSET Array
    mov     ecx,LENGTHOF Array
    mov     esi,0
L:
    INVOKE  Swap, ADDR [ebx + (esi * 4)], ADDR [ebx + (esi * 4) + 4]
    inc     esi
    loop    L

    pop     esi
    pop     ecx
    pop     ebx

    call    DumpMem
    exit
main ENDP

;------------------------------------------------------------------------------
Swap PROC   USES eax esi edi,
            pValX:PTR DWORD,
            pValY:PTR DWORD
    mov     esi,pValX
    mov     edi,pValY
    mov     eax,[esi]
    xchg    eax,[edi]
    mov     [esi],eax
    ret
Swap ENDP

END main
