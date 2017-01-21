TITLE Random uppercase strings

INCLUDE Irvine32.inc

.data
    stringsCount = 20
    symbolsCount = 10
    firstSymbol = 65
    endSymbol = 90
    string      BYTE    symbolsCount DUP(endSymbol)

.code
main PROC
    call    Randomize

    ; Loop for strings
    mov     ecx,stringsCount
    STRINGS_LOOP:

        ; Loop for fill string randomized symbols
        push    ecx
        mov     ecx,symbolsCount
        mov     esi,0
        SYMBOLS_LOOP:
            mov     eax,endSymbol-firstSymbol
            call    RandomRange
            add     eax,firstSymbol
            mov     string[esi],al
            inc     esi
            loop    SYMBOLS_LOOP

        pop     ecx
        mov     edx,OFFSET string
        call    WriteString
        call    CrLf
        loop    STRINGS_LOOP

exit
main ENDP

END main

