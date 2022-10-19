	.file	"login1.cpp"
	.text
	.section	.text$_Z6printfPKcz,"x"
	.linkonce discard
	.globl	_Z6printfPKcz
	.def	_Z6printfPKcz;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6printfPKcz
_Z6printfPKcz:
.LFB10:
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
	.ascii "password.txt\0"
.LC2:
	.ascii "Login successful!\12\15\0"
.LC3:
	.ascii "Try again.\12\15\0"
	.text
	.globl	_Z6login1PcS_
	.def	_Z6login1PcS_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6login1PcS_
_Z6login1PcS_:
.LFB109:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$160, %rsp
	.seh_stackalloc	160
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	leaq	-128(%rbp), %rax
	addq	$60, %rax
	movq	%rdx, %r8
	movl	$30, %edx
	movq	%rax, %rcx
	call	fgets
	movq	-8(%rbp), %rdx
	leaq	-128(%rbp), %rax
	addq	$90, %rax
	movq	%rdx, %r8
	movl	$30, %edx
	movq	%rax, %rcx
	call	fgets
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	leaq	-128(%rbp), %rax
	addq	$60, %rax
	movq	%rax, %rcx
	call	strlen
	subq	$1, %rax
	movb	$0, -68(%rbp,%rax)
	leaq	-128(%rbp), %rax
	addq	$90, %rax
	movq	%rax, %rcx
	call	strlen
	subq	$1, %rax
	movb	$0, -38(%rbp,%rax)
	movq	16(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	movq	24(%rbp), %rax
	leaq	-128(%rbp), %rdx
	leaq	30(%rdx), %rcx
	movq	%rax, %rdx
	call	strcpy
	movb	$0, -99(%rbp)
	movb	$0, -69(%rbp)
	movb	$0, -39(%rbp)
	movb	$0, -9(%rbp)
	leaq	-128(%rbp), %rax
	leaq	60(%rax), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L4
	leaq	-128(%rbp), %rax
	leaq	90(%rax), %rdx
	leaq	-128(%rbp), %rax
	addq	$30, %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L4
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	_Z6printfPKcz
	jmp	.L5
.L4:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	_Z6printfPKcz
	nop
.L5:
	nop
	addq	$160, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "password.txt not found; please download it and put it in this directory.\12\15\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB110:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	cmpl	$2, 16(%rbp)
	jg	.L7
	movl	$-1, %eax
	jmp	.L8
.L7:
	movl	$0, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	access
	cmpl	$-1, %eax
	sete	%al
	testb	%al, %al
	je	.L9
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	_Z6printfPKcz
	movl	$-1, %eax
	jmp	.L8
.L9:
	movq	24(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	cmpq	$1, %rax
	ja	.L10
	movl	$-1, %eax
	jmp	.L8
.L10:
	movq	24(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z6login1PcS_
	movl	$0, %eax
.L8:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev2, Built by MSYS2 project) 12.1.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	access;	.scl	2;	.type	32;	.endef
