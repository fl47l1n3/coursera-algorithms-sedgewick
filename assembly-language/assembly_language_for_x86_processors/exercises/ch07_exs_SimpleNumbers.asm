TITLE Simple numbers

INCLUDE Irvine32.inc

.data
    prompt      BYTE    "Enter number: ",0
    msg1        BYTE    "Number is simple.",0
    msg2        BYTE    "Number is not simple.",0

.code
main PROC
L:
    mov     edx,OFFSET prompt
    call    WriteString
    call    ReadInt
    cmp     eax,0
    jz      QUIT
    call    IsSimple
    jz      NOT_SIMPLE
    jnz     SIMPLE

SIMPLE:
    mov     edx,OFFSET msg1
    call    WriteString
    call    CrLf
    jmp     N

NOT_SIMPLE:
    mov     edx,OFFSET msg2
    call    WriteString
    call    CrLf

N:  jmp     L


QUIT:
    exit
main ENDP

IsSimple PROC
    mov     ebx,eax
    mov     ecx,eax
    dec     ecx
L:
    mov     eax,ebx
    mov     edx,0
    div     ecx

    test    edx,0ffffffffh
    jz      QUIT

    dec     ecx
    cmp     ecx,2
    jae     L

QUIT:
    ret
IsSimple ENDP

END main
