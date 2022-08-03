OBJECTS = loader.o kernel.o gdt.o

GCCPARAMS = -m32 -fno-use-cxa-atexit -fleading-underscore -fno-exceptions -fno-builtin -nostdlib -fno-rtti -fno-pie

ASPARAMS = --32

LDPARAMS = -melf_i386 -no-pie


%.o: %.cpp
	g++ $(GCCPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASPARAMS) -o $@ $<

mykernel.bin: linker.ld $(OBJECTS)
	ld $(LDPARAMS) -T linker.ld -o $@ $(OBJECTS)

mykernel.iso: mykernel.bin
	mkdir iso
	mkdir iso/boot
	mkdir iso/boot/grub
	cp $< iso/boot/
	echo 'set timeout=0' > iso/boot/grub/grub.cfg
	echo 'set default=0' >> iso/boot/grub/grub.cfg
	echo '' >> iso/boot/grub/grub.cfg
	echo 'menuentry "my os" {' >> iso/boot/grub/grub.cfg
	echo '  multiboot /boot/mykernel.bin' >> iso/boot/grub/grub.cfg
	echo '  boot' >> iso/boot/grub/grub.cfg
	echo '}' >> iso/boot/grub/grub.cfg
	grub-mkrescue /usr/lib/grub/i386-pc -o mykernel.iso iso
	rm -rf iso

run: mykernel.iso
	qemu-system-i386 -cdrom mykernel.iso -boot d

clean:
	rm -rf *.bin *.o iso


