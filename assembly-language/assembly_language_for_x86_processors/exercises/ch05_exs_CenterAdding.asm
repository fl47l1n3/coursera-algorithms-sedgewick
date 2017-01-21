TITLE Add integers on screen center

INCLUDE Irvine32.inc

.data
    numbers     SDWORD  10 DUP(?)
    str1        BYTE    "Enter number 1: ",0
    str2        BYTE    "Enter number 2: ",0
    strResult   BYTE    "Numbers sum is: ",0

.code
main PROC
    call    ClrScr
    mov     dh,10
    mov     dl,20
    call    GotoXY

    ; Read number 1
    mov     edx,OFFSET str1
    call    WriteString
    call    ReadInt
    mov     numbers[0],eax

    ; Read number 2
    call    ClrScr
    mov     dh,10
    mov     dl,20
    call    GotoXY

    mov     edx,OFFSET str2
    call    WriteString
    call    ReadInt
    mov     numbers[4],eax

    ; Display result
    call    ClrScr
    mov     dh,10
    mov     dl,20
    call    GotoXY

    mov     edx,OFFSET strResult
    call    WriteString
    mov     eax,numbers[0]
    add     eax,numbers[4]
    call    WriteInt

exit
main ENDP

END main
