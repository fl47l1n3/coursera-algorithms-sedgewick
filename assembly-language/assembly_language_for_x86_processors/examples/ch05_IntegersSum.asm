TITLE Project name

INCLUDE Irvine32.inc

.data
    IntegerCount = 3
    array       DWORD IntegerCount DUP(?)
    prompt1     BYTE    "Enter signed integer: ",0
    prompt2     BYTE    "Numbers sum is: ",0

.code
;------------------------------------------------------------------------------
main PROC
; Main procedure. Entrypoint
;------------------------------------------------------------------------------
    call    ClrScr

    mov     esi,OFFSET array
    mov     ecx,IntegerCount
    call    PromptForIntegers

    call    ArraySum
    call    DisplaySum

    exit
main ENDP

;------------------------------------------------------------------------------
PromptForIntegers PROC
; Prompt from user several integers
; Receives:
;           ESI - address DWORD's array
;           ECI - array size
; Returns: null
    pushad
    mov     edx,OFFSET prompt1

L1:
    call    WriteString
    call    ReadInt         ; read to EAX
    mov     [esi],eax
    add     esi,4
    call    CrLf
    loop    L1

    popad
    ret
PromptForIntegers ENDP
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
ArraySum PROC
; Calculate sum of array 32 bit numbers
; Receives:
;           ESI - array pointer
;           ECX - array elements count
; Returns:
;           EAX - sum of array
;------------------------------------------------------------------------------
    push    esi
    push    ecx
    mov     eax,0

L1:
    add     eax,[esi]
    add     esi,4
    loop    L1

    pop     ecx
    pop     esi
    ret
ArraySum ENDP
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
DisplaySum PROC
; Display sum of array
; Receives:
;           EAX - array sum
; Returns: null
    push    edx
    mov     edx,OFFSET prompt2
    call    WriteString
    call    WriteInt
    call    CrLf
    pop     edx
    ret
DisplaySum ENDP
;------------------------------------------------------------------------------

END main
