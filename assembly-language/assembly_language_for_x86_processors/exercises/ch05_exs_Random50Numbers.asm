TITLE Generate random 50 numbers

INCLUDE Irvine32.inc

.data
    numbersCount = 50
    sep     BYTE    ", ",0

.code
main PROC
    call    Randomize
    mov     ecx,numbersCount

L1:
    mov     eax,40
    call    RandomRange
    sub     eax,20
    call    WriteInt

    mov     edx,OFFSET sep
    call    WriteString

    loop    L1

    call    CrLf

exit
main ENDP

END main
