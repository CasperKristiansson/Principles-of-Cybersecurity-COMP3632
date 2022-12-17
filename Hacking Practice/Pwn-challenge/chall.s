	.file	"chall.c"
	.text
	.def	scanf;	.scl	3;	.type	32;	.endef
	.seh_proc	scanf
scanf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	32(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rdx
	call	__mingw_vfscanf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	32(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rdx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "r\0"
.LC1:
	.ascii "./flag\0"
.LC2:
	.ascii "get flag error\0"
	.text
	.globl	getflag
	.def	getflag;	.scl	2;	.type	32;	.endef
	.seh_proc	getflag
getflag:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$144, %rsp
	.seh_stackalloc	144
	.seh_endprologue
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L6
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %ecx
	call	exit
.L6:
	movq	-8(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %r8
	movl	$100, %edx
	movq	%rax, %rcx
	call	fgets
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$144, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	init
	.def	init;	.scl	2;	.type	32;	.endef
	.seh_proc	init
init:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	setbuf
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	setbuf
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	setbuf
	movl	$256, %ecx
	call	alarm
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	fun
	.def	fun;	.scl	2;	.type	32;	.endef
	.seh_proc	fun
fun:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$144, %rsp
	.seh_stackalloc	144
	.seh_endprologue
	leaq	-112(%rbp), %rax
	movl	$120, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	read
	nop
	addq	$144, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC3:
	.ascii "Please enter your name: \0"
.LC4:
	.ascii "%s\0"
.LC5:
	.ascii "Hi \0"
.LC6:
	.ascii "fork error\0"
.LC7:
	.ascii "\12welcome\0"
.LC8:
	.ascii "recv sucess\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$304, %rsp
	.seh_stackalloc	304
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	call	init
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	printf
.L13:
	call	fork
	cltq
	movq	%rax, 168(%rbp)
	cmpq	$0, 168(%rbp)
	jns	.L10
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %ecx
	call	exit
.L10:
	cmpq	$0, 168(%rbp)
	jne	.L13
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	puts
	call	fun
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
	addq	$304, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev2, Built by MSYS2 project) 12.1.0"
	.def	__mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	setbuf;	.scl	2;	.type	32;	.endef
	.def	alarm;	.scl	2;	.type	32;	.endef
	.def	read;	.scl	2;	.type	32;	.endef
	.def	fork;	.scl	2;	.type	32;	.endef
