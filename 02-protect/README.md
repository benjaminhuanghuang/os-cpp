

![](./gdt.png)

![](./gdt-2.png)



## C++ 嵌入汇编
```
  asm volatile("lgdt (%0)" : : "p"(((uint8_t *)i) + 2));
```