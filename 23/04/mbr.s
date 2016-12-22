.code16

.data
  .word    0xAA55

.text
  msg:
    .asciz  "Hello world!"

.global _start

_start:
    cli
    movw   $msg, %si
    movw   $0xB800, %bx
    movw   %bx, %es
    movw   $0x0, %di
    movb   $0x07, %ah # white

print_char:
    lodsb
    cmpb   $0x0, %al
    je     cleanup
    stosw
    jmp    print_char

cleanup:
    mov    $0x500, %cx
    movw   $0x20, %ax
    movw   %bx, %es
    rep    stosw

