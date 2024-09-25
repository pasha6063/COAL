.model small 
.stack 100h  
.data
    var1 DB 23 
    var2 DB 65 
.code
    main proc
        
        mov ax, @data
        mov ds, ax

       
        mov al, var1  
        mov bl, var2  
        
        ; Swap the values
        mov var1, bl  
        mov var2, al

        
        mov ah, 4Ch   
        int 21h

    main endp
end main
