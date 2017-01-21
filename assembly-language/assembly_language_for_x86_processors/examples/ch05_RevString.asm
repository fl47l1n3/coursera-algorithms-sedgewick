TITLE String reverse

INCLUDE Irvine32.inc

.data
    aName       BYTE    "Kip Irvine",0
    nameSize    = ($ - aName) - 1

.code
main PROC

; Push string aName to stack
    mov     ecx,nameSize
    mov     esi,0

L1: movzx   eax,aName[esi]
    push    eax
    inc     esi
    loop    L1

; Pop reverse string from stack to array aName

    mov     ecx,nameSize
    mov     esi,0

L2: pop     eax
    mov     aName[esi],al
    inc     esi
    loop    L2

; Print string
    mov     edx,OFFSET aName
    call    WriteString
    call    CrLf

exit
main ENDP

END main
