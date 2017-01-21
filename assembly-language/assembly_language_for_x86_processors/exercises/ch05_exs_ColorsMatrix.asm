TITLE Display colors matrix

INCLUDE Irvine32.inc

.data
    bgMax = 16
    fgMax = 16
    symbol = 'X'
    currentColor    DWORD    0

.code
main PROC
    call    ClrScr

    mov     ecx,bgMax
ROW_LOOP:

    push    ecx
    mov     ecx,fgMax
    COLUMN_LOOP:
        add     currentColor,(1 * 16)
        mov     eax,currentColor
        call    SetTextColor

        mov     eax,symbol
        call    WriteChar
        loop    COLUMN_LOOP

    inc     currentColor
    call    CrLf
    pop     ecx
    loop    ROW_LOOP

    mov     eax,white + (black * 16)
    call    SetTextColor
    exit
main ENDP

END main
