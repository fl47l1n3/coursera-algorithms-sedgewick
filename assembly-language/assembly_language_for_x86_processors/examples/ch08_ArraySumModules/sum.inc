INCLUDE Irvine32.inc

PromptForIntegers PROTO,
        ptrPrompt:PTR BYTE,
        ptrArray:PTR DWORD,
        arraySize:DWORD

ArraySum PROTO,
        ptrArray:PTR DWORD,
        arraySize:DWORD

DisplaySum PROTO,
        ptrPrompt:PTR BYTE,
        theSum:DWORD
