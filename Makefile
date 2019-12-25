# This file is part of Jacqueline: an experimental i386 bootable application
# Copyright (C) 2020 Dani Rodríguez <dani@danirod.es>
#
# Makefile - life is too short for running commands manually

UNITS = kernel.ppu
OBJECTS = kernel.o main.o

CC=i386-elf-gcc
LD=i386-elf-ld
PPC=fpc
PPCFLAGS=-Tlinux -Pi386 -O3

.PHONY: qemu clean

%.o: %.pas
	$(PPC) $(PPCFLAGS) $<

kernel.elf: kernel.ld $(OBJECTS)
	$(LD) -T kernel.ld $(OBJECTS)

qemu: kernel.elf
	qemu-system-i386 -kernel kernel.elf

clean:
	rm -rf kernel.elf $(UNITS) $(OBJECTS)
