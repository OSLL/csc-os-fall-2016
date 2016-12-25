build:
	as hello_ex.s -o hello_ex.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc hello_ex.o -o hello_ex
	chmod +x hello_ex
clean:
	find . -type f -not -name 'Makefile' -not -name 'hello_ex.s' -print0 | xargs -0 rm --
