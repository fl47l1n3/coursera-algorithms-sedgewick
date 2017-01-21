TITLE Array fill. Demonstrate pointer arguments in stack

INCLUDE Irvine32.inc

.data
    count = 100
    array   WORD    count DUP(?)

.code
main PROC
    push    OFFSET array
    push    count
    call    ArrayFill
    exit
main ENDP

ArrayFill PROC
    push    ebp
    mov     ebp,esp
    pushad
    mov     esi,[ebp + 12]
    mov     ecx,[ebp + 8]
    cmp     ecx,0
    jle     L2
L1:
    mov     eax,10000h
    call    RandomRange
    mov     [esi],ax
    add     esi,TYPE WORD
    loop    L1
L2:
    popad
    ret     8
ArrayFill ENDP

END main
