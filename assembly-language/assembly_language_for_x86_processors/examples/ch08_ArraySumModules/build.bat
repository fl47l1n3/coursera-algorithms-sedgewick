PATH c:\Masm615

SET INCLUDE=c:\Masm615\include
SET LIB=c:\Masm615\lib

ML -Zi -c -Fl -coff main.asm _display.asm _arraysum.asm _prompt.asm
ML -Zi -c -Fl -coff _prompt.asm
LINK32 main.obj _display.obj _arraysum.obj _prompt.obj irvine32.lib kernel32.lib /SUBSYSTEM:CONSOLE
