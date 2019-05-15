#include "console.h"

int kern_entry()
{
	console_clear();
	console_write("Grahipc driver test string!");	

	return 0;
}

