TITLE Points map

INCLUDE Irvine32.inc

.data
    ItemSize = TYPE DWORD
    PointsMap   DWORD   90,100,'A'
    EntrySize = ($ - PointsMap)
                DWORD   80,98,'B'
                DWORD   70,79,'C'
                DWORD   60,69,'D'
                DWORD   0,59,'F'
    EntriesLen = ($ - PointsMap) / EntrySize
    prompt      BYTE    "Enter your points: ",0
    msg         BYTE    "Your score: ",0

.code
main PROC
    mov     edx,OFFSET prompt
    call    WriteString
    call    ReadInt

    mov     ecx,EntriesLen
    mov     ebx,OFFSET PointsMap
MAP_LOOP:
    ; Compare student point and min point
    cmp     eax,[ebx]
    jb      next    ; If less then next
    ; Compare student point and max point
    cmp     eax,[ebx + ItemSize]
    ja      next    ; If great then next

    mov     al,BYTE PTR [ebx + (ItemSize * 2)]
    jmp     Complete

next:
    ; Check next entry
    add     ebx,EntrySize
    loop    MAP_LOOP

COMPLETE:
    mov     edx,OFFSET msg
    call    WriteString
    call    WriteChar

    exit
main ENDP

END main
