
cpp 代码需要 stack来执行

因此需要 loader.s 来设置stack
```
loader.s  -> loader.o  
                       --->  kernel.bin
kernel.cpp -> kernel.o
```