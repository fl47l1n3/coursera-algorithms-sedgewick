TITLE Examples in chapter 8

INCLUDE Irvine32.inc

.data

.code
main PROC
    exit
main ENDP

;------------------------------------------------------------------------------
; 8.2.1
MySub PROC
    LOCAL   var1:BYTE
    ret
MySub ENDP

StackWalk PROC
    push    ebp
    push    9
    add     esp,-4
    add     esp,12
    ret
StackWalk ENDP

BubbleSort PROC
    LOCAL   temp:DWORD, SwapFlag:BYTE
    mov     temp,20
    mov     SwapFlag,3
    ret
BubbleSort ENDP

BubbleSortRaw PROC
    push    ebp
    mov     ebp,esp
    add     esp,0fffffff8h

    mov     DWORD PTR [ebp - 4],20
    mov     BYTE PTR [ebp - 5],3

    mov     esp,ebp
    pop     ebp
    ret
BubbleSortRaw ENDP

Merge PROC
    LOCAL   pArray:PTR WORD, TempArray[10]:DWORD
    ret
Merge ENDP

END main
