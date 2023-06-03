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
.LFB9250:
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
.LFE9250:
	.size	_ZN9stopwatch4stopEv.part.0, .-_ZN9stopwatch4stopEv.part.0
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB9255:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	movq	240(%rdi,%rax), %r12
	testq	%r12, %r12
	je	.L11
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L7
	movsbl	67(%r12), %esi
.L8:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L7:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L8
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L8
.L11:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE9255:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Expected a == b but "
.LC1:
	.string	" != "
.LC2:
	.string	"assertion failed"
	.text
	.p2align 4
	.type	_Z9assert_eqIlEvT_S0_.part.0, @function
_Z9assert_eqIlEvT_S0_.part.0:
.LFB9252:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	_ZSt4cerr(%rip), %r13
	movl	$20, %edx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	leaq	.LC0(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	movq	%r13, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rbp
	movl	$4, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %r12
	testq	%r12, %r12
	je	.L18
	cmpb	$0, 56(%r12)
	je	.L14
	movsbl	67(%r12), %esi
.L15:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movl	$8, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rdi
	leaq	.LC2(%rip), %rax
	movq	%rax, (%rdi)
	xorl	%edx, %edx
	leaq	_ZTIPKc(%rip), %rsi
	call	__cxa_throw@PLT
.L14:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L15
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L15
.L18:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE9252:
	.size	_Z9assert_eqIlEvT_S0_.part.0, .-_Z9assert_eqIlEvT_S0_.part.0
	.section	.rodata.str1.1
.LC3:
	.string	"Expected a ~= b but "
	.text
	.p2align 4
	.type	_Z13assert_approxdd.part.0, @function
_Z13assert_approxdd.part.0:
.LFB9251:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$20, %edx
	leaq	.LC3(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	_ZSt4cerr(%rip), %rbp
	movq	%rbp, %rdi
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	%xmm1, (%rsp)
	vmovsd	%xmm0, 8(%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	8(%rsp), %xmm0
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$4, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	(%rsp), %xmm1
	movq	%rbp, %rdi
	vmovsd	%xmm1, %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %r12
	testq	%r12, %r12
	je	.L25
	cmpb	$0, 56(%r12)
	je	.L21
	movsbl	67(%r12), %esi
.L22:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movl	$8, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rdi
	leaq	.LC2(%rip), %rax
	movq	%rax, (%rdi)
	xorl	%edx, %edx
	leaq	_ZTIPKc(%rip), %rsi
	call	__cxa_throw@PLT
.L21:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L22
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L22
.L25:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE9251:
	.size	_Z13assert_approxdd.part.0, .-_Z13assert_approxdd.part.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"void prod_realreal(long int, long int, double, const double*, double&, long int&)"
	.section	.rodata.str1.1
.LC6:
	.string	"test_simple_problem.cpp"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"reinterpret_cast<uintptr_t>(x) % 8 == 0"
	.text
	.p2align 4
	.type	_Z13prod_realreallldPKdRdRl.constprop.0, @function
_Z13prod_realreallldPKdRdRl.constprop.0:
.LFB9258:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %r9
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	andq	$-32, %rsp
	.cfi_offset 3, -24
	testb	$7, %dil
	jne	.L340
	vmovapd	.LC8(%rip), %ymm9
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm2
	vmovlpd	(%rsi), %xmm9, %xmm0
	vmovapd	.LC4(%rip), %ymm11
	movq	%rdx, %r8
	vinsertf128	$0x0, %xmm0, %ymm9, %ymm9
	movq	(%rdx), %rdx
	vmovapd	.LC9(%rip), %ymm0
	vmovapd	.LC10(%rip), %ymm10
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC12(%rip), %ymm1
	movq	%rsi, %rdi
	movq	%r9, %rax
	vmovapd	%ymm2, %ymm7
	vmovapd	%ymm2, %ymm4
	vmovapd	%ymm2, %ymm6
	vmovapd	%ymm2, %ymm3
	vmovapd	%ymm2, %ymm12
	xorl	%ecx, %ecx
	vmovapd	%ymm11, %ymm8
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L46:
	vsubpd	(%rax), %ymm0, %ymm13
	movq	%rsi, %rbx
	shrq	$5, %rbx
	vmulpd	%ymm13, %ymm9, %ymm9
	vsubpd	32(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm2, %ymm2
	vsubpd	64(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm12, %ymm12
	vsubpd	96(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm3, %ymm3
	vsubpd	128(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm8, %ymm8
	vsubpd	160(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm6, %ymm6
	vsubpd	192(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm4, %ymm4
	vsubpd	224(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm7, %ymm7
	je	.L341
	addq	$32, %rsi
	addq	$256, %rax
	cmpq	$256, %rsi
	jne	.L46
	vandnpd	%ymm9, %ymm10, %ymm9
	vcmppd	$13, %ymm5, %ymm9, %ymm14
	vcmppd	$2, %ymm1, %ymm9, %ymm13
	vmovmskpd	%ymm14, %esi
	vmovmskpd	%ymm13, %eax
	testl	%esi, %esi
	je	.L47
	vmulpd	%ymm1, %ymm9, %ymm15
	popcntl	%esi, %esi
	addq	%rsi, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L47:
	testl	%eax, %eax
	je	.L48
	vmulpd	%ymm5, %ymm9, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L48:
	vandnpd	%ymm2, %ymm10, %ymm2
	vcmppd	$13, %ymm5, %ymm2, %ymm14
	vcmppd	$2, %ymm1, %ymm2, %ymm13
	vmovmskpd	%ymm14, %esi
	vmovmskpd	%ymm13, %eax
	testl	%esi, %esi
	je	.L49
	vmulpd	%ymm1, %ymm2, %ymm15
	popcntl	%esi, %esi
	addq	%rsi, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm2, %ymm2
.L49:
	testl	%eax, %eax
	je	.L50
	vmulpd	%ymm5, %ymm2, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm2, %ymm2
.L50:
	vandnpd	%ymm12, %ymm10, %ymm12
	vcmppd	$13, %ymm5, %ymm12, %ymm14
	vcmppd	$2, %ymm1, %ymm12, %ymm13
	vmovmskpd	%ymm14, %esi
	vmovmskpd	%ymm13, %eax
	testl	%esi, %esi
	je	.L51
	vmulpd	%ymm1, %ymm12, %ymm15
	popcntl	%esi, %esi
	addq	%rsi, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm12, %ymm12
.L51:
	testl	%eax, %eax
	je	.L52
	vmulpd	%ymm5, %ymm12, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm12, %ymm12
.L52:
	vandnpd	%ymm3, %ymm10, %ymm3
	vcmppd	$13, %ymm5, %ymm3, %ymm14
	vcmppd	$2, %ymm1, %ymm3, %ymm13
	vmovmskpd	%ymm14, %esi
	vmovmskpd	%ymm13, %eax
	testl	%esi, %esi
	je	.L53
	vmulpd	%ymm1, %ymm3, %ymm15
	popcntl	%esi, %esi
	addq	%rsi, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
.L53:
	testl	%eax, %eax
	je	.L54
	vmulpd	%ymm5, %ymm3, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
.L54:
	vandnpd	%ymm8, %ymm10, %ymm8
	vcmppd	$13, %ymm5, %ymm8, %ymm14
	vcmppd	$2, %ymm1, %ymm8, %ymm13
	vmovmskpd	%ymm14, %esi
	vmovmskpd	%ymm13, %eax
	testl	%esi, %esi
	je	.L55
	vmulpd	%ymm1, %ymm8, %ymm15
	popcntl	%esi, %esi
	addq	%rsi, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L55:
	testl	%eax, %eax
	je	.L56
	vmulpd	%ymm5, %ymm8, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L56:
	vandnpd	%ymm6, %ymm10, %ymm6
	vcmppd	$13, %ymm5, %ymm6, %ymm14
	vcmppd	$2, %ymm1, %ymm6, %ymm13
	vmovmskpd	%ymm14, %esi
	vmovmskpd	%ymm13, %eax
	testl	%esi, %esi
	je	.L57
	vmulpd	%ymm1, %ymm6, %ymm15
	popcntl	%esi, %esi
	addq	%rsi, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L57:
	testl	%eax, %eax
	je	.L58
	vmulpd	%ymm5, %ymm6, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L58:
	vandnpd	%ymm4, %ymm10, %ymm4
	vcmppd	$13, %ymm5, %ymm4, %ymm14
	vcmppd	$2, %ymm1, %ymm4, %ymm13
	vmovmskpd	%ymm14, %esi
	vmovmskpd	%ymm13, %eax
	testl	%esi, %esi
	je	.L59
	vmulpd	%ymm1, %ymm4, %ymm15
	popcntl	%esi, %esi
	addq	%rsi, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm4, %ymm4
.L59:
	testl	%eax, %eax
	je	.L60
	vmulpd	%ymm5, %ymm4, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm4, %ymm4
.L60:
	vandnpd	%ymm7, %ymm10, %ymm7
	vcmppd	$13, %ymm5, %ymm7, %ymm14
	vcmppd	$2, %ymm1, %ymm7, %ymm13
	vmovmskpd	%ymm14, %esi
	vmovmskpd	%ymm13, %eax
	testl	%esi, %esi
	je	.L61
	vmulpd	%ymm1, %ymm7, %ymm15
	popcntl	%esi, %esi
	addq	%rsi, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
.L61:
	testl	%eax, %eax
	jne	.L342
.L62:
	leaq	2304(%r9), %r10
	movq	%r10, %rax
	movl	$288, %esi
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L63:
	addq	$32, %rsi
	addq	$256, %rax
	cmpq	$16000, %rsi
	je	.L343
.L79:
	vsubpd	(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm9, %ymm9
	vsubpd	32(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm2, %ymm2
	vsubpd	64(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm12, %ymm12
	vsubpd	96(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm3, %ymm3
	vsubpd	128(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm8, %ymm8
	vsubpd	160(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm6, %ymm6
	vsubpd	192(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm4, %ymm4
	vsubpd	224(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm7, %ymm7
	testb	$-32, %sil
	jne	.L63
	vandnpd	%ymm9, %ymm10, %ymm9
	vcmppd	$13, %ymm5, %ymm9, %ymm14
	vcmppd	$2, %ymm1, %ymm9, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %r11d
	testl	%ebx, %ebx
	je	.L64
	vmulpd	%ymm1, %ymm9, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L64:
	testl	%r11d, %r11d
	je	.L65
	vmulpd	%ymm5, %ymm9, %ymm14
	popcntl	%r11d, %r11d
	subq	%r11, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L65:
	vandnpd	%ymm2, %ymm10, %ymm2
	vcmppd	$13, %ymm5, %ymm2, %ymm14
	vcmppd	$2, %ymm1, %ymm2, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %r11d
	testl	%ebx, %ebx
	je	.L66
	vmulpd	%ymm1, %ymm2, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm2, %ymm2
.L66:
	testl	%r11d, %r11d
	je	.L67
	vmulpd	%ymm5, %ymm2, %ymm14
	popcntl	%r11d, %r11d
	subq	%r11, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm2, %ymm2
.L67:
	vandnpd	%ymm12, %ymm10, %ymm12
	vcmppd	$13, %ymm5, %ymm12, %ymm14
	vcmppd	$2, %ymm1, %ymm12, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %r11d
	testl	%ebx, %ebx
	je	.L68
	vmulpd	%ymm1, %ymm12, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm12, %ymm12
.L68:
	testl	%r11d, %r11d
	je	.L69
	vmulpd	%ymm5, %ymm12, %ymm14
	popcntl	%r11d, %r11d
	subq	%r11, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm12, %ymm12
.L69:
	vandnpd	%ymm3, %ymm10, %ymm3
	vcmppd	$13, %ymm5, %ymm3, %ymm14
	vcmppd	$2, %ymm1, %ymm3, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %r11d
	testl	%ebx, %ebx
	je	.L70
	vmulpd	%ymm1, %ymm3, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
.L70:
	testl	%r11d, %r11d
	je	.L71
	vmulpd	%ymm5, %ymm3, %ymm14
	popcntl	%r11d, %r11d
	subq	%r11, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
.L71:
	vandnpd	%ymm8, %ymm10, %ymm8
	vcmppd	$13, %ymm5, %ymm8, %ymm14
	vcmppd	$2, %ymm1, %ymm8, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %r11d
	testl	%ebx, %ebx
	je	.L72
	vmulpd	%ymm1, %ymm8, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L72:
	testl	%r11d, %r11d
	je	.L73
	vmulpd	%ymm5, %ymm8, %ymm14
	popcntl	%r11d, %r11d
	subq	%r11, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L73:
	vandnpd	%ymm6, %ymm10, %ymm6
	vcmppd	$13, %ymm5, %ymm6, %ymm14
	vcmppd	$2, %ymm1, %ymm6, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %r11d
	testl	%ebx, %ebx
	je	.L74
	vmulpd	%ymm1, %ymm6, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L74:
	testl	%r11d, %r11d
	je	.L75
	vmulpd	%ymm5, %ymm6, %ymm14
	popcntl	%r11d, %r11d
	subq	%r11, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L75:
	vandnpd	%ymm4, %ymm10, %ymm4
	vcmppd	$13, %ymm5, %ymm4, %ymm14
	vcmppd	$2, %ymm1, %ymm4, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %r11d
	testl	%ebx, %ebx
	je	.L76
	vmulpd	%ymm1, %ymm4, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm4, %ymm4
.L76:
	testl	%r11d, %r11d
	je	.L77
	vmulpd	%ymm5, %ymm4, %ymm14
	popcntl	%r11d, %r11d
	subq	%r11, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm4, %ymm4
.L77:
	vandnpd	%ymm7, %ymm10, %ymm7
	vcmppd	$13, %ymm5, %ymm7, %ymm14
	vcmppd	$2, %ymm1, %ymm7, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %r11d
	testl	%ebx, %ebx
	je	.L78
	vmulpd	%ymm1, %ymm7, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
.L78:
	testl	%r11d, %r11d
	je	.L63
	vmulpd	%ymm5, %ymm7, %ymm14
	popcntl	%r11d, %r11d
	subq	%r11, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L341:
	vandnpd	%ymm9, %ymm10, %ymm9
	vcmppd	$13, %ymm5, %ymm9, %ymm14
	vcmppd	$2, %ymm1, %ymm9, %ymm13
	vmovmskpd	%ymm14, %r11d
	vmovmskpd	%ymm13, %r10d
	testl	%r11d, %r11d
	je	.L29
	vmulpd	%ymm1, %ymm9, %ymm15
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L29:
	testl	%r10d, %r10d
	je	.L30
	vmulpd	%ymm5, %ymm9, %ymm14
	popcntl	%r10d, %r10d
	subq	%r10, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L30:
	vandnpd	%ymm2, %ymm10, %ymm2
	vcmppd	$13, %ymm5, %ymm2, %ymm14
	vcmppd	$2, %ymm1, %ymm2, %ymm13
	vmovmskpd	%ymm14, %r11d
	vmovmskpd	%ymm13, %r10d
	testl	%r11d, %r11d
	je	.L31
	vmulpd	%ymm1, %ymm2, %ymm15
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm2, %ymm2
.L31:
	testl	%r10d, %r10d
	je	.L32
	vmulpd	%ymm5, %ymm2, %ymm14
	popcntl	%r10d, %r10d
	subq	%r10, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm2, %ymm2
.L32:
	vandnpd	%ymm12, %ymm10, %ymm12
	vcmppd	$13, %ymm5, %ymm12, %ymm14
	vcmppd	$2, %ymm1, %ymm12, %ymm13
	vmovmskpd	%ymm14, %r11d
	vmovmskpd	%ymm13, %r10d
	testl	%r11d, %r11d
	je	.L33
	vmulpd	%ymm1, %ymm12, %ymm15
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm12, %ymm12
.L33:
	testl	%r10d, %r10d
	je	.L34
	vmulpd	%ymm5, %ymm12, %ymm14
	popcntl	%r10d, %r10d
	subq	%r10, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm12, %ymm12
.L34:
	vandnpd	%ymm3, %ymm10, %ymm3
	vcmppd	$13, %ymm5, %ymm3, %ymm14
	vcmppd	$2, %ymm1, %ymm3, %ymm13
	vmovmskpd	%ymm14, %r11d
	vmovmskpd	%ymm13, %r10d
	testl	%r11d, %r11d
	je	.L35
	vmulpd	%ymm1, %ymm3, %ymm15
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
.L35:
	testl	%r10d, %r10d
	je	.L36
	vmulpd	%ymm5, %ymm3, %ymm14
	popcntl	%r10d, %r10d
	subq	%r10, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
.L36:
	vandnpd	%ymm8, %ymm10, %ymm8
	vcmppd	$13, %ymm5, %ymm8, %ymm14
	vcmppd	$2, %ymm1, %ymm8, %ymm13
	vmovmskpd	%ymm14, %r11d
	vmovmskpd	%ymm13, %r10d
	testl	%r11d, %r11d
	je	.L37
	vmulpd	%ymm1, %ymm8, %ymm15
	popcntl	%r11d, %r11d
	addq	%r11, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L37:
	testl	%r10d, %r10d
	je	.L38
	vmulpd	%ymm5, %ymm8, %ymm14
	popcntl	%r10d, %r10d
	subq	%r10, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L38:
	vandnpd	%ymm6, %ymm10, %ymm6
	vcmppd	$13, %ymm5, %ymm6, %ymm14
	vcmppd	$2, %ymm1, %ymm6, %ymm13
	vmovmskpd	%ymm14, %r11d
	vmovmskpd	%ymm13, %r10d
	testl	%r11d, %r11d
	je	.L39
	vmulpd	%ymm1, %ymm6, %ymm15
	popcntl	%r11d, %r11d
	addq	%r11, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L39:
	testl	%r10d, %r10d
	je	.L40
	vmulpd	%ymm5, %ymm6, %ymm14
	popcntl	%r10d, %r10d
	subq	%r10, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L40:
	vandnpd	%ymm4, %ymm10, %ymm4
	vcmppd	$13, %ymm5, %ymm4, %ymm14
	vcmppd	$2, %ymm1, %ymm4, %ymm13
	vmovmskpd	%ymm14, %r11d
	vmovmskpd	%ymm13, %r10d
	testl	%r11d, %r11d
	je	.L41
	vmulpd	%ymm1, %ymm4, %ymm15
	popcntl	%r11d, %r11d
	addq	%r11, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm4, %ymm4
.L41:
	testl	%r10d, %r10d
	je	.L42
	vmulpd	%ymm5, %ymm4, %ymm14
	popcntl	%r10d, %r10d
	subq	%r10, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm4, %ymm4
.L42:
	vandnpd	%ymm7, %ymm10, %ymm7
	vcmppd	$13, %ymm5, %ymm7, %ymm14
	vcmppd	$2, %ymm1, %ymm7, %ymm13
	vmovmskpd	%ymm14, %r11d
	vmovmskpd	%ymm13, %r10d
	testl	%r11d, %r11d
	je	.L43
	vmulpd	%ymm1, %ymm7, %ymm15
	popcntl	%r11d, %r11d
	addq	%r11, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
.L43:
	testl	%r10d, %r10d
	je	.L44
	vmulpd	%ymm5, %ymm7, %ymm14
	popcntl	%r10d, %r10d
	subq	%r10, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
.L44:
	addq	$32, %rsi
	addq	$256, %rax
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L343:
	vandnpd	%ymm9, %ymm10, %ymm9
	vcmppd	$13, %ymm5, %ymm9, %ymm13
	vcmppd	$2, %ymm1, %ymm9, %ymm0
	vmovmskpd	%ymm13, %esi
	vmovmskpd	%ymm0, %eax
	testl	%esi, %esi
	je	.L80
	vmulpd	%ymm1, %ymm9, %ymm14
	popcntl	%esi, %esi
	addq	%rsi, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L80:
	testl	%eax, %eax
	je	.L81
	vmulpd	%ymm5, %ymm9, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm0, %ymm13, %ymm9, %ymm9
.L81:
	vandnpd	%ymm2, %ymm10, %ymm2
	vcmppd	$13, %ymm5, %ymm2, %ymm13
	vcmppd	$2, %ymm1, %ymm2, %ymm0
	vmovmskpd	%ymm13, %esi
	vmovmskpd	%ymm0, %eax
	testl	%esi, %esi
	je	.L82
	vmulpd	%ymm1, %ymm2, %ymm14
	popcntl	%esi, %esi
	addq	%rsi, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm2, %ymm2
.L82:
	testl	%eax, %eax
	je	.L83
	vmulpd	%ymm5, %ymm2, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm0, %ymm13, %ymm2, %ymm2
.L83:
	vandnpd	%ymm12, %ymm10, %ymm12
	vcmppd	$13, %ymm5, %ymm12, %ymm13
	vcmppd	$2, %ymm1, %ymm12, %ymm0
	vmovmskpd	%ymm13, %esi
	vmovmskpd	%ymm0, %eax
	testl	%esi, %esi
	je	.L84
	vmulpd	%ymm1, %ymm12, %ymm14
	popcntl	%esi, %esi
	addq	%rsi, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm12, %ymm12
.L84:
	testl	%eax, %eax
	je	.L85
	vmulpd	%ymm5, %ymm12, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm0, %ymm13, %ymm12, %ymm12
.L85:
	vandnpd	%ymm3, %ymm10, %ymm3
	vcmppd	$13, %ymm5, %ymm3, %ymm13
	vcmppd	$2, %ymm1, %ymm3, %ymm0
	vmovmskpd	%ymm13, %esi
	vmovmskpd	%ymm0, %eax
	testl	%esi, %esi
	je	.L86
	vmulpd	%ymm1, %ymm3, %ymm14
	popcntl	%esi, %esi
	addq	%rsi, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
.L86:
	testl	%eax, %eax
	je	.L87
	vmulpd	%ymm5, %ymm3, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm0, %ymm13, %ymm3, %ymm3
.L87:
	vandnpd	%ymm8, %ymm10, %ymm8
	vcmppd	$13, %ymm5, %ymm8, %ymm13
	vcmppd	$2, %ymm1, %ymm8, %ymm0
	vmovmskpd	%ymm13, %esi
	vmovmskpd	%ymm0, %eax
	testl	%esi, %esi
	je	.L88
	vmulpd	%ymm1, %ymm8, %ymm14
	popcntl	%esi, %esi
	addq	%rsi, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L88:
	testl	%eax, %eax
	je	.L89
	vmulpd	%ymm5, %ymm8, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm0, %ymm13, %ymm8, %ymm8
.L89:
	vandnpd	%ymm6, %ymm10, %ymm6
	vcmppd	$13, %ymm5, %ymm6, %ymm13
	vcmppd	$2, %ymm1, %ymm6, %ymm0
	vmovmskpd	%ymm13, %esi
	vmovmskpd	%ymm0, %eax
	testl	%esi, %esi
	je	.L90
	vmulpd	%ymm1, %ymm6, %ymm14
	popcntl	%esi, %esi
	addq	%rsi, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L90:
	testl	%eax, %eax
	je	.L91
	vmulpd	%ymm5, %ymm6, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm0, %ymm13, %ymm6, %ymm6
.L91:
	vandnpd	%ymm4, %ymm10, %ymm4
	vcmppd	$13, %ymm5, %ymm4, %ymm13
	vcmppd	$2, %ymm1, %ymm4, %ymm0
	vmovmskpd	%ymm13, %esi
	vmovmskpd	%ymm0, %eax
	testl	%esi, %esi
	je	.L92
	vmulpd	%ymm1, %ymm4, %ymm14
	popcntl	%esi, %esi
	addq	%rsi, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm4, %ymm4
.L92:
	testl	%eax, %eax
	je	.L93
	vmulpd	%ymm5, %ymm4, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm0, %ymm13, %ymm4, %ymm4
.L93:
	vandnpd	%ymm7, %ymm10, %ymm7
	vcmppd	$13, %ymm5, %ymm7, %ymm13
	vcmppd	$2, %ymm1, %ymm7, %ymm0
	vmovmskpd	%ymm13, %esi
	vmovmskpd	%ymm0, %eax
	testl	%esi, %esi
	je	.L94
	vmulpd	%ymm1, %ymm7, %ymm14
	popcntl	%esi, %esi
	addq	%rsi, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
.L94:
	testl	%eax, %eax
	jne	.L344
.L95:
	vmulpd	%ymm8, %ymm9, %ymm8
	vandnpd	%ymm8, %ymm10, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm13
	vcmppd	$2, %ymm1, %ymm0, %ymm9
	vmovmskpd	%ymm13, %eax
	vmovmskpd	%ymm9, %esi
	movl	%eax, %ebx
	orl	%esi, %ebx
	jne	.L345
.L96:
	vmulpd	%ymm6, %ymm2, %ymm6
	vandnpd	%ymm6, %ymm10, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm9
	vcmppd	$2, %ymm1, %ymm0, %ymm2
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm2, %esi
	movl	%eax, %ebx
	orl	%esi, %ebx
	jne	.L346
.L97:
	vmulpd	%ymm4, %ymm12, %ymm4
	vandnpd	%ymm4, %ymm10, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm9
	vcmppd	$2, %ymm1, %ymm0, %ymm2
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm2, %esi
	movl	%eax, %ebx
	orl	%esi, %ebx
	jne	.L347
.L98:
	vmulpd	%ymm3, %ymm7, %ymm7
	vandnpd	%ymm7, %ymm10, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm3
	vcmppd	$2, %ymm1, %ymm0, %ymm2
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm2, %esi
	movl	%eax, %ebx
	orl	%esi, %ebx
	jne	.L348
.L99:
	vmulpd	%ymm6, %ymm8, %ymm6
	addq	%rcx, %rdx
	vandnpd	%ymm6, %ymm10, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm3
	vcmppd	$2, %ymm1, %ymm0, %ymm2
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm2, %ecx
	movl	%eax, %ebx
	orl	%ecx, %ebx
	jne	.L349
.L100:
	vmulpd	%ymm7, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm10, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm3
	vcmppd	$2, %ymm1, %ymm0, %ymm2
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm2, %ecx
	movl	%eax, %ebx
	orl	%ecx, %ebx
	jne	.L350
.L101:
	vmulpd	%ymm6, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm10, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm3
	vcmppd	$2, %ymm1, %ymm0, %ymm2
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm2, %ecx
	movl	%eax, %ebx
	orl	%ecx, %ebx
	jne	.L351
.L102:
	vinsertf128	$1, %xmm11, %ymm4, %ymm0
	vperm2f128	$33, %ymm11, %ymm4, %ymm4
	vmulpd	%ymm4, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm10, %ymm2
	vcmppd	$13, %ymm5, %ymm2, %ymm4
	vcmppd	$2, %ymm1, %ymm2, %ymm3
	vmovmskpd	%ymm4, %eax
	vmovmskpd	%ymm3, %ecx
	movl	%eax, %ebx
	orl	%ecx, %ebx
	jne	.L352
.L103:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	.LC13(%rip), %xmm2
	vmovsd	.LC14(%rip), %xmm1
	vmovsd	.LC15(%rip), %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L353
	vcomisd	%xmm0, %xmm3
	jbe	.L106
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rdx
.L106:
	vmovsd	%xmm0, (%rdi)
	vmovsd	.LC16(%rip), %xmm4
	movq	%rdx, (%r8)
	leaq	2056(%r9), %rax
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L355:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdi)
	incq	(%r8)
.L110:
	addq	$8, %rax
	cmpq	%r10, %rax
	je	.L354
.L112:
	vsubsd	(%rax), %xmm4, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%rdi), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L355
	vcomisd	%xmm0, %xmm3
	ja	.L111
	addq	$8, %rax
	vmovsd	%xmm0, (%rdi)
	cmpq	%r10, %rax
	jne	.L112
.L354:
	vzeroupper
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L353:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%rdx
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L344:
	vmulpd	%ymm5, %ymm7, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm0, %ymm13, %ymm7, %ymm7
	jmp	.L95
	.p2align 4,,10
	.p2align 3
.L342:
	vmulpd	%ymm5, %ymm7, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L111:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdi)
	decq	(%r8)
	jmp	.L110
.L345:
	vmulpd	%ymm1, %ymm0, %ymm8
	popcntl	%eax, %eax
	popcntl	%esi, %esi
	subl	%esi, %eax
	cltq
	vblendvpd	%ymm13, %ymm8, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm8
	addq	%rax, %rdx
	vblendvpd	%ymm9, %ymm8, %ymm0, %ymm8
	jmp	.L96
.L348:
	vmulpd	%ymm1, %ymm0, %ymm7
	popcntl	%eax, %eax
	popcntl	%esi, %esi
	subl	%esi, %eax
	cltq
	vblendvpd	%ymm3, %ymm7, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm7
	addq	%rax, %rdx
	vblendvpd	%ymm2, %ymm7, %ymm0, %ymm7
	jmp	.L99
.L349:
	vmulpd	%ymm1, %ymm0, %ymm6
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm3, %ymm6, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm6
	addq	%rax, %rdx
	vblendvpd	%ymm2, %ymm6, %ymm0, %ymm6
	jmp	.L100
.L350:
	vmulpd	%ymm1, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm3, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm4
	addq	%rax, %rdx
	vblendvpd	%ymm2, %ymm4, %ymm0, %ymm4
	jmp	.L101
.L351:
	vmulpd	%ymm1, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm3, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm4
	addq	%rax, %rdx
	vblendvpd	%ymm2, %ymm4, %ymm0, %ymm4
	jmp	.L102
.L346:
	vmulpd	%ymm1, %ymm0, %ymm6
	popcntl	%eax, %eax
	popcntl	%esi, %esi
	subl	%esi, %eax
	cltq
	vblendvpd	%ymm9, %ymm6, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm6
	addq	%rax, %rdx
	vblendvpd	%ymm2, %ymm6, %ymm0, %ymm6
	jmp	.L97
.L347:
	vmulpd	%ymm1, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%esi, %esi
	subl	%esi, %eax
	cltq
	vblendvpd	%ymm9, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm4
	addq	%rax, %rdx
	vblendvpd	%ymm2, %ymm4, %ymm0, %ymm4
	jmp	.L98
.L352:
	vmulpd	%ymm1, %ymm2, %ymm1
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm4, %ymm1, %ymm2, %ymm2
	vmulpd	%ymm5, %ymm2, %ymm0
	addq	%rax, %rdx
	vblendvpd	%ymm3, %ymm0, %ymm2, %ymm0
	jmp	.L103
.L340:
	leaq	.LC5(%rip), %rcx
	movl	$285, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE9258:
	.size	_Z13prod_realreallldPKdRdRl.constprop.0, .-_Z13prod_realreallldPKdRdRl.constprop.0
	.section	.rodata.str1.1
.LC17:
	.string	" "
	.text
	.p2align 4
	.globl	_Z5debugDv4_d
	.type	_Z5debugDv4_d, @function
_Z5debugDv4_d:
.LFB8796:
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
	leaq	.LC17(%rip), %r13
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
	je	.L362
	cmpb	$0, 56(%r13)
	je	.L358
	movsbl	67(%r13), %esi
.L359:
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
.L358:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L359
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L359
.L362:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE8796:
	.size	_Z5debugDv4_d, .-_Z5debugDv4_d
	.section	.rodata.str1.1
.LC18:
	.string	","
	.text
	.p2align 4
	.globl	_Z5printDv4_d
	.type	_Z5printDv4_d, @function
_Z5printDv4_d:
.LFB8806:
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
	leaq	.LC18(%rip), %r13
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
	je	.L369
	cmpb	$0, 56(%r13)
	je	.L365
	movsbl	67(%r13), %esi
.L366:
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
.L365:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L366
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L366
.L369:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE8806:
	.size	_Z5printDv4_d, .-_Z5printDv4_d
	.p2align 4
	.globl	_Z3absDv4_d
	.type	_Z3absDv4_d, @function
_Z3absDv4_d:
.LFB8809:
	.cfi_startproc
	endbr64
	vmovapd	%ymm0, %ymm1
	vmovapd	.LC10(%rip), %ymm0
	vandnpd	%ymm1, %ymm0, %ymm0
	ret
	.cfi_endproc
.LFE8809:
	.size	_Z3absDv4_d, .-_Z3absDv4_d
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
	.p2align 4
	.globl	_Z8save_mulDv4_dS_Rl
	.type	_Z8save_mulDv4_dS_Rl, @function
_Z8save_mulDv4_dS_Rl:
.LFB8812:
	.cfi_startproc
	endbr64
	vmulpd	%ymm1, %ymm0, %ymm0
	vmovapd	.LC10(%rip), %ymm2
	vmovapd	.LC11(%rip), %ymm1
	vmovapd	.LC12(%rip), %ymm3
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm1, %ymm2, %ymm5
	vcmppd	$2, %ymm3, %ymm2, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L377
	ret
	.p2align 4,,10
	.p2align 3
.L377:
	vmulpd	%ymm3, %ymm2, %ymm3
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm3, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm1
	addq	%rax, (%rdi)
	vblendvpd	%ymm4, %ymm1, %ymm2, %ymm0
	ret
	.cfi_endproc
.LFE8812:
	.size	_Z8save_mulDv4_dS_Rl, .-_Z8save_mulDv4_dS_Rl
	.p2align 4
	.globl	_Z18horizontal_productDv4_dRl
	.type	_Z18horizontal_productDv4_dRl, @function
_Z18horizontal_productDv4_dRl:
.LFB8813:
	.cfi_startproc
	endbr64
	vmovapd	.LC4(%rip), %ymm1
	vmovapd	.LC12(%rip), %ymm3
	vinsertf128	$1, %xmm1, %ymm0, %ymm2
	vperm2f128	$33, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vmovapd	.LC10(%rip), %ymm1
	vmovapd	.LC11(%rip), %ymm2
	vandnpd	%ymm0, %ymm1, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm5
	vcmppd	$2, %ymm3, %ymm1, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L390
.L379:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC14(%rip), %xmm1
	vandpd	.LC13(%rip), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L389
	vmulsd	.LC15(%rip), %xmm0, %xmm0
	incq	(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L389:
	vmovsd	.LC15(%rip), %xmm2
	vcomisd	%xmm0, %xmm2
	jbe	.L378
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	(%rdi)
.L378:
	ret
	.p2align 4,,10
	.p2align 3
.L390:
	vmulpd	%ymm3, %ymm1, %ymm3
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm3, %ymm1, %ymm1
	vmulpd	%ymm2, %ymm1, %ymm2
	addq	%rax, (%rdi)
	vblendvpd	%ymm4, %ymm2, %ymm1, %ymm0
	jmp	.L379
	.cfi_endproc
.LFE8813:
	.size	_Z18horizontal_productDv4_dRl, .-_Z18horizontal_productDv4_dRl
	.section	.rodata.str1.1
.LC19:
	.string	"N % ELEMENTS_PER_LOOP == 0"
	.text
	.p2align 4
	.globl	_Z13prod_realreallldPKdRdRl
	.type	_Z13prod_realreallldPKdRdRl, @function
_Z13prod_realreallldPKdRdRl:
.LFB8823:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %r11
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	testb	$31, %dil
	jne	.L709
	movq	%rdx, %r10
	movq	%rdx, %rax
	testb	$7, %dl
	jne	.L710
	vmovapd	.LC8(%rip), %ymm9
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm6
	vmovapd	.LC4(%rip), %ymm2
	movq	%rsi, %rdi
	movq	%rcx, %rsi
	vmovsd	%xmm0, %xmm0, %xmm12
	movq	%rdi, %r12
	vmovlpd	(%rsi), %xmm9, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm9, %ymm9
	movq	(%r8), %rcx
	vbroadcastsd	%xmm12, %ymm0
	vmovapd	%ymm6, %ymm7
	vmovapd	%ymm6, %ymm3
	vmovapd	%ymm6, %ymm5
	vmovapd	%ymm6, %ymm10
	vmovapd	%ymm6, %ymm11
	xorl	%edx, %edx
	vmovapd	%ymm2, (%rsp)
	vmovapd	%ymm2, %ymm8
	andq	$-32, %r12
	jle	.L482
	vmovapd	.LC10(%rip), %ymm2
	vmovapd	.LC11(%rip), %ymm4
	vmovapd	.LC12(%rip), %ymm1
	xorl	%ebx, %ebx
	jmp	.L411
	.p2align 4,,10
	.p2align 3
.L395:
	addq	$32, %rbx
	addq	$256, %rax
	cmpq	%rbx, %r12
	jle	.L394
.L411:
	vsubpd	(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm9, %ymm9
	vsubpd	32(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm6, %ymm6
	vsubpd	64(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm11, %ymm11
	vsubpd	96(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm10, %ymm10
	vsubpd	128(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm8, %ymm8
	vsubpd	160(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm5, %ymm5
	vsubpd	192(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm3, %ymm3
	vsubpd	224(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm7, %ymm7
	testb	$-32, %bl
	jne	.L395
	vandnpd	%ymm9, %ymm2, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm14
	vcmppd	$2, %ymm1, %ymm9, %ymm13
	vmovmskpd	%ymm14, %r14d
	vmovmskpd	%ymm13, %r13d
	testl	%r14d, %r14d
	je	.L396
	vmulpd	%ymm1, %ymm9, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L396:
	testl	%r13d, %r13d
	je	.L397
	vmulpd	%ymm4, %ymm9, %ymm14
	popcntl	%r13d, %r13d
	subq	%r13, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L397:
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm14
	vcmppd	$2, %ymm1, %ymm6, %ymm13
	vmovmskpd	%ymm14, %r14d
	vmovmskpd	%ymm13, %r13d
	testl	%r14d, %r14d
	je	.L398
	vmulpd	%ymm1, %ymm6, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L398:
	testl	%r13d, %r13d
	je	.L399
	vmulpd	%ymm4, %ymm6, %ymm14
	popcntl	%r13d, %r13d
	subq	%r13, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L399:
	vandnpd	%ymm11, %ymm2, %ymm11
	vcmppd	$13, %ymm4, %ymm11, %ymm14
	vcmppd	$2, %ymm1, %ymm11, %ymm13
	vmovmskpd	%ymm14, %r14d
	vmovmskpd	%ymm13, %r13d
	testl	%r14d, %r14d
	je	.L400
	vmulpd	%ymm1, %ymm11, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
.L400:
	testl	%r13d, %r13d
	je	.L401
	vmulpd	%ymm4, %ymm11, %ymm14
	popcntl	%r13d, %r13d
	subq	%r13, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
.L401:
	vandnpd	%ymm10, %ymm2, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm14
	vcmppd	$2, %ymm1, %ymm10, %ymm13
	vmovmskpd	%ymm14, %r14d
	vmovmskpd	%ymm13, %r13d
	testl	%r14d, %r14d
	je	.L402
	vmulpd	%ymm1, %ymm10, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
.L402:
	testl	%r13d, %r13d
	je	.L403
	vmulpd	%ymm4, %ymm10, %ymm14
	popcntl	%r13d, %r13d
	subq	%r13, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
.L403:
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm14
	vcmppd	$2, %ymm1, %ymm8, %ymm13
	vmovmskpd	%ymm14, %r14d
	vmovmskpd	%ymm13, %r13d
	testl	%r14d, %r14d
	je	.L404
	vmulpd	%ymm1, %ymm8, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L404:
	testl	%r13d, %r13d
	je	.L405
	vmulpd	%ymm4, %ymm8, %ymm14
	popcntl	%r13d, %r13d
	subq	%r13, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L405:
	vandnpd	%ymm5, %ymm2, %ymm5
	vcmppd	$13, %ymm4, %ymm5, %ymm14
	vcmppd	$2, %ymm1, %ymm5, %ymm13
	vmovmskpd	%ymm14, %r14d
	vmovmskpd	%ymm13, %r13d
	testl	%r14d, %r14d
	je	.L406
	vmulpd	%ymm1, %ymm5, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm5, %ymm5
.L406:
	testl	%r13d, %r13d
	je	.L407
	vmulpd	%ymm4, %ymm5, %ymm14
	popcntl	%r13d, %r13d
	subq	%r13, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm5, %ymm5
.L407:
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm14
	vcmppd	$2, %ymm1, %ymm3, %ymm13
	vmovmskpd	%ymm14, %r14d
	vmovmskpd	%ymm13, %r13d
	testl	%r14d, %r14d
	je	.L408
	vmulpd	%ymm1, %ymm3, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
.L408:
	testl	%r13d, %r13d
	je	.L409
	vmulpd	%ymm4, %ymm3, %ymm14
	popcntl	%r13d, %r13d
	subq	%r13, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
.L409:
	vandnpd	%ymm7, %ymm2, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm14
	vcmppd	$2, %ymm1, %ymm7, %ymm13
	vmovmskpd	%ymm14, %r14d
	vmovmskpd	%ymm13, %r13d
	testl	%r14d, %r14d
	je	.L410
	vmulpd	%ymm1, %ymm7, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
.L410:
	testl	%r13d, %r13d
	je	.L395
	vmulpd	%ymm4, %ymm7, %ymm14
	addq	$32, %rbx
	popcntl	%r13d, %r13d
	addq	$256, %rax
	subq	%r13, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
	cmpq	%rbx, %r12
	jg	.L411
	.p2align 4,,10
	.p2align 3
.L394:
	vandnpd	%ymm9, %ymm2, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm14
	vcmppd	$2, %ymm1, %ymm9, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %eax
	testl	%ebx, %ebx
	je	.L412
	vmulpd	%ymm1, %ymm9, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L412:
	testl	%eax, %eax
	je	.L413
	vmulpd	%ymm4, %ymm9, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L413:
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm14
	vcmppd	$2, %ymm1, %ymm6, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %eax
	testl	%ebx, %ebx
	je	.L414
	vmulpd	%ymm1, %ymm6, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L414:
	testl	%eax, %eax
	je	.L415
	vmulpd	%ymm4, %ymm6, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L415:
	vandnpd	%ymm11, %ymm2, %ymm11
	vcmppd	$13, %ymm4, %ymm11, %ymm14
	vcmppd	$2, %ymm1, %ymm11, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %eax
	testl	%ebx, %ebx
	je	.L416
	vmulpd	%ymm1, %ymm11, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
.L416:
	testl	%eax, %eax
	je	.L417
	vmulpd	%ymm4, %ymm11, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
.L417:
	vandnpd	%ymm10, %ymm2, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm14
	vcmppd	$2, %ymm1, %ymm10, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %eax
	testl	%ebx, %ebx
	je	.L418
	vmulpd	%ymm1, %ymm10, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
.L418:
	testl	%eax, %eax
	je	.L419
	vmulpd	%ymm4, %ymm10, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
.L419:
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm14
	vcmppd	$2, %ymm1, %ymm8, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %eax
	testl	%ebx, %ebx
	je	.L420
	vmulpd	%ymm1, %ymm8, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L420:
	testl	%eax, %eax
	je	.L421
	vmulpd	%ymm4, %ymm8, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L421:
	vandnpd	%ymm5, %ymm2, %ymm5
	vcmppd	$13, %ymm4, %ymm5, %ymm14
	vcmppd	$2, %ymm1, %ymm5, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %eax
	testl	%ebx, %ebx
	je	.L422
	vmulpd	%ymm1, %ymm5, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm5, %ymm5
.L422:
	testl	%eax, %eax
	je	.L423
	vmulpd	%ymm4, %ymm5, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm5, %ymm5
.L423:
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm14
	vcmppd	$2, %ymm1, %ymm3, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %eax
	testl	%ebx, %ebx
	je	.L424
	vmulpd	%ymm1, %ymm3, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
.L424:
	testl	%eax, %eax
	je	.L425
	vmulpd	%ymm4, %ymm3, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
.L425:
	vandnpd	%ymm7, %ymm2, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm14
	vcmppd	$2, %ymm1, %ymm7, %ymm13
	vmovmskpd	%ymm14, %ebx
	vmovmskpd	%ymm13, %eax
	testl	%ebx, %ebx
	je	.L426
	vmulpd	%ymm1, %ymm7, %ymm15
	popcntl	%ebx, %ebx
	addq	%rbx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
.L426:
	testl	%eax, %eax
	jne	.L711
.L427:
	leaq	32(%r12), %rbx
	movq	%rbx, %r13
	cmpq	%rbx, %r11
	jle	.L428
	leaq	(%r10,%rbx,8), %rax
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L429:
	addq	$32, %r13
	addq	$256, %rax
	cmpq	%r13, %r11
	jle	.L428
.L445:
	vsubpd	(%rax), %ymm0, %ymm13
	testq	%r13, %r13
	leaq	31(%r13), %r14
	vmulpd	%ymm13, %ymm9, %ymm9
	vsubpd	32(%rax), %ymm0, %ymm13
	cmovns	%r13, %r14
	vmulpd	%ymm13, %ymm6, %ymm6
	vsubpd	64(%rax), %ymm0, %ymm13
	andl	$224, %r14d
	vmulpd	%ymm13, %ymm11, %ymm11
	vsubpd	96(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm10, %ymm10
	vsubpd	128(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm8, %ymm8
	vsubpd	160(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm5, %ymm5
	vsubpd	192(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm3, %ymm3
	vsubpd	224(%rax), %ymm0, %ymm13
	vmulpd	%ymm13, %ymm7, %ymm7
	jne	.L429
	vandnpd	%ymm9, %ymm2, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm14
	vcmppd	$2, %ymm1, %ymm9, %ymm13
	vmovmskpd	%ymm14, %r15d
	vmovmskpd	%ymm13, %r14d
	testl	%r15d, %r15d
	je	.L430
	vmulpd	%ymm1, %ymm9, %ymm15
	popcntl	%r15d, %r15d
	addq	%r15, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L430:
	testl	%r14d, %r14d
	je	.L431
	vmulpd	%ymm4, %ymm9, %ymm14
	popcntl	%r14d, %r14d
	subq	%r14, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L431:
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm14
	vcmppd	$2, %ymm1, %ymm6, %ymm13
	vmovmskpd	%ymm14, %r15d
	vmovmskpd	%ymm13, %r14d
	testl	%r15d, %r15d
	je	.L432
	vmulpd	%ymm1, %ymm6, %ymm15
	popcntl	%r15d, %r15d
	addq	%r15, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L432:
	testl	%r14d, %r14d
	je	.L433
	vmulpd	%ymm4, %ymm6, %ymm14
	popcntl	%r14d, %r14d
	subq	%r14, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L433:
	vandnpd	%ymm11, %ymm2, %ymm11
	vcmppd	$13, %ymm4, %ymm11, %ymm14
	vcmppd	$2, %ymm1, %ymm11, %ymm13
	vmovmskpd	%ymm14, %r15d
	vmovmskpd	%ymm13, %r14d
	testl	%r15d, %r15d
	je	.L434
	vmulpd	%ymm1, %ymm11, %ymm15
	popcntl	%r15d, %r15d
	addq	%r15, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
.L434:
	testl	%r14d, %r14d
	je	.L435
	vmulpd	%ymm4, %ymm11, %ymm14
	popcntl	%r14d, %r14d
	subq	%r14, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
.L435:
	vandnpd	%ymm10, %ymm2, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm14
	vcmppd	$2, %ymm1, %ymm10, %ymm13
	vmovmskpd	%ymm14, %r15d
	vmovmskpd	%ymm13, %r14d
	testl	%r15d, %r15d
	je	.L436
	vmulpd	%ymm1, %ymm10, %ymm15
	popcntl	%r15d, %r15d
	addq	%r15, %rcx
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
.L436:
	testl	%r14d, %r14d
	je	.L437
	vmulpd	%ymm4, %ymm10, %ymm14
	popcntl	%r14d, %r14d
	subq	%r14, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
.L437:
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm14
	vcmppd	$2, %ymm1, %ymm8, %ymm13
	vmovmskpd	%ymm14, %r15d
	vmovmskpd	%ymm13, %r14d
	testl	%r15d, %r15d
	je	.L438
	vmulpd	%ymm1, %ymm8, %ymm15
	popcntl	%r15d, %r15d
	addq	%r15, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L438:
	testl	%r14d, %r14d
	je	.L439
	vmulpd	%ymm4, %ymm8, %ymm14
	popcntl	%r14d, %r14d
	subq	%r14, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L439:
	vandnpd	%ymm5, %ymm2, %ymm5
	vcmppd	$13, %ymm4, %ymm5, %ymm14
	vcmppd	$2, %ymm1, %ymm5, %ymm13
	vmovmskpd	%ymm14, %r15d
	vmovmskpd	%ymm13, %r14d
	testl	%r15d, %r15d
	je	.L440
	vmulpd	%ymm1, %ymm5, %ymm15
	popcntl	%r15d, %r15d
	addq	%r15, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm5, %ymm5
.L440:
	testl	%r14d, %r14d
	je	.L441
	vmulpd	%ymm4, %ymm5, %ymm14
	popcntl	%r14d, %r14d
	subq	%r14, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm5, %ymm5
.L441:
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm14
	vcmppd	$2, %ymm1, %ymm3, %ymm13
	vmovmskpd	%ymm14, %r15d
	vmovmskpd	%ymm13, %r14d
	testl	%r15d, %r15d
	je	.L442
	vmulpd	%ymm1, %ymm3, %ymm15
	popcntl	%r15d, %r15d
	addq	%r15, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
.L442:
	testl	%r14d, %r14d
	je	.L443
	vmulpd	%ymm4, %ymm3, %ymm14
	popcntl	%r14d, %r14d
	subq	%r14, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
.L443:
	vandnpd	%ymm7, %ymm2, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm14
	vcmppd	$2, %ymm1, %ymm7, %ymm13
	vmovmskpd	%ymm14, %r15d
	vmovmskpd	%ymm13, %r14d
	testl	%r15d, %r15d
	je	.L444
	vmulpd	%ymm1, %ymm7, %ymm15
	popcntl	%r15d, %r15d
	addq	%r15, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
.L444:
	testl	%r14d, %r14d
	je	.L429
	vmulpd	%ymm4, %ymm7, %ymm14
	addq	$32, %r13
	popcntl	%r14d, %r14d
	addq	$256, %rax
	subq	%r14, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
	cmpq	%r13, %r11
	jg	.L445
	.p2align 4,,10
	.p2align 3
.L428:
	vandnpd	%ymm9, %ymm2, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm13
	vcmppd	$2, %ymm1, %ymm9, %ymm0
	vmovmskpd	%ymm13, %r11d
	vmovmskpd	%ymm0, %eax
	testl	%r11d, %r11d
	je	.L446
	vmulpd	%ymm1, %ymm9, %ymm14
	popcntl	%r11d, %r11d
	addq	%r11, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L446:
	testl	%eax, %eax
	je	.L447
	vmulpd	%ymm4, %ymm9, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm0, %ymm13, %ymm9, %ymm9
.L447:
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm13
	vcmppd	$2, %ymm1, %ymm6, %ymm0
	vmovmskpd	%ymm13, %r11d
	vmovmskpd	%ymm0, %eax
	testl	%r11d, %r11d
	je	.L448
	vmulpd	%ymm1, %ymm6, %ymm14
	popcntl	%r11d, %r11d
	addq	%r11, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L448:
	testl	%eax, %eax
	je	.L449
	vmulpd	%ymm4, %ymm6, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm0, %ymm13, %ymm6, %ymm6
.L449:
	vandnpd	%ymm11, %ymm2, %ymm11
	vcmppd	$13, %ymm4, %ymm11, %ymm13
	vcmppd	$2, %ymm1, %ymm11, %ymm0
	vmovmskpd	%ymm13, %r11d
	vmovmskpd	%ymm0, %eax
	testl	%r11d, %r11d
	je	.L450
	vmulpd	%ymm1, %ymm11, %ymm14
	popcntl	%r11d, %r11d
	addq	%r11, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
.L450:
	testl	%eax, %eax
	je	.L451
	vmulpd	%ymm4, %ymm11, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm0, %ymm13, %ymm11, %ymm11
.L451:
	vandnpd	%ymm10, %ymm2, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm13
	vcmppd	$2, %ymm1, %ymm10, %ymm0
	vmovmskpd	%ymm13, %r11d
	vmovmskpd	%ymm0, %eax
	testl	%r11d, %r11d
	je	.L452
	vmulpd	%ymm1, %ymm10, %ymm14
	popcntl	%r11d, %r11d
	addq	%r11, %rcx
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
.L452:
	testl	%eax, %eax
	je	.L453
	vmulpd	%ymm4, %ymm10, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rcx
	vblendvpd	%ymm0, %ymm13, %ymm10, %ymm10
.L453:
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm13
	vcmppd	$2, %ymm1, %ymm8, %ymm0
	vmovmskpd	%ymm13, %r11d
	vmovmskpd	%ymm0, %eax
	testl	%r11d, %r11d
	je	.L454
	vmulpd	%ymm1, %ymm8, %ymm14
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L454:
	testl	%eax, %eax
	je	.L455
	vmulpd	%ymm4, %ymm8, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm0, %ymm13, %ymm8, %ymm8
.L455:
	vandnpd	%ymm5, %ymm2, %ymm5
	vcmppd	$13, %ymm4, %ymm5, %ymm13
	vcmppd	$2, %ymm1, %ymm5, %ymm0
	vmovmskpd	%ymm13, %r11d
	vmovmskpd	%ymm0, %eax
	testl	%r11d, %r11d
	je	.L456
	vmulpd	%ymm1, %ymm5, %ymm14
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm5, %ymm5
.L456:
	testl	%eax, %eax
	je	.L457
	vmulpd	%ymm4, %ymm5, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm0, %ymm13, %ymm5, %ymm5
.L457:
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm13
	vcmppd	$2, %ymm1, %ymm3, %ymm0
	vmovmskpd	%ymm13, %r11d
	vmovmskpd	%ymm0, %eax
	testl	%r11d, %r11d
	je	.L458
	vmulpd	%ymm1, %ymm3, %ymm14
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm3, %ymm3
.L458:
	testl	%eax, %eax
	je	.L459
	vmulpd	%ymm4, %ymm3, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm0, %ymm13, %ymm3, %ymm3
.L459:
	vandnpd	%ymm7, %ymm2, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm13
	vcmppd	$2, %ymm1, %ymm7, %ymm0
	vmovmskpd	%ymm13, %r11d
	vmovmskpd	%ymm0, %eax
	testl	%r11d, %r11d
	je	.L460
	vmulpd	%ymm1, %ymm7, %ymm14
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
.L460:
	testl	%eax, %eax
	jne	.L712
.L461:
	vmulpd	%ymm8, %ymm9, %ymm8
	vandnpd	%ymm8, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm13
	vcmppd	$2, %ymm1, %ymm0, %ymm9
	vmovmskpd	%ymm13, %eax
	vmovmskpd	%ymm9, %r11d
	movl	%eax, %r9d
	orl	%r11d, %r9d
	jne	.L713
.L462:
	vmulpd	%ymm5, %ymm6, %ymm5
	vandnpd	%ymm5, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm9
	vcmppd	$2, %ymm1, %ymm0, %ymm6
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm6, %r11d
	movl	%eax, %r9d
	orl	%r11d, %r9d
	jne	.L714
.L463:
	vmulpd	%ymm3, %ymm11, %ymm3
	vandnpd	%ymm3, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm9
	vcmppd	$2, %ymm1, %ymm0, %ymm6
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm6, %r11d
	movl	%eax, %r9d
	orl	%r11d, %r9d
	jne	.L715
.L464:
	vmulpd	%ymm10, %ymm7, %ymm7
	vandnpd	%ymm7, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm9
	vcmppd	$2, %ymm1, %ymm0, %ymm6
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm6, %r11d
	movl	%eax, %r9d
	orl	%r11d, %r9d
	jne	.L716
.L465:
	vmulpd	%ymm5, %ymm8, %ymm5
	addq	%rcx, %rdx
	vandnpd	%ymm5, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm8
	vcmppd	$2, %ymm1, %ymm0, %ymm6
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm6, %ecx
	movl	%eax, %r9d
	orl	%ecx, %r9d
	jne	.L717
.L466:
	vmulpd	%ymm7, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm7
	vcmppd	$2, %ymm1, %ymm0, %ymm6
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm6, %ecx
	movl	%eax, %r9d
	orl	%ecx, %r9d
	jne	.L718
.L467:
	vmulpd	%ymm5, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm6
	vcmppd	$2, %ymm1, %ymm0, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %ecx
	movl	%eax, %r9d
	orl	%ecx, %r9d
	jne	.L719
.L468:
	vmovapd	(%rsp), %ymm7
	vinsertf128	$1, %xmm7, %ymm3, %ymm0
	vperm2f128	$33, %ymm7, %ymm3, %ymm3
	vmulpd	%ymm3, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm4, %ymm2, %ymm5
	vcmppd	$2, %ymm1, %ymm2, %ymm3
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm3, %ecx
	movl	%eax, %r9d
	orl	%ecx, %r9d
	jne	.L720
.L469:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	.LC13(%rip), %xmm2
	vmovsd	.LC14(%rip), %xmm1
	vmovsd	.LC15(%rip), %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L721
	vcomisd	%xmm0, %xmm3
	jbe	.L472
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rdx
.L472:
	vmovsd	%xmm0, (%rsi)
	movslq	%r12d, %rax
	movq	%rdx, (%r8)
	leaq	31(%r12), %rdx
	cmpq	%rax, %rdx
	jge	.L481
	jmp	.L707
	.p2align 4,,10
	.p2align 3
.L722:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi)
	incq	(%r8)
.L476:
	incq	%rax
	cmpq	%rbx, %rax
	je	.L707
.L481:
	cmpq	%rax, %rdi
	je	.L476
	vsubsd	(%r10,%rax,8), %xmm12, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%rsi), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L722
	vcomisd	%xmm0, %xmm3
	ja	.L479
	incq	%rax
	vmovsd	%xmm0, (%rsi)
	cmpq	%rbx, %rax
	jne	.L481
.L707:
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
.L721:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%rdx
	jmp	.L472
	.p2align 4,,10
	.p2align 3
.L712:
	vmulpd	%ymm4, %ymm7, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm0, %ymm13, %ymm7, %ymm7
	jmp	.L461
	.p2align 4,,10
	.p2align 3
.L711:
	vmulpd	%ymm4, %ymm7, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L479:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi)
	decq	(%r8)
	jmp	.L476
	.p2align 4,,10
	.p2align 3
.L713:
	vmulpd	%ymm1, %ymm0, %ymm8
	popcntl	%eax, %eax
	popcntl	%r11d, %r11d
	subl	%r11d, %eax
	cltq
	vblendvpd	%ymm13, %ymm8, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm8
	addq	%rax, %rcx
	vblendvpd	%ymm9, %ymm8, %ymm0, %ymm8
	jmp	.L462
	.p2align 4,,10
	.p2align 3
.L714:
	vmulpd	%ymm1, %ymm0, %ymm5
	popcntl	%eax, %eax
	popcntl	%r11d, %r11d
	subl	%r11d, %eax
	cltq
	vblendvpd	%ymm9, %ymm5, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm5
	addq	%rax, %rcx
	vblendvpd	%ymm6, %ymm5, %ymm0, %ymm5
	jmp	.L463
	.p2align 4,,10
	.p2align 3
.L715:
	vmulpd	%ymm1, %ymm0, %ymm3
	popcntl	%eax, %eax
	popcntl	%r11d, %r11d
	subl	%r11d, %eax
	cltq
	vblendvpd	%ymm9, %ymm3, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm3
	addq	%rax, %rcx
	vblendvpd	%ymm6, %ymm3, %ymm0, %ymm3
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L716:
	vmulpd	%ymm1, %ymm0, %ymm7
	popcntl	%eax, %eax
	popcntl	%r11d, %r11d
	subl	%r11d, %eax
	cltq
	vblendvpd	%ymm9, %ymm7, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm7
	addq	%rax, %rcx
	vblendvpd	%ymm6, %ymm7, %ymm0, %ymm7
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L717:
	vmulpd	%ymm1, %ymm0, %ymm5
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm8, %ymm5, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm5
	addq	%rax, %rdx
	vblendvpd	%ymm6, %ymm5, %ymm0, %ymm5
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L718:
	vmulpd	%ymm1, %ymm0, %ymm3
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm7, %ymm3, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm3
	addq	%rax, %rdx
	vblendvpd	%ymm6, %ymm3, %ymm0, %ymm3
	jmp	.L467
	.p2align 4,,10
	.p2align 3
.L719:
	vmulpd	%ymm1, %ymm0, %ymm3
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm6, %ymm3, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm3
	addq	%rax, %rdx
	vblendvpd	%ymm5, %ymm3, %ymm0, %ymm3
	jmp	.L468
	.p2align 4,,10
	.p2align 3
.L720:
	vmulpd	%ymm1, %ymm2, %ymm1
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm5, %ymm1, %ymm2, %ymm2
	vmulpd	%ymm4, %ymm2, %ymm0
	addq	%rax, %rdx
	vblendvpd	%ymm3, %ymm0, %ymm2, %ymm0
	jmp	.L469
.L482:
	vmovapd	.LC10(%rip), %ymm2
	vmovapd	.LC11(%rip), %ymm4
	vmovapd	.LC12(%rip), %ymm1
	jmp	.L394
.L709:
	leaq	.LC5(%rip), %rcx
	movl	$284, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC19(%rip), %rdi
	call	__assert_fail@PLT
.L710:
	leaq	.LC5(%rip), %rcx
	movl	$285, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE8823:
	.size	_Z13prod_realreallldPKdRdRl, .-_Z13prod_realreallldPKdRdRl
	.p2align 4
	.globl	_Z16prod_realcomplexldPKdS0_RdRl
	.type	_Z16prod_realcomplexldPKdS0_RdRl, @function
_Z16prod_realcomplexldPKdS0_RdRl:
.LFB8824:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rdx, %rdi
	testq	%rax, %rax
	jle	.L734
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC14(%rip), %xmm4
	vmovsd	.LC15(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L729
	.p2align 4,,10
	.p2align 3
.L735:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L727:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L734
.L729:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L735
	vcomisd	%xmm1, %xmm5
	ja	.L728
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L729
.L734:
	ret
	.p2align 4,,10
	.p2align 3
.L728:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L727
	.cfi_endproc
.LFE8824:
	.size	_Z16prod_realcomplexldPKdS0_RdRl, .-_Z16prod_realcomplexldPKdS0_RdRl
	.p2align 4
	.globl	_Z16prod_complexreallddPKdRdRl
	.type	_Z16prod_complexreallddPKdRdRl, @function
_Z16prod_complexreallddPKdRdRl:
.LFB8825:
	.cfi_startproc
	endbr64
	vmulsd	%xmm1, %xmm1, %xmm1
	testq	%rdi, %rdi
	jle	.L747
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC14(%rip), %xmm4
	vmovsd	.LC15(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L742
	.p2align 4,,10
	.p2align 3
.L748:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L740:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L747
.L742:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L748
	vcomisd	%xmm2, %xmm5
	ja	.L741
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L742
.L747:
	ret
	.p2align 4,,10
	.p2align 3
.L741:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L740
	.cfi_endproc
.LFE8825:
	.size	_Z16prod_complexreallddPKdRdRl, .-_Z16prod_complexreallddPKdRdRl
	.p2align 4
	.globl	_Z19prod_complexcomplexllddPKdS0_RdRl
	.type	_Z19prod_complexcomplexllddPKdS0_RdRl, @function
_Z19prod_complexcomplexllddPKdS0_RdRl:
.LFB8826:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	movq	%rdx, %rsi
	testq	%rax, %rax
	jle	.L758
	vmovsd	(%r8), %xmm2
	vmovsd	.LC14(%rip), %xmm5
	vmovsd	.LC15(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L757
	.p2align 4,,10
	.p2align 3
.L771:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L755:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L758
.L757:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L771
	vcomisd	%xmm2, %xmm6
	ja	.L756
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L757
.L758:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L772
	vmovsd	(%r8), %xmm2
	vmovsd	.LC14(%rip), %xmm5
	vmovsd	.LC15(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L763
	.p2align 4,,10
	.p2align 3
.L774:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L761:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L773
.L763:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L774
	vcomisd	%xmm2, %xmm6
	ja	.L762
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L763
.L773:
	ret
	.p2align 4,,10
	.p2align 3
.L756:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L755
	.p2align 4,,10
	.p2align 3
.L762:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L761
	.p2align 4,,10
	.p2align 3
.L772:
	ret
	.cfi_endproc
.LFE8826:
	.size	_Z19prod_complexcomplexllddPKdS0_RdRl, .-_Z19prod_complexcomplexllddPKdS0_RdRl
	.p2align 4
	.globl	_Z13assert_approxdd
	.type	_Z13assert_approxdd, @function
_Z13assert_approxdd:
.LFB8828:
	.cfi_startproc
	endbr64
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovq	.LC13(%rip), %xmm3
	vandpd	%xmm3, %xmm2, %xmm2
	vsubsd	.LC20(%rip), %xmm2, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	.LC21(%rip), %xmm2
	ja	.L784
	ret
.L784:
	pushq	%rax
	.cfi_def_cfa_offset 16
	call	_Z13assert_approxdd.part.0
	.cfi_endproc
.LFE8828:
	.size	_Z13assert_approxdd, .-_Z13assert_approxdd
	.section	.text._ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv:
.LFB9241:
	.cfi_startproc
	endbr64
	vmovdqa	.LC22(%rip), %ymm2
	vmovdqa	.LC23(%rip), %ymm3
	vmovdqa	.LC24(%rip), %ymm4
	vmovdqa	.LC25(%rip), %ymm5
	movq	%rdi, %rax
	leaq	1248(%rdi), %rcx
	movq	%rdi, %rdx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L786:
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
	jne	.L786
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L787:
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
	jne	.L787
	vmovdqa	.LC26(%rip), %xmm0
	vmovdqa	.LC27(%rip), %xmm1
	vpand	2464(%rax), %xmm0, %xmm0
	vpand	2472(%rax), %xmm1, %xmm1
	movq	2488(%rax), %rsi
	vpor	%xmm1, %xmm0, %xmm0
	movq	2480(%rax), %rdx
	vpsrlq	$1, %xmm0, %xmm1
	movq	%rsi, %rcx
	vpand	.LC28(%rip), %xmm0, %xmm0
	andl	$2147483647, %ecx
	vpxor	1216(%rax), %xmm1, %xmm1
	andq	$-2147483648, %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	orq	%rcx, %rdx
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	movq	%rdx, %rcx
	vpxor	.LC29(%rip), %xmm1, %xmm2
	shrq	%rcx
	vpblendvb	%xmm0, %xmm1, %xmm2, %xmm0
	xorq	1232(%rax), %rcx
	andl	$1, %edx
	vmovdqu	%xmm0, 2464(%rax)
	je	.L791
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L791:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L790
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L790:
	movq	%rcx, 2488(%rax)
	movq	$0, 2496(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE9241:
	.size	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, .-_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.text
	.p2align 4
	.globl	_Z8test_allv
	.type	_Z8test_allv, @function
_Z8test_allv:
.LFB8829:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$2592, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vmovapd	.LC30(%rip), %ymm0
	leaq	-2568(%rbp), %rax
	movq	%rax, %rdi
	movq	$0, -2568(%rbp)
	movq	%rax, -2616(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC31(%rip), %xmm3
	vmovq	.LC13(%rip), %xmm12
	vdivsd	%xmm0, %xmm3, %xmm2
	vandpd	%xmm12, %xmm2, %xmm2
	vsubsd	.LC20(%rip), %xmm2, %xmm2
	vandpd	%xmm12, %xmm2, %xmm2
	vcomisd	.LC21(%rip), %xmm2
	ja	.L1236
	movq	-2568(%rbp), %rsi
	cmpq	$1, %rsi
	jne	.L1237
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm7
	vmovapd	.LC32(%rip), %ymm6
	vmulpd	%ymm7, %ymm7, %ymm4
	vmovapd	.LC10(%rip), %ymm3
	vmovapd	.LC11(%rip), %ymm0
	vmovapd	.LC12(%rip), %ymm2
	xorl	%r13d, %r13d
	vmulpd	%ymm6, %ymm4, %ymm8
	vandnpd	%ymm8, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm9
	vcmppd	$2, %ymm2, %ymm1, %ymm5
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1238
.L798:
	vmulpd	%ymm4, %ymm4, %ymm5
	vandnpd	%ymm5, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm10
	vcmppd	$2, %ymm2, %ymm1, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1239
.L799:
	vmulpd	%ymm8, %ymm5, %ymm5
	vandnpd	%ymm5, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm9
	vcmppd	$2, %ymm2, %ymm1, %ymm8
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1240
.L800:
	vinsertf128	$1, .LC4(%rip), %ymm5, %ymm1
	vperm2f128	$33, .LC4(%rip), %ymm5, %ymm5
	vmulpd	%ymm5, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm9
	vcmppd	$2, %ymm2, %ymm5, %ymm8
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1241
.L801:
	vunpckhpd	%xmm1, %xmm1, %xmm5
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	.LC15(%rip), %xmm5
	vmovsd	%xmm5, -2608(%rbp)
	vandpd	%xmm12, %xmm1, %xmm1
	vcomisd	.LC14(%rip), %xmm1
	ja	.L1242
	vcomisd	%xmm1, %xmm5
	jbe	.L804
	vmulsd	.LC14(%rip), %xmm1, %xmm1
	decq	%r13
.L804:
	vmovsd	.LC33(%rip), %xmm5
	vucomisd	%xmm5, %xmm1
	jp	.L956
	jne	.L956
	testq	%r13, %r13
	jne	.L1243
	vmulpd	.LC34(%rip), %ymm4, %ymm5
	vmulpd	%ymm6, %ymm7, %ymm6
	xorl	%esi, %esi
	vmulpd	%ymm4, %ymm7, %ymm4
	vmulpd	%ymm5, %ymm6, %ymm9
	vandnpd	%ymm9, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm10
	vcmppd	$2, %ymm2, %ymm1, %ymm8
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1244
.L812:
	vmulpd	%ymm4, %ymm4, %ymm8
	vandnpd	%ymm8, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm11
	vcmppd	$2, %ymm2, %ymm1, %ymm10
	vmovmskpd	%ymm11, %eax
	vmovmskpd	%ymm10, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1245
.L813:
	vmulpd	%ymm9, %ymm8, %ymm8
	vandnpd	%ymm8, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm10
	vcmppd	$2, %ymm2, %ymm1, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1246
.L814:
	vinsertf128	$1, .LC4(%rip), %ymm8, %ymm1
	vperm2f128	$33, .LC4(%rip), %ymm8, %ymm8
	vmulpd	%ymm8, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm8
	vcmppd	$13, %ymm0, %ymm8, %ymm10
	vcmppd	$2, %ymm2, %ymm8, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1247
.L815:
	vunpckhpd	%xmm1, %xmm1, %xmm8
	vmulsd	%xmm8, %xmm1, %xmm1
	vandpd	%xmm12, %xmm1, %xmm1
	vcomisd	.LC14(%rip), %xmm1
	jbe	.L1226
	vmulsd	-2608(%rbp), %xmm1, %xmm1
	incq	%rsi
.L818:
	vmovsd	.LC35(%rip), %xmm9
	vdivsd	%xmm1, %xmm9, %xmm8
	vandpd	%xmm12, %xmm8, %xmm8
	vsubsd	.LC20(%rip), %xmm8, %xmm8
	vandpd	%xmm12, %xmm8, %xmm8
	vcomisd	.LC21(%rip), %xmm8
	ja	.L1248
	cmpq	$1, %rsi
	jne	.L1249
	vmulpd	.LC36(%rip), %ymm6, %ymm6
	vmulpd	%ymm5, %ymm7, %ymm1
	vmulpd	%ymm4, %ymm7, %ymm4
	xorl	%esi, %esi
	vandnpd	%ymm6, %ymm3, %ymm6
	vcmppd	$13, %ymm0, %ymm6, %ymm9
	vcmppd	$2, %ymm2, %ymm6, %ymm8
	vmovmskpd	%ymm9, %edx
	vmovmskpd	%ymm8, %eax
	testl	%edx, %edx
	je	.L823
	vmulpd	%ymm2, %ymm6, %ymm5
	xorl	%esi, %esi
	popcntl	%edx, %esi
	vblendvpd	%ymm9, %ymm5, %ymm6, %ymm6
.L823:
	testl	%eax, %eax
	je	.L824
	vmulpd	%ymm0, %ymm6, %ymm5
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm8, %ymm5, %ymm6, %ymm6
.L824:
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm8
	vcmppd	$2, %ymm2, %ymm1, %ymm5
	vmovmskpd	%ymm8, %edx
	vmovmskpd	%ymm5, %eax
	testl	%edx, %edx
	je	.L825
	vmulpd	%ymm2, %ymm1, %ymm7
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm8, %ymm7, %ymm1, %ymm1
.L825:
	testl	%eax, %eax
	je	.L826
	vmulpd	%ymm0, %ymm1, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm5, %ymm7, %ymm1, %ymm1
.L826:
	vandnpd	%ymm4, %ymm3, %ymm7
	vcmppd	$13, %ymm0, %ymm7, %ymm8
	vcmppd	$2, %ymm2, %ymm7, %ymm5
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm5, %edx
	testl	%eax, %eax
	je	.L827
	vmulpd	%ymm2, %ymm7, %ymm4
	popcntl	%eax, %eax
	addq	%rax, %rsi
	vblendvpd	%ymm8, %ymm4, %ymm7, %ymm4
	testl	%edx, %edx
	je	.L828
	vmulpd	%ymm0, %ymm4, %ymm8
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	addq	%rax, %rsi
	vblendvpd	%ymm5, %ymm8, %ymm4, %ymm4
	vmovapd	%ymm4, %ymm7
.L939:
	subq	%rdx, %rsi
.L941:
	vmulpd	%ymm1, %ymm6, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm8
	vcmppd	$2, %ymm2, %ymm5, %ymm6
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1250
.L829:
	vmulpd	%ymm7, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm7
	vcmppd	$2, %ymm2, %ymm5, %ymm6
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1251
.L830:
	vmulpd	%ymm1, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm6
	vcmppd	$2, %ymm2, %ymm1, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1252
.L831:
	vinsertf128	$1, .LC4(%rip), %ymm4, %ymm1
	vperm2f128	$33, .LC4(%rip), %ymm4, %ymm4
	vmulpd	%ymm4, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm4
	vcmppd	$13, %ymm0, %ymm4, %ymm6
	vcmppd	$2, %ymm2, %ymm4, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L1253
.L832:
	vunpckhpd	%xmm1, %xmm1, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm1
	vandpd	%xmm12, %xmm1, %xmm1
	vcomisd	.LC14(%rip), %xmm1
	jbe	.L1228
	vmulsd	-2608(%rbp), %xmm1, %xmm1
	incq	%rsi
.L835:
	vmovsd	.LC37(%rip), %xmm5
	vdivsd	%xmm1, %xmm5, %xmm4
	vandpd	%xmm12, %xmm4, %xmm4
	vsubsd	.LC20(%rip), %xmm4, %xmm4
	vandpd	%xmm12, %xmm4, %xmm4
	vcomisd	.LC21(%rip), %xmm4
	ja	.L1254
	cmpq	$2, %rsi
	jne	.L1255
	movl	$128000, %edi
	vzeroupper
	call	_Znam@PLT
	movq	$42, -2560(%rbp)
	movq	%rax, %r14
	movl	$1, %ebx
	movl	$42, %eax
	leaq	-2560(%rbp), %rsi
	movabsq	$6364136223846793005, %rcx
	.p2align 4,,10
	.p2align 3
.L840:
	movq	%rax, %rdx
	shrq	$62, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	addq	%rbx, %rax
	movq	%rax, (%rsi,%rbx,8)
	incq	%rbx
	cmpq	$312, %rbx
	jne	.L840
	leaq	_ZL3gen(%rip), %rcx
	movq	%rcx, %rdi
	movl	$2504, %edx
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	vmovsd	_ZL5distu(%rip), %xmm5
	vmovsd	8+_ZL5distu(%rip), %xmm4
	vmovapd	.LC10(%rip), %ymm3
	vsubsd	%xmm5, %xmm4, %xmm4
	vmovapd	.LC11(%rip), %ymm0
	vmovapd	.LC12(%rip), %ymm2
	vmovq	.LC13(%rip), %xmm12
	movq	%rax, %rcx
	leaq	128000(%r14), %r9
	movq	%r14, %r15
	movabsq	$6148914691236517205, %r8
	movabsq	$8202884508482404352, %rsi
	movabsq	$-2270628950310912, %r12
	vxorps	%xmm6, %xmm6, %xmm6
	jmp	.L841
	.p2align 4,,10
	.p2align 3
.L1257:
	vcvtsi2sdq	%rax, %xmm6, %xmm1
.L843:
	vxorpd	%xmm7, %xmm7, %xmm7
	vaddsd	%xmm7, %xmm1, %xmm1
	vmulsd	.LC39(%rip), %xmm1, %xmm1
	vcomisd	.LC20(%rip), %xmm1
	jnb	.L844
	vfmadd132sd	%xmm4, %xmm5, %xmm1
	vmovsd	.LC41(%rip), %xmm7
	addq	$8, %r15
	vfmadd132sd	.LC40(%rip), %xmm7, %xmm1
	vmovsd	%xmm1, -8(%r15)
	cmpq	%r15, %r9
	je	.L845
.L848:
	movq	%rdi, %rbx
.L841:
	cmpq	$311, %rbx
	ja	.L1256
.L847:
	movq	(%rcx,%rbx,8), %rax
	leaq	1(%rbx), %rdi
	movq	%rax, %r10
	shrq	$29, %r10
	andq	%r8, %r10
	xorq	%r10, %rax
	movq	%rax, %r10
	salq	$17, %r10
	andq	%rsi, %r10
	xorq	%r10, %rax
	movq	%rax, %r10
	salq	$37, %r10
	andq	%r12, %r10
	xorq	%r10, %rax
	movq	%rax, %r10
	shrq	$43, %r10
	movq	%rdi, 2496+_ZL3gen(%rip)
	xorq	%r10, %rax
	jns	.L1257
	movq	%rax, %r10
	shrq	%r10
	andl	$1, %eax
	orq	%rax, %r10
	vcvtsi2sdq	%r10, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L843
.L1242:
	vmulsd	%xmm5, %xmm1, %xmm1
	incq	%r13
	jmp	.L804
	.p2align 4,,10
	.p2align 3
.L1256:
	movq	%rcx, %rdi
	movq	%r9, -2584(%rbp)
	vmovsd	%xmm4, -2600(%rbp)
	vmovsd	%xmm5, -2592(%rbp)
	vzeroupper
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rbx
	vmovsd	-2600(%rbp), %xmm4
	vmovsd	-2592(%rbp), %xmm5
	vmovq	.LC13(%rip), %xmm12
	vmovapd	.LC12(%rip), %ymm2
	vmovapd	.LC11(%rip), %ymm0
	vmovapd	.LC10(%rip), %ymm3
	movq	-2584(%rbp), %r9
	vxorps	%xmm6, %xmm6, %xmm6
	movabsq	$8202884508482404352, %rsi
	movabsq	$6148914691236517205, %r8
	leaq	_ZL3gen(%rip), %rcx
	jmp	.L847
.L844:
	vmovsd	.LC42(%rip), %xmm1
	vmovsd	.LC41(%rip), %xmm7
	vfmadd132sd	%xmm4, %xmm5, %xmm1
	addq	$8, %r15
	vfmadd132sd	.LC40(%rip), %xmm7, %xmm1
	vmovsd	%xmm1, -8(%r15)
	cmpq	%r9, %r15
	jne	.L848
.L845:
	testb	$7, %r14b
	jne	.L1258
	vmovapd	.LC43(%rip), %ymm5
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm6
	vsubpd	32(%r14), %ymm5, %ymm11
	vsubpd	64(%r14), %ymm5, %ymm10
	vsubpd	96(%r14), %ymm5, %ymm9
	vsubpd	160(%r14), %ymm5, %ymm4
	vsubpd	192(%r14), %ymm5, %ymm1
	vsubpd	224(%r14), %ymm5, %ymm7
	vmulpd	%ymm6, %ymm11, %ymm11
	vmulpd	%ymm6, %ymm10, %ymm10
	vmulpd	%ymm6, %ymm9, %ymm9
	vmulpd	%ymm6, %ymm4, %ymm4
	vmulpd	%ymm6, %ymm1, %ymm1
	vmulpd	%ymm6, %ymm7, %ymm7
	vsubpd	(%r14), %ymm5, %ymm6
	vsubpd	128(%r14), %ymm5, %ymm8
	movl	$42, %edx
	vmulpd	.LC44(%rip), %ymm6, %ymm6
	vandnpd	%ymm6, %ymm3, %ymm6
	vcmppd	$13, %ymm0, %ymm6, %ymm14
	vcmppd	$2, %ymm2, %ymm6, %ymm13
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm13, %ecx
	testl	%eax, %eax
	je	.L850
	vmulpd	%ymm2, %ymm6, %ymm15
	popcntl	%eax, %eax
	addl	$42, %eax
	movslq	%eax, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L850:
	testl	%ecx, %ecx
	je	.L851
	vmulpd	%ymm0, %ymm6, %ymm14
	popcntl	%ecx, %ecx
	subq	%rcx, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm6, %ymm6
.L851:
	vandnpd	%ymm11, %ymm3, %ymm11
	vcmppd	$13, %ymm0, %ymm11, %ymm14
	vcmppd	$2, %ymm2, %ymm11, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %eax
	testl	%ecx, %ecx
	je	.L852
	vmulpd	%ymm2, %ymm11, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
.L852:
	testl	%eax, %eax
	je	.L853
	vmulpd	%ymm0, %ymm11, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
.L853:
	vandnpd	%ymm10, %ymm3, %ymm10
	vcmppd	$13, %ymm0, %ymm10, %ymm14
	vcmppd	$2, %ymm2, %ymm10, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %eax
	testl	%ecx, %ecx
	je	.L854
	vmulpd	%ymm2, %ymm10, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
.L854:
	testl	%eax, %eax
	je	.L855
	vmulpd	%ymm0, %ymm10, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
.L855:
	vandnpd	%ymm9, %ymm3, %ymm9
	vcmppd	$13, %ymm0, %ymm9, %ymm14
	vcmppd	$2, %ymm2, %ymm9, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %eax
	testl	%ecx, %ecx
	je	.L856
	vmulpd	%ymm2, %ymm9, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L856:
	testl	%eax, %eax
	je	.L857
	vmulpd	%ymm0, %ymm9, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L857:
	vandnpd	%ymm8, %ymm3, %ymm8
	vcmppd	$13, %ymm0, %ymm8, %ymm14
	vcmppd	$2, %ymm2, %ymm8, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %eax
	testl	%ecx, %ecx
	je	.L858
	vmulpd	%ymm2, %ymm8, %ymm15
	xorl	%r13d, %r13d
	popcntl	%ecx, %r13d
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L858:
	testl	%eax, %eax
	je	.L859
	vmulpd	%ymm0, %ymm8, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm13, %ymm14, %ymm8, %ymm8
.L859:
	vandnpd	%ymm4, %ymm3, %ymm4
	vcmppd	$13, %ymm0, %ymm4, %ymm14
	vcmppd	$2, %ymm2, %ymm4, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %eax
	testl	%ecx, %ecx
	je	.L860
	vmulpd	%ymm2, %ymm4, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm14, %ymm15, %ymm4, %ymm4
.L860:
	testl	%eax, %eax
	je	.L861
	vmulpd	%ymm0, %ymm4, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm13, %ymm14, %ymm4, %ymm4
.L861:
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm14
	vcmppd	$2, %ymm2, %ymm1, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %eax
	testl	%ecx, %ecx
	je	.L862
	vmulpd	%ymm2, %ymm1, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
.L862:
	testl	%eax, %eax
	je	.L863
	vmulpd	%ymm0, %ymm1, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm13, %ymm14, %ymm1, %ymm1
.L863:
	vandnpd	%ymm7, %ymm3, %ymm7
	vcmppd	$13, %ymm0, %ymm7, %ymm14
	vcmppd	$2, %ymm2, %ymm7, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %eax
	testl	%ecx, %ecx
	je	.L864
	vmulpd	%ymm2, %ymm7, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
.L864:
	testl	%eax, %eax
	je	.L865
	vmulpd	%ymm0, %ymm7, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm13, %ymm14, %ymm7, %ymm7
.L865:
	vandnpd	%ymm6, %ymm3, %ymm6
	vcmppd	$13, %ymm0, %ymm6, %ymm14
	vmovapd	%ymm6, %ymm13
	vmovmskpd	%ymm14, %eax
	testl	%eax, %eax
	je	.L866
	vmulpd	%ymm2, %ymm6, %ymm13
	popcntl	%eax, %eax
	addq	%rax, %rdx
	vblendvpd	%ymm14, %ymm13, %ymm6, %ymm13
	.p2align 4,,10
	.p2align 3
.L866:
	vcmppd	$2, %ymm2, %ymm6, %ymm6
	vmovmskpd	%ymm6, %eax
	testl	%eax, %eax
	je	.L867
	vmulpd	%ymm0, %ymm13, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm6, %ymm14, %ymm13, %ymm13
.L867:
	vandnpd	%ymm11, %ymm3, %ymm11
	vcmppd	$13, %ymm0, %ymm11, %ymm14
	vcmppd	$2, %ymm2, %ymm11, %ymm6
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm6, %eax
	testl	%ecx, %ecx
	je	.L868
	vmulpd	%ymm2, %ymm11, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
.L868:
	testl	%eax, %eax
	je	.L869
	vmulpd	%ymm0, %ymm11, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm6, %ymm14, %ymm11, %ymm11
.L869:
	vandnpd	%ymm10, %ymm3, %ymm10
	vcmppd	$13, %ymm0, %ymm10, %ymm14
	vcmppd	$2, %ymm2, %ymm10, %ymm6
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm6, %eax
	testl	%ecx, %ecx
	je	.L870
	vmulpd	%ymm2, %ymm10, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
.L870:
	testl	%eax, %eax
	je	.L871
	vmulpd	%ymm0, %ymm10, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm6, %ymm14, %ymm10, %ymm10
.L871:
	vandnpd	%ymm9, %ymm3, %ymm9
	vcmppd	$13, %ymm0, %ymm9, %ymm14
	vcmppd	$2, %ymm2, %ymm9, %ymm6
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm6, %eax
	testl	%ecx, %ecx
	je	.L872
	vmulpd	%ymm2, %ymm9, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L872:
	testl	%eax, %eax
	je	.L873
	vmulpd	%ymm0, %ymm9, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm6, %ymm14, %ymm9, %ymm9
.L873:
	vandnpd	%ymm8, %ymm3, %ymm8
	vcmppd	$13, %ymm0, %ymm8, %ymm14
	vcmppd	$2, %ymm2, %ymm8, %ymm6
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm6, %eax
	testl	%ecx, %ecx
	je	.L874
	vmulpd	%ymm2, %ymm8, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L874:
	testl	%eax, %eax
	je	.L875
	vmulpd	%ymm0, %ymm8, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm6, %ymm14, %ymm8, %ymm8
.L875:
	vandnpd	%ymm4, %ymm3, %ymm4
	vcmppd	$13, %ymm0, %ymm4, %ymm14
	vcmppd	$2, %ymm2, %ymm4, %ymm6
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm6, %eax
	testl	%ecx, %ecx
	je	.L876
	vmulpd	%ymm2, %ymm4, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm14, %ymm15, %ymm4, %ymm4
.L876:
	testl	%eax, %eax
	je	.L877
	vmulpd	%ymm0, %ymm4, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm6, %ymm14, %ymm4, %ymm4
.L877:
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm14
	vcmppd	$2, %ymm2, %ymm1, %ymm6
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm6, %eax
	testl	%ecx, %ecx
	je	.L878
	vmulpd	%ymm2, %ymm1, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
.L878:
	testl	%eax, %eax
	je	.L879
	vmulpd	%ymm0, %ymm1, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm6, %ymm14, %ymm1, %ymm1
.L879:
	vandnpd	%ymm7, %ymm3, %ymm6
	vcmppd	$13, %ymm0, %ymm6, %ymm14
	vcmppd	$2, %ymm2, %ymm6, %ymm7
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm7, %eax
	testl	%ecx, %ecx
	je	.L880
	vmulpd	%ymm2, %ymm6, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L880:
	testl	%eax, %eax
	je	.L881
	vmulpd	%ymm0, %ymm6, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm7, %ymm14, %ymm6, %ymm6
.L881:
	leaq	512(%r14), %rax
	movl	$64, %ecx
	jmp	.L898
	.p2align 4,,10
	.p2align 3
.L882:
	addq	$32, %rcx
	addq	$256, %rax
	cmpq	$16000, %rcx
	je	.L1259
.L898:
	vsubpd	(%rax), %ymm5, %ymm7
	vmulpd	%ymm7, %ymm13, %ymm13
	vsubpd	32(%rax), %ymm5, %ymm7
	vmulpd	%ymm7, %ymm11, %ymm11
	vsubpd	64(%rax), %ymm5, %ymm7
	vmulpd	%ymm7, %ymm10, %ymm10
	vsubpd	96(%rax), %ymm5, %ymm7
	vmulpd	%ymm7, %ymm9, %ymm9
	vsubpd	128(%rax), %ymm5, %ymm7
	vmulpd	%ymm7, %ymm8, %ymm8
	vsubpd	160(%rax), %ymm5, %ymm7
	vmulpd	%ymm7, %ymm4, %ymm4
	vsubpd	192(%rax), %ymm5, %ymm7
	vmulpd	%ymm7, %ymm1, %ymm1
	vsubpd	224(%rax), %ymm5, %ymm7
	vmulpd	%ymm7, %ymm6, %ymm6
	testb	$-32, %cl
	jne	.L882
	vandnpd	%ymm13, %ymm3, %ymm13
	vcmppd	$13, %ymm0, %ymm13, %ymm14
	vcmppd	$2, %ymm2, %ymm13, %ymm7
	vmovmskpd	%ymm14, %edi
	vmovmskpd	%ymm7, %esi
	testl	%edi, %edi
	je	.L883
	vmulpd	%ymm2, %ymm13, %ymm15
	popcntl	%edi, %edi
	addq	%rdi, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm13, %ymm13
.L883:
	testl	%esi, %esi
	je	.L884
	vmulpd	%ymm0, %ymm13, %ymm14
	popcntl	%esi, %esi
	subq	%rsi, %rdx
	vblendvpd	%ymm7, %ymm14, %ymm13, %ymm13
.L884:
	vandnpd	%ymm11, %ymm3, %ymm11
	vcmppd	$13, %ymm0, %ymm11, %ymm14
	vcmppd	$2, %ymm2, %ymm11, %ymm7
	vmovmskpd	%ymm14, %edi
	vmovmskpd	%ymm7, %esi
	testl	%edi, %edi
	je	.L885
	vmulpd	%ymm2, %ymm11, %ymm15
	popcntl	%edi, %edi
	addq	%rdi, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
.L885:
	testl	%esi, %esi
	je	.L886
	vmulpd	%ymm0, %ymm11, %ymm14
	popcntl	%esi, %esi
	subq	%rsi, %rdx
	vblendvpd	%ymm7, %ymm14, %ymm11, %ymm11
.L886:
	vandnpd	%ymm10, %ymm3, %ymm10
	vcmppd	$13, %ymm0, %ymm10, %ymm14
	vcmppd	$2, %ymm2, %ymm10, %ymm7
	vmovmskpd	%ymm14, %edi
	vmovmskpd	%ymm7, %esi
	testl	%edi, %edi
	je	.L887
	vmulpd	%ymm2, %ymm10, %ymm15
	popcntl	%edi, %edi
	addq	%rdi, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
.L887:
	testl	%esi, %esi
	je	.L888
	vmulpd	%ymm0, %ymm10, %ymm14
	popcntl	%esi, %esi
	subq	%rsi, %rdx
	vblendvpd	%ymm7, %ymm14, %ymm10, %ymm10
.L888:
	vandnpd	%ymm9, %ymm3, %ymm9
	vcmppd	$13, %ymm0, %ymm9, %ymm14
	vcmppd	$2, %ymm2, %ymm9, %ymm7
	vmovmskpd	%ymm14, %edi
	vmovmskpd	%ymm7, %esi
	testl	%edi, %edi
	je	.L889
	vmulpd	%ymm2, %ymm9, %ymm15
	popcntl	%edi, %edi
	addq	%rdi, %rdx
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L889:
	testl	%esi, %esi
	je	.L890
	vmulpd	%ymm0, %ymm9, %ymm14
	popcntl	%esi, %esi
	subq	%rsi, %rdx
	vblendvpd	%ymm7, %ymm14, %ymm9, %ymm9
.L890:
	vandnpd	%ymm8, %ymm3, %ymm8
	vcmppd	$13, %ymm0, %ymm8, %ymm14
	vcmppd	$2, %ymm2, %ymm8, %ymm7
	vmovmskpd	%ymm14, %edi
	vmovmskpd	%ymm7, %esi
	testl	%edi, %edi
	je	.L891
	vmulpd	%ymm2, %ymm8, %ymm15
	popcntl	%edi, %edi
	addq	%rdi, %r13
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
.L891:
	testl	%esi, %esi
	je	.L892
	vmulpd	%ymm0, %ymm8, %ymm14
	popcntl	%esi, %esi
	subq	%rsi, %r13
	vblendvpd	%ymm7, %ymm14, %ymm8, %ymm8
.L892:
	vandnpd	%ymm4, %ymm3, %ymm4
	vcmppd	$13, %ymm0, %ymm4, %ymm14
	vcmppd	$2, %ymm2, %ymm4, %ymm7
	vmovmskpd	%ymm14, %edi
	vmovmskpd	%ymm7, %esi
	testl	%edi, %edi
	je	.L893
	vmulpd	%ymm2, %ymm4, %ymm15
	popcntl	%edi, %edi
	addq	%rdi, %r13
	vblendvpd	%ymm14, %ymm15, %ymm4, %ymm4
.L893:
	testl	%esi, %esi
	je	.L894
	vmulpd	%ymm0, %ymm4, %ymm14
	popcntl	%esi, %esi
	subq	%rsi, %r13
	vblendvpd	%ymm7, %ymm14, %ymm4, %ymm4
.L894:
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm14
	vcmppd	$2, %ymm2, %ymm1, %ymm7
	vmovmskpd	%ymm14, %edi
	vmovmskpd	%ymm7, %esi
	testl	%edi, %edi
	je	.L895
	vmulpd	%ymm2, %ymm1, %ymm15
	popcntl	%edi, %edi
	addq	%rdi, %r13
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
.L895:
	testl	%esi, %esi
	je	.L896
	vmulpd	%ymm0, %ymm1, %ymm14
	popcntl	%esi, %esi
	subq	%rsi, %r13
	vblendvpd	%ymm7, %ymm14, %ymm1, %ymm1
.L896:
	vandnpd	%ymm6, %ymm3, %ymm6
	vcmppd	$13, %ymm0, %ymm6, %ymm14
	vcmppd	$2, %ymm2, %ymm6, %ymm7
	vmovmskpd	%ymm14, %edi
	vmovmskpd	%ymm7, %esi
	testl	%edi, %edi
	je	.L897
	vmulpd	%ymm2, %ymm6, %ymm15
	popcntl	%edi, %edi
	addq	%rdi, %r13
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
.L897:
	testl	%esi, %esi
	je	.L882
	vmulpd	%ymm0, %ymm6, %ymm14
	popcntl	%esi, %esi
	subq	%rsi, %r13
	vblendvpd	%ymm7, %ymm14, %ymm6, %ymm6
	jmp	.L882
.L1259:
	vandnpd	%ymm13, %ymm3, %ymm13
	vcmppd	$13, %ymm0, %ymm13, %ymm7
	vcmppd	$2, %ymm2, %ymm13, %ymm5
	vmovmskpd	%ymm7, %ecx
	vmovmskpd	%ymm5, %eax
	testl	%ecx, %ecx
	je	.L899
	vmulpd	%ymm2, %ymm13, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm7, %ymm14, %ymm13, %ymm13
.L899:
	testl	%eax, %eax
	je	.L900
	vmulpd	%ymm0, %ymm13, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm5, %ymm7, %ymm13, %ymm13
.L900:
	vandnpd	%ymm11, %ymm3, %ymm11
	vcmppd	$13, %ymm0, %ymm11, %ymm7
	vcmppd	$2, %ymm2, %ymm11, %ymm5
	vmovmskpd	%ymm7, %ecx
	vmovmskpd	%ymm5, %eax
	testl	%ecx, %ecx
	je	.L901
	vmulpd	%ymm2, %ymm11, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm7, %ymm14, %ymm11, %ymm11
.L901:
	testl	%eax, %eax
	je	.L902
	vmulpd	%ymm0, %ymm11, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm5, %ymm7, %ymm11, %ymm11
.L902:
	vandnpd	%ymm10, %ymm3, %ymm10
	vcmppd	$13, %ymm0, %ymm10, %ymm7
	vcmppd	$2, %ymm2, %ymm10, %ymm5
	vmovmskpd	%ymm7, %ecx
	vmovmskpd	%ymm5, %eax
	testl	%ecx, %ecx
	je	.L903
	vmulpd	%ymm2, %ymm10, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm7, %ymm14, %ymm10, %ymm10
.L903:
	testl	%eax, %eax
	je	.L904
	vmulpd	%ymm0, %ymm10, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm5, %ymm7, %ymm10, %ymm10
.L904:
	vandnpd	%ymm9, %ymm3, %ymm9
	vcmppd	$13, %ymm0, %ymm9, %ymm7
	vcmppd	$2, %ymm2, %ymm9, %ymm5
	vmovmskpd	%ymm7, %ecx
	vmovmskpd	%ymm5, %eax
	testl	%ecx, %ecx
	je	.L905
	vmulpd	%ymm2, %ymm9, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %rdx
	vblendvpd	%ymm7, %ymm14, %ymm9, %ymm9
.L905:
	testl	%eax, %eax
	je	.L906
	vmulpd	%ymm0, %ymm9, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %rdx
	vblendvpd	%ymm5, %ymm7, %ymm9, %ymm9
.L906:
	vandnpd	%ymm8, %ymm3, %ymm8
	vcmppd	$13, %ymm0, %ymm8, %ymm7
	vcmppd	$2, %ymm2, %ymm8, %ymm5
	vmovmskpd	%ymm7, %ecx
	vmovmskpd	%ymm5, %eax
	testl	%ecx, %ecx
	je	.L907
	vmulpd	%ymm2, %ymm8, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm7, %ymm14, %ymm8, %ymm8
.L907:
	testl	%eax, %eax
	je	.L908
	vmulpd	%ymm0, %ymm8, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm5, %ymm7, %ymm8, %ymm8
.L908:
	vandnpd	%ymm4, %ymm3, %ymm4
	vcmppd	$13, %ymm0, %ymm4, %ymm7
	vcmppd	$2, %ymm2, %ymm4, %ymm5
	vmovmskpd	%ymm7, %ecx
	vmovmskpd	%ymm5, %eax
	testl	%ecx, %ecx
	je	.L909
	vmulpd	%ymm2, %ymm4, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm7, %ymm14, %ymm4, %ymm4
.L909:
	testl	%eax, %eax
	je	.L910
	vmulpd	%ymm0, %ymm4, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm5, %ymm7, %ymm4, %ymm4
.L910:
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm7
	vcmppd	$2, %ymm2, %ymm1, %ymm5
	vmovmskpd	%ymm7, %ecx
	vmovmskpd	%ymm5, %eax
	testl	%ecx, %ecx
	je	.L911
	vmulpd	%ymm2, %ymm1, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm7, %ymm14, %ymm1, %ymm1
.L911:
	testl	%eax, %eax
	je	.L912
	vmulpd	%ymm0, %ymm1, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm5, %ymm7, %ymm1, %ymm1
.L912:
	vandnpd	%ymm6, %ymm3, %ymm6
	vcmppd	$13, %ymm0, %ymm6, %ymm7
	vcmppd	$2, %ymm2, %ymm6, %ymm5
	vmovmskpd	%ymm7, %ecx
	vmovmskpd	%ymm5, %eax
	testl	%ecx, %ecx
	je	.L913
	vmulpd	%ymm2, %ymm6, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %r13
	vblendvpd	%ymm7, %ymm14, %ymm6, %ymm6
.L913:
	testl	%eax, %eax
	je	.L914
	vmulpd	%ymm0, %ymm6, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm5, %ymm7, %ymm6, %ymm6
.L914:
	vmulpd	%ymm8, %ymm13, %ymm8
	vandnpd	%ymm8, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm13
	vcmppd	$2, %ymm2, %ymm5, %ymm7
	vmovmskpd	%ymm13, %eax
	vmovmskpd	%ymm7, %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	jne	.L1260
.L915:
	vmulpd	%ymm11, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm11
	vcmppd	$2, %ymm2, %ymm5, %ymm7
	vmovmskpd	%ymm11, %eax
	vmovmskpd	%ymm7, %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	jne	.L1261
.L916:
	vmulpd	%ymm1, %ymm10, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm10
	vcmppd	$2, %ymm2, %ymm5, %ymm7
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm7, %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	jne	.L1262
.L917:
	vmulpd	%ymm6, %ymm9, %ymm6
	vandnpd	%ymm6, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm9
	vcmppd	$2, %ymm2, %ymm5, %ymm7
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm7, %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	jne	.L1263
.L918:
	vmulpd	%ymm4, %ymm8, %ymm7
	addq	%r13, %rdx
	vandnpd	%ymm7, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm4
	vcmppd	$2, %ymm2, %ymm5, %ymm8
	vmovmskpd	%ymm4, %eax
	vmovmskpd	%ymm8, %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	jne	.L1264
.L919:
	vmulpd	%ymm6, %ymm1, %ymm4
	vandnpd	%ymm4, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm6
	vcmppd	$2, %ymm2, %ymm1, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	jne	.L1265
.L920:
	vmulpd	%ymm7, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm3, %ymm1
	vcmppd	$13, %ymm0, %ymm1, %ymm6
	vcmppd	$2, %ymm2, %ymm1, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	jne	.L1266
.L921:
	vinsertf128	$1, .LC4(%rip), %ymm4, %ymm1
	vperm2f128	$33, .LC4(%rip), %ymm4, %ymm4
	vmulpd	%ymm4, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm5
	vcmppd	$2, %ymm2, %ymm3, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	jne	.L1267
.L922:
	vmovapd	%xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	%xmm12, %xmm0, %xmm1
	vcomisd	.LC14(%rip), %xmm1
	jbe	.L1230
	vmulsd	-2608(%rbp), %xmm1, %xmm1
	incq	%rdx
.L925:
	movq	%rdx, -2568(%rbp)
	vmovsd	.LC45(%rip), %xmm2
	vmovsd	-2608(%rbp), %xmm3
	movq	%rdx, %rsi
	movl	$32, %eax
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L933:
	cmpq	$61, %rax
	movl	$62, %ecx
	cmove	%rcx, %rax
	vsubsd	(%r14,%rax,8), %xmm2, %xmm0
	vandpd	%xmm12, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm1
	vcomisd	.LC14(%rip), %xmm1
	jbe	.L1231
	vmulsd	%xmm3, %xmm1, %xmm1
	incq	%rsi
	movl	$1, %edi
.L930:
	incq	%rax
	cmpq	$64, %rax
	jne	.L933
	testb	%dil, %dil
	je	.L952
	movq	%rsi, -2568(%rbp)
.L934:
	vmovsd	.LC46(%rip), %xmm2
	vmovsd	%xmm1, -2576(%rbp)
	vdivsd	%xmm1, %xmm2, %xmm0
	vandpd	%xmm12, %xmm0, %xmm0
	vsubsd	.LC20(%rip), %xmm0, %xmm0
	vandpd	%xmm12, %xmm0, %xmm0
	vcomisd	.LC21(%rip), %xmm0
	ja	.L1268
	cmpq	$-3, %rsi
	jne	.L1269
	movq	-2616(%rbp), %rdx
	leaq	-2576(%rbp), %rsi
	movq	%r14, %rdi
	vzeroupper
	call	_Z13prod_realreallldPKdRdRl.constprop.0
	vmovsd	-2576(%rbp), %xmm1
	vmovsd	.LC47(%rip), %xmm2
	vmovq	.LC13(%rip), %xmm12
	vdivsd	%xmm1, %xmm2, %xmm0
	vandpd	%xmm12, %xmm0, %xmm0
	vsubsd	.LC20(%rip), %xmm0, %xmm0
	vandpd	%xmm12, %xmm0, %xmm0
	vcomisd	.LC21(%rip), %xmm0
	ja	.L1270
	movq	-2568(%rbp), %rsi
	cmpq	$101, %rsi
	jne	.L1271
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L1272
	addq	$2592, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1231:
	.cfi_restore_state
	vcomisd	%xmm1, %xmm3
	jbe	.L930
	vmulsd	.LC14(%rip), %xmm1, %xmm1
	decq	%rsi
	movl	$1, %edi
	jmp	.L930
.L1230:
	vmovsd	-2608(%rbp), %xmm3
	vcomisd	%xmm1, %xmm3
	jbe	.L925
	vmulsd	.LC14(%rip), %xmm1, %xmm1
	decq	%rdx
	jmp	.L925
.L827:
	vmovapd	%ymm7, %ymm4
	testl	%edx, %edx
	je	.L941
	vmulpd	%ymm0, %ymm7, %ymm8
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm5, %ymm8, %ymm7, %ymm7
	vmovapd	%ymm7, %ymm4
	jmp	.L939
.L1226:
	vmovsd	-2608(%rbp), %xmm15
	vcomisd	%xmm1, %xmm15
	jbe	.L818
	vmulsd	.LC14(%rip), %xmm1, %xmm1
	decq	%rsi
	jmp	.L818
.L1228:
	vmovsd	-2608(%rbp), %xmm4
	vcomisd	%xmm1, %xmm4
	jbe	.L835
	vmulsd	.LC14(%rip), %xmm1, %xmm1
	decq	%rsi
	jmp	.L835
.L952:
	movq	%rdx, %rsi
	jmp	.L934
.L828:
	addq	%rax, %rsi
	vmovapd	%ymm4, %ymm7
	jmp	.L941
.L1244:
	vmulpd	%ymm2, %ymm1, %ymm9
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rsi
	vblendvpd	%ymm10, %ymm9, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm9
	vblendvpd	%ymm8, %ymm9, %ymm1, %ymm9
	jmp	.L812
.L1238:
	vmulpd	%ymm2, %ymm1, %ymm8
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %r13
	vblendvpd	%ymm9, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm8
	vblendvpd	%ymm5, %ymm8, %ymm1, %ymm8
	jmp	.L798
.L1239:
	vmulpd	%ymm2, %ymm1, %ymm5
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm5, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm5
	addq	%rax, %r13
	vblendvpd	%ymm9, %ymm5, %ymm1, %ymm5
	jmp	.L799
.L1240:
	vmulpd	%ymm2, %ymm1, %ymm5
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm9, %ymm5, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm5
	addq	%rax, %r13
	vblendvpd	%ymm8, %ymm5, %ymm1, %ymm5
	jmp	.L800
.L1241:
	vmulpd	%ymm2, %ymm5, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm9, %ymm1, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm1
	addq	%rax, %r13
	vblendvpd	%ymm8, %ymm1, %ymm5, %ymm1
	jmp	.L801
.L1267:
	vmulpd	%ymm2, %ymm3, %ymm2
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm5, %ymm2, %ymm3, %ymm3
	vmulpd	%ymm0, %ymm3, %ymm0
	addq	%rax, %rdx
	vblendvpd	%ymm4, %ymm0, %ymm3, %ymm1
	jmp	.L922
.L1266:
	vmulpd	%ymm2, %ymm1, %ymm4
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm6, %ymm4, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm4
	addq	%rax, %rdx
	vblendvpd	%ymm5, %ymm4, %ymm1, %ymm4
	jmp	.L921
.L1265:
	vmulpd	%ymm2, %ymm1, %ymm4
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm6, %ymm4, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm4
	addq	%rax, %rdx
	vblendvpd	%ymm5, %ymm4, %ymm1, %ymm4
	jmp	.L920
.L1264:
	vmulpd	%ymm2, %ymm5, %ymm7
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm4, %ymm7, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm4
	addq	%rax, %rdx
	vblendvpd	%ymm8, %ymm4, %ymm5, %ymm7
	jmp	.L919
.L1263:
	vmulpd	%ymm2, %ymm5, %ymm6
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm9, %ymm6, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm6
	addq	%rax, %rdx
	vblendvpd	%ymm7, %ymm6, %ymm5, %ymm6
	jmp	.L918
.L1262:
	vmulpd	%ymm2, %ymm5, %ymm1
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm10, %ymm1, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm1
	addq	%rax, %rdx
	vblendvpd	%ymm7, %ymm1, %ymm5, %ymm1
	jmp	.L917
.L1261:
	vmulpd	%ymm2, %ymm5, %ymm4
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm11, %ymm4, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm4
	addq	%rax, %rdx
	vblendvpd	%ymm7, %ymm4, %ymm5, %ymm4
	jmp	.L916
.L1260:
	vmulpd	%ymm2, %ymm5, %ymm8
	popcntl	%eax, %eax
	popcntl	%ecx, %ecx
	subl	%ecx, %eax
	cltq
	vblendvpd	%ymm13, %ymm8, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm8
	addq	%rax, %rdx
	vblendvpd	%ymm7, %ymm8, %ymm5, %ymm8
	jmp	.L915
.L1253:
	vmulpd	%ymm2, %ymm4, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm6, %ymm1, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm4, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm5, %ymm1, %ymm4, %ymm1
	jmp	.L832
.L1252:
	vmulpd	%ymm2, %ymm1, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm6, %ymm4, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm4
	addq	%rax, %rsi
	vblendvpd	%ymm5, %ymm4, %ymm1, %ymm4
	jmp	.L831
.L1251:
	vmulpd	%ymm2, %ymm5, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm7, %ymm4, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm4
	addq	%rax, %rsi
	vblendvpd	%ymm6, %ymm4, %ymm5, %ymm4
	jmp	.L830
.L1250:
	vmulpd	%ymm2, %ymm5, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm1, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm6, %ymm1, %ymm5, %ymm1
	jmp	.L829
.L1247:
	vmulpd	%ymm2, %ymm8, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm1, %ymm8, %ymm8
	vmulpd	%ymm0, %ymm8, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm1, %ymm8, %ymm1
	jmp	.L815
.L1246:
	vmulpd	%ymm2, %ymm1, %ymm8
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm8
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm8, %ymm1, %ymm8
	jmp	.L814
.L1245:
	vmulpd	%ymm2, %ymm1, %ymm8
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm11, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm8
	addq	%rax, %rsi
	vblendvpd	%ymm10, %ymm8, %ymm1, %ymm8
	jmp	.L813
.L1249:
	movl	$1, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L1268:
	vmovsd	%xmm2, %xmm2, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L1269:
	movq	$-3, %rdi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L1270:
	vmovsd	%xmm2, %xmm2, %xmm0
	call	_Z13assert_approxdd.part.0
.L1271:
	movl	$101, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L1236:
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
.L956:
	leaq	_ZSt4cerr(%rip), %r12
	movl	$20, %edx
	leaq	.LC0(%rip), %rsi
	movq	%r12, %rdi
	vmovsd	%xmm1, -2584(%rbp)
	vzeroupper
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	.LC33(%rip), %rax
	movq	%r12, %rdi
	vmovq	%rax, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$4, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2584(%rbp), %xmm1
	movq	%r12, %rdi
	vmovsd	%xmm1, %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r13
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r13,%rax), %r12
	testq	%r12, %r12
	je	.L1273
	cmpb	$0, 56(%r12)
	je	.L809
	movzbl	67(%r12), %eax
.L810:
	movsbl	%al, %esi
	movq	%r13, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movl	$8, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rdi
	leaq	.LC2(%rip), %rax
	movq	%rax, (%rdi)
	xorl	%edx, %edx
	leaq	_ZTIPKc(%rip), %rsi
	call	__cxa_throw@PLT
.L1237:
	movl	$1, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L809:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	%rcx, %rdx
	je	.L810
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rdx
	jmp	.L810
.L1273:
	call	_ZSt16__throw_bad_castv@PLT
.L1243:
	movq	%r13, %rsi
	xorl	%edi, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L1255:
	movl	$2, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L1258:
	leaq	.LC5(%rip), %rcx
	movl	$285, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	vzeroupper
	call	__assert_fail@PLT
.L1254:
	vmovsd	%xmm5, %xmm5, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L1272:
	call	__stack_chk_fail@PLT
.L1248:
	vmovsd	%xmm9, %xmm9, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
	.cfi_endproc
.LFE8829:
	.size	_Z8test_allv, .-_Z8test_allv
	.p2align 4
	.globl	_Z21init_random_positionslddPd
	.type	_Z21init_random_positionslddPd, @function
_Z21init_random_positionslddPd:
.LFB8795:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	jle	.L1288
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
	jmp	.L1283
	.p2align 4,,10
	.p2align 3
.L1290:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L1277:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC39(%rip), %xmm0, %xmm0
	vcomisd	.LC20(%rip), %xmm0
	jnb	.L1278
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L1284
.L1279:
	movq	%rdx, %rax
.L1283:
	cmpq	$311, %rax
	ja	.L1289
.L1282:
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
	jns	.L1290
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L1277
	.p2align 4,,10
	.p2align 3
.L1289:
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
	jmp	.L1282
	.p2align 4,,10
	.p2align 3
.L1278:
	vmovsd	.LC42(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L1279
.L1284:
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
.L1288:
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
.LC48:
	.string	"M N\n"
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"M number of runs, N number of particles\n"
	.section	.rodata.str1.1
.LC50:
	.string	"example: "
.LC51:
	.string	" 10 10000\n"
.LC52:
	.string	" product: "
.LC54:
	.string	" exponent: "
.LC56:
	.string	"prod_realreal: orod="
.LC57:
	.string	" exponent="
.LC58:
	.string	" timing="
.LC59:
	.string	" seconds\n"
.LC60:
	.string	"prod_complexcomplex: orod="
.LC61:
	.string	"prod_realcomplex: orod="
.LC62:
	.string	"prod_complexreal: orod="
	.section	.text.unlikely,"ax",@progbits
.LCOLDB63:
	.section	.text.startup,"ax",@progbits
.LHOTB63:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8830:
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
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movl	%edi, %r13d
	pushq	%r12
	pushq	%r10
	pushq	%rbx
	.cfi_offset 12, -48
	.cfi_offset 10, -56
	.cfi_offset 3, -64
	movq	%rsi, %rbx
	subq	$2720, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	_Z8test_allv
	movq	$5489, -2560(%rbp)
	movl	$5489, %eax
	movl	$1, %ecx
	leaq	-2560(%rbp), %rsi
	movabsq	$6364136223846793005, %rdi
	movq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L1292:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	leaq	(%rax,%rcx), %rdx
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
	cmpq	$312, %rcx
	jne	.L1292
	leaq	_ZL3gen(%rip), %r12
	movl	$2504, %edx
	movq	%r12, %rdi
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	cmpl	$3, %r13d
	je	.L1293
	leaq	_ZSt4cout(%rip), %r12
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC48(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC49(%rip), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$9, %edx
	leaq	.LC50(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC51(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %eax
.L1291:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L1388
	addq	$2720, %rsp
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
.L1293:
	.cfi_restore_state
	movl	$10, %edx
	leaq	.LC52(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	$0, -2632(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	.LC53(%rip), %ymm0
	leaq	-2632(%rbp), %rdi
	call	_Z18horizontal_productDv4_dRl
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$11, %edx
	leaq	.LC54(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2632(%rbp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	cltq
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, -2736(%rbp)
	call	strtol@PLT
	movslq	%eax, %r14
	movabsq	$1152921504606846975, %rax
	movq	%r14, -2688(%rbp)
	cmpq	%rax, %r14
	ja	.L1295
	leaq	0(,%r14,8), %rbx
	movq	%rbx, %rdi
	call	_Znam@PLT
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	_Znam@PLT
	movq	.LC20(%rip), %rdi
	movq	%r15, %rsi
	vmovq	%rdi, %xmm1
	movq	.LC41(%rip), %rdi
	movq	%rax, %r13
	vmovq	%rdi, %xmm0
	movq	%r14, %rdi
	call	_Z21init_random_positionslddPd
	movq	.LC20(%rip), %rdi
	movq	%r13, %rsi
	vmovq	%rdi, %xmm1
	movq	.LC41(%rip), %rdi
	vmovq	%rdi, %xmm0
	movq	%r14, %rdi
	call	_Z21init_random_positionslddPd
	movq	.LC20(%rip), %rsi
	movq	$0, -2616(%rbp)
	movq	%rsi, -2624(%rbp)
	call	clock@PLT
	movq	.LC55(%rip), %rsi
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -2592(%rbp)
	movq	%rax, -2608(%rbp)
	movq	%rsi, -2568(%rbp)
	movb	$1, -2576(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	cmpq	$0, -2736(%rbp)
	vmovsd	%xmm0, -2600(%rbp)
	jle	.L1296
	testq	%r14, %r14
	jle	.L1296
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	-2616(%rbp), %rax
	movq	%rax, -2704(%rbp)
	vmovsd	%xmm4, -2648(%rbp)
	leaq	-2624(%rbp), %rax
	vmovsd	.LC39(%rip), %xmm4
	movq	%rax, -2696(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	%xmm4, -2656(%rbp)
	movq	$0, -2712(%rbp)
	vmovsd	.LC40(%rip), %xmm4
	movq	%rax, -2744(%rbp)
	movq	%r13, -2728(%rbp)
	movq	%rbx, -2720(%rbp)
	movq	-2688(%rbp), %rbx
	vmovsd	%xmm4, -2664(%rbp)
	.p2align 4,,10
	.p2align 3
.L1297:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -2672(%rbp)
	vmovsd	%xmm7, -2680(%rbp)
	jmp	.L1305
	.p2align 4,,10
	.p2align 3
.L1390:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L1299:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcomisd	.LC20(%rip), %xmm0
	jnb	.L1300
	vmovsd	-2672(%rbp), %xmm6
	vmovsd	.LC41(%rip), %xmm7
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm7, %xmm0
.L1386:
	movq	-2704(%rbp), %r8
	movq	-2696(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L1301
	movq	%r14, %rax
.L1305:
	cmpq	$311, %rax
	ja	.L1389
.L1303:
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
	jns	.L1390
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L1299
	.p2align 4,,10
	.p2align 3
.L1301:
	incq	-2712(%rbp)
	movq	-2712(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L1297
	movq	-2720(%rbp), %rbx
	movq	-2728(%rbp), %r13
.L1296:
	leaq	-2608(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -2760(%rbp)
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC56(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC58(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L1391
.L1306:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC59(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC20(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -2592(%rbp)
	movq	%rax, -2624(%rbp)
	movq	$0, -2616(%rbp)
	movb	$1, -2576(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	cmpq	$0, -2736(%rbp)
	vmovsd	%xmm0, -2600(%rbp)
	jle	.L1307
	cmpq	$0, -2688(%rbp)
	jle	.L1307
	leaq	-2616(%rbp), %rax
	movq	%rax, -2704(%rbp)
	leaq	-2624(%rbp), %rax
	movq	%rax, -2696(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC39(%rip), %xmm4
	vmovsd	.LC40(%rip), %xmm6
	movq	$0, -2720(%rbp)
	movq	%rax, -2744(%rbp)
	movq	%rbx, -2728(%rbp)
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	-2688(%rbp), %rbx
	vmovsd	%xmm3, -2648(%rbp)
	vmovsd	%xmm4, -2656(%rbp)
	vmovsd	%xmm6, -2664(%rbp)
	.p2align 4,,10
	.p2align 3
.L1308:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -2672(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -2680(%rbp)
	jmp	.L1321
	.p2align 4,,10
	.p2align 3
.L1395:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L1310:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmovsd	.LC20(%rip), %xmm7
	vmovsd	.LC42(%rip), %xmm6
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-2672(%rbp), %xmm6
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vmovsd	.LC41(%rip), %xmm6
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L1392
.L1315:
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
	js	.L1316
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L1317:
	vaddsd	-2648(%rbp), %xmm1, %xmm1
	vmulsd	-2656(%rbp), %xmm1, %xmm1
	vcomisd	.LC20(%rip), %xmm1
	jnb	.L1318
	vmovsd	-2672(%rbp), %xmm4
	movq	-2704(%rbp), %r9
	vfmadd132sd	-2680(%rbp), %xmm4, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L1387:
	vmovsd	.LC41(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L1393
.L1321:
	cmpq	$311, %r11
	ja	.L1394
.L1314:
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
	jns	.L1395
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L1310
	.p2align 4,,10
	.p2align 3
.L1393:
	incq	-2720(%rbp)
	movq	-2720(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L1308
	movq	-2728(%rbp), %rbx
.L1307:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC60(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC58(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L1396
.L1322:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC59(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC20(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -2592(%rbp)
	movq	%rax, -2624(%rbp)
	movq	$0, -2616(%rbp)
	movb	$1, -2576(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	cmpq	$0, -2736(%rbp)
	vmovsd	%xmm0, -2600(%rbp)
	jle	.L1323
	cmpq	$0, -2688(%rbp)
	jle	.L1323
	movq	.LC20(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC39(%rip), %xmm6
	vmovsd	.LC40(%rip), %xmm7
	movq	$0, -2728(%rbp)
	movq	%rax, -2744(%rbp)
	xorl	%r10d, %r10d
	vmovsd	%xmm4, -2648(%rbp)
	movl	$134201207, %esi
	vmovsd	.LC14(%rip), %xmm3
	vmovsd	.LC15(%rip), %xmm4
	vmovsd	%xmm6, -2656(%rbp)
	vmovsd	%xmm7, -2664(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	salq	$37, %rsi
	movq	%r10, %r14
	.p2align 4,,10
	.p2align 3
.L1324:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm6
	vmovsd	(%rax), %xmm7
	xorl	%r11d, %r11d
	vsubsd	%xmm7, %xmm6, %xmm6
	movq	2496+_ZL3gen(%rip), %rdi
	movq	%r14, %r10
	movq	%r13, %r14
	movq	%r11, %r13
	.p2align 4,,10
	.p2align 3
.L1337:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L1397
.L1330:
	leaq	1(%rax), %rdi
	movq	(%r12,%rax,8), %rax
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
	js	.L1325
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L1326:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC20(%rip), %xmm2
	vmovsd	.LC42(%rip), %xmm1
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	movq	%r10, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC41(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	jmp	.L1335
	.p2align 4,,10
	.p2align 3
.L1399:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L1333:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L1398
.L1335:
	vmovsd	(%r14,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L1399
	vcomisd	%xmm0, %xmm4
	jbe	.L1333
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L1335
.L1398:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L1336
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r10
.L1336:
	incq	%r13
	cmpq	%r13, -2688(%rbp)
	jne	.L1337
	incq	-2728(%rbp)
	movq	%r14, %r13
	movq	%r10, %r14
	movq	-2728(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L1324
.L1323:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC61(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC58(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L1400
.L1338:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC59(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC20(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -2592(%rbp)
	movq	%rax, -2624(%rbp)
	movq	$0, -2616(%rbp)
	movb	$1, -2576(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	cmpq	$0, -2736(%rbp)
	vmovsd	%xmm0, -2600(%rbp)
	jle	.L1339
	cmpq	$0, -2688(%rbp)
	jle	.L1339
	movq	.LC20(%rip), %rax
	vmovsd	.LC40(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC39(%rip), %xmm7
	movq	$0, -2752(%rbp)
	movq	%rax, -2744(%rbp)
	movq	%r15, -2672(%rbp)
	xorl	%esi, %esi
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	%xmm3, -2664(%rbp)
	vmovsd	.LC15(%rip), %xmm4
	vmovsd	.LC14(%rip), %xmm3
	movq	%r13, -2768(%rbp)
	addq	%r15, %rbx
	vmovsd	%xmm6, -2648(%rbp)
	vmovsd	%xmm7, -2656(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	movabsq	$-2270628950310912, %r14
	movq	%rsi, %r13
	.p2align 4,,10
	.p2align 3
.L1340:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm6
	vmovsd	(%rax), %xmm7
	xorl	%r15d, %r15d
	vsubsd	%xmm7, %xmm6, %xmm6
	movq	%r13, %rax
	movq	2496+_ZL3gen(%rip), %rdi
	movq	%rbx, %r13
	movq	%r15, %rbx
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L1358:
	cmpq	$311, %rdi
	ja	.L1401
.L1346:
	movq	(%r12,%rdi,8), %rdx
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
	js	.L1341
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L1342:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC20(%rip), %xmm2
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC42(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC41(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L1402
.L1347:
	leaq	1(%rax), %rdi
	movq	(%r12,%rax,8), %rax
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
	js	.L1348
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L1349:
	vaddsd	-2648(%rbp), %xmm2, %xmm2
	vmovsd	.LC20(%rip), %xmm1
	vmovsd	.LC41(%rip), %xmm9
	vmulsd	-2656(%rbp), %xmm2, %xmm2
	movq	-2672(%rbp), %rax
	movq	%r15, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC42(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	-2664(%rbp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L1356
	.p2align 4,,10
	.p2align 3
.L1404:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L1354:
	addq	$8, %rax
	cmpq	%rax, %r13
	je	.L1403
.L1356:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L1404
	vcomisd	%xmm0, %xmm4
	jbe	.L1354
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r13
	jne	.L1356
.L1403:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L1357
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r15
.L1357:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L1358
	incq	-2752(%rbp)
	movq	%r13, %rbx
	movq	%r15, %r13
	movq	-2752(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L1340
	movq	-2672(%rbp), %r15
	movq	-2768(%rbp), %r13
.L1339:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC62(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC58(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L1405
.L1359:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC59(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZdaPv@PLT
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L1291
	.p2align 4,,10
	.p2align 3
.L1325:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L1326
	.p2align 4,,10
	.p2align 3
.L1341:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L1342
	.p2align 4,,10
	.p2align 3
.L1348:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L1349
	.p2align 4,,10
	.p2align 3
.L1316:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L1317
	.p2align 4,,10
	.p2align 3
.L1389:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L1303
	.p2align 4,,10
	.p2align 3
.L1402:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2728(%rbp)
	vmovsd	%xmm6, -2720(%rbp)
	vmovsd	%xmm4, -2712(%rbp)
	vmovsd	%xmm3, -2704(%rbp)
	vmovsd	%xmm7, -2696(%rbp)
	vmovsd	%xmm5, -2680(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	-2728(%rbp), %xmm0
	vmovsd	-2720(%rbp), %xmm6
	vmovsd	-2712(%rbp), %xmm4
	vmovsd	-2704(%rbp), %xmm3
	vmovsd	-2696(%rbp), %xmm7
	vmovsd	-2680(%rbp), %xmm5
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L1347
	.p2align 4,,10
	.p2align 3
.L1392:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2712(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-2712(%rbp), %xmm0
	jmp	.L1315
	.p2align 4,,10
	.p2align 3
.L1397:
	movq	%r12, %rdi
	movq	%r10, -2720(%rbp)
	vmovsd	%xmm0, -2712(%rbp)
	vmovsd	%xmm6, -2704(%rbp)
	vmovsd	%xmm4, -2696(%rbp)
	vmovsd	%xmm3, -2680(%rbp)
	vmovsd	%xmm7, -2672(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	movq	-2720(%rbp), %r10
	vmovsd	-2712(%rbp), %xmm0
	vmovsd	-2704(%rbp), %xmm6
	vmovsd	-2696(%rbp), %xmm4
	vmovsd	-2680(%rbp), %xmm3
	vmovsd	-2672(%rbp), %xmm7
	movabsq	$-2270628950310912, %rsi
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L1330
	.p2align 4,,10
	.p2align 3
.L1401:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2720(%rbp)
	vmovsd	%xmm6, -2712(%rbp)
	vmovsd	%xmm4, -2704(%rbp)
	vmovsd	%xmm3, -2696(%rbp)
	vmovsd	%xmm7, -2680(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdi
	vmovsd	-2720(%rbp), %xmm0
	vmovsd	-2712(%rbp), %xmm6
	vmovsd	-2704(%rbp), %xmm4
	vmovsd	-2696(%rbp), %xmm3
	vmovsd	-2680(%rbp), %xmm7
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L1346
	.p2align 4,,10
	.p2align 3
.L1394:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L1314
	.p2align 4,,10
	.p2align 3
.L1300:
	vmovsd	.LC42(%rip), %xmm0
	vmovsd	-2672(%rbp), %xmm3
	vmovsd	.LC41(%rip), %xmm4
	vfmadd132sd	-2680(%rbp), %xmm3, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm4, %xmm0
	jmp	.L1386
	.p2align 4,,10
	.p2align 3
.L1318:
	vmovsd	-2680(%rbp), %xmm1
	vmovsd	-2672(%rbp), %xmm7
	movq	-2704(%rbp), %r9
	vfmadd132sd	.LC42(%rip), %xmm7, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L1387
.L1405:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L1359
.L1400:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L1338
.L1396:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L1322
.L1391:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L1306
.L1388:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8830:
.L1295:
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
.LFE8830:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE63:
	.section	.text.startup
.LHOTE63:
	.p2align 4
	.type	_GLOBAL__sub_I__Z21init_random_positionslddPd, @function
_GLOBAL__sub_I__Z21init_random_positionslddPd:
.LFB9247:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	.cfi_offset 12, -24
	leaq	_ZStL8__ioinit(%rip), %r12
	movq	%r12, %rdi
	subq	$8, %rsp
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	__dso_handle(%rip), %rdx
	movq	%r12, %rsi
	call	__cxa_atexit@PLT
	movq	$5489, _ZL3gen(%rip)
	movl	$5489, %ecx
	movl	$1, %edx
	leaq	_ZL3gen(%rip), %rdi
	movabsq	$6364136223846793005, %rsi
	.p2align 4,,10
	.p2align 3
.L1407:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L1407
	vmovapd	.LC64(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	vmovapd	.LC4(%rip), %ymm0
	vmovapd	%ymm0, _ZL10_MM256_ONE(%rip)
	vzeroupper
	addq	$8, %rsp
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9247:
	.size	_GLOBAL__sub_I__Z21init_random_positionslddPd, .-_GLOBAL__sub_I__Z21init_random_positionslddPd
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z21init_random_positionslddPd
	.local	_ZL10_MM256_ONE
	.comm	_ZL10_MM256_ONE,32,32
	.local	_ZL5distu
	.comm	_ZL5distu,16,16
	.local	_ZL3gen
	.comm	_ZL3gen,2504,32
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC4:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC8:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC9:
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.align 32
.LC10:
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.align 32
.LC11:
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.align 32
.LC12:
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC13:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.set	.LC14,.LC11
	.set	.LC15,.LC12
	.set	.LC16,.LC9
	.set	.LC20,.LC4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC21:
	.long	-1998362383
	.long	1055193269
	.section	.rodata.cst32
	.align 32
.LC22:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC23:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC24:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC25:
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.set	.LC26,.LC22
	.set	.LC27,.LC23
	.set	.LC28,.LC24
	.set	.LC29,.LC25
	.align 32
.LC30:
	.long	-1951891235
	.long	1234495258
	.long	675124966
	.long	1248438422
	.long	2045033563
	.long	1597534338
	.long	-1221459147
	.long	1164226036
	.section	.rodata.cst8
	.align 8
.LC31:
	.long	478481221
	.long	1491110742
	.section	.rodata.cst32
	.align 32
.LC32:
	.long	0
	.long	1077149696
	.long	0
	.long	1075052544
	.long	0
	.long	1074266112
	.long	0
	.long	1073741824
	.section	.rodata.cst8
	.align 8
.LC33:
	.long	0
	.long	1082310656
	.section	.rodata.cst32
	.align 32
.LC34:
	.long	740819601
	.long	1159760682
	.long	740819601
	.long	1159760682
	.long	-981572454
	.long	-900654322
	.long	630506365
	.long	1420970413
	.section	.rodata.cst8
	.align 8
.LC35:
	.long	1350305698
	.long	1243119313
	.section	.rodata.cst32
	.align 32
.LC36:
	.long	357496748
	.long	-1771536750
	.long	1772755404
	.long	-639440707
	.long	777033391
	.long	-552366795
	.long	630506365
	.long	1420970413
	.section	.rodata.cst8
	.align 8
.LC37:
	.long	-519963160
	.long	1316942624
	.align 8
.LC39:
	.long	0
	.long	1005584384
	.set	.LC40,.LC32+24
	.align 8
.LC41:
	.long	0
	.long	-1074790400
	.align 8
.LC42:
	.long	-1
	.long	1072693247
	.section	.rodata.cst32
	.align 32
.LC43:
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.align 32
.LC44:
	.long	1717986918
	.long	1075603046
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.set	.LC45,.LC43
	.section	.rodata.cst8
	.align 8
.LC46:
	.long	-789117515
	.long	731179629
	.align 8
.LC47:
	.long	-1935337750
	.long	1246898371
	.section	.rodata.cst32
	.align 32
.LC53:
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
.LC55:
	.long	-1598689907
	.long	1051772663
	.set	.LC64,.LC8
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
