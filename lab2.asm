.model small
.stack 100h
.data   
        Max_size        equ     400                
        String          db      Max_size DUP('$')            
        Intro_message   db      "Incoming string: ", 0Ah, 0Dh, '$'
        Result_message  db      0Ah, 0Dh, "Result String:", 0Ah, 0Dh, '$'
        Error           db      0Ah, 0Dh, "Incoming string have same problem.", 0Ah, 0Dh,'$'
.code

output_string macro
        mov    ah,    9
        int 21h
endm

increment proc
        inc    dl
        ret 
increment endp 

if_number proc   ;ïðîâåðêà ÷èñëà
        cmp al, '-'
		je metka
		jne cont
metka:
		cmp bx, 1
		je metka2
		cmp di, 0
		je increment
		cmp String[di-1], 20h
		je increment
		jne cont
metka2:
		jmp Next
cont:
        cmp    al,    '0'
        jl     metka2
        cmp    al,    '9'
        jle    increment
        jg     if_num_letter
        ret
if_number endp

if_num_letter proc ; ïðîâåðêà h ÷èñëà
        cmp    al,    'A'
        jl     metka2
        cmp    al,    'F'
        jle    increment
        jg     metka2
        ret
if_num_letter endp   

start:    
        mov     ax,     @data
        mov     ds,     ax
        mov     cx,     Max_size
        xor     si,     si
        mov     dx,     offset Intro_message 
        output_string
        push cx
cycle:                
        mov     ah,     1
		
		cmp al, '$'					; $
		je error_input
        
		int     21h
        mov     String[si], al
        inc     si
        cmp     al,     0Dh     
        loopne  cycle
		pop cx
        cmp     String[0], 0Dh
        je      error_input

        mov     String[si], 24h        
        lea     dx,     Result_message
        output_string

        xor     si,     si  
        lea     si,     String
        ;dec     si
        mov     di,     si
		push cx
For:
        mov     al,     String[si]
        cmp     al,     20h       
        je      New_word                 
        cmp     al,     0Dh  
        je      New_word 
        cmp     al,     24h
        je      New_word 
        inc     si
        loop    For  
		pop cx
New_word:
        xor     bx,     bx
        xor     dx,     dx
        mov     bx,     si             
        sub     bx,     di
        push    di
        push    cx
        mov     cx,     bx
For1:   
        mov     al,     String[di]
		call    if_number	

        cmp     bx,     dx           
        je      Delete
	    inc 	di
        loop    For1   
     
Next:
        pop     cx
        pop     di 
        cmp     String[si], 0Dh
        je      Exit     
        inc     si
        mov     di,     si
        loop    For
		
error_input:                            ; ïðîáëåìíûé ââîä
        mov     dx,     offset Error
        output_string
        jmp     error_end 
		
delete_last:                               
        mov     String[di], 24h
        jmp     Exit

Delete:       
        pop     cx
        pop     di 
        cmp     String[si], 0Dh
        je      delete_last    
        inc     si 
        push    di
        push    si 
        push    cx
while_delete:    	
        mov     al,   String[si]
        mov     String[di], al
        cmp     String[si-1], 0Dh
        je      after_del
        cmp     String[si-1], 24h
        je      delete_last
        inc     si
        inc     di
        jmp     while_delete
after_del:
        pop     cx
        pop     si
        pop     di  
        mov     si,     di
        jmp     For
    
Exit:
        mov     dx,     offset String
        output_string
error_end:
        mov     ax,     4c00h
        int     21h
end     start        
