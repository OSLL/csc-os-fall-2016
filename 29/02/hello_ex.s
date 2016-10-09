.data                                                                          
 
        enter_name:
                .asciz "Enter your name:\n"
                enter_length = . - enter_name - 1
        line_break:
                .asciz "!\n"
                break_length = . - line_break - 1
        hello_str:                  
                .asciz "Hello, "
                length = . - hello_str - 1
        name_pattern:
                .asciz "%s"
                name_length = 512
        name_buf:
                .space 512        

.text
        .global _start
	
welcome:
        movq    $1, %rax
        movq    $1, %rdi
        movq    $enter_name, %rsi
        movq    $enter_length, %rdx
        syscall
        ret

print_hello:
        movq    $1, %rax         
        movq    $1, %rdi     
        movq    $hello_str, %rsi
        movq    $length, %rdx   
        syscall
        ret 

print_name:
        movq    $1, %rax
        movq    $1, %rdi
        movq    $name_buf, %rsi
        movq    $name_length, %rdx
        syscall
        ret

_start:
        callq   welcome
        
        movq    $name_pattern, %rdi
        movq    $name_buf, %rsi
        callq   scanf

	callq   print_hello
	callq   print_name

        movq    $name_pattern, %rdi
        movq    $line_break, %rsi
        callq   printf # just for fun

        movq    $60, %rax  
        movq    $0, %rdi     
        syscall
