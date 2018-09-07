#include "init.h"
#include "interrupt.h"
#include "debug.h"
#include "lib/print.h"
int main(void){
	put_char('k');
	put_char('e');
	put_char('r');
	put_char('n');
	put_char('e');
	put_char('l');
	put_char('\n');
	put_char('1');
	put_char('2');
	put_char('\b');
	put_char('3');
	put_str("i am a kernel\n");
	
	put_int(0x00000000);
//	asm volatile("cli":::"memory");
//	init_all();
//	asm volatile ("cli");
//	ASSERT(1==2);
	init_all();
	ASSERT(1 == 2);
//	asm volatile("sti");

	while(1);
	return 0;
}
