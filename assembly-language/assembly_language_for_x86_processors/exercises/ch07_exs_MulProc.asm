TITLE Multiple procedure

INCLUDE Irvine32.inc

.data

.code
main PROC
    mov     eax,123
    mov     ebx,36
    call    Multiple
    mov     eax,edx
    call    WriteDec
    exit
main ENDP

Multiple PROC
    mov     edx,0   ; Result here
    mov     ecx,7   ; Loop for all 8 bits
L_DIGIT_EXTRACTOR:
    shr     ebx,1   ; Extract to CF next bit for analyse
    jc      L_SHIFT ; If CF=1 - go to calc
    jmp     L_NEXT

L_SHIFT:    ; Mul and add to result
    mov     esi,eax
    shl     esi,cl
    add     edx,esi

L_NEXT:
    loop    L_DIGIT_EXTRACTOR
    ret


Multiple ENDP

END main
