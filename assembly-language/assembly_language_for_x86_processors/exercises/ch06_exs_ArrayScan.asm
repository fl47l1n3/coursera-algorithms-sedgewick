TITLE Array scan

INCLUDE Irvine32.inc

.data
    intArray    SWORD   0,0,0,0,1,20,35,-12,66,4,0
    ;intArray    SWORD   0,0
    ;intArray    SWORD   1,0
    noneMsg     BYTE    "Nonzero element not found",0

.code
main PROC
    mov     ebx,OFFSET intArray
    mov     ecx,LENGTHOF intArray

L1:
    test    WORD PTR [ebx],1
    pushfd
    add     ebx,TYPE intArray
    popfd
    loopz   L1
    jnz     found

    mov     edx,OFFSET noneMsg
    call    WriteString
    jmp     quit

found:
    sub     ebx,TYPE intArray
    movsx   eax,WORD PTR [ebx]
    call    WriteInt

quit:
    call    CrLf
    exit
main ENDP

END main
