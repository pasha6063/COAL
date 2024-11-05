.model small
.stack 100h

.data
    menu_msg db 'Please select an option:', 13, 10, '1. Addition', 13, 10, '2. Subtraction', 13, 10, '3. Division', 13, 10, '$'
    prompt_option db 'Enter your choice: $'
    prompt_num1 db 'Enter number 1: $'
    prompt_num2 db 'Enter number 2: $'
    result_msg db 'The result is: $'
    error_msg db 'Invalid option selected!$'

    num1 db ?
    num2 db ?
    result db ?

.code
    main proc
        ; Initialize data segment
        mov ax, @data
        mov ds, ax

        ; Display menu
        lea dx, menu_msg
        call display_string
        call newline

        ; Prompt for option
        lea dx, prompt_option
        call display_string
        mov ah, 1
        int 21h 
        
        sub al, '0'             
        mov bl, al              

        ; Prompt user for the first number
        call newline
        lea dx, prompt_num1
        call display_string
        call read_integer
        mov num1, al            ; Store first number

        ; Prompt user for the second number
        call newline
        lea dx, prompt_num2
        call display_string
        call read_integer
        mov num2, al            ; Store second number

        ; Process the option
        call newline
        cmp bl, 1
        je addition
        cmp bl, 2
        je subtraction
        cmp bl, 3
        je division
        jmp invalid_option

    addition:
        ; Call addition procedure
        call add_numbers
        jmp display_result

    subtraction:
        ; Call subtraction procedure
        call subtract_numbers
        jmp display_result

    division:
        ; Call division procedure
        call divide_numbers
        jmp display_result

    invalid_option:
        ; Display error message for invalid option
        call newline
        lea dx, error_msg
        call display_string
        jmp exit

    display_result:
        ; Display the result
        call newline
        lea dx, result_msg
        call display_string
        call display_result_value
        jmp exit

    exit:
        mov ax, 4c00h           ; Exit program
        int 21h
    main endp

    ; Newline procedure
    newline proc
        mov dl, 13              ; Carriage return
        mov ah, 2               ; Function to display character
        int 21h

        mov dl, 10              ; Line feed
        mov ah, 2               ; Function to display character
        int 21h
        ret
    newline endp

    ; Display string procedure
    display_string proc
        ; Expects DX to contain address of the string
        mov ah, 09h
        int 21h
        ret
    display_string endp

    ; Read integer procedure
    read_integer proc
        ; Reads a single-digit decimal number from the user
        mov ah, 1
        int 21h
        sub al, '0'             
        ret
    read_integer endp

    ; Display result value
    display_result_value proc
        mov al, result          
        add al, '0'            
        mov dl, al
        mov ah, 02h
        int 21h
        ret
    display_result_value endp

    ; Addition procedure
    add_numbers proc
        mov al, num1
        add al, num2
        mov result, al
        ret
    add_numbers endp

    ; Subtraction procedure
    subtract_numbers proc
        mov al, num1
        sub al, num2
        mov result, al
        ret
    subtract_numbers endp

    ; Division procedure
    divide_numbers proc
        mov al, num1
        mov ah, 0               ; Clear AH for division
        div num2                ; Divide AL by num2
        mov result, al
        ret
    divide_numbers endp

end main