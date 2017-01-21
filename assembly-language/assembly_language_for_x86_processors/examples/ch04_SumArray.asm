TITLE Вычислние суммы элементов массива

INCLUDE Irvine32.inc

.data
    intArray    WORD    100h,200h,300h,400h

.code
main PROC

    mov     edi,OFFSET intArray     ; EDI - адрес массива
    mov     ecx,LENGTHOF intArray   ; ECX - кол-во элементов массива
    mov     ax,0                    ; Тут будем хранить сумму

L1:
    add     ax,[edi]            ; СкладываемШаблон программы
    add     edi,TYPE intArray   ; Двигаем указатель на следующий элемент
    loop    L1

exit
main ENDP

END main
