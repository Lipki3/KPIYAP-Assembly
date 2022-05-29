	
		.model small
		.stack 100h
	
		.DATA  
            
offsetX	dw	0	                        	                                   
width	EQU	121                    
level	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 
		db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4
		db	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 2, 1, 1, 1, 1, 1, 1, 1 
		db	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 3, 0, 0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1 
		db	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 2, 0, 0, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 3, 2, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1 
		db	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1 
		db	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1

chars	db	' ',		' ',		' ',		'o',		179,		48
colors	db  00110000b,	00100000b,	01100000b,	00111110b,	00111111b,	00111111b
;			0 sky,		1 grass,	2 wall, 	3 coin,		4 flagpole,	5 flag  

entityX		dw	20,	65, 100 
entityY	 	db	19,	19, 22
entityDir	db	0,	0
entityCount	db	3                              
                              
curPage		db	0
                               
row			db	0
column		db	0

playerX		dw	10
playerY		db	18    
               
coinsCollected		db	0
maxCoins			db	10
               
fallState			db 0                           
                     
coinsStr			db "Coins:$"                               
levelCompletedStr	db "Level completed!$"                               
levelFailedStr		db "Level failed$"
                               	                                                 
		.CODE  
		
	processKeys proc	 
		mov		ah, 01h 
		int		16h
		jnz		processKey
		ret         				      
	 
processKey:	   
		mov		ah, 00h 
		int		16h
		           
		cmp		al, 'd'
		je		goRight
		
		cmp		al, 'a'
		je		goLeft		
		
		cmp		al, ' '
		je		jump           
		           
		cmp		al, 27
		je		quit			            
		ret	         
		
pRet:		    
		ret	
		
quit:	
		mov	ah,08h 
		int 21h 
		mov	ax,0003h 
		int 	10h 	            
		mov		ah, 4Ch
		int		21h
jump:            
		mov		bh, playerY
		add		bh, 2
		mov		dx, playerX
		call	isBlockEmpty
		je		pRet
  
  		mov		cx, 4
  		mov		bh, playerY
  		
  		jumpLoop:	
			dec		bh
			call	isBlockEmpty
			jne		pRet   
			dec		playerY
			loop	jumpLoop
				               
		ret				            
           
goLeft:                 
		mov		ax, offsetX
		cmp		playerX, ax
		jle		pkRet		    
		                
		mov		bh, playerY
		mov		dx, playerX
		dec		dx
		call	isBlockEmpty
		jne		pkRet
		
		inc		bh
		call	isBlockEmpty
		jne		pkRet		                
		                  
		mov		ax, offsetX
		add		ax, 40		                  
		cmp		playerX, ax
		jg		movePlayerLeft
		
		cmp		offsetX, 0
		jle		movePlayerLeft
		
		dec		offsetX  
		dec		playerX
		ret		               
		               
movePlayerLeft:		                
		dec		playerX
		ret           
           
goRight:              
		mov		ax, offsetX
		add		ax, 79
		cmp		playerX, ax
		jge		pkRet
                        
		mov		bh, playerY
		mov		dx, playerX
		inc		dx
		call	isBlockEmpty
		jne		pkRet
		
		inc		bh
		call	isBlockEmpty
		jne		pkRet
                              
		mov		ax, offsetX
		add		ax, 40                              
		cmp		playerX, ax
		jl		movePlayerRight   
		
		mov		ax, offsetX
		add		ax, 80
		cmp		ax, width
		jge		movePlayerRight
		
		inc		offsetX       
		inc		playerX
		ret                     
                      
movePlayerRight:                        
		inc		playerX
		ret   
		

		
pkRet:		    
		ret	               	             
endp	processKeys	

	render proc
		mov		ah, 0
		mov		al, curPage
		inc		ax        
		mov		bh, 4
		div		bh
		mov		curPage, ah
		
		mov		ah, 01h
		mov		ch, 00010000b   
		int		10h				           
	             
		mov		cx, 25
		mov	 	row, 0
		
		rowLoop:       
				push	cx
				mov		cx, 80
				mov		column, 0
								           
				colLoop:       
					mov		al, ' '
					mov		dh, row
					mov		dl, column   
					call	drawChar
					           
					inc		column					           
					loop	colLoop
		                
		        pop		cx      
		        inc		row
				loop	rowLoop				                    		                    
		                    
		mov		al, 1
		mov		bl, 00000000b
		mov		dx, playerX
		mov		bh, playerY
		call	drawOnMap
		
		mov		al, 186
		inc		bh
		call	drawOnMap 					
		                    
		mov		ch, 0		                    
		mov		cl, entityCount		                   
		mov		al, 15
		mov		si, 0		 
		  
		drawEntity:            
				mov		bx, si
				mov		dx, entityX[si + bx]
				mov		bh, entityY[si]    
				mov		bl, 00000100b 
				call	drawOnMap						               
		          
				inc		si		             
		loop	drawEntity					
		                   
		lea		si, coinsStr
		mov		dh, 0
		mov		dl, 0
		mov		bl, 00001110b
		call	drawString			          

		inc		dl		                       
		mov		al, 'o'
		mov		bl, 00001110b
		mov		ch, 0
		mov		cl, coinsCollected         
		jcxz	endDrawCollectedCoins
		
		drawCollectedCoins:     
				call	drawChar
				inc		dl
		loop	drawCollectedCoins
		endDrawCollectedCoins:		 	                    
		
		mov		cl, maxCoins
		sub		cl, coinsCollected
		mov		bl, 00000000b
		jcxz	endDrawRemainingCoins		           
		           
		drawRemainingCoins:
				call	drawChar
				inc		dl      				             				             
		loop	drawRemainingCoins
		endDrawRemainingCoins: 				
				                       
		mov		al, curPage
		mov		ah, 5h	
		int		10h							
	             
	    ret
endp	render 

	processWorld proc				         
		mov		ch, 0			                       
		mov		cl, entityCount
		mov		si, 0
		moveEntityLoop:
				call	moveEntity
				inc		si				
		loop	moveEntityLoop

		mov		dx, playerX
		mov		bh, playerY
		call	collectCoin
		call	checkLevelCompleted 
		call	checkLevelFailed
		inc		bh
		call	collectCoin
		call	checkLevelCompleted
		call	checkLevelFailed

		mov		dx, playerX			                        
		mov		bh, playerY			                        
		add		bh, 2  
		call	isBlockEmpty		           
		jne		onGround
		
		cmp		fallState, 2
		jne		nextFallState                                              
		inc		playerY	               
		mov		fallState, 0
		ret	          
		
nextFallState:
		inc		fallState
		ret                      		
		          
onGround:	                
	                
		ret	                	                	
endp	processWorld
		
start:    
		mov		ah, 0h 
		mov		al, 03h 
		int		10h    
		
		mov		ax, @data
		mov		ds, ax
		push	ds
		pop		es            
                
lp:
		call	processKeys                       
		call	render		                  
		call	processWorld   
		
		mov	ah, 86h  
		mov	cx, 0000h
		mov	dx, 208Dh 
		int	15h 
		          
		jmp		lp	              
		
		mov	ah,08h 
		int 21h 
		mov	ax,0003h 
		int 	10h               
		mov		ah, 4Ch 
		int		21h    
		

           
	drawOnMap	proc	
		push	dx
	
	    sub		dx, offsetX
	    cmp		dx, 0
	    jl		endDrawOnMap
	    cmp		dx, 79
	    jg		endDrawOnMap
	    
	    mov		dh, bh
	    call	drawChar
	       
endDrawOnMap:	        
		pop		dx	             
		ret	             
endp	drawOnMap           
               
	drawChar	proc	
		push	dx
		push	cx  
		push	bx
		push	ax
		push	bx
		push	ax
		
		mov		bh, curPage
		mov		ah, 02h
		int		10h   

		mov		bh, dh
		mov		dh, 0
		add		dx, offsetX						     				            		             
		call	getBlock		
		
		pop		ax
		pop		cx
		and		cl, 00001111b
		mov		bh, 0		
		
		cmp		chars[bx], ' '		                 
		je		noBackgroundChar
		mov		al, chars[bx]				          
		mov		cl, 0		                 
						                 
		noBackgroundChar:
					                
		mov		bl, colors[bx] 
		or		bl, cl
		mov		bh, curPage
		mov		ah, 09h		
		mov		cx, 1    
		int		10h

		pop		ax					
		pop		bx							 			    	
		pop		cx
		pop		dx			            	            
	 	ret	           
endp	drawChar 

	drawString	proc		
		push	ax		       
		                           
drawStringLoop:
		cmp		byte ptr [si], '$'
		je		endDrawString
	
		mov		al, [si]
		call	drawChar
		inc		dl
		inc		si

		jmp		drawStringLoop
				
endDrawString:
		pop		ax             
		ret	              
endp	drawString    

	setBlock		proc	
		push	bx
		push	ax
	        
		mov		al, bl	        
		call	getBlockOffset                        
		mov		level[bx], al
	        
		pop		ax	        
		pop		bx	           	
		ret	            
endp	setBlock
               
	getBlock	proc		
		push	ax
		push	bx
	
	  	call	getBlockOffset
		mov		bl, level[bx]   

		pop		ax
		mov		bh, ah
		pop		ax			                       	
		ret
endp	getBlock      

	getBlockOffset	proc	
		push	ax        
		push	dx
	
	  	mov		ah, 0				 	     
		mov		al, bh
		mov		bx, width
		mul		bx   
		pop		dx 
		mov		bx, dx
		add		bx, ax  	
		    		
		pop		ax			                       	              
		ret	            
endp	getBlockOffset
	                                                       
                  
	isBlockEmpty proc		 
		call	getBlock
		cmp		bl, 0
		je 		blockIsEmpty
		                     
		cmp		bl, 3
		je		blockIsEmpty

		cmp		bl, 4
		je		blockIsEmpty  
		
		cmp		bl, 5
		je		blockIsEmpty
		                     
		ret		                
blockIsEmpty:						
		ret	
endp	isBlockEmpty                  
                            

               
	collectCoin	proc			
		push	bx
	
		call	getBlockOffset
		cmp		level[bx], 3
		jne		notCoin
		
		mov		level[bx], 0
		inc		coinsCollected
				
notCoin:
	
		pop		bx		
		ret	
endp	collectCoin               
             
checkLevelCompleted		proc	
		push	bx
	
		call	getBlock
		cmp		bl, 4
		je		levelCompleted 
		cmp		bl, 5
		je		levelCompleted                         
		jmp		levelNotCompleted
                         
levelCompleted:                         
		lea		si, levelCompletedStr[0]
		mov		dh, 5
		mov		dl, 30
		mov		bl, 00000000b
		call	drawString                   
		
		mov	ah,08h 
		int 21h 
		mov	ax,0003h 
		int 	10h               
		mov		ah, 4Ch
		int		21h			
			  
levelNotCompleted:			      
		pop		bx
		ret			      
endp	checkLevelCompleted	             
             
checkLevelFailed	proc		
		push	bx
		push	cx  
		push	si
	                            
		cmp		bh, 24
		jge		levelFailed	                            
	                            
		mov		ch, 0
		mov		cl, entityCount
		jcxz	levelNotFailed
		mov		si, 0 		                
		                
		checkEntityCollision:
				push	bx
				mov		bx, si   
				cmp		dx, entityX[bx + si]        
				pop		bx
				jne		endCheckEntityCollision		       
				       				       
				cmp		bh, entityY[si]
				je		levelFailed					  
				         
		  		endCheckEntityCollision:
		  		inc		si
		loop	checkEntityCollision  
		jmp		levelNotFailed

levelFailed:
		lea		si, levelFailedStr[0]
		mov		dh, 5
		mov		dl, 30
		mov		bl, 00000000b
		call	drawString                   
		
		mov	ah,08h 
		int 21h 
		mov	ax,0003h 
		int 	10h               
		mov		ah, 4Ch
		int		21h					     
		
		pop		si
		pop		cx
		pop		bx    
		ret
			                    	
levelNotFailed:
		pop		si
		pop		cx
		pop		bx 
		ret	                    	
endp	checkLevelFailed             
                        
moveEntity	proc			
		push	bx
		push	dx
	
		mov		bx, si
		mov		dx, entityX[bx + si]
		mov		bh, entityY[si]				       
		inc		bh
    	call	isBlockEmpty
    	jne		endEntityFall
    	inc		entityY[si]
   	
endEntityFall:
		cmp		entityDir[si], 0
		je		tryMoveEntityRight
		
tryMoveEntityLeft:
		dec		bh
		dec		dx
		cmp		dx, 0
		jle		swapDirection
		call	isBlockEmpty
		jne		swapDirection
		
		mov		bx, si
		dec		entityX[bx + si]
		jmp		endMoveEntity

tryMoveEntityRight:  
		dec		bh
		inc		dx 
		cmp		dx, width
		jge		swapDirection
		call	isBlockEmpty
		jne		swapDirection
	
		mov		bx, si
		inc		entityX[bx + si]		
		jmp		endMoveEntity
		
swapDirection:
		xor		entityDir[si], 1

endMoveEntity:						
		pop		dx
		pop		bx
		ret	              
endp	moveEntity                        
                        

          
end		start
