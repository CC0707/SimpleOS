#include "interrupt.h"
#include "print.h"
#include "timer.h"
#include "init.h"
#include "memory.h"
void init_all(void){
	put_str("init_all\n");
	idt_init();
	timer_init();
	mem_init();
}
