CPPPARAMS = -m32
NASMPARAMS = --32
LDPARAMS = -melf_i386



objects = header.o loader.o #kernel.o

%.o : %.cpp
	g++ $*.cpp -o $*.o

%.o : %.asm
	nasm -f elf64 $*.asm -o $*.o

os: linker.ld $(objects)
	ld -n -o os.bin -T $< $(objects)

install: os.bin
	cp $< iso/boot/os.bin && \
	grub-mkrescue /usr/lib/grub/i386-pc -o os.iso iso

run:
	qemu-system-x86_64 -cdrom os.iso


env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

clean:
	rm -rf *.o
	rm -rf *.bin