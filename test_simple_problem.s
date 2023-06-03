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
	.string	"Expected a ~= b but "
.LC1:
	.string	" != "
.LC2:
	.string	"assertion failed"
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
	leaq	.LC0(%rip), %rsi
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
.LFE9251:
	.size	_Z13assert_approxdd.part.0, .-_Z13assert_approxdd.part.0
	.section	.rodata.str1.1
.LC3:
	.string	"Expected a == b but "
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
	leaq	.LC3(%rip), %rsi
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
.LFE9252:
	.size	_Z9assert_eqIlEvT_S0_.part.0, .-_Z9assert_eqIlEvT_S0_.part.0
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
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	testb	$7, %sil
	jne	.L211
	vmovapd	.LC8(%rip), %ymm8
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm5
	vmovsd	%xmm0, %xmm0, %xmm14
	movq	%rdi, %rbx
	vmovlpd	(%rdx), %xmm8, %xmm0
	movq	%rdx, %r9
	vinsertf128	$0x0, %xmm0, %ymm8, %ymm8
	movq	(%rcx), %r10
	vmovapd	.LC4(%rip), %ymm7
	vmovapd	.LC9(%rip), %ymm11
	vmovapd	.LC10(%rip), %ymm2
	vmovapd	.LC11(%rip), %ymm3
	movq	%rsi, %rax
	vbroadcastsd	%xmm14, %ymm0
	andq	$-32, %rbx
	vmovapd	%ymm5, %ymm6
	vmovapd	%ymm5, %ymm1
	vmovapd	%ymm5, %ymm4
	vmovapd	%ymm5, %ymm9
	vmovapd	%ymm5, %ymm10
	xorl	%r11d, %r11d
	xorl	%edx, %edx
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L29:
	addq	$32, %rdx
	addq	$256, %rax
	cmpq	$16000, %rdx
	je	.L212
.L45:
	cmpq	%rdx, %rbx
	je	.L28
	vsubpd	(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm8, %ymm8
	vsubpd	32(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm5, %ymm5
	vsubpd	64(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm10, %ymm10
	vsubpd	96(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm9, %ymm9
	vsubpd	128(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm7, %ymm7
	vsubpd	160(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm4, %ymm4
	vsubpd	192(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm1, %ymm1
	vsubpd	224(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm6, %ymm6
.L28:
	testb	$-32, %dl
	jne	.L29
	vandnpd	%ymm8, %ymm11, %ymm8
	vcmppd	$13, %ymm2, %ymm8, %ymm13
	vcmppd	$2, %ymm3, %ymm8, %ymm12
	vmovmskpd	%ymm13, %r13d
	vmovmskpd	%ymm12, %r12d
	testl	%r13d, %r13d
	je	.L30
	vmulpd	%ymm3, %ymm8, %ymm15
	popcntl	%r13d, %r13d
	addq	%r13, %r10
	vblendvpd	%ymm13, %ymm15, %ymm8, %ymm8
.L30:
	testl	%r12d, %r12d
	je	.L31
	vmulpd	%ymm2, %ymm8, %ymm13
	popcntl	%r12d, %r12d
	subq	%r12, %r10
	vblendvpd	%ymm12, %ymm13, %ymm8, %ymm8
.L31:
	vandnpd	%ymm5, %ymm11, %ymm5
	vcmppd	$13, %ymm2, %ymm5, %ymm13
	vcmppd	$2, %ymm3, %ymm5, %ymm12
	vmovmskpd	%ymm13, %r13d
	vmovmskpd	%ymm12, %r12d
	testl	%r13d, %r13d
	je	.L32
	vmulpd	%ymm3, %ymm5, %ymm15
	popcntl	%r13d, %r13d
	addq	%r13, %r10
	vblendvpd	%ymm13, %ymm15, %ymm5, %ymm5
.L32:
	testl	%r12d, %r12d
	je	.L33
	vmulpd	%ymm2, %ymm5, %ymm13
	popcntl	%r12d, %r12d
	subq	%r12, %r10
	vblendvpd	%ymm12, %ymm13, %ymm5, %ymm5
.L33:
	vandnpd	%ymm10, %ymm11, %ymm10
	vcmppd	$13, %ymm2, %ymm10, %ymm13
	vcmppd	$2, %ymm3, %ymm10, %ymm12
	vmovmskpd	%ymm13, %r13d
	vmovmskpd	%ymm12, %r12d
	testl	%r13d, %r13d
	je	.L34
	vmulpd	%ymm3, %ymm10, %ymm15
	popcntl	%r13d, %r13d
	addq	%r13, %r10
	vblendvpd	%ymm13, %ymm15, %ymm10, %ymm10
.L34:
	testl	%r12d, %r12d
	je	.L35
	vmulpd	%ymm2, %ymm10, %ymm13
	popcntl	%r12d, %r12d
	subq	%r12, %r10
	vblendvpd	%ymm12, %ymm13, %ymm10, %ymm10
.L35:
	vandnpd	%ymm9, %ymm11, %ymm9
	vcmppd	$13, %ymm2, %ymm9, %ymm13
	vcmppd	$2, %ymm3, %ymm9, %ymm12
	vmovmskpd	%ymm13, %r13d
	vmovmskpd	%ymm12, %r12d
	testl	%r13d, %r13d
	je	.L36
	vmulpd	%ymm3, %ymm9, %ymm15
	popcntl	%r13d, %r13d
	addq	%r13, %r10
	vblendvpd	%ymm13, %ymm15, %ymm9, %ymm9
.L36:
	testl	%r12d, %r12d
	je	.L37
	vmulpd	%ymm2, %ymm9, %ymm13
	popcntl	%r12d, %r12d
	subq	%r12, %r10
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L37:
	vandnpd	%ymm7, %ymm11, %ymm7
	vcmppd	$13, %ymm2, %ymm7, %ymm13
	vcmppd	$2, %ymm3, %ymm7, %ymm12
	vmovmskpd	%ymm13, %r13d
	vmovmskpd	%ymm12, %r12d
	testl	%r13d, %r13d
	je	.L38
	vmulpd	%ymm3, %ymm7, %ymm15
	popcntl	%r13d, %r13d
	addq	%r13, %r11
	vblendvpd	%ymm13, %ymm15, %ymm7, %ymm7
.L38:
	testl	%r12d, %r12d
	je	.L39
	vmulpd	%ymm2, %ymm7, %ymm13
	popcntl	%r12d, %r12d
	subq	%r12, %r11
	vblendvpd	%ymm12, %ymm13, %ymm7, %ymm7
.L39:
	vandnpd	%ymm4, %ymm11, %ymm4
	vcmppd	$13, %ymm2, %ymm4, %ymm13
	vcmppd	$2, %ymm3, %ymm4, %ymm12
	vmovmskpd	%ymm13, %r13d
	vmovmskpd	%ymm12, %r12d
	testl	%r13d, %r13d
	je	.L40
	vmulpd	%ymm3, %ymm4, %ymm15
	popcntl	%r13d, %r13d
	addq	%r13, %r11
	vblendvpd	%ymm13, %ymm15, %ymm4, %ymm4
.L40:
	testl	%r12d, %r12d
	je	.L41
	vmulpd	%ymm2, %ymm4, %ymm13
	popcntl	%r12d, %r12d
	subq	%r12, %r11
	vblendvpd	%ymm12, %ymm13, %ymm4, %ymm4
.L41:
	vandnpd	%ymm1, %ymm11, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm13
	vcmppd	$2, %ymm3, %ymm1, %ymm12
	vmovmskpd	%ymm13, %r13d
	vmovmskpd	%ymm12, %r12d
	testl	%r13d, %r13d
	je	.L42
	vmulpd	%ymm3, %ymm1, %ymm15
	popcntl	%r13d, %r13d
	addq	%r13, %r11
	vblendvpd	%ymm13, %ymm15, %ymm1, %ymm1
.L42:
	testl	%r12d, %r12d
	je	.L43
	vmulpd	%ymm2, %ymm1, %ymm13
	popcntl	%r12d, %r12d
	subq	%r12, %r11
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
.L43:
	vandnpd	%ymm6, %ymm11, %ymm6
	vcmppd	$13, %ymm2, %ymm6, %ymm13
	vcmppd	$2, %ymm3, %ymm6, %ymm12
	vmovmskpd	%ymm13, %r13d
	vmovmskpd	%ymm12, %r12d
	testl	%r13d, %r13d
	je	.L44
	vmulpd	%ymm3, %ymm6, %ymm15
	popcntl	%r13d, %r13d
	addq	%r13, %r11
	vblendvpd	%ymm13, %ymm15, %ymm6, %ymm6
.L44:
	testl	%r12d, %r12d
	je	.L29
	vmulpd	%ymm2, %ymm6, %ymm13
	popcntl	%r12d, %r12d
	subq	%r12, %r11
	vblendvpd	%ymm12, %ymm13, %ymm6, %ymm6
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L212:
	vandnpd	%ymm8, %ymm11, %ymm8
	vcmppd	$13, %ymm2, %ymm8, %ymm12
	vcmppd	$2, %ymm3, %ymm8, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L46
	vmulpd	%ymm3, %ymm8, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r10
	vblendvpd	%ymm12, %ymm13, %ymm8, %ymm8
.L46:
	testl	%eax, %eax
	je	.L47
	vmulpd	%ymm2, %ymm8, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r10
	vblendvpd	%ymm0, %ymm12, %ymm8, %ymm8
.L47:
	vandnpd	%ymm5, %ymm11, %ymm5
	vcmppd	$13, %ymm2, %ymm5, %ymm12
	vcmppd	$2, %ymm3, %ymm5, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L48
	vmulpd	%ymm3, %ymm5, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r10
	vblendvpd	%ymm12, %ymm13, %ymm5, %ymm5
.L48:
	testl	%eax, %eax
	je	.L49
	vmulpd	%ymm2, %ymm5, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r10
	vblendvpd	%ymm0, %ymm12, %ymm5, %ymm5
.L49:
	vandnpd	%ymm10, %ymm11, %ymm10
	vcmppd	$13, %ymm2, %ymm10, %ymm12
	vcmppd	$2, %ymm3, %ymm10, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L50
	vmulpd	%ymm3, %ymm10, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r10
	vblendvpd	%ymm12, %ymm13, %ymm10, %ymm10
.L50:
	testl	%eax, %eax
	je	.L51
	vmulpd	%ymm2, %ymm10, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r10
	vblendvpd	%ymm0, %ymm12, %ymm10, %ymm10
.L51:
	vandnpd	%ymm9, %ymm11, %ymm9
	vcmppd	$13, %ymm2, %ymm9, %ymm12
	vcmppd	$2, %ymm3, %ymm9, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L52
	vmulpd	%ymm3, %ymm9, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r10
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L52:
	testl	%eax, %eax
	je	.L53
	vmulpd	%ymm2, %ymm9, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r10
	vblendvpd	%ymm0, %ymm12, %ymm9, %ymm9
.L53:
	vandnpd	%ymm7, %ymm11, %ymm7
	vcmppd	$13, %ymm2, %ymm7, %ymm12
	vcmppd	$2, %ymm3, %ymm7, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L54
	vmulpd	%ymm3, %ymm7, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r11
	vblendvpd	%ymm12, %ymm13, %ymm7, %ymm7
.L54:
	testl	%eax, %eax
	je	.L55
	vmulpd	%ymm2, %ymm7, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r11
	vblendvpd	%ymm0, %ymm12, %ymm7, %ymm7
.L55:
	vandnpd	%ymm4, %ymm11, %ymm4
	vcmppd	$13, %ymm2, %ymm4, %ymm12
	vcmppd	$2, %ymm3, %ymm4, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L56
	vmulpd	%ymm3, %ymm4, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r11
	vblendvpd	%ymm12, %ymm13, %ymm4, %ymm4
.L56:
	testl	%eax, %eax
	je	.L57
	vmulpd	%ymm2, %ymm4, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r11
	vblendvpd	%ymm0, %ymm12, %ymm4, %ymm4
.L57:
	vandnpd	%ymm1, %ymm11, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm12
	vcmppd	$2, %ymm3, %ymm1, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L58
	vmulpd	%ymm3, %ymm1, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r11
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
.L58:
	testl	%eax, %eax
	je	.L59
	vmulpd	%ymm2, %ymm1, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r11
	vblendvpd	%ymm0, %ymm12, %ymm1, %ymm1
.L59:
	vandnpd	%ymm6, %ymm11, %ymm6
	vcmppd	$13, %ymm2, %ymm6, %ymm12
	vcmppd	$2, %ymm3, %ymm6, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L60
	vmulpd	%ymm3, %ymm6, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r11
	vblendvpd	%ymm12, %ymm13, %ymm6, %ymm6
.L60:
	testl	%eax, %eax
	jne	.L213
.L61:
	vmulpd	%ymm8, %ymm7, %ymm7
	vandnpd	%ymm7, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm12
	vcmppd	$2, %ymm3, %ymm0, %ymm8
	vmovmskpd	%ymm12, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	jne	.L214
.L62:
	vmulpd	%ymm4, %ymm5, %ymm4
	vandnpd	%ymm4, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm8
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	jne	.L215
.L63:
	vmulpd	%ymm10, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm8
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	jne	.L216
.L64:
	vmulpd	%ymm9, %ymm6, %ymm6
	vandnpd	%ymm6, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm8
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	jne	.L217
.L65:
	vmulpd	%ymm4, %ymm7, %ymm4
	addq	%r11, %r10
	vandnpd	%ymm4, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm7
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	jne	.L218
.L66:
	vmulpd	%ymm6, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm6
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	jne	.L219
.L67:
	vmulpd	%ymm4, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm5
	vcmppd	$2, %ymm3, %ymm0, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	jne	.L220
.L68:
	vinsertf128	$1, .LC4(%rip), %ymm1, %ymm0
	vperm2f128	$33, .LC4(%rip), %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm11, %ymm11
	vcmppd	$13, %ymm2, %ymm11, %ymm4
	vcmppd	$2, %ymm3, %ymm11, %ymm1
	vmovmskpd	%ymm4, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	jne	.L221
.L69:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	.LC12(%rip), %xmm2
	vmovsd	.LC13(%rip), %xmm1
	vmovsd	.LC14(%rip), %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L222
	vcomisd	%xmm0, %xmm3
	jbe	.L72
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%r10
.L72:
	leaq	31(%rbx), %rdx
	movslq	%ebx, %rax
	vmovsd	%xmm0, (%r9)
	movq	%r10, (%rcx)
	cmpq	%rax, %rdx
	jl	.L209
	addq	$32, %rbx
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L223:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
	incq	(%rcx)
.L76:
	incq	%rax
	cmpq	%rax, %rbx
	je	.L209
.L81:
	cmpq	%rax, %rdi
	je	.L76
	vsubsd	(%rsi,%rax,8), %xmm14, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%r9), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L223
	vcomisd	%xmm0, %xmm3
	ja	.L79
	incq	%rax
	vmovsd	%xmm0, (%r9)
	cmpq	%rax, %rbx
	jne	.L81
.L209:
	vzeroupper
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L222:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%r10
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L213:
	vmulpd	%ymm2, %ymm6, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r11
	vblendvpd	%ymm0, %ymm12, %ymm6, %ymm6
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L79:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
	decq	(%rcx)
	jmp	.L76
.L214:
	vmulpd	%ymm3, %ymm0, %ymm7
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm12, %ymm7, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm7
	addq	%rax, %r10
	vblendvpd	%ymm8, %ymm7, %ymm0, %ymm7
	jmp	.L62
.L217:
	vmulpd	%ymm3, %ymm0, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm6, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm6
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm6, %ymm0, %ymm6
	jmp	.L65
.L218:
	vmulpd	%ymm3, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm7, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm4
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm4, %ymm0, %ymm4
	jmp	.L66
.L219:
	vmulpd	%ymm3, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm6, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm1, %ymm0, %ymm1
	jmp	.L67
.L220:
	vmulpd	%ymm3, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm4, %ymm1, %ymm0, %ymm1
	jmp	.L68
.L215:
	vmulpd	%ymm3, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm4
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm4, %ymm0, %ymm4
	jmp	.L63
.L216:
	vmulpd	%ymm3, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm1, %ymm0, %ymm1
	jmp	.L64
.L221:
	vmulpd	%ymm3, %ymm11, %ymm3
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm4, %ymm3, %ymm11, %ymm11
	vmulpd	%ymm2, %ymm11, %ymm2
	addq	%rax, %r10
	vblendvpd	%ymm1, %ymm2, %ymm11, %ymm0
	jmp	.L69
.L211:
	leaq	.LC5(%rip), %rcx
	movl	$285, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE9258:
	.size	_Z13prod_realreallldPKdRdRl.constprop.0, .-_Z13prod_realreallldPKdRdRl.constprop.0
	.section	.rodata.str1.1
.LC15:
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
	leaq	.LC15(%rip), %r13
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
	je	.L230
	cmpb	$0, 56(%r13)
	je	.L226
	movsbl	67(%r13), %esi
.L227:
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
.L226:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L227
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L227
.L230:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE8796:
	.size	_Z5debugDv4_d, .-_Z5debugDv4_d
	.section	.rodata.str1.1
.LC16:
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
	leaq	.LC16(%rip), %r13
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
	je	.L237
	cmpb	$0, 56(%r13)
	je	.L233
	movsbl	67(%r13), %esi
.L234:
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
.L233:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L234
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L234
.L237:
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
	vmovapd	.LC9(%rip), %ymm0
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
	vmovapd	.LC9(%rip), %ymm2
	vmovapd	.LC10(%rip), %ymm1
	vmovapd	.LC11(%rip), %ymm3
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm1, %ymm2, %ymm5
	vcmppd	$2, %ymm3, %ymm2, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L245
	ret
	.p2align 4,,10
	.p2align 3
.L245:
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
	vmovapd	.LC11(%rip), %ymm3
	vinsertf128	$1, %xmm1, %ymm0, %ymm2
	vperm2f128	$33, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vmovapd	.LC9(%rip), %ymm1
	vmovapd	.LC10(%rip), %ymm2
	vandnpd	%ymm0, %ymm1, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm5
	vcmppd	$2, %ymm3, %ymm1, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L258
.L247:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC13(%rip), %xmm1
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L257
	vmulsd	.LC14(%rip), %xmm0, %xmm0
	incq	(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L257:
	vmovsd	.LC14(%rip), %xmm2
	vcomisd	%xmm0, %xmm2
	jbe	.L246
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	(%rdi)
.L246:
	ret
	.p2align 4,,10
	.p2align 3
.L258:
	vmulpd	%ymm3, %ymm1, %ymm3
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm3, %ymm1, %ymm1
	vmulpd	%ymm2, %ymm1, %ymm2
	addq	%rax, (%rdi)
	vblendvpd	%ymm4, %ymm2, %ymm1, %ymm0
	jmp	.L247
	.cfi_endproc
.LFE8813:
	.size	_Z18horizontal_productDv4_dRl, .-_Z18horizontal_productDv4_dRl
	.section	.rodata.str1.1
.LC17:
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
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	testb	$31, %dil
	jne	.L447
	movq	%rdx, %r9
	movq	%rdx, %rax
	testb	$7, %dl
	jne	.L448
	vmovapd	.LC8(%rip), %ymm8
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm5
	vmovapd	.LC4(%rip), %ymm7
	vmovsd	%xmm0, %xmm0, %xmm14
	movq	%rsi, %r12
	vmovlpd	(%rcx), %xmm8, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm8, %ymm8
	movq	(%r8), %r10
	movq	%rdi, %rbx
	vbroadcastsd	%xmm14, %ymm0
	andq	$-32, %r12
	vmovapd	%ymm5, %ymm6
	vmovapd	%ymm5, %ymm1
	vmovapd	%ymm5, %ymm4
	vmovapd	%ymm5, %ymm9
	vmovapd	%ymm5, %ymm10
	xorl	%r11d, %r11d
	vmovapd	%ymm7, (%rsp)
	testq	%rdi, %rdi
	jle	.L317
	vmovapd	.LC9(%rip), %ymm11
	vmovapd	.LC10(%rip), %ymm2
	vmovapd	.LC11(%rip), %ymm3
	xorl	%edx, %edx
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L264:
	addq	$32, %rdx
	addq	$256, %rax
	cmpq	%rdx, %rbx
	jle	.L262
.L280:
	cmpq	%rdx, %r12
	je	.L263
	vsubpd	(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm8, %ymm8
	vsubpd	32(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm5, %ymm5
	vsubpd	64(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm10, %ymm10
	vsubpd	96(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm9, %ymm9
	vsubpd	128(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm7, %ymm7
	vsubpd	160(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm4, %ymm4
	vsubpd	192(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm1, %ymm1
	vsubpd	224(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm6, %ymm6
.L263:
	testb	$-32, %dl
	jne	.L264
	vandnpd	%ymm8, %ymm11, %ymm8
	vcmppd	$13, %ymm2, %ymm8, %ymm13
	vcmppd	$2, %ymm3, %ymm8, %ymm12
	vmovmskpd	%ymm13, %r14d
	vmovmskpd	%ymm12, %r13d
	testl	%r14d, %r14d
	je	.L265
	vmulpd	%ymm3, %ymm8, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %r10
	vblendvpd	%ymm13, %ymm15, %ymm8, %ymm8
.L265:
	testl	%r13d, %r13d
	je	.L266
	vmulpd	%ymm2, %ymm8, %ymm13
	popcntl	%r13d, %r13d
	subq	%r13, %r10
	vblendvpd	%ymm12, %ymm13, %ymm8, %ymm8
.L266:
	vandnpd	%ymm5, %ymm11, %ymm5
	vcmppd	$13, %ymm2, %ymm5, %ymm13
	vcmppd	$2, %ymm3, %ymm5, %ymm12
	vmovmskpd	%ymm13, %r14d
	vmovmskpd	%ymm12, %r13d
	testl	%r14d, %r14d
	je	.L267
	vmulpd	%ymm3, %ymm5, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %r10
	vblendvpd	%ymm13, %ymm15, %ymm5, %ymm5
.L267:
	testl	%r13d, %r13d
	je	.L268
	vmulpd	%ymm2, %ymm5, %ymm13
	popcntl	%r13d, %r13d
	subq	%r13, %r10
	vblendvpd	%ymm12, %ymm13, %ymm5, %ymm5
.L268:
	vandnpd	%ymm10, %ymm11, %ymm10
	vcmppd	$13, %ymm2, %ymm10, %ymm13
	vcmppd	$2, %ymm3, %ymm10, %ymm12
	vmovmskpd	%ymm13, %r14d
	vmovmskpd	%ymm12, %r13d
	testl	%r14d, %r14d
	je	.L269
	vmulpd	%ymm3, %ymm10, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %r10
	vblendvpd	%ymm13, %ymm15, %ymm10, %ymm10
.L269:
	testl	%r13d, %r13d
	je	.L270
	vmulpd	%ymm2, %ymm10, %ymm13
	popcntl	%r13d, %r13d
	subq	%r13, %r10
	vblendvpd	%ymm12, %ymm13, %ymm10, %ymm10
.L270:
	vandnpd	%ymm9, %ymm11, %ymm9
	vcmppd	$13, %ymm2, %ymm9, %ymm13
	vcmppd	$2, %ymm3, %ymm9, %ymm12
	vmovmskpd	%ymm13, %r14d
	vmovmskpd	%ymm12, %r13d
	testl	%r14d, %r14d
	je	.L271
	vmulpd	%ymm3, %ymm9, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %r10
	vblendvpd	%ymm13, %ymm15, %ymm9, %ymm9
.L271:
	testl	%r13d, %r13d
	je	.L272
	vmulpd	%ymm2, %ymm9, %ymm13
	popcntl	%r13d, %r13d
	subq	%r13, %r10
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L272:
	vandnpd	%ymm7, %ymm11, %ymm7
	vcmppd	$13, %ymm2, %ymm7, %ymm13
	vcmppd	$2, %ymm3, %ymm7, %ymm12
	vmovmskpd	%ymm13, %r14d
	vmovmskpd	%ymm12, %r13d
	testl	%r14d, %r14d
	je	.L273
	vmulpd	%ymm3, %ymm7, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %r11
	vblendvpd	%ymm13, %ymm15, %ymm7, %ymm7
.L273:
	testl	%r13d, %r13d
	je	.L274
	vmulpd	%ymm2, %ymm7, %ymm13
	popcntl	%r13d, %r13d
	subq	%r13, %r11
	vblendvpd	%ymm12, %ymm13, %ymm7, %ymm7
.L274:
	vandnpd	%ymm4, %ymm11, %ymm4
	vcmppd	$13, %ymm2, %ymm4, %ymm13
	vcmppd	$2, %ymm3, %ymm4, %ymm12
	vmovmskpd	%ymm13, %r14d
	vmovmskpd	%ymm12, %r13d
	testl	%r14d, %r14d
	je	.L275
	vmulpd	%ymm3, %ymm4, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %r11
	vblendvpd	%ymm13, %ymm15, %ymm4, %ymm4
.L275:
	testl	%r13d, %r13d
	je	.L276
	vmulpd	%ymm2, %ymm4, %ymm13
	popcntl	%r13d, %r13d
	subq	%r13, %r11
	vblendvpd	%ymm12, %ymm13, %ymm4, %ymm4
.L276:
	vandnpd	%ymm1, %ymm11, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm13
	vcmppd	$2, %ymm3, %ymm1, %ymm12
	vmovmskpd	%ymm13, %r14d
	vmovmskpd	%ymm12, %r13d
	testl	%r14d, %r14d
	je	.L277
	vmulpd	%ymm3, %ymm1, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %r11
	vblendvpd	%ymm13, %ymm15, %ymm1, %ymm1
.L277:
	testl	%r13d, %r13d
	je	.L278
	vmulpd	%ymm2, %ymm1, %ymm13
	popcntl	%r13d, %r13d
	subq	%r13, %r11
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
.L278:
	vandnpd	%ymm6, %ymm11, %ymm6
	vcmppd	$13, %ymm2, %ymm6, %ymm13
	vcmppd	$2, %ymm3, %ymm6, %ymm12
	vmovmskpd	%ymm13, %r14d
	vmovmskpd	%ymm12, %r13d
	testl	%r14d, %r14d
	je	.L279
	vmulpd	%ymm3, %ymm6, %ymm15
	popcntl	%r14d, %r14d
	addq	%r14, %r11
	vblendvpd	%ymm13, %ymm15, %ymm6, %ymm6
.L279:
	testl	%r13d, %r13d
	je	.L264
	vmulpd	%ymm2, %ymm6, %ymm13
	addq	$32, %rdx
	popcntl	%r13d, %r13d
	addq	$256, %rax
	subq	%r13, %r11
	vblendvpd	%ymm12, %ymm13, %ymm6, %ymm6
	cmpq	%rdx, %rbx
	jg	.L280
	.p2align 4,,10
	.p2align 3
.L262:
	vandnpd	%ymm8, %ymm11, %ymm8
	vcmppd	$13, %ymm2, %ymm8, %ymm12
	vcmppd	$2, %ymm3, %ymm8, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L281
	vmulpd	%ymm3, %ymm8, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r10
	vblendvpd	%ymm12, %ymm13, %ymm8, %ymm8
.L281:
	testl	%eax, %eax
	je	.L282
	vmulpd	%ymm2, %ymm8, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r10
	vblendvpd	%ymm0, %ymm12, %ymm8, %ymm8
.L282:
	vandnpd	%ymm5, %ymm11, %ymm5
	vcmppd	$13, %ymm2, %ymm5, %ymm12
	vcmppd	$2, %ymm3, %ymm5, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L283
	vmulpd	%ymm3, %ymm5, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r10
	vblendvpd	%ymm12, %ymm13, %ymm5, %ymm5
.L283:
	testl	%eax, %eax
	je	.L284
	vmulpd	%ymm2, %ymm5, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r10
	vblendvpd	%ymm0, %ymm12, %ymm5, %ymm5
.L284:
	vandnpd	%ymm10, %ymm11, %ymm10
	vcmppd	$13, %ymm2, %ymm10, %ymm12
	vcmppd	$2, %ymm3, %ymm10, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L285
	vmulpd	%ymm3, %ymm10, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r10
	vblendvpd	%ymm12, %ymm13, %ymm10, %ymm10
.L285:
	testl	%eax, %eax
	je	.L286
	vmulpd	%ymm2, %ymm10, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r10
	vblendvpd	%ymm0, %ymm12, %ymm10, %ymm10
.L286:
	vandnpd	%ymm9, %ymm11, %ymm9
	vcmppd	$13, %ymm2, %ymm9, %ymm12
	vcmppd	$2, %ymm3, %ymm9, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L287
	vmulpd	%ymm3, %ymm9, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r10
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L287:
	testl	%eax, %eax
	je	.L288
	vmulpd	%ymm2, %ymm9, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r10
	vblendvpd	%ymm0, %ymm12, %ymm9, %ymm9
.L288:
	vandnpd	%ymm7, %ymm11, %ymm7
	vcmppd	$13, %ymm2, %ymm7, %ymm12
	vcmppd	$2, %ymm3, %ymm7, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L289
	vmulpd	%ymm3, %ymm7, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r11
	vblendvpd	%ymm12, %ymm13, %ymm7, %ymm7
.L289:
	testl	%eax, %eax
	je	.L290
	vmulpd	%ymm2, %ymm7, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r11
	vblendvpd	%ymm0, %ymm12, %ymm7, %ymm7
.L290:
	vandnpd	%ymm4, %ymm11, %ymm4
	vcmppd	$13, %ymm2, %ymm4, %ymm12
	vcmppd	$2, %ymm3, %ymm4, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L291
	vmulpd	%ymm3, %ymm4, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r11
	vblendvpd	%ymm12, %ymm13, %ymm4, %ymm4
.L291:
	testl	%eax, %eax
	je	.L292
	vmulpd	%ymm2, %ymm4, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r11
	vblendvpd	%ymm0, %ymm12, %ymm4, %ymm4
.L292:
	vandnpd	%ymm1, %ymm11, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm12
	vcmppd	$2, %ymm3, %ymm1, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L293
	vmulpd	%ymm3, %ymm1, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r11
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
.L293:
	testl	%eax, %eax
	je	.L294
	vmulpd	%ymm2, %ymm1, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r11
	vblendvpd	%ymm0, %ymm12, %ymm1, %ymm1
.L294:
	vandnpd	%ymm6, %ymm11, %ymm6
	vcmppd	$13, %ymm2, %ymm6, %ymm12
	vcmppd	$2, %ymm3, %ymm6, %ymm0
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L295
	vmulpd	%ymm3, %ymm6, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %r11
	vblendvpd	%ymm12, %ymm13, %ymm6, %ymm6
.L295:
	testl	%eax, %eax
	jne	.L449
.L296:
	vmulpd	%ymm7, %ymm8, %ymm7
	vandnpd	%ymm7, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm12
	vcmppd	$2, %ymm3, %ymm0, %ymm8
	vmovmskpd	%ymm12, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L450
.L297:
	vmulpd	%ymm5, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm8
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L451
.L298:
	vmulpd	%ymm1, %ymm10, %ymm1
	vandnpd	%ymm1, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm8
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L452
.L299:
	vmulpd	%ymm6, %ymm9, %ymm6
	vandnpd	%ymm6, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm8
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L453
.L300:
	vmulpd	%ymm4, %ymm7, %ymm4
	addq	%r11, %r10
	vandnpd	%ymm4, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm7
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L454
.L301:
	vmulpd	%ymm6, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm6
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L455
.L302:
	vmulpd	%ymm4, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm11, %ymm0
	vcmppd	$13, %ymm2, %ymm0, %ymm5
	vcmppd	$2, %ymm3, %ymm0, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L456
.L303:
	vmovapd	(%rsp), %ymm6
	vinsertf128	$1, %xmm6, %ymm1, %ymm0
	vperm2f128	$33, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm11, %ymm11
	vcmppd	$13, %ymm2, %ymm11, %ymm4
	vcmppd	$2, %ymm3, %ymm11, %ymm1
	vmovmskpd	%ymm4, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L457
.L304:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	.LC12(%rip), %xmm2
	vmovsd	.LC13(%rip), %xmm1
	vmovsd	.LC14(%rip), %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L458
	vcomisd	%xmm0, %xmm3
	jbe	.L307
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%r10
.L307:
	leaq	31(%r12), %rdx
	movslq	%r12d, %rax
	vmovsd	%xmm0, (%rcx)
	movq	%r10, (%r8)
	cmpq	%rax, %rdx
	jl	.L445
	addq	$32, %r12
	jmp	.L316
	.p2align 4,,10
	.p2align 3
.L459:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	incq	(%r8)
.L311:
	incq	%rax
	cmpq	%rax, %r12
	je	.L445
.L316:
	cmpq	%rax, %rsi
	je	.L311
	vsubsd	(%r9,%rax,8), %xmm14, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%rcx), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L459
	vcomisd	%xmm0, %xmm3
	ja	.L314
	incq	%rax
	vmovsd	%xmm0, (%rcx)
	cmpq	%rax, %r12
	jne	.L316
.L445:
	vzeroupper
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L458:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%r10
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L449:
	vmulpd	%ymm2, %ymm6, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %r11
	vblendvpd	%ymm0, %ymm12, %ymm6, %ymm6
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L314:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	decq	(%r8)
	jmp	.L311
	.p2align 4,,10
	.p2align 3
.L450:
	vmulpd	%ymm3, %ymm0, %ymm7
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm12, %ymm7, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm7
	addq	%rax, %r10
	vblendvpd	%ymm8, %ymm7, %ymm0, %ymm7
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L451:
	vmulpd	%ymm3, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm4
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm4, %ymm0, %ymm4
	jmp	.L298
	.p2align 4,,10
	.p2align 3
.L452:
	vmulpd	%ymm3, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm1, %ymm0, %ymm1
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L453:
	vmulpd	%ymm3, %ymm0, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm6, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm6
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm6, %ymm0, %ymm6
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L454:
	vmulpd	%ymm3, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm7, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm4
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm4, %ymm0, %ymm4
	jmp	.L301
	.p2align 4,,10
	.p2align 3
.L455:
	vmulpd	%ymm3, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm6, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm5, %ymm1, %ymm0, %ymm1
	jmp	.L302
	.p2align 4,,10
	.p2align 3
.L456:
	vmulpd	%ymm3, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm4, %ymm1, %ymm0, %ymm1
	jmp	.L303
	.p2align 4,,10
	.p2align 3
.L457:
	vmulpd	%ymm3, %ymm11, %ymm3
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm4, %ymm3, %ymm11, %ymm11
	vmulpd	%ymm2, %ymm11, %ymm2
	addq	%rax, %r10
	vblendvpd	%ymm1, %ymm2, %ymm11, %ymm0
	jmp	.L304
.L317:
	vmovapd	.LC9(%rip), %ymm11
	vmovapd	.LC10(%rip), %ymm2
	vmovapd	.LC11(%rip), %ymm3
	jmp	.L262
.L447:
	leaq	.LC5(%rip), %rcx
	movl	$284, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	__assert_fail@PLT
.L448:
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
	jle	.L471
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	.LC14(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L472:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L464:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L471
.L466:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L472
	vcomisd	%xmm1, %xmm5
	ja	.L465
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L466
.L471:
	ret
	.p2align 4,,10
	.p2align 3
.L465:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L464
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
	jle	.L484
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	.LC14(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L479
	.p2align 4,,10
	.p2align 3
.L485:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L477:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L484
.L479:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L485
	vcomisd	%xmm2, %xmm5
	ja	.L478
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L479
.L484:
	ret
	.p2align 4,,10
	.p2align 3
.L478:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L477
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
	jle	.L495
	vmovsd	(%r8), %xmm2
	vmovsd	.LC13(%rip), %xmm5
	vmovsd	.LC14(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L494
	.p2align 4,,10
	.p2align 3
.L508:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L492:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L495
.L494:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L508
	vcomisd	%xmm2, %xmm6
	ja	.L493
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L494
.L495:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L509
	vmovsd	(%r8), %xmm2
	vmovsd	.LC13(%rip), %xmm5
	vmovsd	.LC14(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L511:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L498:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L510
.L500:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L511
	vcomisd	%xmm2, %xmm6
	ja	.L499
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L500
.L510:
	ret
	.p2align 4,,10
	.p2align 3
.L493:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L492
	.p2align 4,,10
	.p2align 3
.L499:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L509:
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
	vmovq	.LC12(%rip), %xmm3
	vandpd	%xmm3, %xmm2, %xmm2
	vsubsd	.LC18(%rip), %xmm2, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	.LC19(%rip), %xmm2
	ja	.L521
	ret
.L521:
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
	vmovdqa	.LC20(%rip), %ymm5
	vmovdqa	.LC21(%rip), %ymm2
	vmovdqa	.LC22(%rip), %ymm3
	vmovdqa	.LC23(%rip), %ymm4
	movq	%rdi, %rax
	leaq	1248(%rdi), %rcx
	movq	%rdi, %rdx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L523:
	vpand	8(%rdx), %ymm2, %ymm1
	vpand	(%rdx), %ymm5, %ymm0
	addq	$32, %rdx
	vpor	%ymm1, %ymm0, %ymm0
	vpsrlq	$1, %ymm0, %ymm1
	vpand	%ymm3, %ymm0, %ymm0
	vpxor	1216(%rdx), %ymm1, %ymm1
	vpcmpeqq	%ymm7, %ymm0, %ymm0
	vpxor	%ymm4, %ymm1, %ymm6
	vpblendvb	%ymm0, %ymm1, %ymm6, %ymm0
	vmovdqu	%ymm0, -32(%rdx)
	cmpq	%rcx, %rdx
	jne	.L523
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L524:
	vpand	8(%rdx), %ymm2, %ymm1
	vpand	(%rdx), %ymm5, %ymm0
	addq	$32, %rdx
	vpor	%ymm1, %ymm0, %ymm0
	vpsrlq	$1, %ymm0, %ymm1
	vpand	%ymm3, %ymm0, %ymm0
	vpxor	-1280(%rdx), %ymm1, %ymm1
	vpcmpeqq	%ymm7, %ymm0, %ymm0
	vpxor	%ymm4, %ymm1, %ymm6
	vpblendvb	%ymm0, %ymm1, %ymm6, %ymm0
	vmovdqu	%ymm0, -32(%rdx)
	cmpq	%rdx, %rcx
	jne	.L524
	vmovdqa	.LC24(%rip), %xmm0
	vmovdqa	.LC25(%rip), %xmm1
	vpand	2464(%rax), %xmm0, %xmm0
	vpand	2472(%rax), %xmm1, %xmm1
	movq	2488(%rax), %rsi
	vpor	%xmm1, %xmm0, %xmm0
	movq	2480(%rax), %rdx
	vpsrlq	$1, %xmm0, %xmm1
	movq	%rsi, %rcx
	vpand	.LC26(%rip), %xmm0, %xmm0
	andl	$2147483647, %ecx
	vpxor	1216(%rax), %xmm1, %xmm1
	andq	$-2147483648, %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	orq	%rcx, %rdx
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	movq	%rdx, %rcx
	vpxor	.LC27(%rip), %xmm1, %xmm2
	shrq	%rcx
	vpblendvb	%xmm0, %xmm1, %xmm2, %xmm0
	xorq	1232(%rax), %rcx
	andl	$1, %edx
	vmovdqu	%xmm0, 2464(%rax)
	je	.L528
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L528:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L527
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L527:
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
	vmovapd	.LC28(%rip), %ymm0
	leaq	-2568(%rbp), %rax
	movq	%rax, %rdi
	movq	$0, -2568(%rbp)
	movq	%rax, -2616(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC29(%rip), %xmm3
	vdivsd	%xmm0, %xmm3, %xmm2
	vandpd	.LC12(%rip), %xmm2, %xmm2
	vsubsd	.LC18(%rip), %xmm2, %xmm2
	vandpd	.LC12(%rip), %xmm2, %xmm2
	vcomisd	.LC19(%rip), %xmm2
	ja	.L667
	movq	-2568(%rbp), %rsi
	cmpq	$1, %rsi
	jne	.L668
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm6
	vmovapd	.LC30(%rip), %ymm9
	vmulpd	%ymm6, %ymm6, %ymm7
	vmovapd	.LC9(%rip), %ymm0
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC11(%rip), %ymm3
	xorl	%esi, %esi
	vmulpd	%ymm9, %ymm7, %ymm5
	vandnpd	%ymm5, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm8
	vcmppd	$2, %ymm3, %ymm1, %ymm2
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm2, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L669
.L535:
	vmulpd	%ymm7, %ymm7, %ymm2
	vandnpd	%ymm2, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm10
	vcmppd	$2, %ymm3, %ymm1, %ymm8
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L670
.L536:
	vmulpd	%ymm5, %ymm2, %ymm2
	vandnpd	%ymm2, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm8
	vcmppd	$2, %ymm3, %ymm1, %ymm5
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L671
.L537:
	vmovapd	.LC4(%rip), %ymm5
	vinsertf128	$1, %xmm5, %ymm2, %ymm1
	vperm2f128	$33, %ymm5, %ymm2, %ymm2
	vmulpd	%ymm2, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm0, %ymm2
	vcmppd	$13, %ymm4, %ymm2, %ymm10
	vcmppd	$2, %ymm3, %ymm2, %ymm8
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L672
.L538:
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vmovsd	.LC13(%rip), %xmm2
	vmovsd	.LC14(%rip), %xmm12
	vandpd	.LC12(%rip), %xmm1, %xmm1
	vcomisd	%xmm2, %xmm1
	ja	.L673
	vcomisd	%xmm1, %xmm12
	jbe	.L541
	vmulsd	%xmm2, %xmm1, %xmm1
	decq	%rsi
.L541:
	vmovsd	.LC31(%rip), %xmm8
	vucomisd	%xmm8, %xmm1
	jp	.L602
	jne	.L602
	testq	%rsi, %rsi
	jne	.L674
	vmulpd	.LC32(%rip), %ymm7, %ymm8
	vmulpd	%ymm9, %ymm6, %ymm9
	xorl	%r8d, %r8d
	vmulpd	%ymm7, %ymm6, %ymm7
	vmulpd	%ymm8, %ymm9, %ymm11
	vandnpd	%ymm11, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm13
	vcmppd	$2, %ymm3, %ymm1, %ymm10
	vmovmskpd	%ymm13, %eax
	vmovmskpd	%ymm10, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L675
.L549:
	vmulpd	%ymm7, %ymm7, %ymm10
	vandnpd	%ymm10, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm14
	vcmppd	$2, %ymm3, %ymm1, %ymm13
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm13, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L676
.L550:
	vmulpd	%ymm11, %ymm10, %ymm10
	vandnpd	%ymm10, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm13
	vcmppd	$2, %ymm3, %ymm1, %ymm11
	vmovmskpd	%ymm13, %eax
	vmovmskpd	%ymm11, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L677
.L551:
	vinsertf128	$1, %xmm5, %ymm10, %ymm1
	vperm2f128	$33, %ymm5, %ymm10, %ymm10
	vmulpd	%ymm10, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm0, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm13
	vcmppd	$2, %ymm3, %ymm10, %ymm11
	vmovmskpd	%ymm13, %eax
	vmovmskpd	%ymm11, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L678
.L552:
	vunpckhpd	%xmm1, %xmm1, %xmm10
	vmulsd	%xmm10, %xmm1, %xmm1
	vandpd	.LC12(%rip), %xmm1, %xmm1
	vcomisd	%xmm2, %xmm1
	jbe	.L658
	vmulsd	%xmm12, %xmm1, %xmm1
	incq	%r8
.L555:
	vmovsd	.LC33(%rip), %xmm11
	vdivsd	%xmm1, %xmm11, %xmm10
	vandpd	.LC12(%rip), %xmm10, %xmm10
	vsubsd	.LC18(%rip), %xmm10, %xmm10
	vandpd	.LC12(%rip), %xmm10, %xmm10
	vcomisd	.LC19(%rip), %xmm10
	ja	.L679
	cmpq	$1, %r8
	jne	.L680
	vmulpd	.LC34(%rip), %ymm9, %ymm9
	vmulpd	%ymm8, %ymm6, %ymm1
	vmulpd	%ymm7, %ymm6, %ymm7
	vandnpd	%ymm9, %ymm0, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm10
	vcmppd	$2, %ymm3, %ymm9, %ymm6
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm6, %eax
	testl	%edx, %edx
	je	.L560
	vmulpd	%ymm3, %ymm9, %ymm8
	xorl	%esi, %esi
	popcntl	%edx, %esi
	vblendvpd	%ymm10, %ymm8, %ymm9, %ymm9
.L560:
	testl	%eax, %eax
	je	.L561
	vmulpd	%ymm4, %ymm9, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm6, %ymm8, %ymm9, %ymm9
.L561:
	vandnpd	%ymm1, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm10
	vcmppd	$2, %ymm3, %ymm1, %ymm6
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm6, %eax
	testl	%edx, %edx
	je	.L562
	vmulpd	%ymm3, %ymm1, %ymm8
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm10, %ymm8, %ymm1, %ymm1
.L562:
	testl	%eax, %eax
	je	.L563
	vmulpd	%ymm4, %ymm1, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm6, %ymm8, %ymm1, %ymm1
.L563:
	vandnpd	%ymm7, %ymm0, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm10
	vcmppd	$2, %ymm3, %ymm8, %ymm7
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm7, %edx
	testl	%eax, %eax
	je	.L564
	vmulpd	%ymm3, %ymm8, %ymm6
	popcntl	%eax, %eax
	addq	%rax, %rsi
	vblendvpd	%ymm10, %ymm6, %ymm8, %ymm6
	testl	%edx, %edx
	je	.L565
	vmulpd	%ymm4, %ymm6, %ymm10
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	addq	%rax, %rsi
	vblendvpd	%ymm7, %ymm10, %ymm6, %ymm6
	vmovapd	%ymm6, %ymm8
.L592:
	subq	%rdx, %rsi
.L594:
	vmulpd	%ymm1, %ymm9, %ymm1
	vandnpd	%ymm1, %ymm0, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm10
	vcmppd	$2, %ymm3, %ymm7, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L681
.L566:
	vmulpd	%ymm6, %ymm8, %ymm6
	vandnpd	%ymm6, %ymm0, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm9
	vcmppd	$2, %ymm3, %ymm7, %ymm8
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L682
.L567:
	vmulpd	%ymm1, %ymm6, %ymm6
	vandnpd	%ymm6, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm8
	vcmppd	$2, %ymm3, %ymm1, %ymm7
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm7, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L683
.L568:
	vinsertf128	$1, %xmm5, %ymm6, %ymm1
	vperm2f128	$33, %ymm5, %ymm6, %ymm6
	vmulpd	%ymm6, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm0, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm6
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L684
.L569:
	vmovapd	%xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm1
	vcomisd	%xmm2, %xmm1
	jbe	.L660
	vmulsd	%xmm12, %xmm1, %xmm1
	incq	%rsi
.L572:
	vmovsd	.LC35(%rip), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L685
	cmpq	$2, %rsi
	jne	.L686
	movl	$128000, %edi
	vzeroupper
	call	_Znam@PLT
	movq	$42, -2560(%rbp)
	movq	%rax, -2608(%rbp)
	movl	$1, %ebx
	movl	$42, %eax
	leaq	-2560(%rbp), %rsi
	movabsq	$6364136223846793005, %rcx
	.p2align 4,,10
	.p2align 3
.L577:
	movq	%rax, %rdx
	shrq	$62, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	addq	%rbx, %rax
	movq	%rax, (%rsi,%rbx,8)
	incq	%rbx
	cmpq	$312, %rbx
	jne	.L577
	leaq	_ZL3gen(%rip), %r15
	movl	$2504, %edx
	movq	%r15, %rdi
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	movq	-2608(%rbp), %rax
	vmovsd	_ZL5distu(%rip), %xmm2
	vmovsd	8+_ZL5distu(%rip), %xmm1
	movq	%rax, %r14
	vsubsd	%xmm2, %xmm1, %xmm1
	leaq	128000(%rax), %r8
	movabsq	$6148914691236517205, %rsi
	movabsq	$8202884508482404352, %r13
	movabsq	$-2270628950310912, %r12
	vxorps	%xmm3, %xmm3, %xmm3
	jmp	.L578
	.p2align 4,,10
	.p2align 3
.L688:
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L580:
	vxorpd	%xmm5, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm0, %xmm0
	vmulsd	.LC37(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L581
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	.LC39(%rip), %xmm4
	addq	$8, %r14
	vfmadd132sd	.LC38(%rip), %xmm4, %xmm0
	vmovsd	%xmm0, -8(%r14)
	cmpq	%r14, %r8
	je	.L582
.L585:
	movq	%rdi, %rbx
.L578:
	cmpq	$311, %rbx
	ja	.L687
.L584:
	movq	(%r15,%rbx,8), %rax
	leaq	1(%rbx), %rdi
	movq	%rax, %r9
	shrq	$29, %r9
	andq	%rsi, %r9
	xorq	%r9, %rax
	movq	%rax, %r9
	salq	$17, %r9
	andq	%r13, %r9
	xorq	%r9, %rax
	movq	%rax, %r9
	salq	$37, %r9
	andq	%r12, %r9
	xorq	%r9, %rax
	movq	%rax, %r9
	shrq	$43, %r9
	movq	%rdi, 2496+_ZL3gen(%rip)
	xorq	%r9, %rax
	jns	.L688
	movq	%rax, %r9
	shrq	%r9
	andl	$1, %eax
	orq	%rax, %r9
	vcvtsi2sdq	%r9, %xmm3, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L580
.L673:
	vmulsd	%xmm12, %xmm1, %xmm1
	incq	%rsi
	jmp	.L541
	.p2align 4,,10
	.p2align 3
.L687:
	movq	%r15, %rdi
	movq	%r8, -2584(%rbp)
	vmovsd	%xmm1, -2600(%rbp)
	vmovsd	%xmm2, -2592(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rbx
	vmovsd	-2600(%rbp), %xmm1
	vmovsd	-2592(%rbp), %xmm2
	movq	-2584(%rbp), %r8
	vxorps	%xmm3, %xmm3, %xmm3
	movabsq	$6148914691236517205, %rsi
	jmp	.L584
.L581:
	vmovsd	.LC40(%rip), %xmm0
	vmovsd	.LC39(%rip), %xmm7
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	addq	$8, %r14
	vfmadd132sd	.LC38(%rip), %xmm7, %xmm0
	vmovsd	%xmm0, -8(%r14)
	cmpq	%r14, %r8
	jne	.L585
.L582:
	movq	.LC41(%rip), %rax
	vmovsd	.LC42(%rip), %xmm0
	movq	-2616(%rbp), %rcx
	movq	-2608(%rbp), %rsi
	leaq	-2576(%rbp), %r14
	movq	%r14, %rdx
	movl	$61, %edi
	movq	%rax, -2576(%rbp)
	movq	$42, -2568(%rbp)
	call	_Z13prod_realreallldPKdRdRl.constprop.0
	vmovsd	-2576(%rbp), %xmm1
	vmovsd	.LC43(%rip), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L666
	movq	-2568(%rbp), %rsi
	cmpq	$-3, %rsi
	jne	.L689
	vmovsd	.LC44(%rip), %xmm0
	movq	-2616(%rbp), %rcx
	movq	-2608(%rbp), %rsi
	movq	%r14, %rdx
	movl	$256, %edi
	call	_Z13prod_realreallldPKdRdRl.constprop.0
	vmovsd	-2576(%rbp), %xmm1
	vmovsd	.LC45(%rip), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L666
	movq	-2568(%rbp), %rsi
	cmpq	$101, %rsi
	jne	.L690
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L691
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
.L564:
	.cfi_restore_state
	vmovapd	%ymm8, %ymm6
	testl	%edx, %edx
	je	.L594
	vmulpd	%ymm4, %ymm8, %ymm10
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm7, %ymm10, %ymm8, %ymm8
	vmovapd	%ymm8, %ymm6
	jmp	.L592
.L658:
	vcomisd	%xmm1, %xmm12
	jbe	.L555
	vmulsd	%xmm2, %xmm1, %xmm1
	decq	%r8
	jmp	.L555
.L660:
	vcomisd	%xmm1, %xmm12
	jbe	.L572
	vmulsd	%xmm2, %xmm1, %xmm1
	decq	%rsi
	jmp	.L572
.L565:
	addq	%rax, %rsi
	vmovapd	%ymm6, %ymm8
	jmp	.L594
.L675:
	vmulpd	%ymm3, %ymm1, %ymm11
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %r8
	vblendvpd	%ymm13, %ymm11, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm11
	vblendvpd	%ymm10, %ymm11, %ymm1, %ymm11
	jmp	.L549
.L669:
	vmulpd	%ymm3, %ymm1, %ymm5
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rsi
	vblendvpd	%ymm8, %ymm5, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm5
	vblendvpd	%ymm2, %ymm5, %ymm1, %ymm5
	jmp	.L535
.L670:
	vmulpd	%ymm3, %ymm1, %ymm2
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm2, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm2
	addq	%rax, %rsi
	vblendvpd	%ymm8, %ymm2, %ymm1, %ymm2
	jmp	.L536
.L671:
	vmulpd	%ymm3, %ymm1, %ymm2
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm2, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm2
	addq	%rax, %rsi
	vblendvpd	%ymm5, %ymm2, %ymm1, %ymm2
	jmp	.L537
.L672:
	vmulpd	%ymm3, %ymm2, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm1, %ymm2, %ymm2
	vmulpd	%ymm4, %ymm2, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm8, %ymm1, %ymm2, %ymm1
	jmp	.L538
.L684:
	vmulpd	%ymm3, %ymm0, %ymm3
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm6, %ymm3, %ymm0, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm5, %ymm0, %ymm1, %ymm1
	jmp	.L569
.L683:
	vmulpd	%ymm3, %ymm1, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm6
	addq	%rax, %rsi
	vblendvpd	%ymm7, %ymm6, %ymm1, %ymm6
	jmp	.L568
.L682:
	vmulpd	%ymm3, %ymm7, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm9, %ymm6, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm7, %ymm6
	addq	%rax, %rsi
	vblendvpd	%ymm8, %ymm6, %ymm7, %ymm6
	jmp	.L567
.L681:
	vmulpd	%ymm3, %ymm7, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm1, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm7, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm1, %ymm7, %ymm1
	jmp	.L566
.L678:
	vmulpd	%ymm3, %ymm10, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm13, %ymm1, %ymm10, %ymm10
	vmulpd	%ymm4, %ymm10, %ymm1
	addq	%rax, %r8
	vblendvpd	%ymm11, %ymm1, %ymm10, %ymm1
	jmp	.L552
.L677:
	vmulpd	%ymm3, %ymm1, %ymm10
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm13, %ymm10, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm10
	addq	%rax, %r8
	vblendvpd	%ymm11, %ymm10, %ymm1, %ymm10
	jmp	.L551
.L676:
	vmulpd	%ymm3, %ymm1, %ymm10
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm14, %ymm10, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm10
	addq	%rax, %r8
	vblendvpd	%ymm13, %ymm10, %ymm1, %ymm10
	jmp	.L550
.L690:
	movl	$101, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L668:
	movl	$1, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L674:
	xorl	%edi, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L667:
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
.L602:
	leaq	_ZSt4cerr(%rip), %r12
	movl	$20, %edx
	leaq	.LC3(%rip), %rsi
	movq	%r12, %rdi
	vmovsd	%xmm1, -2584(%rbp)
	vzeroupper
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	.LC31(%rip), %rax
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
	je	.L692
	cmpb	$0, 56(%r12)
	je	.L546
	movzbl	67(%r12), %eax
.L547:
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
.L686:
	movl	$2, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L546:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	%rcx, %rdx
	je	.L547
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rdx
	jmp	.L547
.L692:
	call	_ZSt16__throw_bad_castv@PLT
.L666:
	vmovsd	%xmm2, %xmm2, %xmm0
	call	_Z13assert_approxdd.part.0
.L685:
	vmovsd	%xmm2, %xmm2, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L691:
	call	__stack_chk_fail@PLT
.L679:
	vmovsd	%xmm11, %xmm11, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L680:
	movq	%r8, %rsi
	movl	$1, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L689:
	movq	$-3, %rdi
	call	_Z9assert_eqIlEvT_S0_.part.0
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
	jle	.L707
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
	jmp	.L702
	.p2align 4,,10
	.p2align 3
.L709:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L696:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC37(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L697
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L703
.L698:
	movq	%rdx, %rax
.L702:
	cmpq	$311, %rax
	ja	.L708
.L701:
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
	jns	.L709
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L696
	.p2align 4,,10
	.p2align 3
.L708:
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
	jmp	.L701
	.p2align 4,,10
	.p2align 3
.L697:
	vmovsd	.LC40(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L698
.L703:
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
.L707:
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
.LC46:
	.string	"M N\n"
	.section	.rodata.str1.8
	.align 8
.LC47:
	.string	"M number of runs, N number of particles\n"
	.section	.rodata.str1.1
.LC48:
	.string	"example: "
.LC49:
	.string	" 10 10000\n"
.LC50:
	.string	" product: "
.LC52:
	.string	" exponent: "
.LC54:
	.string	"prod_realreal: orod="
.LC55:
	.string	" exponent="
.LC56:
	.string	" timing="
.LC57:
	.string	" seconds\n"
.LC58:
	.string	"prod_complexcomplex: orod="
.LC59:
	.string	"prod_realcomplex: orod="
.LC60:
	.string	"prod_complexreal: orod="
	.section	.text.unlikely,"ax",@progbits
.LCOLDB61:
	.section	.text.startup,"ax",@progbits
.LHOTB61:
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
.L711:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	leaq	(%rax,%rcx), %rdx
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
	cmpq	$312, %rcx
	jne	.L711
	leaq	_ZL3gen(%rip), %r12
	movl	$2504, %edx
	movq	%r12, %rdi
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	cmpl	$3, %r13d
	je	.L712
	leaq	_ZSt4cout(%rip), %r12
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC46(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC47(%rip), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$9, %edx
	leaq	.LC48(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC49(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %eax
.L710:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L807
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
.L712:
	.cfi_restore_state
	movl	$10, %edx
	leaq	.LC50(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	$0, -2632(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	.LC51(%rip), %ymm0
	leaq	-2632(%rbp), %rdi
	call	_Z18horizontal_productDv4_dRl
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$11, %edx
	leaq	.LC52(%rip), %rsi
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
	ja	.L714
	leaq	0(,%r14,8), %rbx
	movq	%rbx, %rdi
	call	_Znam@PLT
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	_Znam@PLT
	movq	.LC18(%rip), %rdi
	movq	%r15, %rsi
	vmovq	%rdi, %xmm1
	movq	.LC39(%rip), %rdi
	movq	%rax, %r13
	vmovq	%rdi, %xmm0
	movq	%r14, %rdi
	call	_Z21init_random_positionslddPd
	movq	.LC18(%rip), %rdi
	movq	%r13, %rsi
	vmovq	%rdi, %xmm1
	movq	.LC39(%rip), %rdi
	vmovq	%rdi, %xmm0
	movq	%r14, %rdi
	call	_Z21init_random_positionslddPd
	movq	.LC18(%rip), %rsi
	movq	$0, -2616(%rbp)
	movq	%rsi, -2624(%rbp)
	call	clock@PLT
	movq	.LC53(%rip), %rsi
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
	jle	.L715
	testq	%r14, %r14
	jle	.L715
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	-2616(%rbp), %rax
	movq	%rax, -2704(%rbp)
	vmovsd	%xmm4, -2648(%rbp)
	leaq	-2624(%rbp), %rax
	vmovsd	.LC37(%rip), %xmm4
	movq	%rax, -2696(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	%xmm4, -2656(%rbp)
	movq	$0, -2712(%rbp)
	vmovsd	.LC38(%rip), %xmm4
	movq	%rax, -2744(%rbp)
	movq	%r13, -2728(%rbp)
	movq	%rbx, -2720(%rbp)
	movq	-2688(%rbp), %rbx
	vmovsd	%xmm4, -2664(%rbp)
	.p2align 4,,10
	.p2align 3
.L716:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -2672(%rbp)
	vmovsd	%xmm7, -2680(%rbp)
	jmp	.L724
	.p2align 4,,10
	.p2align 3
.L809:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L718:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L719
	vmovsd	-2672(%rbp), %xmm6
	vmovsd	.LC39(%rip), %xmm7
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm7, %xmm0
.L805:
	movq	-2704(%rbp), %r8
	movq	-2696(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L720
	movq	%r14, %rax
.L724:
	cmpq	$311, %rax
	ja	.L808
.L722:
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
	jns	.L809
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L718
	.p2align 4,,10
	.p2align 3
.L720:
	incq	-2712(%rbp)
	movq	-2712(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L716
	movq	-2720(%rbp), %rbx
	movq	-2728(%rbp), %r13
.L715:
	leaq	-2608(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -2760(%rbp)
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC54(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC55(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC56(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L810
.L725:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC57(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC18(%rip), %rax
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
	jle	.L726
	cmpq	$0, -2688(%rbp)
	jle	.L726
	leaq	-2616(%rbp), %rax
	movq	%rax, -2704(%rbp)
	leaq	-2624(%rbp), %rax
	movq	%rax, -2696(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC37(%rip), %xmm4
	vmovsd	.LC38(%rip), %xmm6
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
.L727:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -2672(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -2680(%rbp)
	jmp	.L740
	.p2align 4,,10
	.p2align 3
.L814:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L729:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmovsd	.LC18(%rip), %xmm7
	vmovsd	.LC40(%rip), %xmm6
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-2672(%rbp), %xmm6
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vmovsd	.LC39(%rip), %xmm6
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L811
.L734:
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
	js	.L735
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L736:
	vaddsd	-2648(%rbp), %xmm1, %xmm1
	vmulsd	-2656(%rbp), %xmm1, %xmm1
	vcomisd	.LC18(%rip), %xmm1
	jnb	.L737
	vmovsd	-2672(%rbp), %xmm4
	movq	-2704(%rbp), %r9
	vfmadd132sd	-2680(%rbp), %xmm4, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L806:
	vmovsd	.LC39(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L812
.L740:
	cmpq	$311, %r11
	ja	.L813
.L733:
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
	jns	.L814
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L729
	.p2align 4,,10
	.p2align 3
.L812:
	incq	-2720(%rbp)
	movq	-2720(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L727
	movq	-2728(%rbp), %rbx
.L726:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC58(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC55(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC56(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L815
.L741:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC57(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC18(%rip), %rax
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
	jle	.L742
	cmpq	$0, -2688(%rbp)
	jle	.L742
	movq	.LC18(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC37(%rip), %xmm6
	vmovsd	.LC38(%rip), %xmm7
	movq	$0, -2728(%rbp)
	movq	%rax, -2744(%rbp)
	xorl	%r10d, %r10d
	vmovsd	%xmm4, -2648(%rbp)
	movl	$134201207, %esi
	vmovsd	.LC13(%rip), %xmm3
	vmovsd	.LC14(%rip), %xmm4
	vmovsd	%xmm6, -2656(%rbp)
	vmovsd	%xmm7, -2664(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	salq	$37, %rsi
	movq	%r10, %r14
	.p2align 4,,10
	.p2align 3
.L743:
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
.L756:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L816
.L749:
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
	js	.L744
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L745:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC18(%rip), %xmm2
	vmovsd	.LC40(%rip), %xmm1
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	movq	%r10, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC39(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	jmp	.L754
	.p2align 4,,10
	.p2align 3
.L818:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L752:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L817
.L754:
	vmovsd	(%r14,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L818
	vcomisd	%xmm0, %xmm4
	jbe	.L752
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L754
.L817:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L755
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r10
.L755:
	incq	%r13
	cmpq	%r13, -2688(%rbp)
	jne	.L756
	incq	-2728(%rbp)
	movq	%r14, %r13
	movq	%r10, %r14
	movq	-2728(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L743
.L742:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC59(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC55(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC56(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L819
.L757:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC57(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC18(%rip), %rax
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
	jle	.L758
	cmpq	$0, -2688(%rbp)
	jle	.L758
	movq	.LC18(%rip), %rax
	vmovsd	.LC38(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC37(%rip), %xmm7
	movq	$0, -2752(%rbp)
	movq	%rax, -2744(%rbp)
	movq	%r15, -2672(%rbp)
	xorl	%esi, %esi
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	%xmm3, -2664(%rbp)
	vmovsd	.LC14(%rip), %xmm4
	vmovsd	.LC13(%rip), %xmm3
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
.L759:
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
.L777:
	cmpq	$311, %rdi
	ja	.L820
.L765:
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
	js	.L760
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L761:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC18(%rip), %xmm2
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC40(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC39(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L821
.L766:
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
	js	.L767
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L768:
	vaddsd	-2648(%rbp), %xmm2, %xmm2
	vmovsd	.LC18(%rip), %xmm1
	vmovsd	.LC39(%rip), %xmm9
	vmulsd	-2656(%rbp), %xmm2, %xmm2
	movq	-2672(%rbp), %rax
	movq	%r15, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC40(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	-2664(%rbp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L775
	.p2align 4,,10
	.p2align 3
.L823:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L773:
	addq	$8, %rax
	cmpq	%rax, %r13
	je	.L822
.L775:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L823
	vcomisd	%xmm0, %xmm4
	jbe	.L773
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r13
	jne	.L775
.L822:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L776
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r15
.L776:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L777
	incq	-2752(%rbp)
	movq	%r13, %rbx
	movq	%r15, %r13
	movq	-2752(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L759
	movq	-2672(%rbp), %r15
	movq	-2768(%rbp), %r13
.L758:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC60(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC55(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC56(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L824
.L778:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC57(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZdaPv@PLT
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L710
	.p2align 4,,10
	.p2align 3
.L744:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L745
	.p2align 4,,10
	.p2align 3
.L760:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L761
	.p2align 4,,10
	.p2align 3
.L767:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L768
	.p2align 4,,10
	.p2align 3
.L735:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L736
	.p2align 4,,10
	.p2align 3
.L808:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L722
	.p2align 4,,10
	.p2align 3
.L821:
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
	jmp	.L766
	.p2align 4,,10
	.p2align 3
.L811:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2712(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-2712(%rbp), %xmm0
	jmp	.L734
	.p2align 4,,10
	.p2align 3
.L816:
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
	jmp	.L749
	.p2align 4,,10
	.p2align 3
.L820:
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
	jmp	.L765
	.p2align 4,,10
	.p2align 3
.L813:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L733
	.p2align 4,,10
	.p2align 3
.L719:
	vmovsd	.LC40(%rip), %xmm0
	vmovsd	-2672(%rbp), %xmm3
	vmovsd	.LC39(%rip), %xmm4
	vfmadd132sd	-2680(%rbp), %xmm3, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm4, %xmm0
	jmp	.L805
	.p2align 4,,10
	.p2align 3
.L737:
	vmovsd	-2680(%rbp), %xmm1
	vmovsd	-2672(%rbp), %xmm7
	movq	-2704(%rbp), %r9
	vfmadd132sd	.LC40(%rip), %xmm7, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L806
.L824:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L778
.L819:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L757
.L815:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L741
.L810:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L725
.L807:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8830:
.L714:
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
.LCOLDE61:
	.section	.text.startup
.LHOTE61:
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
.L826:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L826
	vmovapd	.LC62(%rip), %xmm0
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
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.align 32
.LC10:
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.align 32
.LC11:
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
.LC12:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.set	.LC13,.LC10
	.set	.LC14,.LC11
	.set	.LC18,.LC4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC19:
	.long	-1998362383
	.long	1055193269
	.section	.rodata.cst32
	.align 32
.LC20:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC21:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC22:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC23:
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.set	.LC24,.LC20
	.set	.LC25,.LC21
	.set	.LC26,.LC22
	.set	.LC27,.LC23
	.align 32
.LC28:
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
.LC29:
	.long	478481221
	.long	1491110742
	.section	.rodata.cst32
	.align 32
.LC30:
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
.LC31:
	.long	0
	.long	1082310656
	.section	.rodata.cst32
	.align 32
.LC32:
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
.LC33:
	.long	1350305698
	.long	1243119313
	.section	.rodata.cst32
	.align 32
.LC34:
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
.LC35:
	.long	-519963160
	.long	1316942624
	.align 8
.LC37:
	.long	0
	.long	1005584384
	.set	.LC38,.LC30+24
	.align 8
.LC39:
	.long	0
	.long	-1074790400
	.align 8
.LC40:
	.long	-1
	.long	1072693247
	.align 8
.LC41:
	.long	1717986918
	.long	1075603046
	.align 8
.LC42:
	.long	-398572965
	.long	1068149977
	.align 8
.LC43:
	.long	-789117515
	.long	731179629
	.align 8
.LC44:
	.long	-1889785610
	.long	-1071352382
	.align 8
.LC45:
	.long	-1935337750
	.long	1246898371
	.section	.rodata.cst32
	.align 32
.LC51:
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
.LC53:
	.long	-1598689907
	.long	1051772663
	.set	.LC62,.LC8
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
