/*
This file is part of Jacqueline: an experimental i386 bootable application
Copyright (C) 2020 Dani Rodríguez <dani@danirod.es>

kernel.ld - this is the linkerscript used by the GNU compiler
*/

/* This is defined in main.S. */
ENTRY(bootMain)

/* Output file information. */
OUTPUT(kernel.elf)
OUTPUT_FORMAT(elf32-i386)

/* Memory sections. */
SECTIONS {
	. = 0x00100000;

	.text : ALIGN(0x1000) {
		*(.text)
	}

	.data : ALIGN(0x1000) {
		*(.data)
	}

	.bss : ALIGN(0x1000) {
		*(.bss)
	}
}

