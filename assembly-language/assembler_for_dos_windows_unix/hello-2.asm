; Hello Workd! � ���� EXE

        .model  small   ; ��� � ������ � ����� ��������.
        .stack  100h    ; ������� ����� ������� 256 ����.

        .code
start:
        mov     ax,@data            ; ���� ���������� ����� �������� ������ � ������� ds.
        mov     ds,ax               ; �������� ������ (???) ������� ��������� ����� ax.
        
        mov     dx,offset message   ; offset ����� ��������, ������������ �������� ������.
        mov     ah,9
        int     21h     

        mov     ax,4C00H            ; exe DOS ��������� ����������� ���� ��������� �������.
        int     21h

        .data
message db      "Hello World!",0Dh,0Ah,'$'
        end     start