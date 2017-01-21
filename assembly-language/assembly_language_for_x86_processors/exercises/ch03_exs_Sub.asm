TITLE Шаблон программы

INCLUDE Irvine32.inc

.data

.code
main PROC

mov ax,09h
sub ax,02h

call DumpRegs

exit
main ENDP

END main
