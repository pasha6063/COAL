;https://github.com/pasha6063
TITLE  Grade Calculation Using IF-ELSE Directives (GradeCalc.asm)

; Program to determine the grade based on marks
; Uses IF-ELSE directives for grade assignment

INCLUDE Irvine32.inc

.data
Marks WORD ?
Grade BYTE ?

msgA BYTE "Grade: A", 0
msgB BYTE "Grade: B", 0
msgC BYTE "Grade: C", 0
msgF BYTE "Grade: F", 0

.code
main PROC

    ; Initialize Marks (example: Marks = 75)
    mov Marks, 75
    
    ; Call procedure to calculate grade
    call CalculateGrade

    ; Exit program
    exit
main ENDP

CalculateGrade PROC

    ; Check conditions and assign grade
    .IF Marks > 80
        mov Grade, 'A'
        lea edx, msgA
    .ELSEIF Marks > 70
        mov Grade, 'B'
        lea edx, msgB
    .ELSEIF Marks > 60
        mov Grade, 'C'
        lea edx, msgC
    .ELSE
        mov Grade, 'F'
        lea edx, msgF
    .ENDIF

    ; Display grade
    call WriteString
    call Crlf

    ret
CalculateGrade ENDP

END main