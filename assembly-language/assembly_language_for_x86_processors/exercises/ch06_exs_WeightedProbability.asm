TITLE Weighted probablility

INCLUDE Irvine32.inc

.data
    COUNT = 20
    Msg     BYTE    "Weighted probability!",0

.code
main PROC
    call    Randomize
    mov     ecx,COUNT
L:
    mov     eax,9
    call    RandomRange
    .IF eax >= 0 && eax <= 2
        mov     eax,white + (black * 16)
    .ELSEIF eax == 3
        mov     eax,blue + (black * 16)
    .ELSEIF eax >= 4 && eax <= 9
        mov     eax,green + (black * 16)
    .ENDIF
    call    SetTextColor

    mov     edx,OFFSET Msg
    call    WriteString
    call    CrLf
    loop    L

    mov     eax,white + (black * 16)
    call    SetTextColor
    exit
main ENDP

END main
