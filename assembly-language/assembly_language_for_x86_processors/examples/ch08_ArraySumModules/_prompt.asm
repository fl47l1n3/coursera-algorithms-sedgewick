TITLE Prompt integers procedure

INCLUDE sum.inc

.code
PromptForIntegers PROC,
        ptrPrompt:PTR BYTE,
        ptrArray:PTR DWORD,
        arraySize:DWORD

    pushad
    mov     ecx,arraySize
    cmp     ecx,0
    jle     L2
    mov     edx,ptrPrompt
    mov     esi,ptrArray
L1:
    call    WriteString
    call    ReadInt
    mov     [esi],eax
    call    CrLf

    add     esi,4
    loop    L1

L2:
    popad
    ret

PromptForIntegers ENDP
END
