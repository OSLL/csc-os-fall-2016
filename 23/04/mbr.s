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

print_char:
    lodsb
    cmpb   $0x0, %al
    je     loop
    movb   $0x0E, %ah
    int    $0x10
    jmp    print_char

loop:
    jmp loop

