#! /bin/bash
SHELL = /bin/bash
BUILD_DIR = ./build
ENTRY_POINT = 0xc0001500
AS = nasm
CC = gcc
LD = ld
LIB = -I lib/
ASFLAGS = -f elf
CFLAGS = -Wall $(LIB) -c -m32 -fno-builtin -W -Wstrict-prototypes -Wmissing-prototypes
LDFLAGS = -m elf_i386 -Ttext $(ENTRY_POINT) -e main -Map $(BUILD_DIR)/kernel.map
OBJS =  $(BUILD_DIR)/main.o\
	$(BUILD_DIR)/init.o\
	$(BUILD_DIR)/interrupt.o\
	$(BUILD_DIR)/timer.o\
	$(BUILD_DIR)/kernel.o\
	$(BUILD_DIR)/print.o\
	$(BUILD_DIR)/debug.o\
	$(BUILD_DIR)/string.o\
	$(BUILD_DIR)/bitmap.o\
	$(BUILD_DIR)/memory.o
	
############
$(BUILD_DIR)/main.o: main.c lib/print.h lib/stdint.h init.h debug.h
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/init.o: init.c init.h lib/print.h lib/stdint.h interrupt.h timer.h memory.h bitmap.h
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/interrupt.o: interrupt.c  interrupt.h lib/print.h lib/stdint.h global.h io.h
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/timer.o: timer.c timer.h lib/print.h lib/stdint.h io.h 
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/debug.o: debug.c lib/print.h lib/stdint.h debug.h  interrupt.h
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/string.o:lib/string.c lib/print.h lib/stdint.h debug.h  global.h lib/string.h
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/bitmap.o:bitmap.c bitmap.h lib/print.h lib/stdint.h lib/string.h interrupt.h debug.h global.h
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/memory.o:memory.c memory.h lib/print.h lib/stdint.h lib/string.h bitmap.h global.h
	$(CC) $(CFLAGS) $< -o $@
####################################################################
$(BUILD_DIR)/kernel.o: kernel.S
	$(AS) $(ASFLAGS) $< -o $@
$(BUILD_DIR)/print.o: lib/print.S
	$(AS) $(ASFLAGS) $< -o $@

$(BUILD_DIR)/kernel.bin: $(OBJS)
	$(LD) $(LDFLAGS) $^ -o $@

.PHONY: mk_dir hd clean all
mk_dir:
	if [[ ! -d $(BUILD_DIR) ]];then mkdir $(BUILD_DIR);fi
hd:
	dd if=$(BUILD_DIR)/kernel.bin of=../../hd60M.img bs=512 count=200 seek=9 conv=notrunc
clean:
	cd $(BUILD_DIR) && rm -f ./*

build:	$(BUILD_DIR)/kernel.bin

all: mk_dir build hd

