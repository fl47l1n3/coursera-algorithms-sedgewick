        .model  tiny
        .code
        .386
        org             100h

start:                  
        ; ������� �����
        mov     ax,0003h
        int     10h

        cld     ; ��������� � ������ ����������� ��� ������ stos*
        
        mov     eax,1F201F00h       ; ������ ������ � ��������
        mov     bx,0F20h            ; ������
        mov     cx,255              ; �������
        mov     di,offset ctable    ; ������������� ������ ��� ���������� ES:DI

cloop:
        stosd   ; �������� ��������� ������ � ���� ������� (EAX �� ������ ES:DI)
        
        inc     al              ; � AL � ��� �������� ������, � AH ������, ����������� AL
        test    cx,0Fh          ; ���� �� 16 -
        jnz     continue_loop   ; ����������   
        
        push    cx                          
        
        ; ���� ��������� ���������� ����� ���������
        mov     cx,80-32
        xchg    ax,bx
        rep     stosw
        xchg    bx,ax
        
        pop     cx        

continue_loop:
        loop    cloop
        stosd

        ; ES:DI - �����, ������ ����������
        ; DS:SI - �����, ���� ����������
        ; CX - ������� ��� ��������� ��������
        ; movsw � ����� �������� �� ES:DI � DS:SI CX ��� �� DWORD
        mov     ax,0B800h
        mov     es,ax
        mov     di,di
        mov     si,offset ctable
        mov     cx,15*80+32
        rep     movsw        
        
        ret

ctable:

end     start