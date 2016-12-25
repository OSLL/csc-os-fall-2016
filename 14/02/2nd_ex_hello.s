.code32

.data

name_asking:
	.asciz "Your name, please\n"

input:
	.space 128

input_format:
	.asciz "%s"

hello_str:
	.asciz "Hello, "


.text
	
	.global main

main:
	# asking name
	movl	$4, %eax
	movl	$1, %ebx
	movl	$name_asking, %ecx
	movl	$18, %edx
	int 	$0x80

	# scanning name
	pushl $input
	pushl $input_format
	call scanf

	# writing hello
	movl	$4, %eax
	movl	$1, %ebx
	movl	$hello_str, %ecx
	movl	$7, %edx
	int 	$0x80

	# writing name
	movl	$4, %eax
	movl	$1, %ebx
	movl	$input, %ecx
	movl	$128, %edx
	int 	$0x80

	# system exit
	movl	$1, %eax
	movl 	$0, %ebx
	int 	$0x80
