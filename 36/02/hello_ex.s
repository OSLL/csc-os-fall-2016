.data                                                                          
hello_str:                  
        .asciz "Hello, "
        len_hello = . - hello_str - 1
hello_first:
	.asciz "Enter your name: "
	len_first = . - hello_first - 1
.bss
.lcomm  buff, 32
.text
.global  main
.macro write str size
// syscall write
        movl    $4, %eax     
// stdout - 1
        movl    $1, %ebx         
        movl    \str, %ecx 
        movl    \size, %edx
	int   $0x80
.endm
main:
//greatings
	write $hello_first $len_first
//read	
	movl  $3, %eax
	movl  $0, %ebx
	movl  $buff, %ecx
	movl  $32, %edx
	int   $0x80
	pushl %eax
//write hello
	write $hello_str $len_hello
	movl  $4, %eax
	movl  $1, %ebx
	movl  $buff, %ecx
	movl  $32, %edx
	int   $0x80
	popl  %edx
// syscall exit
        movl    $1, %eax  
// exit code
        movl    $0, %ebx     
// do syscall 
        int     $0x80         
