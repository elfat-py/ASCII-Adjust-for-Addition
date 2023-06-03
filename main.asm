section .data
    number1 db '4'  ; ASCII digit 4
    number2 db '7'  ; ASCII digit 7
    result db 0     ; Variable to store the result

section .text
    global _start

_start:
    ; Step II: Load number 1 in AL
    mov al, byte [number1]

    ; Step III: Load number 2 in BL
    mov bl, byte [number2]

    ; Step IV: Mask the number 1 and store result in AL
    and al, 0Fh

    ; Step V: Mask number 2 and store result in BL
    and bl, 0Fh

    ; Step VI: Add = number 1 + number 2
    add al, bl

    ; Step VII: Check if addition < 9
    cmp al, 9
    jbe valid_result  ; Jump if below or equal to 9

    ; Step VIII: Add 6 to make the result valid
    add al, 6

valid_result:
    ; Step IX: Display the result
    add al, 30h     ; Convert the result to ASCII character
    mov [result], al

    ; Output the result to the console
    mov edx, 1      ; File descriptor for stdout
    mov ecx, result ; Pointer to the result
    mov ebx, 1      ; Length of the string to be printed
    mov eax, 4      ; System call number for write
    int 0x80        ; Call the kernel

    ; Exit the program
    mov eax, 1      ; System call number for exit
    xor ebx, ebx    ; Exit status 0
    int 0x80        ; Call the kernel
