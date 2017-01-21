TITLE Inproved Points map

INCLUDE Irvine32.inc

.data
    MAX_INPUTS  = 100
    ItemSize = TYPE DWORD
    PointsMap   DWORD   90,100,'A'
    EntrySize = ($ - PointsMap)
                DWORD   80,98,'B'
                DWORD   70,79,'C'
                DWORD   60,69,'D'
                DWORD   0,59,'F'
    EntriesLen = ($ - PointsMap) / EntrySize
    InputsCount BYTE    0

    prompt      BYTE    "Enter your points: ",0
    msg         BYTE    "Your score: ",0
    again       BYTE    "Do you want enter another point? (Y/N): ",0
    result      BYTE    "Inputs count: ",0
    invalid     BYTE    "Invalid point, must be 0..100 :(",0

.code
main PROC
    mov     ecx,MAX_INPUTS
L1:
    inc     InputsCount
    call    ReadPoint
    call    CalcScore
    call    CheckAgain
    loopz    L1

    mov     edx,OFFSET result
    call    WriteString
    mov     al,InputsCount
    call    WriteInt

    exit
main ENDP

;------------------------------------------------------------------------------
CheckAgain PROC
    mov     edx,OFFSET again
    call    WriteString
    call    ReadChar
    call    CrLf
    and     al,'Y'
    cmp     al,'Y'
    ret
CheckAgain ENDP

;------------------------------------------------------------------------------
ReadPoint PROC
BEGIN:
    mov     edx,OFFSET prompt
    call    WriteString
    call    ReadInt
    cmp     al,100
    ja      BAD
    ret
BAD:
    mov     edx,OFFSET invalid
    call    WriteString
    call    CrLf
    jmp     BEGIN
ReadPoint ENDP


;------------------------------------------------------------------------------
; Receives: EAX - entered point
; Returns: AL - calculated score
CalcScore PROC
    pushad
    mov     ecx,EntriesLen
    mov     ebx,OFFSET PointsMap
MAP_LOOP:
    ; Compare student point and min point
    cmp     eax,[ebx]
    jb      next    ; If less then next
    ; Compare student point and max point
    cmp     eax,[ebx + ItemSize]
    ja      next    ; If great then next

    mov     al,BYTE PTR [ebx + (ItemSize * 2)]
    mov     edx,OFFSET msg
    call    WriteString
    call    WriteChar
    call    CrLf
    popad
    ret

next:
    ; Check next entry
    add     ebx,EntrySize
    loop    MAP_LOOP
CalcScore ENDP

END main
