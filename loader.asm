global start
;extern kernel_main    ; in main64.asm


section .text
bits 64
;---------------------- entry
start:  
  ;mov esp, stack_top
  mov dword [0xb8000], 0x2f4b2f4f

  hlt


section .bss  ; statically allocated variables
stack_bottm:
  resb 4096 * 4
stack_top: