# Jacqueline

Jacqueline is an experimental bootloader written in Pascal (Free Pascal dialect)
written for the i386 architecture, **just because**. Note that, unlike
[NativeOS][1], I have no plans to further develop Jacqueline once the system
_compiles_ and I'm able to start the image using an emulator.

## Why Pascal?

Even while Pascal wasn't written with low-level programming in mind, it is
nonetheless possible to do low-level systems programming with the Free Pascal
dialect, as it supports features that are present in other low-level languages
such as C, C++ or even Rust in unsafe mode, such as:

* Pointers, using the `^` operator (such as `var intptr: ^integer`).
* Memory addresses, using the `@` operator (let `var foo: integer`, then
  `@foo` yields the memory address of `foo` as an `^integer`.
* Inline assembly interfacing, through the `asm` keyword, à la C. In fact,
  I find more intuitive to move data between registers and variables in
  Free Pascal than in GNU C.

Free Pascal is able to generate standard object files (*.o), encoded in popular
executable file formats such as PE and ELF, and thus, it is possible to make
object files written originally in diverse languages such as C, Pascal or
Assembly to interface each other.

## Setting up

### Requirements

* An i386-elf toolchain (required for compiling the Assembly code and linking
  the final kernel image).
* A Free Pascal distribution with 32 bit support (i.e., ppc386 is provided).
* BSD make or GNU make.
* QEMU to run the kernel.

### How to

`make qemu`


[1]: https://github.com/danirod/nativeos
