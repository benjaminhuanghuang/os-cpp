void printf(char *str)
{
  unsigned short *videoMemory = (unsigned short *)0xb8000;

  for (int i = 0; str[i] != '\n'; i++)
  {
    videoMemory[i] = (videoMemory[i] & 0xFF00) | str[i];
  }
}

extern "C" void kernelMain(const void *multiboot_structure, unsigned int /*multiboot_magic*/)
{
  printf("hello world");
  while (1)
    ;
}