OBJECTS = loader.o kernel.o

GCCPARAMS = -m32 -fno-use-cxa-atexit -fleading-underscore -fno-exceptions -fno-builtin -nostdlib -fno-rtti -fno-pie

ASPARAMS = --32

LDPARAMS = -melf_i386 -no-pie


%.o: %.cpp
	g++ $(GCCPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASPARAMS) -o $@ $<

mykernel.bin: linker.ld $(OBJECTS)
	ld $(LDPARAMS) -T linker.ld -o $@ $(OBJECTS)

install: mykernel.bin
	cp $< boot/mykernel.bin


clean:
	rm -rf *.bin *.o


