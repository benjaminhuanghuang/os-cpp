void printf(char * str){
  unsigned short*videoMem = (unsigned short*) 0xb8000;
  for(int i=0; str[i]; i++){
    videoMem[i]= (videoMem[i] & 0xFF00) | str[i];
  }
}


void kernelMain(){

  while(1);
}