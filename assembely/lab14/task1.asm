;https://github.com/pasha6063
TITLE Sum of Squares (SimpleSumSquares.asm)

; Program to calculate the sum of squares of first n natural numbers
; Demonstrates `loopnz`, `shl`, and `movsx`

INCLUDE Irvine32.inc

.data
n DWORD 5          ; Number of natural numbers
sum DWORD 0        ; Store the result
msg BYTE "Sum of squares: ", 0

.code
main PROC
    mov ecx, n          ; Set loop counter to n
    mov eax, 0          ; Clear sum accumulator
    mov ebx, 1          ; Start with the first number

calculate:
    mov edx, ebx        ; Copy current number
    shl edx, 1          ; Multiply by 2
    imul edx, ebx       ; Calculate square (n * n)
    add eax, edx        ; Add square to sum
    inc ebx             ; Increment number
    loopnz calculate    ; Repeat for next number

    mov sum, eax        ; Store result in sum

    lea edx, msg        ; Load message
    call WriteString    ; Display message
    mov eax, sum        ; Load result
    call WriteDec       ; Display sum
    call Crlf           ; New line

    exit
main ENDP

END main
