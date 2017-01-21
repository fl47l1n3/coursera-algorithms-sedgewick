TITLE Array sum procedure

INCLUDE Irvine32.inc

ArraySum PROTO  ptrArray:PTR DWORD,
                szArray:DWORD

.data
    array   DWORD   10000h,20000h,30000h,40000h,50000h

.code
main PROC
    INVOKE  ArraySum, ADDR array, LENGTHOF array
    call    WriteHex
    exit
main ENDP

;------------------------------------------------------------------------------
ArraySum PROC   USES esi ecx,
                ptrArray:PTR DWORD,
                szArray:DWORD
    mov     eax,0
    mov     esi,ptrArray
    mov     ecx,szArray

    ; If array is zero size
    cmp     ecx,0
    je      L2

L1:
    add     eax,[esi]
    add     esi,4
    loop    L1

L2:
    ret
ArraySum ENDP

END main
