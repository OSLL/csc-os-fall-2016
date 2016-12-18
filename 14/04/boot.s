.code16

.data
  .word   0xAA55

.text
  
  greetings: 
    .asciz  "Hello, World!"
  
  .globl _start

_start:

  movw    $greetings, %si
  movw    $0xB800, %bx
  movw    $0x07C0, %dx
  movw    $0x0, %di
  movb    $0x07, %ah

write_char:
  
  movb    (%si), %al
  inc     %si

  orb $0x00, %al
  jz infinite_loop

  movw    %bx, %es
  stosw

  jmp     write_char

infinite_loop: jmp infinite_loop
