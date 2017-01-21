; Безусловный переход
mov ax,4
jmp infloop
mov bx,2
infloop:
mov cx,5

; Проверка равенства
mov ax,3
cmp ax,3
jz  is_three
is_three:
mov cx,1                     

; IF - ELSE IF - ELSE
cmp al,cl   ; if al==cl     
    jz write_1
cmp al,cl   ; else if al>cl
    ja write_2              
jmp write_3 ; else 
write_1:
    mov bl,1                
    ret
write_2:
    mov bl,2          
    ret
write_3:
    mov bl,3
    ret

; forloop на jz
for_start:
    mov cx,0
for_loop:
    inc cx
    cmp cx,10
    jnz for_loop
for_finish:
    ret

; loop
for_start:
    mov cx,5
for_loop:    
    mov bx,2
loop for_loop
for_finish: