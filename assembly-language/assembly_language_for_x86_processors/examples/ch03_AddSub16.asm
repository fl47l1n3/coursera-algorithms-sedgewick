TITLE Add and sub in 16 bit mode

INCLUDE Irvine16.inc

.data

val1        DWORD   10000h
val2        DWORD   40000h
val3        DWORD   20000h
finalVal    DWORD   ?

.code
main PROC

mov ax,@data
mov ds,ax

mov eax,val1
add eax,val2
sub eax,val3
mov finalVal,eax

call DumpRegs

exit
main ENDP

END main
