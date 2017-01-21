TITLE Finite state machine. Check signed integers

INCLUDE Irvine32.inc

.data
    ENTER_KEY = 13
    InvalidInputMsg BYTE    "Invalid input",13,10,0

.code
main PROC
    call    ClrScr

StateA:
    call    GetNext

    cmp     al,'+'
    je      StateB

    cmp     al,'-'
    je      StateB

    call    IsDigit
    jz      StateC

    call    DisplayErrorMsg
    jmp     Quit

StateB:
    call    GetNext

    call    IsDigit
    jz      StateC

    call    DisplayErrorMsg
    jmp     Quit

StateC:
    call    GetNext

    call    IsDigit
    jz      StateC
    cmp     AL,ENTER_KEY
    je      Quit

    call    DisplayErrorMsg
    jmp     Quit

Quit:
    call    CrLf
    exit
main ENDP

;------------------------------------------------------------------------------
; GetNext
GetNext PROC
    call    ReadChar
    call    WriteChar
    ret
GetNext ENDP

;------------------------------------------------------------------------------
; DisplayErrorMsg
DisplayErrorMsg PROC
    push    edx
    mov     edx,OFFSET InvalidInputMsg
    call    WriteString
    pop     edx
    ret
DisplayErrorMsg ENDP

END main
