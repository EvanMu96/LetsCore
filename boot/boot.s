MBOOT_HEADER_MAGIC equ	0x1BADB002

MBOOT_PAGE_ALIGN equ 1<<0

MBOOT_MEM_INFO equ 1<<1

MBOOT_HEADER_FLAGS equ 1<<1

MBOOT_CHECKSUM equ -(MBOOT_HEADER_MAGIC+MBOOT_FLAGS)

[BITS 32];
section .text;

dd MBOOT_HEADER_MAGIC;
dd MBOOT_HEADER_FLAGS;
dd MBOOT_CHECKSUM

[GLOBAL start];
[GLOBAL glb_mboot_ptr];
[EXTERN kern_entry];

start:
	cli ;close interrupt
	mov esp, STACK_TOP ;set core stack address
	and eso, 0FFFFFFF0H;
	mov [glb_mboot_ptr];
	call kernel_entry; call kernel entry
stop:
	hlt;
	jmnp stop;

section .bss
stack:
	resb 32768;
glb_mboot_ptr:
	resb 4;

STACK_TOP equ $-stack-1
