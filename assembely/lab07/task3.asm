.stack 100h
.model small
.data
    array db 5, 20, 7, 25, 15, 30   ; Array of integers
    largest db 0                    ; To store the largest number
    msg db 'Largest number: $'      ; Message to display the result

.code
main proc
    mov ax, @data                   ; Initialize the data segment
    mov ds, ax

    mov bx, offset array            ; Load the address of the array into BX
    mov cx, 6                       ; Set loop counter (size of the array)

    ; Initialize the largest number with the first element of the array
    mov al, [bx]                    ; Load the first element of the array into AL
    mov [largest], al               ; Store it in the 'largest' variable

    inc bx                          ; Point to the next element in the array
    dec cx                          ; Decrease loop counter (we already processed one element)

compare_loop:
    mov al, [bx]                    ; Load the current array element into AL
    
    cmp al, [largest]               ; Compare AL with current largest
    jle skip_update                 ; If AL <= largest, skip update

    mov [largest], al               ; Update largest with the new value if AL is greater

skip_update:
    inc bx                          ; Point to the next element in the array
    loop compare_loop               ; Decrement CX and loop if CX != 0

    ; Now that we have the largest number, display the result

    ; Print the message "Largest number: "
    mov ah, 09h                     ; Function to display a string
    lea dx, msg                     ; Load the address of the message
    int 21h                         ; Display the message

    ; Convert the largest number to ASCII and display it
    mov al, [largest]               ; Load the largest number into AL
    add al, 30h                     ; Convert it to ASCII (0-9 range)
    mov dl, al                      ; Move the ASCII character to DL for display

    ; Display the largest number
    mov ah, 02h                     ; Function to display a character
    int 21h                         ; Print the character in DL

    ; End the program
    mov ah, 4Ch                     ; Function to exit the program
    int 21h                         ; Call DOS interrupt to terminate

main endp
end main
