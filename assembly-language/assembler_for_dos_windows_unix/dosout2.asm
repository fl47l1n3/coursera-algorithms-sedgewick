; ������� ������ � STDERR

        .model  tiny
        .code
        org     100h
start:                        
        ; ��������� ����� 40h - ������� � ���� ��� ����������.
        ; BX - 1 ��� STDOUT, 2 ��� STDERR
        ; DX - ����� ������ ������
        ; �� - ����� ������
        mov     ah,40h
        mov     bx,2
        mov     dx,offset message
        mov     cx,message_length
        int     21h
        ret              
        
message db      "This function may print symbol $"
message_length = $-message

        end     start