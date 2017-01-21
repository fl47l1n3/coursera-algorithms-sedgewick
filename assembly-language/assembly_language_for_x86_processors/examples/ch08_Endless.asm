TITLE Endless programm

INCLUDE Irvine32.inc

.data
    endlessMsg  BYTE    "This recursion dont stop",0

.code
main PROC
    call    Endless
    exit
main ENDP

Endless PROC
    mov     edx,OFFSET endlessMsg
    call    WriteString
    call    Endless
    ret
Endless ENDP

END main
