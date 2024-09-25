.model small
.stack 100h
.data

arr db 1,2,3,4,5
.code
    main proc
    
    mov ax,@data
    mov ds, ax
    
    lea si,arr
    mov cx,5
    
    display_loop: 
    
        mov dl,[si]
        add dl,30h
        
        mov ah,2
        int 21h 
        
        inc si  
        
         
    loop display_loop    
        
    mov ah,4ch
    int 21h    


    main endp
end main