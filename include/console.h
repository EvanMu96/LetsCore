#ifndef INCLUDE_CONSOLE_H_
#define INLCUDE_CONSOLE_H_

# include "types.h"
typedef
enum rea_color {
	rc_black = 0,
	rc_white = 15
} real_color_t;


// erase all
void console_clear();

//print a char with color
void console_putc_color(char c, real_color_t back, real_color_t fore);

//print a string, default: back->black fore->white
void console_write(char *cstr);

//print a string with color
void console_write_color(char *cstr, real_color_t back, real_color_t fore);

void console_write_hex(uint32_t n, real_color_t back, real_color_t fore);

void console_write_dec(uint32_t n, real_color_t back, real_color_t fore);

#endif //INCLUDE_CONSOLE_H_


