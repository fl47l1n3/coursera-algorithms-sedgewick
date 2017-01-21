TITLE Input array of integers

INCLUDE Irvine32.inc

.data
    integersCount = 10
    array       SDWORD  integersCount DUP(?)
    prompt1     BYTE    "Enter integer numner: ",0
    outStr      BYTE    "Array is: ",0
    sep         BYTE    ", ",0

.code
main PROC
    call    ClrScr
    mov     ecx,integersCount   ; Loop counter
    mov     esi,0               ; Array index

L1:
    ; Display prompt
    mov     edx,OFFSET prompt1
    call    WriteString

    ; Read input
    call    ReadInt
    mov     array[esi],eax
    add     esi,4

    loop    L1

; Display array
    mov     edx,OFFSET outStr
    call    WriteString
    mov     ecx,integersCount
    mov     esi,0
L2:
    mov     eax,array[esi]
    call    WriteInt

    mov     edx,OFFSET sep
    call    WriteString

    add     esi,4
    loop    L2

exit
main ENDP

END main
