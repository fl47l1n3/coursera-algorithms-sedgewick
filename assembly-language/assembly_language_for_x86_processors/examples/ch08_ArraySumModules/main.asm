TITLE Mudules

INCLUDE Irvine32.inc
INCLUDE sum.inc

Count = 3

.data
    prompt1     BYTE    "Enter signed integer: ",0
    prompt2     BYTE    "Numbers sum is: ",0
    array       DWORD   Count DUP(?)
    sum         DWORD   ?

.code
main PROC
    call    ClrScr
    INVOKE  PromptForIntegers,
                ADDR prompt1,
                ADDR array,
                Count

    INVOKE  ArraySum,
                ADDR array,
                Count

    mov     sum,eax
    INVOKE  DisplaySum,
                ADDR prompt2,
                sum

    call    CrLf
    exit
main ENDP

END main
