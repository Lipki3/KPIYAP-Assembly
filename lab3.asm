printSym macro info
	mov ah, 02h
	mov dx, info
	int 21h
endm

newLine macro
	push ax
    push dx
    printSym 0Ah
    printSym 0Dh
    pop dx
    pop ax
endm

println macro info
	push ax
	push dx

	mov ah, 09h
	mov dx, offset info
	int 21h

	pop dx
	pop ax
endm

printSpace macro 
    push dx
	mov ah, 02h
	mov dl, 20h
	int 21h 
	pop dx
endm

.model small

.stack 100h

.data
	y equ 5;2;5
	x equ 6;3;6   

	elemSize equ 2
    sign dw 0
	messageInput db 0Ah, 0Dh,"Input number", 0Ah, 0Dh, '$'
	messageWordIsNotNum db "It's not a number", 0Ah, 0Dh, '$'
	messageOverflow db 10,13,"Number out of range", 0Ah, 0Dh, '$'
	messageMatrix db 0Ah, 0Dh,"Matrix:", 0Ah, 0Dh, '$'   
	
	messageResult db "Result:", 0Ah, 0Dh, '$'     


	matrix dw x*y dup(0)
	res dw x dup(0)
	
.code 




inputSym proc
	mov ah, 01h
	int 21h
	ret
endp   



printNum proc
	push ax
	push bx
	push cx
	push dx

	xor cx, cx
	xor dx, dx
	cmp ax, 0
	jge noSign

	push ax
	printSym '-'
	pop ax
	mov dx, -1
	imul dx
	xor dx, dx

noSign:
	mov bx, 10
	div bx		

	add dx, 30h	
	push dx		
	xor dx, dx

	inc cx

	cmp ax, 0
	jne noSign

	jcxz printResultEnd


printResult:  
  
	pop dx
	printSym dx
	loop printResult

printResultEnd:
	
	pop dx
	pop cx   
	pop bx
	pop ax   
	ret
endp

start:
	mov ax, @data	
	mov ds, ax

	xor ax, ax
    xor si, si
	mov cx, x*y

	mov bx, offset matrix

inputLoop:

	println messageInput

	call inputNumber

	cmp dx, 0
	je goodInput

	jmp inputLoop	
	


goodInput:
	mov word ptr [bx], ax
	add bx, elemSize

	loop inputLoop

	println messageMatrix

	xor bx, bx			;line
	mov cx, y
    xor di, di

whileLines:
	push cx 
	xor si, si 			;column
    xor dx,dx
	mov cx, x	

whileColumns:
	mov ax, matrix [bx + si]

	call printNum		;print 
	printSpace

    cmp dx, 1
    je Of
	mov ax, matrix [bx + si]	;calculating
	;dec res[di]
	;adc ax, res[di] 
	add ax, res[di]
	jno noOverFlow
    
    mov dx, 1  

Of:    
	mov ax, 0	

noOverFlow:
	;dec ax
	mov res[di], ax		;remember results
	
	add si, elemSize

	loop whileColumns

	newLine
	add bx, elemSize*x 
	add di, elemSize 
	;mov res[di], 0
	pop cx
	loop whileLines

	println messageResult

	mov bx, offset res
	mov cx, y

printLoop:
	mov ax, word ptr[bx]
	call printNum
	

    
     
    printSpace
	
	add bx, elemSize

	loop printLoop
	
	jmp to_close
 

	loop printLoop
	
	jmp to_close

   
minus:
	mov dx, -1
	push dx
	mov sign, 1
	call inputSym  
	inc si
	jmp next
	
inputNumber proc
	push bx
	xor bx, bx
	xor si, si  
	mov sign, 0
checkSign:
	call inputSym
	
	inc si
	cmp al, 2dh		;'-'
	je minus

	cmp al, 2bh		;'+'
	jne notSign
	call inputSym

notSign:
	mov dx, 0001h
	push dx
	jmp next   
	
checkOverfloeMinus:
    cmp ax, 32768
    ja ErrorOverflow
    jmp next1 
    
withMinus:
    cmp si, 6
    jl next1 
    jg ErrorOverflow
    je checkOverfloeMinus

next:
	mov dx, 0000h
	push dx

	xor dx, dx
    cmp al, 13		;'\n'
    je ErrorNotDigit
checkDigit:
	
	cmp al, 13		;'\n'
	je endlineIsInput

	cmp al, 30h		;'0'	;if number
	jl ErrorNotDigit
	cmp al, 39h		;'9'
	jg ErrorNotDigit

	mov bl, al 		;in bl the last entered number
	sub bl, 30h

	;number formation
	pop ax
	mov dx, 10
	mul dx
	add ax, bx
	push ax
    
    cmp sign, 1  
    je withMinus
    cmp si, 5
    jl next1 
    jg ErrorOverflow
    
checkOverflow:
	;cmp sign, 1
	;je checkOverfloeMinus
	mov bl, 80h			;check for overflow
	and bl, ah
	cmp bl, 0
	jne ErrorOverflow      
 	
next1:
	call inputSym
	inc si
	jmp checkDigit

endlineIsInput:
	pop ax		;number
	pop bx		;sign
	imul bx

	xor dx, dx	
	jmp endOfProc

ErrorNotDigit:
	println messageWordIsNotNum
	mov dx, 1

	jmp badInput
	
ErrorOverflow:
	println messageOverflow
	mov dx, 2

badInput:
	pop ax	;number
	pop ax	;sign
	xor ax, ax

endOfProc:

	pop bx

	ret
endp

to_close:       

	mov ax, 4c00h
	int 21h
end start
