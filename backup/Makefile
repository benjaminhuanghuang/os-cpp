GCCPARAMS = -m32 -Iinclude -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore -Wno-write-strings
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = header.o loader.o kernel.o

%.o : %.cpp
	gcc $(GCCPARAMS) -c -o $@ $<

%.o : %.asm
	as $(ASPARAMS) $*.asm -o $*.o

kernel.bin: linker.ld $(objects)
	ld  $(LDPARAMS) -T linker.ld-o $@ $(objects)

iso: kernel.bin
	cp $< iso/boot/kernel.bin && \
	grub-mkrescue /usr/lib/grub/i386-pc -o os.iso iso

run:
	qemu-system-x86_64 -cdrom os.iso


env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

clean:
	rm -rf *.o
	rm -rf *.bin