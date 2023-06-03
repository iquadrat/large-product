	.file	"test_simple_problem.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1354:
	.cfi_startproc
	endbr64
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1354:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.align 2
	.p2align 4
	.type	_ZN9stopwatch4stopEv.part.0, @function
_ZN9stopwatch4stopEv.part.0:
.LFB9234:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movb	$0, 32(%rdi)
	movq	%rdi, %rbx
	call	clock@PLT
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovsd	24(%rbx), %xmm1
	vsubsd	8(%rbx), %xmm0, %xmm0
	vfmadd132sd	40(%rbx), %xmm1, %xmm0
	vmovsd	%xmm0, 24(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9234:
	.size	_ZN9stopwatch4stopEv.part.0, .-_ZN9stopwatch4stopEv.part.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	","
	.text
	.p2align 4
	.globl	_Z5printDv4_d
	.type	_Z5printDv4_d, @function
_Z5printDv4_d:
.LFB8805:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	_ZSt4cout(%rip), %rdi
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%r12
	subq	$64, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	vmovapd	%ymm0, -80(%rbp)
	vmovapd	%xmm0, -32(%rbp)
	vzeroupper
	leaq	.LC0(%rip), %r13
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$1, %edx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	-32(%rbp), %xmm2
	movq	%r12, %rdi
	vunpckhpd	%xmm2, %xmm2, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	-80(%rbp), %ymm1
	movq	%r12, %rdi
	vextractf128	$0x1, %ymm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm0
	vmovapd	%xmm1, -32(%rbp)
	vzeroupper
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$1, %edx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	-32(%rbp), %xmm1
	movq	%r12, %rdi
	vunpckhpd	%xmm1, %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %r13
	testq	%r13, %r13
	je	.L11
	cmpb	$0, 56(%r13)
	je	.L7
	movsbl	67(%r13), %esi
.L8:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	addq	$64, %rsp
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	movq	%rax, %rdi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L8
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L8
.L11:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE8805:
	.size	_Z5printDv4_d, .-_Z5printDv4_d
	.p2align 4
	.globl	_Z3absDv4_d
	.type	_Z3absDv4_d, @function
_Z3absDv4_d:
.LFB8808:
	.cfi_startproc
	endbr64
	vmovapd	%ymm0, %ymm1
	vmovapd	.LC1(%rip), %ymm0
	vandnpd	%ymm1, %ymm0, %ymm0
	ret
	.cfi_endproc
.LFE8808:
	.size	_Z3absDv4_d, .-_Z3absDv4_d
	.p2align 4
	.globl	_Z18horizontal_productDv4_d
	.type	_Z18horizontal_productDv4_d, @function
_Z18horizontal_productDv4_d:
.LFB8810:
	.cfi_startproc
	endbr64
	vmovapd	%xmm0, %xmm2
	vextractf128	$0x1, %ymm0, %xmm0
	vmulpd	%xmm0, %xmm2, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm2, %xmm2
	vmovsd	%xmm2, %xmm2, %xmm0
	ret
	.cfi_endproc
.LFE8810:
	.size	_Z18horizontal_productDv4_d, .-_Z18horizontal_productDv4_d
	.p2align 4
	.globl	_Z8mul_diffDv4_dS_S_
	.type	_Z8mul_diffDv4_dS_S_, @function
_Z8mul_diffDv4_dS_S_:
.LFB8811:
	.cfi_startproc
	endbr64
	vsubpd	%ymm2, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE8811:
	.size	_Z8mul_diffDv4_dS_S_, .-_Z8mul_diffDv4_dS_S_
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"void prod_realreal(long int, long int, double, const double*, double&, long int&)"
	.section	.rodata.str1.1
.LC4:
	.string	"test_simple_problem.cpp"
.LC5:
	.string	"N % ELEMENTS_PER_LOOP == 0"
	.text
	.p2align 4
	.globl	_Z13prod_realreallldPKdRdRl
	.type	_Z13prod_realreallldPKdRdRl, @function
_Z13prod_realreallldPKdRdRl:
.LFB8812:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	addq	$-128, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, 112(%rsp)
	andl	$31, %edi
	movq	%rsi, 72(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%r8, 80(%rsp)
	jne	.L59
	movq	(%r8), %rax
	vmovapd	.LC6(%rip), %ymm3
	movq	%rax, 104(%rsp)
	movq	72(%rsp), %rax
	vmovsd	%xmm0, %xmm0, %xmm4
	andq	$-32, %rax
	vmovlpd	(%rcx), %xmm3, %xmm0
	cmpq	$0, 112(%rsp)
	movq	%rax, 120(%rsp)
	movq	%rcx, %r12
	vinsertf128	$0x0, %xmm0, %ymm3, %ymm3
	vbroadcastsd	%xmm4, %ymm2
	jle	.L41
	vmovapd	.LC2(%rip), %ymm5
	movq	%rcx, 56(%rsp)
	vmovapd	.LC1(%rip), %ymm1
	vmovapd	.LC7(%rip), %ymm0
	vmovapd	.LC8(%rip), %ymm6
	movq	%rdx, %r8
	vmovapd	%ymm5, %ymm9
	vmovapd	%ymm5, %ymm11
	vmovapd	%ymm5, %ymm10
	vmovapd	%ymm5, %ymm12
	vmovapd	%ymm5, %ymm8
	vmovapd	%ymm5, %ymm7
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L19:
	cmpq	%r9, 120(%rsp)
	je	.L18
	vsubpd	(%r8), %ymm2, %ymm13
	vmulpd	%ymm13, %ymm3, %ymm3
	vsubpd	32(%r8), %ymm2, %ymm13
	vmulpd	%ymm13, %ymm7, %ymm7
	vsubpd	64(%r8), %ymm2, %ymm13
	vmulpd	%ymm13, %ymm8, %ymm8
	vsubpd	96(%r8), %ymm2, %ymm13
	vmulpd	%ymm13, %ymm12, %ymm12
	vsubpd	128(%r8), %ymm2, %ymm13
	vmulpd	%ymm13, %ymm10, %ymm10
	vsubpd	160(%r8), %ymm2, %ymm13
	vmulpd	%ymm13, %ymm11, %ymm11
	vsubpd	192(%r8), %ymm2, %ymm13
	vmulpd	%ymm13, %ymm9, %ymm9
	vsubpd	224(%r8), %ymm2, %ymm13
	vmulpd	%ymm13, %ymm5, %ymm5
	testb	$-32, %r9b
	jne	.L18
	vandnpd	%ymm3, %ymm1, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm14
	vcmppd	$2, %ymm6, %ymm3, %ymm13
	vandnpd	%ymm7, %ymm1, %ymm7
	vmovmskpd	%ymm14, %ecx
	vmulpd	%ymm0, %ymm3, %ymm14
	vmovmskpd	%ymm13, %r15d
	vandnpd	%ymm8, %ymm1, %ymm8
	vandnpd	%ymm12, %ymm1, %ymm12
	vandnpd	%ymm10, %ymm1, %ymm10
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
	vcmppd	$13, %ymm0, %ymm7, %ymm14
	vcmppd	$2, %ymm6, %ymm7, %ymm13
	vandnpd	%ymm11, %ymm1, %ymm11
	vmovmskpd	%ymm14, %edx
	vmulpd	%ymm0, %ymm7, %ymm14
	vmovmskpd	%ymm13, %r14d
	popcntl	%ecx, %ecx
	addq	104(%rsp), %rcx
	vandnpd	%ymm9, %ymm1, %ymm9
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
	vcmppd	$13, %ymm0, %ymm8, %ymm14
	vcmppd	$2, %ymm6, %ymm8, %ymm13
	popcntl	%r15d, %r15d
	vmovmskpd	%ymm14, %eax
	vmulpd	%ymm0, %ymm8, %ymm14
	vmovmskpd	%ymm13, %ebx
	movl	%eax, 100(%rsp)
	subq	%r15, %rcx
	movl	%ebx, 96(%rsp)
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
	vcmppd	$13, %ymm0, %ymm12, %ymm14
	vcmppd	$2, %ymm6, %ymm12, %ymm13
	popcntl	%edx, %edx
	vmovmskpd	%ymm14, %esi
	vmulpd	%ymm0, %ymm12, %ymm14
	vmovmskpd	%ymm13, %edi
	addq	%rcx, %rdx
	movl	%esi, 92(%rsp)
	xorl	%ecx, %ecx
	vblendvpd	%ymm13, %ymm14, %ymm12, %ymm12
	vcmppd	$13, %ymm0, %ymm10, %ymm14
	vcmppd	$2, %ymm6, %ymm10, %ymm13
	popcntl	%r14d, %r14d
	vmovmskpd	%ymm14, %eax
	vmulpd	%ymm0, %ymm10, %ymm14
	vmovmskpd	%ymm13, %r13d
	subq	%r14, %rdx
	movl	%edi, 88(%rsp)
	popcntl	100(%rsp), %ecx
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
	vcmppd	$13, %ymm0, %ymm11, %ymm14
	vcmppd	$2, %ymm6, %ymm11, %ymm13
	addq	%rdx, %rcx
	vmovmskpd	%ymm14, %r12d
	vmulpd	%ymm0, %ymm11, %ymm14
	xorl	%edx, %edx
	popcntl	96(%rsp), %edx
	subq	%rdx, %rcx
	xorl	%edx, %edx
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
	vcmppd	$13, %ymm0, %ymm9, %ymm14
	popcntl	92(%rsp), %edx
	addq	%rcx, %rdx
	vmovmskpd	%ymm14, %r11d
	vmulpd	%ymm0, %ymm9, %ymm14
	xorl	%ecx, %ecx
	vmovmskpd	%ymm13, %ebx
	popcntl	88(%rsp), %ecx
	vcmppd	$2, %ymm6, %ymm9, %ymm13
	subq	%rcx, %rdx
	popcntl	%eax, %eax
	addq	%rdx, %rax
	vandnpd	%ymm5, %ymm1, %ymm5
	popcntl	%r13d, %r13d
	subq	%r13, %rax
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
	popcntl	%r12d, %r12d
	vcmppd	$13, %ymm0, %ymm5, %ymm14
	addq	%r12, %rax
	vmovmskpd	%ymm13, %r10d
	popcntl	%ebx, %ebx
	vcmppd	$2, %ymm6, %ymm5, %ymm13
	subq	%rbx, %rax
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vmovmskpd	%ymm14, %edi
	popcntl	%r10d, %r10d
	vmulpd	%ymm0, %ymm5, %ymm14
	subq	%r10, %rax
	vmovmskpd	%ymm13, %esi
	popcntl	%edi, %edi
	addq	%rax, %rdi
	popcntl	%esi, %esi
	subq	%rsi, %rdi
	movq	%rdi, 104(%rsp)
	vblendvpd	%ymm13, %ymm14, %ymm5, %ymm5
.L18:
	addq	$32, %r9
	addq	$256, %r8
	cmpq	%r9, 112(%rsp)
	jg	.L19
	movq	56(%rsp), %r12
.L17:
	vandnpd	%ymm3, %ymm1, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm13
	vcmppd	$2, %ymm6, %ymm3, %ymm2
	vandnpd	%ymm7, %ymm1, %ymm7
	vmovmskpd	%ymm13, %eax
	vmulpd	%ymm0, %ymm3, %ymm13
	vmovmskpd	%ymm2, %r10d
	vandnpd	%ymm8, %ymm1, %ymm8
	vandnpd	%ymm12, %ymm1, %ymm12
	vandnpd	%ymm10, %ymm1, %ymm10
	vblendvpd	%ymm2, %ymm13, %ymm3, %ymm3
	vcmppd	$13, %ymm0, %ymm7, %ymm13
	vcmppd	$2, %ymm6, %ymm7, %ymm2
	vandnpd	%ymm11, %ymm1, %ymm11
	vmovmskpd	%ymm13, %r15d
	vmulpd	%ymm0, %ymm7, %ymm13
	vmovmskpd	%ymm2, %esi
	vandnpd	%ymm5, %ymm1, %ymm5
	movl	%esi, 112(%rsp)
	popcntl	%eax, %eax
	vblendvpd	%ymm2, %ymm13, %ymm7, %ymm7
	vcmppd	$13, %ymm0, %ymm8, %ymm13
	vcmppd	$2, %ymm6, %ymm8, %ymm2
	vmulpd	%ymm7, %ymm3, %ymm3
	vmovmskpd	%ymm13, %ebx
	vmulpd	%ymm0, %ymm8, %ymm13
	vmovmskpd	%ymm2, %edi
	movl	%ebx, 100(%rsp)
	movl	%edi, 96(%rsp)
	addq	104(%rsp), %rax
	vblendvpd	%ymm2, %ymm13, %ymm8, %ymm8
	vcmppd	$13, %ymm0, %ymm12, %ymm13
	vcmppd	$2, %ymm6, %ymm12, %ymm2
	popcntl	%r10d, %r10d
	vmovmskpd	%ymm13, %edx
	vmulpd	%ymm0, %ymm12, %ymm13
	vmovmskpd	%ymm2, %ecx
	movl	%edx, 92(%rsp)
	movl	%ecx, 88(%rsp)
	subq	%r10, %rax
	vblendvpd	%ymm2, %ymm13, %ymm12, %ymm12
	vmulpd	%ymm12, %ymm8, %ymm8
	vcmppd	$13, %ymm0, %ymm10, %ymm13
	vcmppd	$2, %ymm6, %ymm10, %ymm2
	xorl	%r10d, %r10d
	vmovmskpd	%ymm13, %r14d
	vmulpd	%ymm3, %ymm8, %ymm7
	vmulpd	%ymm0, %ymm10, %ymm13
	vmovmskpd	%ymm2, %r11d
	movl	%r11d, 52(%rsp)
	movl	%r14d, 56(%rsp)
	vandnpd	%ymm7, %ymm1, %ymm7
	vcmppd	$13, %ymm0, %ymm7, %ymm8
	vblendvpd	%ymm2, %ymm13, %ymm10, %ymm10
	vcmppd	$13, %ymm0, %ymm11, %ymm13
	vmovmskpd	%ymm8, %edx
	vmulpd	%ymm0, %ymm7, %ymm8
	vcmppd	$2, %ymm6, %ymm7, %ymm3
	vmovmskpd	%ymm13, %r9d
	vmulpd	%ymm0, %ymm11, %ymm13
	vcmppd	$2, %ymm6, %ymm11, %ymm2
	vblendvpd	%ymm3, %ymm8, %ymm7, %ymm7
	vandnpd	%ymm7, %ymm1, %ymm7
	vcmppd	$13, %ymm0, %ymm7, %ymm8
	vmovmskpd	%ymm2, %r8d
	vblendvpd	%ymm2, %ymm13, %ymm11, %ymm11
	vandnpd	%ymm9, %ymm1, %ymm2
	vcmppd	$13, %ymm0, %ymm2, %ymm13
	vmovmskpd	%ymm8, %r11d
	vmulpd	%ymm0, %ymm7, %ymm8
	vmovmskpd	%ymm13, %r13d
	vmulpd	%ymm0, %ymm2, %ymm13
	vmovmskpd	%ymm3, %ecx
	vcmppd	$2, %ymm6, %ymm7, %ymm3
	vcmppd	$2, %ymm6, %ymm2, %ymm9
	movl	%r9d, 48(%rsp)
	vblendvpd	%ymm3, %ymm8, %ymm7, %ymm7
	vandnpd	%ymm7, %ymm1, %ymm7
	vblendvpd	%ymm9, %ymm13, %ymm2, %ymm2
	vcmppd	$13, %ymm0, %ymm5, %ymm13
	vcmppd	$13, %ymm0, %ymm7, %ymm8
	vmovmskpd	%ymm9, %esi
	vmovmskpd	%ymm13, %ebx
	vmulpd	%ymm0, %ymm5, %ymm13
	movl	%ebx, 32(%rsp)
	vmovmskpd	%ymm8, %ebx
	vmulpd	%ymm0, %ymm7, %ymm8
	vcmppd	$2, %ymm6, %ymm5, %ymm9
	vmovmskpd	%ymm3, %r14d
	vcmppd	$2, %ymm6, %ymm7, %ymm3
	vblendvpd	%ymm9, %ymm13, %ymm5, %ymm5
	vmulpd	%ymm11, %ymm10, %ymm10
	vmovmskpd	%ymm3, %r9d
	vblendvpd	%ymm3, %ymm8, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm2, %ymm3
	movl	%r13d, 40(%rsp)
	movl	%r9d, 12(%rsp)
	movl	%r14d, 16(%rsp)
	vmovmskpd	%ymm9, %edi
	vmulpd	%ymm10, %ymm3, %ymm3
	movl	%edi, 28(%rsp)
	movl	%r8d, 44(%rsp)
	popcntl	%r15d, %r10d
	addq	%rax, %r10
	vandnpd	%ymm3, %ymm1, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm5
	vcmppd	$2, %ymm6, %ymm3, %ymm2
	xorl	%eax, %eax
	vmovmskpd	%ymm5, %r13d
	vmulpd	%ymm0, %ymm3, %ymm5
	vmovmskpd	%ymm2, %r14d
	popcntl	112(%rsp), %eax
	subq	%rax, %r10
	xorl	%eax, %eax
	vblendvpd	%ymm2, %ymm5, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm1, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm5
	vcmppd	$2, %ymm6, %ymm3, %ymm2
	popcntl	100(%rsp), %eax
	vmovmskpd	%ymm5, %r9d
	vmulpd	%ymm0, %ymm3, %ymm5
	vmovmskpd	%ymm2, %r8d
	addq	%r10, %rax
	xorl	%r10d, %r10d
	popcntl	96(%rsp), %r10d
	vblendvpd	%ymm2, %ymm5, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm1, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm5
	vcmppd	$2, %ymm6, %ymm3, %ymm2
	subq	%r10, %rax
	vmovmskpd	%ymm5, %edi
	vmulpd	%ymm0, %ymm3, %ymm5
	xorl	%r10d, %r10d
	popcntl	92(%rsp), %r10d
	addq	%rax, %r10
	xorl	%eax, %eax
	vblendvpd	%ymm2, %ymm5, %ymm3, %ymm3
	vmulpd	%ymm3, %ymm7, %ymm7
	popcntl	88(%rsp), %eax
	subq	%rax, %r10
	xorl	%eax, %eax
	popcntl	56(%rsp), %eax
	addq	%r10, %rax
	xorl	%r10d, %r10d
	popcntl	52(%rsp), %r10d
	subq	%r10, %rax
	xorl	%r10d, %r10d
	vandnpd	%ymm7, %ymm1, %ymm1
	movl	%esi, 36(%rsp)
	popcntl	48(%rsp), %r10d
	addq	%rax, %r10
	xorl	%eax, %eax
	popcntl	44(%rsp), %eax
	vcmppd	$13, %ymm0, %ymm1, %ymm3
	subq	%rax, %r10
	vmulpd	%ymm0, %ymm1, %ymm0
	xorl	%eax, %eax
	popcntl	40(%rsp), %eax
	addq	%r10, %rax
	xorl	%r10d, %r10d
	popcntl	36(%rsp), %r10d
	movl	%edx, 24(%rsp)
	subq	%r10, %rax
	vmovmskpd	%ymm2, %esi
	xorl	%r10d, %r10d
	vcmppd	$2, %ymm6, %ymm1, %ymm2
	popcntl	32(%rsp), %r10d
	movl	%ecx, 20(%rsp)
	addq	%rax, %r10
	xorl	%eax, %eax
	popcntl	28(%rsp), %eax
	subq	%rax, %r10
	xorl	%eax, %eax
	vblendvpd	%ymm2, %ymm0, %ymm1, %ymm1
	popcntl	24(%rsp), %eax
	addq	%r10, %rax
	xorl	%r10d, %r10d
	popcntl	20(%rsp), %r10d
	vmovapd	%xmm1, %xmm0
	subq	%r10, %rax
	vextractf128	$0x1, %ymm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm1
	popcntl	%r11d, %r11d
	addq	%rax, %r11
	xorl	%eax, %eax
	popcntl	16(%rsp), %eax
	subq	%rax, %r11
	popcntl	%ebx, %ebx
	xorl	%eax, %eax
	addq	%r11, %rbx
	popcntl	12(%rsp), %eax
	subq	%rax, %rbx
	xorl	%eax, %eax
	popcntl	%r13d, %eax
	addq	%rbx, %rax
	xorl	%r10d, %r10d
	vunpckhpd	%xmm1, %xmm1, %xmm1
	popcntl	%r14d, %r10d
	subq	%r10, %rax
	vmulsd	%xmm1, %xmm0, %xmm0
	popcntl	%r9d, %r9d
	addq	%r9, %rax
	popcntl	%r8d, %r8d
	subq	%r8, %rax
	popcntl	%edi, %edi
	addq	%rdi, %rax
	popcntl	%esi, %esi
	vmovsd	.LC9(%rip), %xmm1
	subq	%rsi, %rax
	vmovmskpd	%ymm3, %ecx
	vmovmskpd	%ymm2, %edx
	popcntl	%ecx, %ecx
	addq	%rcx, %rax
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vcomisd	%xmm1, %xmm0
	movq	80(%rsp), %rbx
	vmovsd	%xmm0, (%r12)
	vmovsd	.LC10(%rip), %xmm2
	movq	%rax, (%rbx)
	ja	.L60
	vcomisd	%xmm0, %xmm2
	jbe	.L22
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rax
	vmovsd	%xmm0, (%r12)
	movq	%rax, (%rbx)
.L22:
	vcomisd	%xmm1, %xmm0
	jbe	.L53
.L62:
	vmulsd	%xmm2, %xmm0, %xmm0
	movq	80(%rsp), %rsi
	incq	%rax
	vmovsd	%xmm0, (%r12)
	movq	%rax, (%rsi)
.L26:
	vcomisd	%xmm1, %xmm0
	jbe	.L54
.L63:
	vmulsd	%xmm2, %xmm0, %xmm0
	movq	80(%rsp), %rsi
	incq	%rax
	vmovsd	%xmm0, (%r12)
	movq	%rax, (%rsi)
.L30:
	movq	120(%rsp), %rbx
	vmovq	.LC11(%rip), %xmm3
	leaq	31(%rbx), %rcx
	movslq	%ebx, %rax
	leaq	32(%rbx), %rdx
	cmpq	%rcx, %rax
	jg	.L56
	movq	72(%rsp), %rcx
	movq	64(%rsp), %rsi
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L61:
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12)
.L34:
	incq	%rax
	cmpq	%rdx, %rax
	je	.L56
.L39:
	cmpq	%rax, %rcx
	je	.L34
	vsubsd	(%rsi,%rax,8), %xmm4, %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vmulsd	(%r12), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L61
	vcomisd	%xmm0, %xmm2
	jbe	.L58
	vmulsd	%xmm1, %xmm0, %xmm0
.L58:
	incq	%rax
	vmovsd	%xmm0, (%r12)
	cmpq	%rdx, %rax
	jne	.L39
.L56:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore_state
	vmulsd	%xmm2, %xmm0, %xmm0
	incq	%rax
	vcomisd	%xmm1, %xmm0
	vmovsd	%xmm0, (%r12)
	movq	%rax, (%rbx)
	ja	.L62
.L53:
	vcomisd	%xmm0, %xmm2
	jbe	.L26
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rax
	movq	80(%rsp), %rsi
	vcomisd	%xmm1, %xmm0
	vmovsd	%xmm0, (%r12)
	movq	%rax, (%rsi)
	ja	.L63
.L54:
	vcomisd	%xmm0, %xmm2
	jbe	.L30
	vmulsd	%xmm1, %xmm0, %xmm0
	movq	80(%rsp), %rsi
	decq	%rax
	vmovsd	%xmm0, (%r12)
	movq	%rax, (%rsi)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L41:
	vmovapd	.LC2(%rip), %ymm5
	vmovapd	.LC1(%rip), %ymm1
	vmovapd	.LC7(%rip), %ymm0
	vmovapd	.LC8(%rip), %ymm6
	vmovapd	%ymm5, %ymm9
	vmovapd	%ymm5, %ymm11
	vmovapd	%ymm5, %ymm10
	vmovapd	%ymm5, %ymm12
	vmovapd	%ymm5, %ymm8
	vmovapd	%ymm5, %ymm7
	jmp	.L17
.L59:
	leaq	.LC3(%rip), %rcx
	movl	$173, %edx
	leaq	.LC4(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE8812:
	.size	_Z13prod_realreallldPKdRdRl, .-_Z13prod_realreallldPKdRdRl
	.p2align 4
	.globl	_Z16prod_realcomplexldPKdS0_RdRl
	.type	_Z16prod_realcomplexldPKdS0_RdRl, @function
_Z16prod_realcomplexldPKdS0_RdRl:
.LFB8813:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rdx, %rdi
	testq	%rax, %rax
	jle	.L75
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC9(%rip), %xmm4
	vmovsd	.LC10(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L76:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L68:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L75
.L70:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L76
	vcomisd	%xmm1, %xmm5
	ja	.L69
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L70
.L75:
	ret
	.p2align 4,,10
	.p2align 3
.L69:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L68
	.cfi_endproc
.LFE8813:
	.size	_Z16prod_realcomplexldPKdS0_RdRl, .-_Z16prod_realcomplexldPKdS0_RdRl
	.p2align 4
	.globl	_Z16prod_complexreallddPKdRdRl
	.type	_Z16prod_complexreallddPKdRdRl, @function
_Z16prod_complexreallddPKdRdRl:
.LFB8814:
	.cfi_startproc
	endbr64
	vmulsd	%xmm1, %xmm1, %xmm1
	testq	%rdi, %rdi
	jle	.L88
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC9(%rip), %xmm4
	vmovsd	.LC10(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L89:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L81:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L88
.L83:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L89
	vcomisd	%xmm2, %xmm5
	ja	.L82
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L83
.L88:
	ret
	.p2align 4,,10
	.p2align 3
.L82:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L81
	.cfi_endproc
.LFE8814:
	.size	_Z16prod_complexreallddPKdRdRl, .-_Z16prod_complexreallddPKdRdRl
	.p2align 4
	.globl	_Z19prod_complexcomplexllddPKdS0_RdRl
	.type	_Z19prod_complexcomplexllddPKdS0_RdRl, @function
_Z19prod_complexcomplexllddPKdS0_RdRl:
.LFB8815:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	movq	%rdx, %rsi
	testq	%rax, %rax
	jle	.L99
	vmovsd	(%r8), %xmm2
	vmovsd	.LC9(%rip), %xmm5
	vmovsd	.LC10(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L112:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L96:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L99
.L98:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L112
	vcomisd	%xmm2, %xmm6
	ja	.L97
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L98
.L99:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L113
	vmovsd	(%r8), %xmm2
	vmovsd	.LC9(%rip), %xmm5
	vmovsd	.LC10(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L115:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L102:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L114
.L104:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L115
	vcomisd	%xmm2, %xmm6
	ja	.L103
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L104
.L114:
	ret
	.p2align 4,,10
	.p2align 3
.L97:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L103:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L113:
	ret
	.cfi_endproc
.LFE8815:
	.size	_Z19prod_complexcomplexllddPKdS0_RdRl, .-_Z19prod_complexcomplexllddPKdS0_RdRl
	.section	.text._ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv:
.LFB9225:
	.cfi_startproc
	endbr64
	vmovdqa	.LC12(%rip), %ymm2
	vmovdqa	.LC13(%rip), %ymm3
	vmovdqa	.LC14(%rip), %ymm4
	vmovdqa	.LC15(%rip), %ymm5
	movq	%rdi, %rax
	leaq	1248(%rdi), %rcx
	movq	%rdi, %rdx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L117:
	vpand	8(%rdx), %ymm3, %ymm1
	vpand	(%rdx), %ymm2, %ymm0
	addq	$32, %rdx
	vpor	%ymm1, %ymm0, %ymm0
	vpsrlq	$1, %ymm0, %ymm1
	vpand	%ymm4, %ymm0, %ymm0
	vpxor	1216(%rdx), %ymm1, %ymm1
	vpcmpeqq	%ymm7, %ymm0, %ymm0
	vpxor	%ymm5, %ymm1, %ymm6
	vpblendvb	%ymm0, %ymm1, %ymm6, %ymm0
	vmovdqu	%ymm0, -32(%rdx)
	cmpq	%rcx, %rdx
	jne	.L117
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L118:
	vpand	8(%rdx), %ymm3, %ymm1
	vpand	(%rdx), %ymm2, %ymm0
	addq	$32, %rdx
	vpor	%ymm1, %ymm0, %ymm0
	vpsrlq	$1, %ymm0, %ymm1
	vpand	%ymm4, %ymm0, %ymm0
	vpxor	-1280(%rdx), %ymm1, %ymm1
	vpcmpeqq	%ymm7, %ymm0, %ymm0
	vpxor	%ymm5, %ymm1, %ymm6
	vpblendvb	%ymm0, %ymm1, %ymm6, %ymm0
	vmovdqu	%ymm0, -32(%rdx)
	cmpq	%rdx, %rcx
	jne	.L118
	vmovdqa	.LC16(%rip), %xmm0
	vmovdqa	.LC17(%rip), %xmm1
	vpand	2464(%rax), %xmm0, %xmm0
	vpand	2472(%rax), %xmm1, %xmm1
	movq	2488(%rax), %rsi
	vpor	%xmm1, %xmm0, %xmm0
	movq	2480(%rax), %rdx
	vpsrlq	$1, %xmm0, %xmm1
	movq	%rsi, %rcx
	vpand	.LC18(%rip), %xmm0, %xmm0
	andl	$2147483647, %ecx
	vpxor	1216(%rax), %xmm1, %xmm1
	andq	$-2147483648, %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	orq	%rcx, %rdx
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	movq	%rdx, %rcx
	vpxor	.LC19(%rip), %xmm1, %xmm2
	shrq	%rcx
	vpblendvb	%xmm0, %xmm1, %xmm2, %xmm0
	xorq	1232(%rax), %rcx
	andl	$1, %edx
	vmovdqu	%xmm0, 2464(%rax)
	je	.L122
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L122:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L121
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L121:
	movq	%rcx, 2488(%rax)
	movq	$0, 2496(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE9225:
	.size	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, .-_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.text
	.p2align 4
	.globl	_Z21init_random_positionslddPd
	.type	_Z21init_random_positionslddPd, @function
_Z21init_random_positionslddPd:
.LFB8795:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	jle	.L139
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	vsubsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm0, %xmm0, %xmm2
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	vxorps	%xmm5, %xmm5, %xmm5
	leaq	_ZL3gen(%rip), %rcx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movabsq	$6148914691236517205, %r15
	movabsq	$8202884508482404352, %r14
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movabsq	$-2270628950310912, %r13
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	vmovsd	_ZL5distu(%rip), %xmm4
	vmovsd	8+_ZL5distu(%rip), %xmm3
	movq	2496+_ZL3gen(%rip), %rax
	vsubsd	%xmm4, %xmm3, %xmm3
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L141:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L128:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC21(%rip), %xmm0, %xmm0
	vcomisd	.LC22(%rip), %xmm0
	jnb	.L129
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L135
.L130:
	movq	%rdx, %rax
.L134:
	cmpq	$311, %rax
	ja	.L140
.L133:
	leaq	1(%rax), %rdx
	movq	(%rcx,%rax,8), %rax
	movq	%rdx, 2496+_ZL3gen(%rip)
	movq	%rax, %rsi
	shrq	$29, %rsi
	andq	%r15, %rsi
	xorq	%rsi, %rax
	movq	%rax, %rsi
	salq	$17, %rsi
	andq	%r14, %rsi
	xorq	%rsi, %rax
	movq	%rax, %rsi
	salq	$37, %rsi
	andq	%r13, %rsi
	xorq	%rsi, %rax
	movq	%rax, %rsi
	shrq	$43, %rsi
	xorq	%rsi, %rax
	jns	.L141
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L140:
	movq	%rcx, %rdi
	vmovsd	%xmm3, 24(%rsp)
	vmovsd	%xmm1, 16(%rsp)
	vmovsd	%xmm2, 8(%rsp)
	vmovsd	%xmm4, (%rsp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	24(%rsp), %xmm3
	vmovsd	16(%rsp), %xmm1
	vmovsd	8(%rsp), %xmm2
	vmovsd	(%rsp), %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	leaq	_ZL3gen(%rip), %rcx
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L129:
	vmovsd	.LC23(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L130
.L135:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L139:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE8795:
	.size	_Z21init_random_positionslddPd, .-_Z21init_random_positionslddPd
	.section	.rodata.str1.1
.LC24:
	.string	"M N\n"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"M number of runs, N number of particles\n"
	.section	.rodata.str1.1
.LC26:
	.string	"example: "
.LC27:
	.string	" 10 10000\n"
.LC28:
	.string	" product: "
.LC33:
	.string	"prod_realreal: orod="
.LC34:
	.string	" exponent="
.LC35:
	.string	" timing="
.LC36:
	.string	" seconds\n"
.LC37:
	.string	"prod_complexcomplex: orod="
.LC38:
	.string	"prod_realcomplex: orod="
.LC39:
	.string	"prod_complexreal: orod="
	.section	.text.unlikely,"ax",@progbits
.LCOLDB45:
	.section	.text.startup,"ax",@progbits
.LHOTB45:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8816:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	pushq	%rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 10, -56
	.cfi_offset 3, -64
	movq	%rsi, %rbx
	subq	$208, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$3, %edi
	je	.L143
	leaq	_ZSt4cout(%rip), %r12
	movq	(%rsi), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC24(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC25(%rip), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$9, %edx
	leaq	.LC26(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC27(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %eax
.L142:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L241
	addq	$208, %rsp
	popq	%rbx
	popq	%r10
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L143:
	.cfi_restore_state
	movl	$10, %edx
	leaq	.LC28(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	.LC29(%rip), %ymm0
	leaq	_ZSt4cout(%rip), %rdi
	vmovapd	%xmm0, %xmm1
	vextractf128	$0x1, %ymm0, %xmm0
	vmulpd	%xmm0, %xmm1, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm0
	vzeroupper
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r13
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r13,%rax), %r12
	testq	%r12, %r12
	je	.L242
	cmpb	$0, 56(%r12)
	je	.L146
	movzbl	67(%r12), %eax
.L147:
	movsbl	%al, %esi
	movq	%r13, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movslq	%eax, %r12
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r12, -224(%rbp)
	call	strtol@PLT
	movslq	%eax, %r14
	movabsq	$1152921504606846975, %rax
	movq	%r14, -176(%rbp)
	cmpq	%rax, %r14
	ja	.L148
	leaq	0(,%r14,8), %rbx
	movq	%rbx, %rdi
	call	_Znam@PLT
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	_Znam@PLT
	movq	%rax, %r13
	movq	.LC22(%rip), %rax
	movq	%r15, %rsi
	vmovq	%rax, %xmm1
	movq	.LC30(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC22(%rip), %rax
	movq	%r13, %rsi
	vmovq	%rax, %xmm1
	movq	.LC30(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC22(%rip), %rax
	movq	$0, -120(%rbp)
	movq	%rax, -128(%rbp)
	call	clock@PLT
	movq	%rax, -112(%rbp)
	movq	.LC31(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -72(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	testq	%r12, %r12
	jle	.L149
	testq	%r14, %r14
	jle	.L149
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	-120(%rbp), %rax
	movq	%rax, -192(%rbp)
	vmovsd	%xmm4, -144(%rbp)
	leaq	-128(%rbp), %rax
	vmovsd	.LC21(%rip), %xmm4
	movq	%rax, -184(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	%xmm4, -152(%rbp)
	movq	$0, -200(%rbp)
	vmovsd	.LC32(%rip), %xmm4
	movq	%rax, -232(%rbp)
	movq	%r13, -216(%rbp)
	movq	%rbx, -208(%rbp)
	movq	-176(%rbp), %rbx
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm4, -136(%rbp)
	.p2align 4,,10
	.p2align 3
.L150:
	movq	-232(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -160(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L244:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L152:
	vaddsd	-144(%rbp), %xmm0, %xmm0
	vmulsd	-152(%rbp), %xmm0, %xmm0
	vcomisd	.LC22(%rip), %xmm0
	jnb	.L153
	vmovsd	-160(%rbp), %xmm6
	vmovsd	.LC30(%rip), %xmm7
	vfmadd132sd	-168(%rbp), %xmm6, %xmm0
	vfmadd132sd	-136(%rbp), %xmm7, %xmm0
.L239:
	movq	-192(%rbp), %r8
	movq	-184(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L154
	movq	%r14, %rax
.L158:
	cmpq	$311, %rax
	ja	.L243
.L156:
	leaq	1(%rax), %r14
	movq	(%r12,%rax,8), %rax
	movabsq	$6148914691236517205, %rsi
	movq	%rax, %rdx
	shrq	$29, %rdx
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	movabsq	$8202884508482404352, %rsi
	salq	$17, %rdx
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$37, %rdx
	movabsq	$-2270628950310912, %rsi
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$43, %rdx
	movq	%r14, 2496+_ZL3gen(%rip)
	xorq	%rdx, %rax
	jns	.L244
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L243:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L156
	.p2align 4,,10
	.p2align 3
.L154:
	incq	-200(%rbp)
	movq	-200(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L150
	movq	-208(%rbp), %rbx
	movq	-216(%rbp), %r13
.L149:
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -248(%rbp)
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC33(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L245
.L159:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC36(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC22(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -128(%rbp)
	movq	$0, -120(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	cmpq	$0, -224(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L160
	cmpq	$0, -176(%rbp)
	jle	.L160
	leaq	-120(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, -184(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC21(%rip), %xmm4
	vmovsd	.LC32(%rip), %xmm6
	movq	$0, -208(%rbp)
	movq	%rax, -232(%rbp)
	movq	%rbx, -216(%rbp)
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	-176(%rbp), %rbx
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm3, -144(%rbp)
	vmovsd	%xmm4, -152(%rbp)
	vmovsd	%xmm6, -136(%rbp)
	.p2align 4,,10
	.p2align 3
.L161:
	movq	-232(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -160(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -168(%rbp)
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L249:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L163:
	vaddsd	-144(%rbp), %xmm0, %xmm0
	vmovsd	.LC22(%rip), %xmm7
	vmovsd	.LC23(%rip), %xmm6
	vmulsd	-152(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-160(%rbp), %xmm6
	vfmadd132sd	-168(%rbp), %xmm6, %xmm0
	vmovsd	.LC30(%rip), %xmm6
	vfmadd132sd	-136(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L246
.L168:
	movq	(%r12,%rdx,8), %rax
	leaq	1(%rdx), %r11
	movq	%rax, %rdx
	movabsq	$6148914691236517205, %rsi
	shrq	$29, %rdx
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	movabsq	$8202884508482404352, %rsi
	salq	$17, %rdx
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$37, %rdx
	movabsq	$-2270628950310912, %rsi
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$43, %rdx
	movq	%r11, 2496+_ZL3gen(%rip)
	xorq	%rdx, %rax
	js	.L169
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L170:
	vaddsd	-144(%rbp), %xmm1, %xmm1
	vmulsd	-152(%rbp), %xmm1, %xmm1
	vcomisd	.LC22(%rip), %xmm1
	jnb	.L171
	vmovsd	-160(%rbp), %xmm4
	movq	-192(%rbp), %r9
	vfmadd132sd	-168(%rbp), %xmm4, %xmm1
	movq	-184(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L240:
	vmovsd	.LC30(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-136(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L247
.L174:
	cmpq	$311, %r11
	ja	.L248
.L167:
	movq	(%r12,%r11,8), %rax
	movabsq	$6148914691236517205, %rsi
	movq	%rax, %rcx
	shrq	$29, %rcx
	andq	%rsi, %rcx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	movabsq	$8202884508482404352, %rsi
	salq	$17, %rcx
	andq	%rsi, %rcx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$37, %rcx
	movabsq	$-2270628950310912, %rsi
	andq	%rsi, %rcx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	leaq	1(%r11), %rdx
	shrq	$43, %rcx
	movq	%rdx, 2496+_ZL3gen(%rip)
	xorq	%rcx, %rax
	jns	.L249
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L170
	.p2align 4,,10
	.p2align 3
.L246:
	movq	%r12, %rdi
	vmovsd	%xmm0, -200(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-200(%rbp), %xmm0
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L248:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L247:
	incq	-208(%rbp)
	movq	-208(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L161
	movq	-216(%rbp), %rbx
.L160:
	movq	-248(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC37(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L250
.L175:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC36(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC22(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -128(%rbp)
	movq	$0, -120(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	cmpq	$0, -224(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L176
	cmpq	$0, -176(%rbp)
	jle	.L176
	movq	.LC22(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC21(%rip), %xmm6
	vmovsd	.LC32(%rip), %xmm7
	movq	$0, -216(%rbp)
	movq	%rax, -232(%rbp)
	xorl	%r10d, %r10d
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm4, -144(%rbp)
	movl	$134201207, %esi
	vmovsd	.LC9(%rip), %xmm3
	vmovsd	.LC10(%rip), %xmm4
	vmovsd	%xmm6, -152(%rbp)
	vmovsd	%xmm7, -136(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	salq	$37, %rsi
	movq	%r10, %r14
	movq	%r12, %r11
	.p2align 4,,10
	.p2align 3
.L177:
	movq	-232(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm6
	vmovsd	(%rax), %xmm7
	xorl	%r12d, %r12d
	vsubsd	%xmm7, %xmm6, %xmm6
	movq	%r14, %rax
	movq	2496+_ZL3gen(%rip), %rdi
	movq	%r12, %r14
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L190:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L251
.L183:
	leaq	1(%rax), %rdi
	movq	(%r11,%rax,8), %rax
	movq	%rdi, 2496+_ZL3gen(%rip)
	movq	%rax, %rdx
	shrq	$29, %rdx
	andq	%r9, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$17, %rdx
	andq	%r8, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$37, %rdx
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$43, %rdx
	xorq	%rdx, %rax
	js	.L178
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L179:
	vaddsd	-144(%rbp), %xmm5, %xmm5
	vmovsd	.LC22(%rip), %xmm2
	vmovsd	.LC23(%rip), %xmm1
	vmulsd	-152(%rbp), %xmm5, %xmm5
	movq	%r12, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC30(%rip), %xmm1
	vfmadd132sd	-136(%rbp), %xmm1, %xmm5
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L253:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L186:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L252
.L188:
	vmovsd	0(%r13,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L253
	vcomisd	%xmm0, %xmm4
	jbe	.L186
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L188
.L252:
	vmovsd	%xmm0, -128(%rbp)
	testb	%cl, %cl
	je	.L189
	movq	%rdx, -120(%rbp)
	movq	%rdx, %r12
.L189:
	incq	%r14
	cmpq	%r14, -176(%rbp)
	jne	.L190
	incq	-216(%rbp)
	movq	%r12, %r14
	movq	-216(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L177
.L176:
	movq	-248(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC38(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L254
.L191:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC36(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC22(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -128(%rbp)
	movq	$0, -120(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	cmpq	$0, -224(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L192
	cmpq	$0, -176(%rbp)
	jle	.L192
	movq	.LC22(%rip), %rax
	vmovsd	.LC32(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC21(%rip), %xmm7
	movq	$0, -240(%rbp)
	movq	%rax, -232(%rbp)
	movq	%r15, -160(%rbp)
	addq	%r15, %rbx
	xorl	%esi, %esi
	leaq	_ZL3gen(%rip), %r12
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	%xmm3, -136(%rbp)
	vmovsd	.LC10(%rip), %xmm4
	vmovsd	.LC9(%rip), %xmm3
	movq	%r13, -256(%rbp)
	vmovsd	%xmm6, -144(%rbp)
	vmovsd	%xmm7, -152(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	movabsq	$-2270628950310912, %r14
	movq	%rsi, %r13
	xchgq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L193:
	movq	-232(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm6
	vmovsd	(%rax), %xmm7
	xorl	%r15d, %r15d
	vsubsd	%xmm7, %xmm6, %xmm6
	movq	%rbx, %rax
	movq	2496+_ZL3gen(%rip), %rdi
	movq	%r13, %rbx
	movq	%r15, %r13
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L211:
	cmpq	$311, %rdi
	ja	.L255
.L199:
	movq	(%r15,%rdi,8), %rdx
	leaq	1(%rdi), %rax
	movq	%rdx, %rcx
	shrq	$29, %rcx
	andq	%r9, %rcx
	xorq	%rcx, %rdx
	movq	%rdx, %rcx
	salq	$17, %rcx
	andq	%r8, %rcx
	xorq	%rcx, %rdx
	movq	%rdx, %rcx
	salq	$37, %rcx
	andq	%r14, %rcx
	xorq	%rcx, %rdx
	movq	%rdx, %rcx
	shrq	$43, %rcx
	movq	%rax, 2496+_ZL3gen(%rip)
	xorq	%rcx, %rdx
	js	.L194
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L195:
	vaddsd	-144(%rbp), %xmm5, %xmm5
	vmovsd	.LC22(%rip), %xmm2
	vmulsd	-152(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC23(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC30(%rip), %xmm1
	vfmadd132sd	-136(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L256
.L200:
	leaq	1(%rax), %rdi
	movq	(%r15,%rax,8), %rax
	movq	%rdi, 2496+_ZL3gen(%rip)
	movq	%rax, %rdx
	shrq	$29, %rdx
	andq	%r9, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$17, %rdx
	andq	%r8, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$37, %rdx
	andq	%r14, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$43, %rdx
	xorq	%rdx, %rax
	js	.L201
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L202:
	vaddsd	-144(%rbp), %xmm2, %xmm2
	vmovsd	.LC22(%rip), %xmm1
	vmovsd	.LC30(%rip), %xmm9
	vmulsd	-152(%rbp), %xmm2, %xmm2
	movq	-160(%rbp), %rax
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC23(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	-136(%rbp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L258:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L207:
	addq	$8, %rax
	cmpq	%rax, %r12
	je	.L257
.L209:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L258
	vcomisd	%xmm0, %xmm4
	jbe	.L207
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r12
	jne	.L209
.L257:
	vmovsd	%xmm0, -128(%rbp)
	testb	%cl, %cl
	je	.L210
	movq	%rdx, -120(%rbp)
	movq	%rdx, %rbx
.L210:
	incq	%r13
	cmpq	%r13, -176(%rbp)
	jne	.L211
	incq	-240(%rbp)
	movq	%rbx, %r13
	movq	%r15, %rbx
	movq	-240(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L193
	movq	-160(%rbp), %r15
	movq	-256(%rbp), %r13
.L192:
	movq	-248(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC39(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L259
.L212:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC36(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZdaPv@PLT
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L201:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L194:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L195
	.p2align 4,,10
	.p2align 3
.L178:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L179
	.p2align 4,,10
	.p2align 3
.L256:
	movq	%r15, %rdi
	vmovsd	%xmm0, -216(%rbp)
	vmovsd	%xmm3, -208(%rbp)
	vmovsd	%xmm4, -200(%rbp)
	vmovsd	%xmm6, -192(%rbp)
	vmovsd	%xmm7, -184(%rbp)
	vmovsd	%xmm5, -168(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	-216(%rbp), %xmm0
	vmovsd	-208(%rbp), %xmm3
	vmovsd	-200(%rbp), %xmm4
	vmovsd	-192(%rbp), %xmm6
	vmovsd	-184(%rbp), %xmm7
	vmovsd	-168(%rbp), %xmm5
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L255:
	movq	%r15, %rdi
	vmovsd	%xmm0, -208(%rbp)
	vmovsd	%xmm3, -200(%rbp)
	vmovsd	%xmm4, -192(%rbp)
	vmovsd	%xmm6, -184(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdi
	vmovsd	-208(%rbp), %xmm0
	vmovsd	-200(%rbp), %xmm3
	vmovsd	-192(%rbp), %xmm4
	vmovsd	-184(%rbp), %xmm6
	vmovsd	-168(%rbp), %xmm7
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L251:
	movq	%r11, %rdi
	movq	%r11, -160(%rbp)
	vmovsd	%xmm0, -208(%rbp)
	vmovsd	%xmm6, -200(%rbp)
	vmovsd	%xmm3, -192(%rbp)
	vmovsd	%xmm4, -184(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	-208(%rbp), %xmm0
	vmovsd	-200(%rbp), %xmm6
	vmovsd	-192(%rbp), %xmm3
	vmovsd	-184(%rbp), %xmm4
	vmovsd	-168(%rbp), %xmm7
	movq	-160(%rbp), %r11
	movabsq	$-2270628950310912, %rsi
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L171:
	vmovsd	-168(%rbp), %xmm1
	vmovsd	-160(%rbp), %xmm7
	movq	-192(%rbp), %r9
	vfmadd132sd	.LC23(%rip), %xmm7, %xmm1
	movq	-184(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L153:
	vmovsd	.LC23(%rip), %xmm0
	vmovsd	-160(%rbp), %xmm3
	vmovsd	.LC30(%rip), %xmm4
	vfmadd132sd	-168(%rbp), %xmm3, %xmm0
	vfmadd132sd	-136(%rbp), %xmm4, %xmm0
	jmp	.L239
.L146:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	%rcx, %rdx
	je	.L147
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rdx
	jmp	.L147
.L259:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L212
.L254:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L191
.L250:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L175
.L245:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L159
.L242:
	call	_ZSt16__throw_bad_castv@PLT
.L241:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8816:
.L148:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -64
	.cfi_offset 6, -16
	.cfi_offset 10, -56
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	call	__cxa_throw_bad_array_new_length@PLT
	.cfi_endproc
.LFE8816:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE45:
	.section	.text.startup
.LHOTE45:
	.p2align 4
	.type	_GLOBAL__sub_I__Z21init_random_positionslddPd, @function
_GLOBAL__sub_I__Z21init_random_positionslddPd:
.LFB9231:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	__dso_handle(%rip), %rdx
	movq	%rbp, %rsi
	call	__cxa_atexit@PLT
	movq	$5489, _ZL3gen(%rip)
	movl	$5489, %ecx
	movl	$1, %edx
	leaq	_ZL3gen(%rip), %rdi
	movabsq	$6364136223846793005, %rsi
	.p2align 4,,10
	.p2align 3
.L261:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L261
	vmovapd	.LC46(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9231:
	.size	_GLOBAL__sub_I__Z21init_random_positionslddPd, .-_GLOBAL__sub_I__Z21init_random_positionslddPd
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z21init_random_positionslddPd
	.local	_ZL5distu
	.comm	_ZL5distu,16,16
	.local	_ZL3gen
	.comm	_ZL3gen,2504,32
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC1:
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.align 32
.LC2:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC6:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC7:
	.long	0
	.long	1340080128
	.long	0
	.long	1340080128
	.long	0
	.long	1340080128
	.long	0
	.long	1340080128
	.align 32
.LC8:
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.set	.LC9,.LC7
	.set	.LC10,.LC8
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC11:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst32
	.align 32
.LC12:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC13:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC14:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC15:
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.set	.LC16,.LC12
	.set	.LC17,.LC13
	.set	.LC18,.LC14
	.set	.LC19,.LC15
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC21:
	.long	0
	.long	1005584384
	.set	.LC22,.LC2
	.align 8
.LC23:
	.long	-1
	.long	1072693247
	.section	.rodata.cst32
	.align 32
.LC29:
	.long	0
	.long	1074790400
	.long	0
	.long	1074266112
	.long	0
	.long	1073741824
	.long	0
	.long	1072693248
	.section	.rodata.cst8
	.align 8
.LC30:
	.long	0
	.long	-1074790400
	.align 8
.LC31:
	.long	-1598689907
	.long	1051772663
	.set	.LC32,.LC29+16
	.set	.LC46,.LC6
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
