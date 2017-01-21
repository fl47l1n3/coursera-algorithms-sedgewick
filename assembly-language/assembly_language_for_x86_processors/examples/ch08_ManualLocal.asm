TITLE Manually local variables

INCLUDE Irvine32.inc

.data

.code
main PROC
    call    Locals
    exit
main ENDP

;------------------------------------------------------------------------------
; void Locals() {
;   char X = 'X';
;   int Y = 10;
;   char name[20];
;   name[0] = 'B';
;   double Z = 1.2;
; }
; X - 4 = EBP - 4
; Y - 4 = EBP - 8
; name - 20 = EBP - 28
; Z - 8 = EBP - 36
Locals PROC
    push    ebp
    mov     ebp,esp
    sub     esp,36

    mov     BYTE PTR [ebp - 4],'X'  ; X
    mov     DWORD PTR [ebp - 8],10  ; Y
    mov     BYTE PTR [ebp - 28],'B' ; name[0]
    mov     DWORD PTR [ebp - 32],3ff33333h
    mov     DWORD PTR [ebp - 36],33333333h

    mov     esp,ebp
    pop     ebp
    ret
Locals ENDP

END main
