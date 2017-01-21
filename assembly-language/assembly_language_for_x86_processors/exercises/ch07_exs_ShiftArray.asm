TITLE Shift array

INCLUDE Irvine32.inc

.data
    array       DWORD   01234abcdh
    arraySize = ($ - array)
                DWORD   0ef1234abh
                DWORD   01234abcdh
                DWORD   01234abcdh
                DWORD   01234abcdh
    arrayLen = ($ - array) / arraySize

.code
main PROC
    mov     esi,OFFSET array
    mov     ebx,arraySize
    mov     ecx,arrayLen
    call    PrintArray

    mov     esi,OFFSET array
    mov     ebx,arraySize
    mov     ecx,arrayLen
    call    ShiftArray
    call    ShiftArray

    call    CrLf
    mov     esi,OFFSET array
    mov     ebx,arraySize
    mov     ecx,arrayLen
    call    PrintArray
    exit
main ENDP

ShiftArray PROC
; ESI - pointer to array
; EBX - array element size
; ECX - elements length
    pushad
    mov     edx,[esi]
L1:
    mov     eax,[esi + ebx]

    cmp     ecx,1
    je      X
    jmp     N
X:  mov     eax,edx
N:  shrd    [esi],eax,4
    add     esi,ebx
    loop    L1
    popad
    ret
ShiftArray ENDP

PrintArray PROC
    pushad
L1:
    mov     eax,[esi]
    call    WriteHex
    mov     eax,' '
    call    WriteChar
    add     esi,ebx
    loop    L1
    popad
    ret
PrintArray ENDP

END main
