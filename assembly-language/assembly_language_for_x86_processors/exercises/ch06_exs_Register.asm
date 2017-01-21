TITLE Tool for registration students to courses

INCLUDE Irvine32.inc

.data
    TRUE = 1
    FALSE = 0
    gradeAverage    WORD    275
    credits         WORD    12
    OkToRegister    BYTE    ?

    InvalidCredits  BYTE    "Credits must be 1..30",0

.code
main PROC
    ; 1 < credits < 30
    ; If check failed - print msg
    cmp     credits,1
    jb      quit
    cmp     credits,30
    ja      quit

    ; gradeAverage > 350
    cmp     gradeAverage,350
    ja      its_ok

    ; gradeAverage > 250 && credits <= 16
    cmp     gradeAverage,250
    jb      L   ; If gradeAverage beyond - condition failed, goto next condition
    cmp     credits,16
    jbe     its_ok

    ; credits <= 12
L:  cmp     credits,12
    jbe     its_ok

    mov     OkToRegister,FALSE
    mov     al,OkToRegister
    call    WriteInt
    exit

its_ok:
    mov     OkToRegister,TRUE
    mov     al,OkToRegister
    call    WriteInt
    exit

quit:
    mov     edx,OFFSET InvalidCredits
    call    WriteString
    call    CrLf
    exit
main ENDP

END main

