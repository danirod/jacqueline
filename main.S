/*
This file is part of Jacqueline: an experimental i386 bootable application
Copyright (C) 2020 Dani Rodríguez <dani@danirod.es>

main.S -- start here!  stuff that just has to be done in assembly
*/

.text

/* Multiboot magic numbers are required to be present at the binary head. */
#define MULTIBOOT_MAGIC_NUMBER 0x1BADB002
#define MULTIBOOT_FLAGS 0x00000003
#define MULTIBOOT_CHECKSUM -(MULTIBOOT_MAGIC_NUMBER + MULTIBOOT_FLAGS)
.align 4
bootHead: /* and another boot to her wimpy husband Hank */
.int MULTIBOOT_MAGIC_NUMBER
.int MULTIBOOT_FLAGS
.int MULTIBOOT_CHECKSUM

/* The binary ELF file loaded by the bootloader starts running code HERE. */
.global bootMain
bootMain:
	movl $0xb8000, %ebx
	xorl %esi, %esi
.bootLoop:
	movl %eax, (%esi, %ebx)
	addl $4, %esi
	cmpl $4000, %esi
	je bootPostMain
	addl $0x12341234, %eax
	jmp .bootLoop

/* Infinite loop once kmain is done. */
bootPostMain:
	cli
	hlt
	jmp bootPostMain

