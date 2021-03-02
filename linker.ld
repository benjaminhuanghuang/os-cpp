ENTRY(start)

SECTIONS
{
	/* set current address */
	. = 1M;

	.boot :
	{
		*(.multiboot_header)
	}

	.text :
	{  
		*(.text)
	}
}