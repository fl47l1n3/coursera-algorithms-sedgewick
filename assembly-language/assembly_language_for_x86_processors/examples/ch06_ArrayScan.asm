TITLE Array scan

INCLUDE Irvine32.inc

.data
    intArray    SWORD   0,0,0,0,1,20,35,-12,66,4,0
    ;intArray    SWORD   1,0,0,0
    ;intArray    SWORD   0,0,0,0
    ;intArray    SWORD   0,0,0,1
    noneMsg     BYTE    "Nonzero element not found",0

.code
main PROC
    mov     ebx,OFFSET intArray
    mov     ecx,LENGTHOF intArray

L1:
    cmp     WORD PTR [ebx],0
    jnz     found
    add     ebx,TYPE intArray
    loop    L1

    mov     eax,OFFSET noneMsg
    call    WriteString
    jmp     quit

found:
    movsx   eax,WORD PTR [ebx]
    call    WriteInt

quit:
    call    CrLf
    exit
main ENDP

END main
