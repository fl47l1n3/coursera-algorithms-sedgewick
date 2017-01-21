TITLE Extend adding for 256 digit integers

INCLUDE Irvine32.inc

.data
    op1     QWORD   0A2B2A40674981234h
            QWORD   0A2B2A40674981234h
            QWORD   0A2B2A40674981234h
            QWORD   0A2B2A40674981234h
    opSize = ($ - op1) / 4
    op2     QWORD   08010870000234502h
            QWORD   08010870000234502h
            QWORD   08010870000234502h
            QWORD   08010870000234502h
    sum     DWORD   (opSize + 1) dup(?)

.code
main PROC
    mov     esi,OFFSET op1
    mov     edi,OFFSET op2
    mov     ebx,OFFSET sum
    mov     ecx,opSize
    call    Extend_Add

    mov     esi,OFFSET sum
    mov     ebx,4
    mov     ecx,opSize
    call    DumpMem
    exit
main ENDP

Extend_Add PROC
; ESI and EDI - addresses of integers
; EBX - address of result
; ECX - operand's size in dwords
    pushad
    clc

L1:
    mov     eax,[esi]
    adc     eax,[edi]

    pushfd
    mov     [ebx],eax
    add     esi,4
    add     edi,4
    add     ebx,4
    popfd

    loop    L1

    mov     dword ptr [ebx],0
    adc     dword ptr [ebx],0
    popad

    ret
Extend_Add ENDP

END main
