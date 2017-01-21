TITLE DisplaySum procedure

INCLUDE sum.inc

.code
DisplaySum PROC,
        ptrPrompt:PTR BYTE,
        theSum:DWORD

    push    eax
    push    edx

    mov     edx,ptrPrompt
    call    WriteString
    mov     eax,theSum
    call    WriteInt
    call    CrLf

    pop     edx
    pop     eax
    ret

DisplaySum ENDP
END
