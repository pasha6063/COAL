;stack
.model small
.stack 100h
.data
.code
    main proc
        
        mov ax,0xAF16
        mov bx,0xAF50
        
        push ax
        push bx  
        
        pop ax
        pop bx
        
        
        mov ah,4ch 
        int 21h
    main endp
    end main