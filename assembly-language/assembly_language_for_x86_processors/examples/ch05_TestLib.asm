TITLE Using libraries

INCLUDE Irvine32.inc
CR = 0Dh
LF = 0Ah

.data
    str1    BYTE    "Generate 20 random numbers in range "
            BYTE    "0...990:",CR,LF,0
    str2    BYTE    "Enter 32x signed number: ",0
    str3    BYTE    "Enter you name: ",0
    str4    BYTE    "Key pressed: ",0
    str5    BYTE    "Register's content: ",CR,LF,0
    str6    BYTE    "Hello, ",0
    buffer  BYTE    50 DUP(0)
    dwordVal    DWORD   ?

.code
main PROC

; Black text on white backgroud
    mov     eax,black + (white * 16)
    call    SetTextColor

; Clear screen
; Set first time value of randomize generator
    call    ClrScr
    call    Randomize

; Generate 20 random numbers
    mov     edx,OFFSET str1
    call    WriteString
    mov     ecx,5  ; Loop counter
    mov     dh,2    ; Row - 2
    mov     dl,0    ; Column - 0

L1: call GotoXY
    mov     eax,991
    call    RandomRange
    call    WriteDec
    mov     eax,500
    call    Delay
    inc     dh
    add     dl,2
    loop L1

; Clear screen
    call    CrLf
    call    WaitMsg
    call    ClrScr

; Enter decimal number and write in various fromats
    mov     edx,OFFSET str2
    call    WriteString
    call    ReadInt
    mov     dwordVal,eax
    call    CrLf
    call    WriteInt
    call    CrLf
    call    WriteHex
    call    CrLf
    call    WriteBin

; Show CPU registers
    call    CrLf
    mov     edx,OFFSET str5
    call    WriteString
    call    DumpRegs
    call    CrLf

; Show memory dump
    mov     esi,OFFSET dwordVal
    mov     ecx,LENGTHOF dwordVal
    mov     ebx,TYPE dwordVal
    call    DumpMem
    call    CrLf
    call    WaitMsg

; Enter you name
    call    ClrScr
    mov     edx,OFFSET str3
    call    WriteString
    mov     edx,OFFSET buffer
    mov     ecx,SIZEOF buffer - 1
    call    ReadString
    mov     edx,OFFSET str6
    call    WriteString
    mov     edx,OFFSET buffer
    call    WriteString
    call    CrLf
    call    WaitMsg

exit
main ENDP

END main
