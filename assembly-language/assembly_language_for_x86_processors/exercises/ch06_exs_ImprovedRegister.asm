TITLE Tool for registration students to courses

INCLUDE Irvine32.inc

.data
    TRUE = 1
    FALSE = 0
    gradeAverage        DWORD   275
    credits             DWORD   12
    OkToRegister        BYTE    ?

    GradeAverageMsg     BYTE    "Enter our grade average: ",0
    CreditsMsg          BYTE    "Enter your credits: ",0
    InvalidCredits      BYTE    "Credits must be 1..30",0
    InvalidGrade        BYTE    "Grade average must be 0..400",0
    RecordFailed        BYTE    "Record failed",0

.code
main PROC
    call    ClrScr

BEGIN:
    ; Enter grade -------------------------------------------------------------
    mov     edx,OFFSET GradeAverageMsg
    call    WriteString
    call    ReadInt
    cmp     al,0
    je      quit
    mov     gradeAverage,eax

    mov     edx,OFFSET InvalidGrade
    cmp     gradeAverage,0
    jbe     quit_and_msg
    cmp     gradeAverage,400
    jae     quit_and_msg

    ; Enter credits -----------------------------------------------------------
    mov     edx,OFFSET CreditsMsg
    call    WriteString
    call    ReadInt
    cmp     al,0
    je      quit
    mov     credits,eax

    mov     edx,OFFSET InvalidCredits
    cmp     credits,1
    jbe     quit_and_msg
    cmp     credits,30
    jae     quit_and_msg

    ; Check student's grade average and credits -------------------------------
    ; gradeAverage > 350
    cmp     gradeAverage,350
    ja      SUCCESS

    ; gradeAverage > 250 && credits <= 16
    cmp     gradeAverage,250
    jb      L   ; If gradeAverage beyond - condition failed, goto next condition
    cmp     credits,16
    jbe     SUCCESS

    ; credits <= 12
L:  cmp     credits,12
    jbe     SUCCESS

    jmp     FAILED

SUCCESS:
    mov     al,TRUE
FAILED:
    mov     al,FALSE

    jmp     BEGIN

quit_and_msg:
    call    WriteString
    jmp     quit

quit:
    call    CrLf
    exit
main ENDP

;------------------------------------------------------------------------------
Check PROC
Check ENDP

END main

