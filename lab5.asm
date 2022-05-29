.model small
.stack 100h
.data    
PositionRead 	dd  0
PositionWrite	dd  0

maxCMDSize 		equ 126
cmdSize         db  ?
cmdBuffer       db  maxCMDSize + 1 dup(0)
sourcePath      db  maxCMDSize + 1 dup(0) 
                             
sourceID        dw  0
                      
bufferSize      equ 50
buffer          db  bufferSize + 1 dup(0)
                                                       
spaceSymbol     equ ' '
newLineSymbol   equ 0Dh
returnSymbol    equ 0Ah
tabulation      equ 9
endl            equ 0
                      
startMessage       	 		db  "Program is started", '$'
proccesingMessage			db	"Proccesing", '$'
badCMDArgsMessage     		db  "Bad command-line arguments. Only 1 argument required: source path",'$'
badSourceMessage         	db  "Cannot open source file", '$'
fileNotFoundMessage      	db  "File not found", '$'
errorClosingSource    		db  "Cannot close source file", '$' 
errorWritingMessage      	db  "Error writing to file", '$'
endMessage               	db  "Program is ended", '$'
errorReadSourceMessage   	db  "Error reading from source file", '$'
EOF                   		db  0

period                equ 2
currWordStartingValue equ 1
currWordIndex         db currWordStartingValue	

.code  

println MACRO info          
	push ax                 
	push dx                 
                            
	mov ah, 09h          ; вывести строку info    
	lea dx, info            
	int 21h     
                            
	mov dl, 0Ah           ; перейти на новую строку 
	mov ah, 02h             
	int 21h            
                            
	mov dl, 0Dh                
	mov ah, 02h             
	int 21h          
                            
	pop dx                  
	pop ax                  
ENDM

cmpWordLenWith0 MACRO textline, is0Marker       ; Сравнение длины строки с нулем, 1 параметр - строка, 2 условие перехода при 0
	push si                                     
	                                            
	lea si, textline                            
	call    strlen                              
	                                            
	pop si                                      
	cmp ax, 0                                   
	je is0Marker                                
ENDM 

seekPos MACRO whatPos
 						; увеличивает позицию whatPos на cx
	local noCarry          
	
	add word ptr whatPos, cx
	jnc noCarry
	add word ptr [whatPos+2], 1
noCarry:      
    

endm 

putPos MACRO whatPos
	push ax                     
	push bx                     
	push cx                     
	push dx                    
                                
	mov ah, 42h                 ; уставить указатель файла
	xor al, al 			        ; начало файла
	mov dx, word ptr whatPos			    
	mov cx, word ptr [whatPos+2]           
	int 21h                      
    
	pop dx                      
	pop cx                      
	pop bx                      
	pop ax   

endm 

checkWordIndex MACRO          
	mov al, currWordIndex       
	xor ah, ah                  
                                
	push bx                     
	mov bl, period              
	div bl                     
	pop bx                      
	mov currWordIndex, ah       ; Присваиваем currWordIndex значение остатка от деления, т.е. четное слово или нет 
                                
	cmp ah, 0                   ; Сравниваем ah с нулем
	je movToSkip                
	jmp movToWrite              
                                
ENDM 

ifDelimJumpTo MACRO marker  
    cmp al, spaceSymbol                 
    je marker                                                            
	cmp al, newLineSymbol               
	je marker                                       
	cmp al, tabulation                  
	je marker                           
	cmp al, returnSymbol                
	je marker                                                                   
	cmp al, endl                        
	je marker                           
                                        
ENDM  

main:
	mov ax, @data           
	mov es, ax              
                            
	xor ch, ch              ; считать размер командной строки
	mov cl, ds:[80h]		
	mov cmdSize, cl 		
	
	mov si, 81h    			;переписать командную строку         
	lea di, cmdBuffer        
	cld  ; clear DF
	rep movsb               
                            
	mov ds, ax              
                            
	println startMessage       
                           
	call parseCMD           
	cmp ax, 0               
	jne endMain				
                            
	call openFiles          
	cmp ax, 0               
	jne endMain				
                            
	call processingFile      
	cmp ax, 0               
	jne endMain				
                            
	call closeFiles         
	cmp ax, 0               
	jne endMain				
                            
endMain:                    
	println endMessage         
                            
	mov ah, 4Ch             
	int 21h                 


parseCMD PROC                                                                               
	push bx                                     
	push cx                                     
	push dx                                     
	xor ch, ch  
	mov cl, cmdSize                            
                                                
	lea si, cmdBuffer                                                                                                                         
	lea di, buffer  
	
	call getCmdWord                                                                                    
                                                                                                           
	lea di, sourcePath                          ; записываем путь файла
	call getCmdWord                          
                                                
	cmpWordLenWith0 sourcePath, badCMDArgs      ; Если строка, содержащая название исходного файла пуста, прыгаем в badCMDArgs  
	                                                 
	lea di, buffer                               
	call getCmdWord                          
                                                
	cmpWordLenWith0 buffer, argsIsGood          
                                                ; то вызов программы корректный - прыгаем в argsIsGood
badCMDArgs:                                     
	println badCMDArgsMessage                   
	mov ax, 1                                   ; Записываем в ax код ошибки
                                                
	jmp endproc                                 ; Прыгаем в endproc и завершаем процедуру
                                                
argsIsGood:                                     
	mov ax, 0                                   ; Записываем в ax код успешного завершения процедуры
endproc:                                        
	pop dx                                      
	pop cx                                      
	pop bx                                      ; Восстанавливаем значения регистров и выходим из процедуры
	ret	                                        
  parseCMD endp  

getCmdWord PROC              
	push ax                     
	push cx                     
	push di                     
	                            
l_parseWord:                  
	mov al, ds:[si]             ; Загружаем в al текущий символ
	
	cmp al, spaceSymbol         
    je stopSymbol          
	cmp al, newLineSymbol       
	je stopSymbol                      
	cmp al, tabulation          
	je stopSymbol          
	cmp al, returnSymbol        
	je stopSymbol                                                  
	cmp al, endl                
	je stopSymbol          
                                
	mov es:[di], al             ; Если данный символ входит в слово, добавляем его в результирующую строку
                                
	inc di                      
	inc si                      
                                
	loop l_parseWord          ; Пока не конец командной строки
stopSymbol:                
	mov al, endl          
	mov es:[di], al             ; Загружаем символ конца ASCIIZ строки 
	inc si                      ; Увеличиваем si для перезода на следующий символ 
                                
	pop di                      
	pop cx                      
	pop ax                      
	ret                         
  getCmdWord endp  



;ds:si - смещение, в котором находится начало строки
;Результат - в ax помещается длина строки 
strlen PROC                     
	push bx                     
	push si                     
	                            
	xor ax, ax                  
                                
l_calc:                  
    mov bl, ds:[si]         
    cmp bl, endl          
    je endCalc              
                                
    inc si                 
    inc ax                                                                      
    jmp l_calc           
	                            
endCalc:                    
	pop si                      
	pop bx                     
	ret                         
  strlen ENDP 

openFiles PROC                  
	push bx                     
	push dx                             
	push si                                     
	                                            
	lea si, sourcePath                          
	
	call strlen              ; проверка формата, в ax длина названия файла                
	xor si, si         
	mov si, ax 
	sub si, 1                   
	        
	cmp sourcePath[si], 't' 		
	jne checkTxt_Error     
	sub si, 1
	
	cmp sourcePath[si], 'x' 
	jne checkTxt_Error    
	sub si, 1
	
	cmp sourcePath[si], 't' 
	jne checkTxt_Error   
	sub si, 1
	
	cmp sourcePath[si], '.' 
	jne checkTxt_Error
	                    
	jmp checkTxt_OK
	
checkTxt_Error: 
	pop si
	jmp badSourse       
	       
checkTxt_OK:                                            
	pop si  
	                            
	mov ah, 3Dh			        ; открыть существующий файл
	mov al, 02h			        ; режим
	lea dx, sourcePath          ; название исходного файла
	mov cx, 00h			        
	int 21h                     
                                
	jc badSourse	        ; (CF = 1) Если файл не открылся, то прыгаем в badSourse 
                                
	mov sourceID, ax	        ; Загружаем идентификатор файла
	
	mov ax, 0			        ; Загружаем в ax 0, т.е. ошибок во время выполнения процедуры не произшло 
	jmp endOpenProc		     
                                
badSourse:                  
	println badSourceMessage       
	cmp ax, 02h                
	jne errorFound                 ; файл найден, прыгаем в errorFound
                                
	println fileNotFoundMessage    ; Выводим сообщение о том, что файл не найден 
                                
	jmp errorFound            
                          
errorFound:                     
	mov ax, 1                   ; ошибка
endOpenProc:                    
	pop dx                      
	pop bx                      
	ret                         
  openFiles ENDP

processingFile PROC                    
	push ax                             
	push bx                             
	push cx                             
	push dx                             
	push si                             
	push di                             
                                        
	mov bx, sourceID                    

	println proccesingMessage
	
	putPos PositionRead
	putPos PositionWrite
	
    call readFromFile                   
	                                    
	cmp ax, 0                           
	je finishProcessing                 
                                        
	lea si, buffer                      
	lea di, buffer                      
	mov cx, ax					        ; в cx размер буффера 
	xor dx, dx                          ; В dx будет храниться кол-во элементов буффера, подлежащих записи
l_Processing:                         
	                                      
writeDelims:                       
	call p_writeDelims                     
	add dx, bx                          
	cmp ax, 0                           ; Сравниваем ax с 0, в ax кол-во строк которые мы записали
	je notNewLine                       ; Если ax == 0 прыгаем в notNewLine
                                        
                                        ; Если переходим на новую строку, то обнуляем индекс текущего слова                   
	mov bl,currWordStartingValue        ; Загружаем в bl индекс слова, с которого начинать удаление
	mov currWordIndex, bl               
                                        
notNewLine:                             
	call checkEndBuff                  
	cmp ax, 2                          
	je finishProcessing             
	cmp ax, 1                           
	je writeDelims                 
                                        
	checkWordIndex                      ; Запускаем макрос, который определяет четное ли слово сейчас или нет
                                        ; и взависимости от этого решает записать слово прыгая в moToWrite, или пропустить слово прыгая в movToSkip
movToWrite:                             
	call writeWord                      
	add dx, bx                          
	call checkEndBuff                   
	cmp ax, 2                           
	je finishProcessing                 
	cmp ax, 1                           
	je movToWrite                       
                                        
	jmp endWriteSkip                  
                                        
movToSkip:                              
	call skipWord                       
	call checkEndBuff                   
	cmp ax, 2                           
	je finishProcessing                 
	cmp ax, 1                           
	je movToSkip                        
                                        
	jmp endWriteSkip                     
                                        
endWriteSkip:                           	                           
	add currWordIndex, 1               
	
	jmp l_Processing                  
                                        
finishProcessing:                      
    mov bx, sourceID                                        
    putPos PositionWrite 
	
    xor ax,ax                           
    mov ah, 40h                         
    mov bx, sourceID                    
    mov cx, 0h                          
    int 21h                             
                                        
	pop di                               
	pop si                              
	pop dx                              
	pop cx                              
	pop bx                              
	pop ax                              
	ret                                 
  processingFile ENDP



;ds:si - источник 
;es:di - приемник 
;cx - длина
;вывод
;	bx - кол-во записываемых разделителей
;	ax - кол-во переходов на новую строку
p_writeDelims PROC                        
	push dx                             
	xor bx, bx                          
	xor dx, dx                          
                                        
l_WriteDelims:                   
	mov al, ds:[si]                     ; Записываем в al символ, подлежащий записи
	                                    
	cmp al, spaceSymbol                     
	je isDelim                          
                                        
	cmp al, newLineSymbol               
	je isNewLineSymbol                  
                                        
	cmp al, tabulation                 
	je isDelim                          
                                        
	cmp al, returnSymbol                
	je isNewLineSymbol                  
                                        
	cmp al, endl                        
	je isDelim                          
                                      
	jmp isNotDelim                     
                                        
isNewLineSymbol:                        
	inc dx                              ; dx кол-во переходов на новую строку
isDelim:                                
	movsb                               
	inc bx                              ; Увеличиваем bx кол-во записанных символов
	loop l_WriteDelims           
                                        
isNotDelim:                             
	mov ax, dx                          
                                        
	pop dx                              
	ret                                 
 p_writeDelims ENDP 

;	ax = 0 - в буффере еще есть символы
;	ax = 1 - буффер пуст, данные записаны, и новый "кусок" файла был подгружен в буффер 
;	ax = 2 - буффер был обработан, данные записаны, была совершена попытка подгузки данных, но программа уже дошла до конца файла
checkEndBuff PROC               
	cmp cx, 0                  
	jne notEndOfBuffer          ; Если cx != 0, то буффер еще не полностью записан
                                
	cmp dx, 0                   
	je skipWrite                ; Если dx == 0, то нам нечего записывать
	                            
	mov cx, dx                  ; Записывает в cx dx, т.е. кол-во символов
	call writeToFile           
                                
skipWrite:     

	call readFromFile   

	cmp ax, 0                   
	je endOfProcessing          
                                
	lea si, buffer           
	lea di, buffer              
	mov cx, ax					; Записываем в cx кол-во символов в буффере из ax
	xor dx, dx                  
                                
	mov ax, 1                   
	ret                         
                                
endOfProcessing:                
	mov ax, 2                  
	ret                         
                                
notEndOfBuffer:                 
	mov ax, 0                   
	ret                         
  checkEndBuff ENDP 


;cx - кол-во записываемых символов от начала буффера
;RES: ax - количество записанных символов
writeToFile PROC                      
	push bx                           
	push cx                       
	push dx                             
	                                  
	mov bx, sourceID    
	            
	putPos PositionWrite
				  ; устанавливаем положение курсора в файле
	seekPos  PositionWrite			  ; сдвигаем указатель на cx
	
	mov ah, 40h                       ; функция записи в файл
	mov bx, sourceID                  
	lea dx, buffer                    
	int 21h   
	
	jnc goodWrite					  
                                      
	println errorWritingMessage          ; Иначе выводим сообщение о возникновении ошибки при записи
	mov ax, 0                         
                                      
goodWrite:
	putPos PositionRead                             
    mov bx, sourceID                                  
        
	pop dx                           
	pop cx                            
	pop bx                            
	ret                               
 writeToFile ENDP  


;Результат: в ax помещается колв-во считанных из файла символов
readFromFile PROC                   
	push bx                         
	push cx                         
	push dx
	
	putPos PositionRead
	
	mov ah, 3Fh                     ; функция чтения из файла
	mov bx, sourceID                
	mov cx, bufferSize             
	lea dx, buffer                  
	int 21h                         
                                
	jnc goodRead					
	
	println errorReadSourceMessage     
	mov ax, 0                       
                                    
goodRead:               
	seekPos PositionRead			

	pop dx                          
	pop cx                         
	pop bx                          
	ret                             
  readFromFile  ENDP  

 

;ds:si - источник
;es:di - приемник
;cx - кол-во необработанных символов буффера
;bx - кол-во записываемых символов
writeWord PROC                      
	push ax                        
	xor bx, bx                      
                                    
loopParseWordWW:                    
	mov al, ds:[si]                 
	
	ifDelimJumpTo isStoppedSymbolWW
                                    
	movsb                           
	inc bx                          
	loop loopParseWordWW            
                                    
isStoppedSymbolWW:                  
	pop ax                          
	ret                             
writeWord ENDP   

;ds:si - offset, where we will find (will change)
;То же самое, что и в writeWord
skipWord PROC
	push ax
	xor bx, bx
	
loopParseWordSW:
	mov al, ds:[si]
	
	ifDelimJumpTo isStoppedSymbolSW

	inc si
	inc bx
	loop loopParseWordSW

isStoppedSymbolSW:
	pop ax
	ret
skipWord ENDP   

closeFiles PROC                 
	push bx                     
	push cx                     
                                
	xor cx, cx                  
	
	mov ah, 3Eh                 ; Функция закрытия файла
	mov bx, sourceID            
	int 21h                      
                                
	jnc goodCloseOfSource		
	
	println errorClosingSource  
	
	inc cx 			            
                                
goodCloseOfSource:                             
	mov ax, cx 		            
                                
	pop cx                      
	pop bx                      
	ret                         
 closeFiles  ENDP  

end main
