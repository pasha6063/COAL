; display result on screen
.model small     ; 64kb for data and 64 kb for code
.stack 100h
.data
var1 DB 1    ;creation of var 1
var2 DB 2    ;creation of var 2
var3 DB 3    ;creation of var 3
result DB 0
.code
       main proc 
	    
		  mov ax, @data    ; get the reference of data segment
          mov ds, ax
		  
		  mov al,var1      ;store var 1 in al register
		  
		  mov bl,var2       ;store var 2 in bl register
		  
		  mov cl,var3       ;store var 3 in cl register
		  
		  add al,bl         ; add al and bl 
		  add al,cl
	
          add al,48         ; convert ascii  to decimal
          mov dl,al
		  
		  mov ah,2         ; to print the result
		  int 21h
		  
		  mov result,al
		  
		  mov ah,4ch
		  int 21h
       main endp
end main    


