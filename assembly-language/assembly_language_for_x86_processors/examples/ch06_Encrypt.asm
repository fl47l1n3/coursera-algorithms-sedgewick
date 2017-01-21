TITLE Cryptography tool

INCLUDE Irvine32.inc

KEY = 239
BUFMAX = 128

.data
    sPrompt     BYTE    "Enter source message: ",0
    sEncrypt    BYTE    "Encrypted message: ",0
    sDecrypt    BYTE    "Decrypted message: ",0
    buffer      BYTE    BUFMAX DUP(0)
    bufSize     DWORD   ?

.code
main PROC
    call    InputTheString
    call    TranslateBuffer

    mov     edx,OFFSET sEncrypt
    call    DisplayMessage

    call    TranslateBuffer

    mov     edx,OFFSET sDecrypt
    call    DisplayMessage

    exit
main ENDP

InputTheString PROC
    pushad
    mov     edx,OFFSET sPrompt
    call    WriteString

    mov     ecx,BUFMAX
    mov     edx,OFFSET buffer
    call    ReadString
    mov     bufSize,eax

    call    CrLf
    popad
    ret
InputTheString ENDP

DisplayMessage PROC
    pushad
    call    WriteString
    mov     edx,OFFSET buffer
    call    WriteString
    call    CrLf
    call    CrLf
    popad
    ret
DisplayMessage ENDP

TranslateBuffer PROC
    pushad

    mov     ecx,bufSize
    mov     esi,0
L1:
    xor     buffer[esi],KEY
    inc     esi
    loop    L1

    popad
    ret
TranslateBuffer ENDP

END main
