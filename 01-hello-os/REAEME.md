# Hello OS

## multiboot
按照multiboot规范生成kernel.bin, 用GRUB引导

## C++
编译kernel.cpp时要禁止一些c++的缺省选项

注意c++编译器生成的函数名会有"_", 可以用 objdump 查看函数名
```
  objdump -d kernel.o    
```

## 安装kernel
```
  vim /boot/gurb/grub.cfg

  menuentry "myos" {
    multiboot /boot/mykernel.bin
    boot
  }

  cp mykernel.bin /boot/mykernel.bin
```

## Make iso image with grub
```
apt-get install -y xorriso
apt-get install -y grub-pc-bin
apt-get install -y grub-common

grub-mkrescue /usr/lib/grub/i386-pc -o mykernel.iso iso
```


## Boot from image
```
  qemu-system-i386 -cdrom mykernel.iso -boot d
```


