TITLE Set cursor position

INCLUDE Irvine32.inc

.data

.code
main PROC
    mov     dl,100
    mov     dh,2
    call    SetCursorPosition
    exit
main ENDP

SetCursorPosition PROC
.data
    BadXCoordMsg    BYTE    "Invalid X coordinate!",0Dh,0Ah,0
    BadYCoordMsg    BYTE    "Invalid Y coordinate!",0Dh,0Ah,0

.code
    .IF (DL < 0) || (DL > 79)
        mov     edx,OFFSET BadXCoordMsg
        call    WriteString
        jmp     quit
    .ENDIF

    .IF (DH < 0) || (DH > 24)
        mov     edx,OFFSET BadYCoordMsg
        call    WriteString
        jmp     quit
    .ENDIF

    call    GotoXY
quit:
    ret
SetCursorPosition ENDP

END main
