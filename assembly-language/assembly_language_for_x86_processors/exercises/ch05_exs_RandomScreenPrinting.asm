TITLE Print random symbols in random screen position

INCLUDE Irvine32.inc

.data
    screenWidth = 100
    screenHeight = 40
    symbolsCount = 100
    maxSymbol = 255

    currentX    DWORD   0
    currentY    DWORD   0

.code
main PROC
    call    Randomize
    call    ClrScr

    mov     ecx,symbolsCount
SYMBOLS_LOOP:
    ; Set random XY position
    mov     eax,screenWidth
    call    randomRange
    mov     currentY,eax
    mov     eax,screenHeight
    call    randomRange
    mov     currentX,eax

    mov     dh,BYTE PTR currentX
    mov     dl,BYTE PTR currentY
    call    GotoXY

    ; Display random symbol
    mov     eax,maxSymbol
    call    RandomRange
    call    WriteChar

    ; Random delay in 300ms range
    mov     eax,300
    call    RandomRange
    call    Delay

    loop    SYMBOLS_LOOP

exit
main ENDP

END main
