TITLE Show file time from AX

INCLUDE Irvine32.inc

.data
    exampleDate     WORD    0001001000000111b

.code
main PROC
    call    ShowFileTime
    exit
main ENDP

ShowFileTime PROC
        pushad
        ; Hour to AX, 11-15 bits
        mov     bx,0
        mov     bx,exampleDate
        shr     bx,11
        ; Display
        cmp     bx,10
        jbe     WZ1
        jmp     N1
WZ1:    mov     ax,'0'
        call    WriteChar
N1:     mov     ax,bx
        call    WriteDec
        mov     ax,':'
        call    WriteChar

        ; Munites to AX, 5-10 bits
        mov     bx,0
        mov     bx,exampleDate
        shr     bx,5
        and     bx,00111111b
        ; Display
        cmp     bx,10
        jbe     WZ2
        jmp     N2
WZ2:    mov     ax,'0'
        call    WriteChar
N2:     mov     ax,bx
        call    WriteDec
        mov     ax,':'
        call    WriteChar

        ; Munites to AX, 5-10 bits
        mov     bx,0
        mov     bx,exampleDate
        and     bx,00011111b
        ; Display
        cmp     bx,10
        jbe     WZ3
        jmp     N3
WZ3:    mov     ax,'0'
        call    WriteChar
N3:     mov     ax,bx
        call    WriteDec
        mov     ax,0

        call    CrLf
        popad
        ret
ShowFileTime ENDP

END main
