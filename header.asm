.set MAGIC,		0xE85250D6
.set ARCH,		0
.set LENGTH,	(multiboot_header_end - multiboot_header)
.set CHECKSUM,	-(MAGIC + ARCH + LENGTH)

# Store the contents of the Multiboot header at the beginning of the file.
.section .multiboot
multiboot_header:
	.long MAGIC
	.long ARCH
	.long LENGTH
	.long CHECKSUM
	.short 0
	.short 0
	.long 8
multiboot_header_end:






