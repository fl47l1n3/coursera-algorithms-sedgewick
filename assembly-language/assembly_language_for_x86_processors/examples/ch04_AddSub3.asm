TITLE Шаблон программы

INCLUDE Irvine32.inc

.data
Rval    SDWORD  ?
Xval    SDWORD  26
Yval    SDWORD  30
Zval    SDWORD  40

.code
main PROC

; Команды INC и DEC
mov     eax,1000h
inc     eax
dec     eax

; Rval = -Xval + (Yval - Zval)
mov     eax,Xval
neg     eax
mov     ebx,Yval
sub     ebx,Zval
add     eax,ebx
mov     Rval,eax

; Пример с ZF
mov     ecx,0
sub     ecx,1

; Пример с CF
mov     al,0FFh
mov     al,1

; Пример с OF
mov     al,+127
add     al,1

exit
main ENDP

END main
