.model small
.stack 100h
.data          
   msg db 'Hello world$',   ; Original message with '$' marking the end
   strlen equ $ - msg           ; Calculate string length (excluding the '$')
   reversed db 12 DUP('$')      ; Space to store the reversed string

.code
main proc
    mov ax, @data
    mov ds, ax                  ; Initialize data segment

    ; Display the original string
    mov dx, OFFSET msg          ; Load address of msg
    mov ah, 09h                 ; DOS interrupt 21h for string display
    int 21h

    ; Initialize SI for pushing characters onto stack
    lea si, msg                 ; Load address of the original string into SI
    mov cx, strlen              ; Store the length of the string into CX
    
    ; Adjust CX to length - 1 because strlen includes the '$' marker
    dec cx

push_loop:
    mov al, [si]                ; Load character from the original string
    push ax                     ; Push character onto stack
    inc si                      ; Move to the next character
    loop push_loop              ; Repeat until all characters are pushed

    ; Display a newline
    mov ah, 02h
    mov dl, 13                  ; Carriage return (CR)
    int 21h
    mov dl, 10                  ; Line feed (LF)
    int 21h

    ; Popping characters from the stack to display the reversed string
    mov cx, strlen              ; Restore CX to the original length
    dec cx                      ; Adjust for the loop

pop_loop:
    pop ax                      ; Pop the character from the stack
    mov dl, al                  ; Transfer character to DL for display
    mov ah, 02h                 ; DOS interrupt 21h to display a single character
    int 21h
    loop pop_loop               ; Repeat until all characters are displayed

    ; End the program
    mov ah, 4Ch                 ; DOS interrupt 21h for program termination
    int 21h

main endp
end main