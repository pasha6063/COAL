.model small
.stack 100h
.data
.code
        main proc 
            
            mov dl,'1'
        
        mov cx, 10   ;no of iteration of loop
        LABEL1:
            mov ah,2
            int 21h
        inc dl
        

         
 
        loop LABEL1 
        
         mov dl,10
        mov ah,2
        int 21h
        
        mov dl,13
        mov ah,2
        int 21h
        
        
        mov dl,'A'
        
        mov cx, 26   ;no of iteration of loop
        LABEL2:
            mov ah,2
            int 21h
        inc dl
        loop LABEL2

         mov ah,4ch
         int 21h
         
        
        loop LABEL2          

        main endp
end main