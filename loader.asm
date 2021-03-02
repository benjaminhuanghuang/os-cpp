.section .text
.extern kernelMain
.extern callConstructors
.global loader

loader:
  mov $kernel_stack, %esp
  call callConstructors
  push %eax
  push %ebx
  call kernelMain

_stop:
  cli
  hlt
  jmp _stop


.section .bss
.space 2*1024*1024   # 2M
kernel_stack:

