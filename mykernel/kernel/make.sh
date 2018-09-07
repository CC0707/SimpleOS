nasm -f elf -o build/print.o lib/print.S
nasm -f elf -o build/kernel.o kernel.S
gcc -m32 -I lib/ -c -fno-builtin -o build/interrupt.o interrupt.c
gcc -m32 -I lib/ -c -fno-builtin -o build/init.o init.c
gcc -m32 -I lib/ -c -fno-builtin -o build/timer.o timer.c
gcc -m32 -I lib/ -c -fno-builtin -o build/main.o main.c
ld -m elf_i386  -Ttext 0xc0001500 -e main -o build/kernel.bin build/main.o build/init.o build/interrupt.o build/print.o build/kernel.o build/timer.o

dd if=build/kernel.bin of=../../hd60M.img bs=512 count=200 seek=9 conv=notrunc
