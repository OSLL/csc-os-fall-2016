build:
	as --32 -o 2nd_ex_hello.o 2nd_ex_hello.s
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o 2nd_ex_hello -e main 2nd_ex_hello.o /lib/i386-linux-gnu/libc.so.6

clean:
	rm -f 2nd_ex_hello 2nd_ex_hello.o