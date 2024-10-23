display macro var1, var2
    lea dx, var1     
    mov ah, 9       
    int 21h         

    call nextline   

    lea dx, var2    
    mov ah, 9        
    int 21h          
endm                 

.model small
.stack 100h

.data 
var1 db "hello$"     
var2 db "World$"     

.code

main proc 
    mov ax, @data     
    mov ds, ax 

    display var1, var2

    mov ah, 4ch       
    int 21h    
main endp

nextline proc
    mov dx, 10       
    mov ah, 2
    int 21h          

    mov dx, 13       
    mov ah, 2
    int 21h          
    ret              
nextline endp

end main