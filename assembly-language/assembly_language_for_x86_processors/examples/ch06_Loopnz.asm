TITLE Loops with conditions

INCLUDE Irvine32.inc

.data
    array       SWORD   -3,-6,-1,-10,10,30,40,4
    sentinel    SWORD   0

.code
main PROC

    mov     esi,OFFSET array
    mov     ecx,LENGTHOF array

next:
    test    WORD PTR [esi],8000h
    pushfd
    add     esi,TYPE array
    popfd
    loopnz  next

    jnz     quit
    sub     esi,TYPE array

    mov     eax,esi
    call    WriteInt

quit:
    exit
main ENDP

END main
