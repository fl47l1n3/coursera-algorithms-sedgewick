TITLE Шаблон программы

INCLUDE Irvine32.inc

.data

; bytes
var1    BYTE    10
var2    SBYTE   -128
var3    SBYTE   +127
var4    BYTE    ?
var5    BYTE    'A'

list1   BYTE    10h,24,'A',01000101b
array   BYTE    20 DUP(0)

hwllo   BYTE    "Hello, world!",0

; words
word1   WORD   65535
word2   SWORD  -32768
word3   WORD   ?
myList  WORD   1,2,3,4,5

; dwords
val1  DWORD   12345678h
val2  SDWORD  -2147483648
val3  DWORD   20 DUP(?)

; QuadWord and TenByte Values

quad1  DQ  234567812345678h
ten1   DT  1000000000123456789Ah

; Reals

rVal1  REAL4   -1.2
rVal2  REAL8   3.2E-260
rVal3  REAL10  4.6E4096

; The following ranges were discovered by trial and error:

ShortRealMax REAL4 9.9E+37		; maximum exponent
ShortRealMin REAL4 9.9E-38		; minimum exponent

LongRealMax REAL8 9.0E+307		; maximum exponent
LongRealMin REAL8 9.9E-308		; minimum exponent

ExtRealMax	REAL10 9.9E+4931		; maximum exponent
ExtRealMin REAL10 9.9E-5199		; minimum exponent


ShortArray REAL4 20 DUP(0.0)

; Pointers

arrayB  BYTE  10,20,30,40
arrayW  WORD  1000h,2000h,3000h,4000h
ptrB    DWORD  arrayB		; points to arrayB
ptrW    DWORD  arrayW		; points to arrayW

.code
main PROC

exit
main ENDP

END main
