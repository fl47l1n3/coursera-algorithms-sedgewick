TITLE Display colored text

INCLUDE Irvine32.inc

.data
    myString    BYTE    "This is colored text!",0

.code
main PROC
    mov     edx,OFFSET myString

    mov     eax,blue + (black * 16)
    call    SetTextColor
    call    WriteString
    call    CrLf

    mov     eax,red + (black * 16)
    call    SetTextColor
    call    WriteString
    call    CrLf

    mov     eax,green + (black * 16)
    call    SetTextColor
    call    WriteString
    call    CrLf

    mov     eax,cyan + (black * 16)
    call    SetTextColor
    call    WriteString

    mov     eax,white + (black * 16)
    call    SetTextColor
    exit
main ENDP

END main
