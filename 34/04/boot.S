.code16

.text
.globl _start;

_start:
      jmp _boot           
      welcome: .asciz "Hello, World\n\r"

.writeStringIn:
	lodsb

	orb  %al, %al
	jz   .writeStringOut

	movw   %cx, %sp

  	and    $0x00FF, %ax
  	or     $0x5F00, %ax
  	push   %ax
  	add    $0x2, %cx
	jmp  .writeStringIn

.writeStringOut:
	ret

_boot:
    leaw  welcome, %si
	call .writeStringIn
	
	. = _start + 510
	.byte 0x55
	.byte 0xaa
