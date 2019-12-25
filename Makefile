# This file is part of Jacqueline: an experimental i386 bootable application
# Copyright (C) 2020 Dani Rodríguez <dani@danirod.es>
#
# Makefile - life is too short for running commands manually

OBJECTS = main.o

CC=i386-elf-gcc
LD=i386-elf-ld

.PHONY: qemu clean

kernel.elf: kernel.ld $(OBJECTS)
	$(LD) -T kernel.ld $(OBJECTS)

qemu: kernel.elf
	qemu-system-i386 -kernel kernel.elf

clean:
	rm -rf kernel.elf $(OBJECTS)
