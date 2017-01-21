TITLE Шаблон программы

INCLUDE Irvine32.inc

; Создаем новые типы данных
PBYTE   TYPEDEF PTR BYTE
PWORD   TYPEDEF PTR WORD
PDWORD  TYPEDEF PTR DWORD

.data
arrayB  BYTE    10h,20h,30h
arrayW  WORD    1,2,3
arrayD  DWORD   4,5,6

; Создадим переменные-указатели
ptr1    PBYTE   arrayB
ptr2    PWORD   arrayW
ptr3    PDWORD  arrayD

.code
main PROC

; Воспользуемся указателями для доступа к данным
mov     esi,ptr1
mov     al,[esi]    ; AL = 10h

mov     esi,ptr2
mov     ax,[esi]    ; AX = 0001h

mov     esi,ptr3
mov     eax,[esi]   ; EAX = 00000004h
add     esi,4
mov     eax,[esi]   ; EAX = 00000005h

exit
main ENDP

END main
