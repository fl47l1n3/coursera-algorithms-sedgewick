TITLE Шаблон программы

INCLUDE Irvine32.inc
COUNT=7

.data

.code
main PROC

    mov     ecx,COUNT
    mov     eax,1
    mov     ebx,1
L1:
    ; Каждое последующее сумма 2-х предыдущих
    add     eax,ebx
    ; Печатает новое вычисленное из EAX
    call    DumpRegs
    ; Меняем значения, иначе в EBX будет все время 1
    xchg    eax,ebx
    loop    L1

exit
main ENDP

END main
