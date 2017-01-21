TITLE Sum of array procedure

INCLUDE Irvine32.inc

.data
    array   DWORD   10000h,20000h,30000h,40000h,50000h
    theSum  DWORD   ?

.code
main PROC
    mov     esi,OFFSET array
    mov     ecx,LENGTHOF array
    call    ArraySum
    mov     theSum,eax
exit
main ENDP

;------------------------------------------------------------------------------
ArraySum PROC
; Calculate sum of array 32 bit numbers
; Receives:
;           ESI - array pointer
;           ECX - array elements count
; Returns:
;           EAX - sum of array
;------------------------------------------------------------------------------
    push    esi
    push    ecx
    mov     eax,0

L1:
    add     eax,[esi]
    add     esi,4
    loop    L1

    pop     ecx
    pop     esi
    ret
ArraySum ENDP

END main
