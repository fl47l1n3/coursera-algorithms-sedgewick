TITLE Write number in binary format

INCLUDE Irvine32.inc

.data
    binValue    DWORD   1234ABCDh
    buffer      BYTE    32 DUP(0),0

.code
main PROC
    mov     eax,binValue        ; Display number
    mov     ecx,32              ; Conut of bits
    mov     esi,OFFSET buffer

L1:
    shr     eax,1
    mov     BYTE PTR [esi],'0'
    jnc     L2
    mov     BYTE PTR [esi],'1'

L2:
    inc     esi
    loop    L1

    mov     edx,OFFSET buffer
    call    WriteString
    call    CrLf

    exit
main ENDP

END main
