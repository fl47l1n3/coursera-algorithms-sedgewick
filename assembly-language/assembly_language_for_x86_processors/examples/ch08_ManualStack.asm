TITLE Working with stack manually

INCLUDE Irvine32.inc

.data
    sum     DWORD   ?

.code
main PROC
    push    6
    push    5
    call    AddTwo
    mov     sum,eax
    exit
main ENDP

AddTwo PROC
    push    ebp
    mov     ebp,esp
    mov     eax,[ebp + 12]
    add     eax,[ebp + 8]
    pop     ebp
    ret     8
AddTwo ENDP

END main
