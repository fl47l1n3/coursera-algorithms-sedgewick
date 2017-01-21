TITLE Logical calculator

INCLUDE Irvine32.inc

.data
    CalculatorMap   BYTE    "1) x AND y",0
    MsgShift = ($ - CalculatorMap)
                    BYTE    "AND",0
                    ALIGN   4
    ProcShift = ($ - CalculatorMap)
                    DWORD   AND_op
    CalculatorMapS = ($ - CalculatorMap)
                    BYTE    "2) x OR y ",0
                    BYTE    "OR",0
                    ALIGN   4
                    DWORD   OR_op
                    BYTE    "3) NOT x  ",0
                    BYTE    "NOT",0
                    ALIGN   4
                    DWORD   NOT_op
                    BYTE    "4) x XOR y",0
                    BYTE    "XOR",0
                    ALIGN   4
                    DWORD   XOR_op
                    BYTE    "5) exit   ",0
                    BYTE    " ",0
                    ALIGN   4
                    DWORD   EXIT_op
    CalculatorLen = ($ - CalculatorMap) / CalculatorMapS
    Prompt          BYTE    "Enter menu number: ",0
    Msg1            BYTE    "Enter value: ",0
    Msg2            BYTE    "Enter value 2: ",0

.code
main PROC

    ; --- Display menu
BEGIN:
    call    ClrScr
    mov     ecx,CalculatorLen
    mov     edx,OFFSET CalculatorMap
L_MENU:
    call    WriteString
    call    CrLf
    add     edx,CalculatorMapS
    loop    L_MENU

    ; --- Read value
    mov     edx,OFFSET Prompt
    call    WriteString
    call    ReadInt

    ; --- Check input
    cmp     eax,1
    jb      BEGIN
    cmp     eax,CalculatorLen
    ja      BEGIN

    sub     eax,1
    mov     ebx,CalculatorMapS
    mul     ebx

    mov     edx,OFFSET CalculatorMap + MsgShift
    add     edx,eax
    call    WriteString
    call    CrLf
    mov     ebx,OFFSET CalculatorMap
    add     ebx,eax
    call    NEAR PTR [ebx + ProcShift]

    exit
main ENDP

AND_op PROC
    pushad
    mov     edx,OFFSET Msg1
    call    WriteString
    call    ReadHex
    mov     ebx,eax
    mov     edx,OFFSET Msg2
    call    WriteString
    call    ReadHex
    and     eax,ebx
    call    WriteHex
    call    CrLf
    popad
    ret
AND_op ENDP

OR_op PROC
    pushad
    mov     edx,OFFSET Msg1
    call    WriteString
    call    ReadHex
    mov     ebx,eax
    mov     edx,OFFSET Msg2
    call    WriteString
    call    ReadHex
    or      eax,ebx
    call    WriteHex
    call    CrLf
    popad
    ret
OR_op ENDP

NOT_op PROC
    pushad
    mov     edx,OFFSET Msg1
    call    WriteString
    call    ReadHex
    not     eax
    call    WriteHex
    call    CrLf
    popad
    ret
NOT_op ENDP

XOR_op PROC
    pushad
    mov     edx,OFFSET Msg1
    call    WriteString
    call    ReadHex
    mov     ebx,eax
    mov     edx,OFFSET Msg2
    call    WriteString
    call    ReadHex
    xor     eax,ebx
    call    WriteHex
    call    CrLf
    popad
    ret
XOR_op ENDP

EXIT_op PROC
    ret
EXIT_op ENDP

END main
