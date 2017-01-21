TITLE Dump memory procedure

INCLUDE Irvine32.inc

.data
    mem     BYTE    1,2,3,4,1,2,3,5,6

.code
DumpMemory PROC USES esi ecx ebx,
        ptrArray:PTR DWORD,
        arraySize:DWORD,
        itemSize:DWORD

    mov     esi,ptrArray
    mov     ecx,arraySize
    mov     ebx,itemSize
    call    DumpMem

    ret
DumpMemory ENDP

main PROC
    INVOKE  DumpMemory,ADDR mem,LENGTHOF mem,TYPE mem
    exit
main ENDP

END main
