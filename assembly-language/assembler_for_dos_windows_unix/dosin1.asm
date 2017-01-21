    .model  tiny
    .code
    org     100h
    
start:                        
    ; �������� �����������                               
    mov     dx,offset message1
    mov     ah,9
    int     21h           
               
    ; ������� � buffer ���������������� ����
    mov     dx,offset buffer
    mov     ah,0Ah
    int     21h

    ; ������� ������                           
    mov     dx,offset crlf
    mov     ah,9
    int     21h      
    
    ; ������� ����� �� ����������� ������������� � �������� �����
    ; DI - ����� ����� � ������
    ; AX - ������� �������� ����������
    ; SI - ����� ������
    ; CL - ��������� ��� MUL
    xor     di,di
    xor     ax,ax
    mov     cl,blength
    xor     ch,ch
    xor     bx,bx
    mov     si,cx
    mov     cl,10     
    
asc2hex:             
    ; ��������� ������
    mov     bl,byte ptr bcontents[di]
    
    ; ������ ��������
    sub     bl,'0'
    jb      asc_error
    cmp     bl,9
    ja      asc_error                    
                   
    ; ���������� ��� ������� �����  
    mul     cx
    add     ax,bx
    inc     di
    cmp     di,si
    jb      asc2hex
                   
    ; ������� ���������
    push    ax
    mov     ah,9
    mov     dx,offset message2
    int     21h
    pop     ax
                 
    ; �������� AX
    push    ax
    xchg    ah,al
    call    print_al
    pop     ax
    call    print_al                   
    
    ret           
    
asc_error:
    mov     dx,offset err_msg
    mov     ah,9
    int     21h
    ret          
    
print_al:
    mov     dh,al
    and     dh,0Fh
    shr     al,4
    call    print_nibble
    mov     al,dh
print_nibble:
    cmp     al,10
    sbb     al,69h
    das
    mov     dl,al
    mov     ah,2
    int     21h
    ret
    
message1    db  "Enter number: $"
message2    db  "HEX number is: $"
err_msg     db  "Input error"
crlf        db  0Dh,0Ah,'$'
buffer      db  6
blength     db  ?   ; ���������� ������ ������������� �� ������ �����
bcontents:
    
end    start