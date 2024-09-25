.MODEL SMALL
.STACK 100h

.DATA
    ARR DB 1, 2, 3, 4 ; Declare array of 4 numbers
    MSG DB 'The sum is: $'

.CODE
MAIN PROC
    MOV AX, @DATA     ; Set DS segment register
    MOV DS, AX

    ; Add elements of array
    MOV AL, 0         ; Initialize sum to 0
    ADD AL, ARR[0]    ; Add element 1
    ADD AL, ARR[1]    ; Add element 2
    ADD AL, ARR[2]    ; Add element 3
    ADD AL, ARR[3]    ; Add element 4

    ; Display result
    MOV AH, 9          ; Display a string
    MOV DX, OFFSET MSG ; Message address
    INT 21h             ; Print message

    MOV AH, 2          ; Display a character
    ADD AL, '0'        ; Convert to ASCII
    INT 21h             ; Print character

    MOV AH, 4Ch         ; Exit program
    INT 21h             ; Exit

MAIN ENDP
END MAIN