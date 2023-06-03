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
.LFB9255:
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
.LFE9255:
	.size	_ZN9stopwatch4stopEv.part.0, .-_ZN9stopwatch4stopEv.part.0
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB9259:
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
.LFE9259:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Expected a ~= b but "
.LC1:
	.string	" != "
	.text
	.p2align 4
	.type	_Z13assert_approxdd.part.0, @function
_Z13assert_approxdd.part.0:
.LFB9254:
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
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L15
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L15
.L18:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE9254:
	.size	_Z13assert_approxdd.part.0, .-_Z13assert_approxdd.part.0
	.section	.rodata.str1.1
.LC2:
	.string	"Expected a == b but "
	.text
	.p2align 4
	.type	_Z9assert_eqIlEvT_S0_.part.0, @function
_Z9assert_eqIlEvT_S0_.part.0:
.LFB9256:
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
	leaq	.LC2(%rip), %rsi
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
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L22
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L22
.L25:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE9256:
	.size	_Z9assert_eqIlEvT_S0_.part.0, .-_Z9assert_eqIlEvT_S0_.part.0
	.p2align 4
	.type	_Z9assert_eqIdEvT_S0_.part.0.constprop.0, @function
_Z9assert_eqIdEvT_S0_.part.0.constprop.0:
.LFB9262:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$20, %edx
	leaq	.LC2(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	_ZSt4cerr(%rip), %rbp
	movq	%rbp, %rdi
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	%xmm0, 8(%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	.LC3(%rip), %xmm0
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$4, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	8(%rsp), %xmm1
	movq	%rbp, %rdi
	vmovsd	%xmm1, %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %r12
	testq	%r12, %r12
	je	.L32
	cmpb	$0, 56(%r12)
	je	.L28
	movsbl	67(%r12), %esi
.L29:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
	.p2align 4,,10
	.p2align 3
.L28:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L29
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L29
.L32:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE9262:
	.size	_Z9assert_eqIdEvT_S0_.part.0.constprop.0, .-_Z9assert_eqIdEvT_S0_.part.0.constprop.0
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
	.string	"reinterpret_cast<uintptr_t>(x) % 32 == 0"
	.text
	.p2align 4
	.type	_Z13prod_realreallldPKdRdRl.constprop.0, @function
_Z13prod_realreallldPKdRdRl.constprop.0:
.LFB9263:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$640, %rsp
	testb	$31, %sil
	jne	.L91
	vmovapd	.LC8(%rip), %ymm5
	vmovq	%xmm0, %r8
	vmovlpd	(%rdx), %xmm5, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm5, %ymm5
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	(%rcx), %xmm0, %xmm0
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm4
	vmovapd	.LC4(%rip), %ymm2
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovq	%xmm0, %xmm7
	vmovapd	%ymm7, 576(%rsp)
	movq	%rdi, %r10
	vmovq	%r8, %xmm7
	movq	%rdx, %r9
	vbroadcastsd	%xmm7, %ymm3
	vmovapd	%ymm1, 608(%rsp)
	vmovapd	.LC9(%rip), %ymm11
	vmovapd	.LC10(%rip), %ymm0
	vmovapd	.LC11(%rip), %ymm1
	movq	%rsi, %rax
	andq	$-32, %r10
	vmovapd	%ymm4, %ymm12
	vmovapd	%ymm4, %ymm13
	vmovapd	%ymm4, %ymm14
	xorl	%edx, %edx
	vmovapd	%ymm4, %ymm7
	vmovapd	%ymm2, %ymm10
	vmovapd	%ymm4, %ymm15
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L36:
	addq	$32, %rdx
	addq	$256, %rax
	cmpq	$16000, %rdx
	je	.L92
.L37:
	cmpq	%rdx, %r10
	je	.L35
	vsubpd	(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm5, %ymm5
	vsubpd	32(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm4, %ymm4
	vsubpd	64(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm15, %ymm15
	vsubpd	96(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm14, %ymm14
	vsubpd	128(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm10, %ymm10
	vsubpd	160(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm13, %ymm13
	vsubpd	192(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm12, %ymm12
	vsubpd	224(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm7, %ymm7
.L35:
	testb	$-32, %dl
	jne	.L36
	vandnpd	%ymm5, %ymm11, %ymm5
	vmulpd	%ymm1, %ymm5, %ymm8
	vcmppd	$13, %ymm0, %ymm5, %ymm6
	vandnpd	%ymm4, %ymm11, %ymm4
	vandnpd	%ymm14, %ymm11, %ymm14
	vandpd	%ymm2, %ymm6, %ymm9
	vblendvpd	%ymm6, %ymm8, %ymm5, %ymm5
	vcmppd	$2, %ymm1, %ymm5, %ymm6
	vmovapd	%ymm9, 544(%rsp)
	vandnpd	%ymm13, %ymm11, %ymm13
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 512(%rsp)
	vmulpd	%ymm0, %ymm5, %ymm8
	vandnpd	%ymm12, %ymm11, %ymm12
	vblendvpd	%ymm6, %ymm8, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm4, %ymm8
	vcmppd	$13, %ymm0, %ymm4, %ymm6
	vandpd	%ymm2, %ymm6, %ymm9
	vblendvpd	%ymm6, %ymm8, %ymm4, %ymm4
	vcmppd	$2, %ymm1, %ymm4, %ymm6
	vmovapd	%ymm9, 480(%rsp)
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 448(%rsp)
	vmulpd	%ymm0, %ymm4, %ymm8
	vblendvpd	%ymm6, %ymm8, %ymm4, %ymm4
	vandnpd	%ymm15, %ymm11, %ymm6
	vmulpd	%ymm1, %ymm6, %ymm9
	vcmppd	$13, %ymm0, %ymm6, %ymm8
	vandpd	%ymm2, %ymm8, %ymm15
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm6
	vmulpd	%ymm0, %ymm6, %ymm9
	vcmppd	$2, %ymm1, %ymm6, %ymm8
	vmovapd	%ymm15, 416(%rsp)
	vandpd	%ymm2, %ymm8, %ymm15
	vmovapd	%ymm15, 384(%rsp)
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm15
	vmulpd	%ymm1, %ymm14, %ymm8
	vcmppd	$13, %ymm0, %ymm14, %ymm6
	vandpd	%ymm2, %ymm6, %ymm9
	vblendvpd	%ymm6, %ymm8, %ymm14, %ymm14
	vmovapd	544(%rsp), %ymm6
	vmovapd	%ymm9, 352(%rsp)
	vaddpd	576(%rsp), %ymm6, %ymm6
	vcmppd	$2, %ymm1, %ymm14, %ymm8
	vsubpd	512(%rsp), %ymm6, %ymm6
	vandpd	%ymm2, %ymm8, %ymm9
	vaddpd	480(%rsp), %ymm6, %ymm6
	vsubpd	448(%rsp), %ymm6, %ymm6
	vaddpd	416(%rsp), %ymm6, %ymm6
	vsubpd	384(%rsp), %ymm6, %ymm6
	vaddpd	352(%rsp), %ymm6, %ymm6
	vsubpd	%ymm9, %ymm6, %ymm6
	vmovapd	%ymm6, 576(%rsp)
	vmulpd	%ymm0, %ymm14, %ymm6
	vblendvpd	%ymm8, %ymm6, %ymm14, %ymm14
	vandnpd	%ymm10, %ymm11, %ymm6
	vmulpd	%ymm1, %ymm6, %ymm9
	vcmppd	$13, %ymm0, %ymm6, %ymm8
	vandpd	%ymm2, %ymm8, %ymm10
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm6
	vcmppd	$2, %ymm1, %ymm6, %ymm8
	vmovapd	%ymm10, 544(%rsp)
	vandpd	%ymm2, %ymm8, %ymm9
	vmovapd	%ymm9, 512(%rsp)
	vmulpd	%ymm0, %ymm6, %ymm9
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm10
	vcmppd	$13, %ymm0, %ymm13, %ymm6
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 480(%rsp)
	vmulpd	%ymm1, %ymm13, %ymm8
	vblendvpd	%ymm6, %ymm8, %ymm13, %ymm13
	vmulpd	%ymm0, %ymm13, %ymm8
	vcmppd	$2, %ymm1, %ymm13, %ymm6
	vandpd	%ymm2, %ymm6, %ymm9
	vblendvpd	%ymm6, %ymm8, %ymm13, %ymm13
	vcmppd	$13, %ymm0, %ymm12, %ymm6
	vmovapd	%ymm9, 448(%rsp)
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 416(%rsp)
	vmulpd	%ymm1, %ymm12, %ymm8
	vblendvpd	%ymm6, %ymm8, %ymm12, %ymm12
	vmulpd	%ymm0, %ymm12, %ymm8
	vcmppd	$2, %ymm1, %ymm12, %ymm6
	vandpd	%ymm2, %ymm6, %ymm9
	vblendvpd	%ymm6, %ymm8, %ymm12, %ymm12
	vandnpd	%ymm7, %ymm11, %ymm6
	vcmppd	$13, %ymm0, %ymm6, %ymm8
	vmovapd	%ymm9, 384(%rsp)
	vandpd	%ymm2, %ymm8, %ymm7
	vmovapd	%ymm7, 352(%rsp)
	vmulpd	%ymm1, %ymm6, %ymm7
	vblendvpd	%ymm8, %ymm7, %ymm6, %ymm7
	vmovapd	544(%rsp), %ymm6
	vcmppd	$2, %ymm1, %ymm7, %ymm8
	vaddpd	608(%rsp), %ymm6, %ymm6
	vandpd	%ymm2, %ymm8, %ymm9
	vsubpd	512(%rsp), %ymm6, %ymm6
	vaddpd	480(%rsp), %ymm6, %ymm6
	vsubpd	448(%rsp), %ymm6, %ymm6
	vaddpd	416(%rsp), %ymm6, %ymm6
	vsubpd	384(%rsp), %ymm6, %ymm6
	vaddpd	352(%rsp), %ymm6, %ymm6
	vsubpd	%ymm9, %ymm6, %ymm6
	vmovapd	%ymm6, 608(%rsp)
	vmulpd	%ymm0, %ymm7, %ymm6
	vblendvpd	%ymm8, %ymm6, %ymm7, %ymm7
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L92:
	vandnpd	%ymm5, %ymm11, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm3
	vandnpd	%ymm4, %ymm11, %ymm4
	vmovapd	%ymm15, %ymm8
	vandpd	%ymm2, %ymm3, %ymm6
	vmovapd	%ymm6, 544(%rsp)
	vmulpd	%ymm1, %ymm5, %ymm6
	vmovapd	%ymm10, %ymm15
	vmovapd	%ymm7, %ymm10
	vblendvpd	%ymm3, %ymm6, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm6
	vcmppd	$2, %ymm1, %ymm5, %ymm3
	vandpd	%ymm2, %ymm3, %ymm7
	vblendvpd	%ymm3, %ymm6, %ymm5, %ymm6
	vcmppd	$13, %ymm0, %ymm4, %ymm3
	vmovapd	%ymm7, 512(%rsp)
	vandpd	%ymm2, %ymm3, %ymm5
	vmovapd	%ymm5, 480(%rsp)
	vmulpd	%ymm1, %ymm4, %ymm5
	vblendvpd	%ymm3, %ymm5, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm4, %ymm5
	vcmppd	$2, %ymm1, %ymm4, %ymm3
	vandpd	%ymm2, %ymm3, %ymm9
	vblendvpd	%ymm3, %ymm5, %ymm4, %ymm7
	vandnpd	%ymm8, %ymm11, %ymm3
	vmulpd	%ymm1, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm3, %ymm4
	vmovapd	%ymm9, 448(%rsp)
	vandpd	%ymm2, %ymm4, %ymm8
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm3
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovapd	%ymm8, 416(%rsp)
	vandpd	%ymm2, %ymm4, %ymm5
	vmovapd	%ymm5, 384(%rsp)
	vmulpd	%ymm0, %ymm3, %ymm5
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm4
	vandnpd	%ymm14, %ymm11, %ymm3
	vmulpd	%ymm1, %ymm3, %ymm5
	vmovapd	%ymm4, 352(%rsp)
	vcmppd	$13, %ymm0, %ymm3, %ymm4
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm3
	vandpd	%ymm2, %ymm4, %ymm9
	vmulpd	%ymm0, %ymm3, %ymm5
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovapd	%ymm9, 320(%rsp)
	vandpd	%ymm2, %ymm4, %ymm8
	vmovapd	%ymm8, 288(%rsp)
	vandnpd	%ymm15, %ymm11, %ymm8
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm3
	vmulpd	%ymm1, %ymm8, %ymm4
	vmovapd	%ymm3, %ymm14
	vcmppd	$13, %ymm0, %ymm8, %ymm3
	vandnpd	%ymm13, %ymm11, %ymm5
	vblendvpd	%ymm3, %ymm4, %ymm8, %ymm8
	vandpd	%ymm2, %ymm3, %ymm15
	vcmppd	$2, %ymm1, %ymm8, %ymm3
	vmovapd	%ymm15, 256(%rsp)
	vandpd	%ymm2, %ymm3, %ymm4
	vmovapd	%ymm4, 224(%rsp)
	vmulpd	%ymm0, %ymm8, %ymm4
	vblendvpd	%ymm3, %ymm4, %ymm8, %ymm8
	vmulpd	%ymm1, %ymm5, %ymm4
	vcmppd	$13, %ymm0, %ymm5, %ymm3
	vmulpd	%ymm6, %ymm8, %ymm6
	vandpd	%ymm2, %ymm3, %ymm13
	vblendvpd	%ymm3, %ymm4, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm4
	vcmppd	$2, %ymm1, %ymm5, %ymm3
	vandnpd	%ymm6, %ymm11, %ymm6
	vmovapd	%ymm13, 192(%rsp)
	vandpd	%ymm2, %ymm3, %ymm15
	vblendvpd	%ymm3, %ymm4, %ymm5, %ymm5
	vandnpd	%ymm12, %ymm11, %ymm3
	vmulpd	%ymm1, %ymm3, %ymm9
	vcmppd	$13, %ymm0, %ymm3, %ymm4
	vcmppd	$13, %ymm0, %ymm6, %ymm8
	vmulpd	%ymm7, %ymm5, %ymm5
	vandpd	%ymm2, %ymm4, %ymm12
	vblendvpd	%ymm4, %ymm9, %ymm3, %ymm3
	vmulpd	%ymm0, %ymm3, %ymm9
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovapd	%ymm12, 128(%rsp)
	vandnpd	%ymm5, %ymm11, %ymm5
	vandpd	%ymm2, %ymm4, %ymm12
	vblendvpd	%ymm4, %ymm9, %ymm3, %ymm3
	vandnpd	%ymm10, %ymm11, %ymm4
	vcmppd	$13, %ymm0, %ymm4, %ymm9
	vmovapd	%ymm15, 160(%rsp)
	vandpd	%ymm2, %ymm8, %ymm15
	vandpd	%ymm2, %ymm9, %ymm10
	vmovapd	%ymm10, 64(%rsp)
	vmulpd	%ymm1, %ymm4, %ymm10
	vmulpd	%ymm1, %ymm5, %ymm7
	vmovapd	%ymm12, 96(%rsp)
	vmulpd	352(%rsp), %ymm3, %ymm3
	vblendvpd	%ymm9, %ymm10, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm4, %ymm10
	vcmppd	$2, %ymm1, %ymm4, %ymm9
	vandnpd	%ymm3, %ymm11, %ymm3
	vandpd	%ymm2, %ymm9, %ymm13
	vblendvpd	%ymm9, %ymm10, %ymm4, %ymm4
	vmulpd	%ymm1, %ymm6, %ymm9
	vmovapd	%ymm13, 32(%rsp)
	vmulpd	%ymm14, %ymm4, %ymm4
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm6
	vmulpd	%ymm0, %ymm6, %ymm9
	vcmppd	$2, %ymm1, %ymm6, %ymm8
	vandnpd	%ymm4, %ymm11, %ymm4
	vandpd	%ymm2, %ymm8, %ymm13
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm8
	vcmppd	$13, %ymm0, %ymm5, %ymm6
	vblendvpd	%ymm6, %ymm7, %ymm5, %ymm5
	vandpd	%ymm2, %ymm6, %ymm12
	vcmppd	$2, %ymm1, %ymm5, %ymm6
	vandpd	%ymm2, %ymm6, %ymm7
	vmovapd	%ymm7, (%rsp)
	vmulpd	%ymm0, %ymm5, %ymm7
	vblendvpd	%ymm6, %ymm7, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm3, %ymm7
	vcmppd	$13, %ymm0, %ymm3, %ymm6
	vmulpd	%ymm5, %ymm8, %ymm5
	vandpd	%ymm2, %ymm6, %ymm10
	vblendvpd	%ymm6, %ymm7, %ymm3, %ymm3
	vmulpd	%ymm0, %ymm3, %ymm7
	vcmppd	$2, %ymm1, %ymm3, %ymm6
	vandnpd	%ymm5, %ymm11, %ymm5
	vandpd	%ymm2, %ymm6, %ymm9
	vblendvpd	%ymm6, %ymm7, %ymm3, %ymm3
	vcmppd	$13, %ymm0, %ymm4, %ymm6
	vandpd	%ymm2, %ymm6, %ymm7
	vmovapd	%ymm7, 352(%rsp)
	vmulpd	%ymm1, %ymm4, %ymm7
	vblendvpd	%ymm6, %ymm7, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm4, %ymm14
	vcmppd	$2, %ymm1, %ymm4, %ymm6
	vandpd	%ymm2, %ymm6, %ymm7
	vblendvpd	%ymm6, %ymm14, %ymm4, %ymm4
	vmovapd	544(%rsp), %ymm6
	vaddpd	576(%rsp), %ymm6, %ymm6
	vsubpd	512(%rsp), %ymm6, %ymm6
	vaddpd	480(%rsp), %ymm6, %ymm6
	vsubpd	448(%rsp), %ymm6, %ymm6
	vaddpd	416(%rsp), %ymm6, %ymm6
	vsubpd	384(%rsp), %ymm6, %ymm6
	vaddpd	320(%rsp), %ymm6, %ymm6
	vsubpd	288(%rsp), %ymm6, %ymm6
	vaddpd	%ymm15, %ymm6, %ymm6
	vsubpd	%ymm13, %ymm6, %ymm6
	vaddpd	%ymm12, %ymm6, %ymm6
	vsubpd	(%rsp), %ymm6, %ymm6
	vaddpd	%ymm10, %ymm6, %ymm6
	vsubpd	%ymm9, %ymm6, %ymm6
	vaddpd	352(%rsp), %ymm6, %ymm6
	vsubpd	%ymm7, %ymm6, %ymm6
	vmovapd	256(%rsp), %ymm7
	vaddpd	608(%rsp), %ymm7, %ymm7
	vsubpd	224(%rsp), %ymm7, %ymm7
	vaddpd	192(%rsp), %ymm7, %ymm7
	vsubpd	160(%rsp), %ymm7, %ymm7
	vaddpd	128(%rsp), %ymm7, %ymm7
	vsubpd	96(%rsp), %ymm7, %ymm7
	vaddpd	64(%rsp), %ymm7, %ymm7
	vsubpd	32(%rsp), %ymm7, %ymm7
	vaddpd	%ymm7, %ymm6, %ymm6
	vcmppd	$13, %ymm0, %ymm5, %ymm7
	vcvtpd2dqy	%ymm6, %xmm6
	vphaddd	%xmm6, %xmm6, %xmm6
	vphaddd	%xmm6, %xmm6, %xmm6
	vmovd	%xmm6, %eax
	vcmppd	$2, %ymm1, %ymm5, %ymm6
	vmovmskpd	%ymm7, %r11d
	cltq
	vmovmskpd	%ymm6, %edx
	testl	%r11d, %r11d
	je	.L38
	vmulpd	%ymm1, %ymm5, %ymm8
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm7, %ymm8, %ymm5, %ymm5
.L38:
	testl	%edx, %edx
	je	.L39
	vmulpd	%ymm0, %ymm5, %ymm7
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm6, %ymm7, %ymm5, %ymm5
.L39:
	vmulpd	%ymm4, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm11, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm6
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovmskpd	%ymm6, %r11d
	vmovmskpd	%ymm4, %edx
	testl	%r11d, %r11d
	je	.L40
	vmulpd	%ymm1, %ymm3, %ymm7
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm6, %ymm7, %ymm3, %ymm3
.L40:
	testl	%edx, %edx
	je	.L41
	vmulpd	%ymm0, %ymm3, %ymm6
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm4, %ymm6, %ymm3, %ymm3
.L41:
	vmulpd	%ymm5, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm11, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm5
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovmskpd	%ymm5, %r11d
	vmovmskpd	%ymm4, %edx
	testl	%r11d, %r11d
	je	.L42
	vmulpd	%ymm1, %ymm3, %ymm6
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm5, %ymm6, %ymm3, %ymm3
.L42:
	testl	%edx, %edx
	je	.L43
	vmulpd	%ymm0, %ymm3, %ymm5
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm3
.L43:
	vinsertf128	$1, %xmm2, %ymm3, %ymm4
	vperm2f128	$33, %ymm2, %ymm3, %ymm3
	vmulpd	%ymm3, %ymm4, %ymm2
	vandnpd	%ymm2, %ymm11, %ymm2
	vcmppd	$13, %ymm0, %ymm2, %ymm4
	vcmppd	$2, %ymm1, %ymm2, %ymm3
	vmovmskpd	%ymm4, %r11d
	vmovmskpd	%ymm3, %edx
	testl	%r11d, %r11d
	je	.L44
	vmulpd	%ymm1, %ymm2, %ymm1
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm4, %ymm1, %ymm2, %ymm2
.L44:
	testl	%edx, %edx
	je	.L45
	vmulpd	%ymm0, %ymm2, %ymm0
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm3, %ymm0, %ymm2, %ymm2
.L45:
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm2
	vmovq	.LC12(%rip), %xmm3
	vmovsd	.LC13(%rip), %xmm1
	vmovsd	.LC14(%rip), %xmm4
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm1, %xmm2
	ja	.L93
	vcomisd	%xmm2, %xmm4
	jbe	.L48
	vmulsd	%xmm1, %xmm2, %xmm2
	decq	%rax
.L48:
	vmovsd	%xmm2, (%r9)
	leaq	31(%r10), %rdx
	movq	%rax, (%rcx)
	movslq	%r10d, %rax
	cmpq	%rax, %rdx
	jl	.L89
	leaq	32(%r10), %rdx
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L94:
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
	incq	(%rcx)
.L52:
	incq	%rax
	cmpq	%rdx, %rax
	je	.L89
.L57:
	cmpq	%rax, %rdi
	je	.L52
	vmovq	%r8, %xmm7
	vsubsd	(%rsi,%rax,8), %xmm7, %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vmulsd	(%r9), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L94
	vcomisd	%xmm0, %xmm4
	ja	.L55
	incq	%rax
	vmovsd	%xmm0, (%r9)
	cmpq	%rdx, %rax
	jne	.L57
.L89:
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L93:
	.cfi_restore_state
	vmulsd	%xmm4, %xmm2, %xmm2
	incq	%rax
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L55:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
	decq	(%rcx)
	jmp	.L52
.L91:
	leaq	.LC5(%rip), %rcx
	movl	$112, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE9263:
	.size	_Z13prod_realreallldPKdRdRl.constprop.0, .-_Z13prod_realreallldPKdRdRl.constprop.0
	.section	.rodata.str1.1
.LC15:
	.string	","
	.text
	.p2align 4
	.globl	_Z5printDv4_d
	.type	_Z5printDv4_d, @function
_Z5printDv4_d:
.LFB8794:
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
	je	.L101
	cmpb	$0, 56(%r13)
	je	.L97
	movsbl	67(%r13), %esi
.L98:
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
.L97:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L98
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L98
.L101:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE8794:
	.size	_Z5printDv4_d, .-_Z5printDv4_d
	.p2align 4
	.globl	_Z5debugDv4_d
	.type	_Z5debugDv4_d, @function
_Z5debugDv4_d:
.LFB8795:
	.cfi_startproc
	endbr64
	jmp	_Z5printDv4_d
	.cfi_endproc
.LFE8795:
	.size	_Z5debugDv4_d, .-_Z5debugDv4_d
	.p2align 4
	.globl	_Z16new_double_arrayl
	.type	_Z16new_double_arrayl, @function
_Z16new_double_arrayl:
.LFB8796:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	0(,%rdi,8), %rdx
	movl	$32, %esi
	movq	%rsp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	posix_memalign@PLT
	testl	%eax, %eax
	movl	$0, %eax
	cmove	(%rsp), %rax
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L108
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L108:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE8796:
	.size	_Z16new_double_arrayl, .-_Z16new_double_arrayl
	.p2align 4
	.globl	_Z3absDv4_d
	.type	_Z3absDv4_d, @function
_Z3absDv4_d:
.LFB8799:
	.cfi_startproc
	endbr64
	vmovapd	%ymm0, %ymm1
	vmovapd	.LC9(%rip), %ymm0
	vandnpd	%ymm1, %ymm0, %ymm0
	ret
	.cfi_endproc
.LFE8799:
	.size	_Z3absDv4_d, .-_Z3absDv4_d
	.p2align 4
	.globl	_Z8mul_diffDv4_dS_S_
	.type	_Z8mul_diffDv4_dS_S_, @function
_Z8mul_diffDv4_dS_S_:
.LFB8802:
	.cfi_startproc
	endbr64
	vsubpd	%ymm2, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE8802:
	.size	_Z8mul_diffDv4_dS_S_, .-_Z8mul_diffDv4_dS_S_
	.p2align 4
	.globl	_Z8save_mulDv4_dS_Rl
	.type	_Z8save_mulDv4_dS_Rl, @function
_Z8save_mulDv4_dS_Rl:
.LFB8803:
	.cfi_startproc
	endbr64
	vmulpd	%ymm1, %ymm0, %ymm1
	vmovapd	.LC9(%rip), %ymm0
	vmovapd	.LC11(%rip), %ymm2
	vandnpd	%ymm1, %ymm0, %ymm0
	vmovapd	.LC10(%rip), %ymm1
	vcmppd	$2, %ymm2, %ymm0, %ymm3
	vcmppd	$13, %ymm1, %ymm0, %ymm4
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm4, %edx
	testl	%edx, %edx
	je	.L112
	vmulpd	%ymm2, %ymm0, %ymm2
	popcntl	%edx, %edx
	addq	%rdx, (%rdi)
	vblendvpd	%ymm4, %ymm2, %ymm0, %ymm0
.L112:
	testl	%eax, %eax
	je	.L111
	vmulpd	%ymm1, %ymm0, %ymm1
	popcntl	%eax, %eax
	subq	%rax, (%rdi)
	vblendvpd	%ymm3, %ymm1, %ymm0, %ymm0
.L111:
	ret
	.cfi_endproc
.LFE8803:
	.size	_Z8save_mulDv4_dS_Rl, .-_Z8save_mulDv4_dS_Rl
	.p2align 4
	.globl	_Z8save_mulDv4_dS_RS_
	.type	_Z8save_mulDv4_dS_RS_, @function
_Z8save_mulDv4_dS_RS_:
.LFB8804:
	.cfi_startproc
	endbr64
	vmulpd	%ymm1, %ymm0, %ymm1
	vmovapd	.LC9(%rip), %ymm0
	vmovapd	.LC10(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm4
	vandnpd	%ymm1, %ymm0, %ymm0
	vmovapd	.LC11(%rip), %ymm1
	vcmppd	$13, %ymm3, %ymm0, %ymm5
	vmulpd	%ymm1, %ymm0, %ymm6
	vandpd	%ymm4, %ymm5, %ymm2
	vaddpd	(%rdi), %ymm2, %ymm2
	vblendvpd	%ymm5, %ymm6, %ymm0, %ymm0
	vcmppd	$2, %ymm1, %ymm0, %ymm1
	vmulpd	%ymm3, %ymm0, %ymm3
	vandpd	%ymm4, %ymm1, %ymm4
	vsubpd	%ymm4, %ymm2, %ymm2
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm0
	vmovapd	%ymm2, (%rdi)
	ret
	.cfi_endproc
.LFE8804:
	.size	_Z8save_mulDv4_dS_RS_, .-_Z8save_mulDv4_dS_RS_
	.p2align 4
	.globl	_Z18horizontal_productDv4_dRl
	.type	_Z18horizontal_productDv4_dRl, @function
_Z18horizontal_productDv4_dRl:
.LFB8805:
	.cfi_startproc
	endbr64
	vmovapd	.LC4(%rip), %ymm1
	vinsertf128	$1, %xmm1, %ymm0, %ymm2
	vperm2f128	$33, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm1
	vmovapd	.LC9(%rip), %ymm0
	vmovapd	.LC11(%rip), %ymm2
	vandnpd	%ymm1, %ymm0, %ymm0
	vmovapd	.LC10(%rip), %ymm1
	vcmppd	$2, %ymm2, %ymm0, %ymm3
	vcmppd	$13, %ymm1, %ymm0, %ymm4
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm4, %edx
	testl	%edx, %edx
	je	.L122
	vmulpd	%ymm2, %ymm0, %ymm2
	popcntl	%edx, %edx
	addq	%rdx, (%rdi)
	vblendvpd	%ymm4, %ymm2, %ymm0, %ymm0
.L122:
	testl	%eax, %eax
	je	.L123
	vmulpd	%ymm1, %ymm0, %ymm1
	popcntl	%eax, %eax
	subq	%rax, (%rdi)
	vblendvpd	%ymm3, %ymm1, %ymm0, %ymm0
.L123:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC13(%rip), %xmm1
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L136
	vmulsd	.LC14(%rip), %xmm0, %xmm0
	incq	(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L136:
	vmovsd	.LC14(%rip), %xmm2
	vcomisd	%xmm0, %xmm2
	jbe	.L121
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	(%rdi)
.L121:
	ret
	.cfi_endproc
.LFE8805:
	.size	_Z18horizontal_productDv4_dRl, .-_Z18horizontal_productDv4_dRl
	.p2align 4
	.globl	_Z13assert_approxdd
	.type	_Z13assert_approxdd, @function
_Z13assert_approxdd:
.LFB8815:
	.cfi_startproc
	endbr64
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovq	.LC12(%rip), %xmm3
	vandpd	%xmm3, %xmm2, %xmm2
	vsubsd	.LC16(%rip), %xmm2, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	.LC17(%rip), %xmm2
	ja	.L143
	ret
	.p2align 4,,10
	.p2align 3
.L143:
	jmp	_Z13assert_approxdd.part.0
	.cfi_endproc
.LFE8815:
	.size	_Z13assert_approxdd, .-_Z13assert_approxdd
	.section	.text._Z10test_vprodv,"axG",@progbits,_Z10test_vprodv,comdat
	.p2align 4
	.weak	_Z10test_vprodv
	.type	_Z10test_vprodv, @function
_Z10test_vprodv:
.LFB8816:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	leaq	-64(%rbp), %rdi
	pushq	%r12
	pushq	%rbx
	subq	$152, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	vmovapd	.LC18(%rip), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	$0, -64(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	.LC19(%rip), %xmm0
	vmovq	.LC12(%rip), %xmm2
	vdivsd	%xmm1, %xmm0, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vsubsd	.LC16(%rip), %xmm3, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vcomisd	.LC17(%rip), %xmm3
	ja	.L292
.L145:
	movq	-64(%rbp), %rsi
	cmpq	$1, %rsi
	je	.L147
	movl	$1, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovq	.LC12(%rip), %xmm2
.L147:
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmulpd	%ymm1, %ymm1, %ymm1
	vmovapd	.LC20(%rip), %ymm7
	vcvtpd2dqy	%ymm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %r12d
	vmulpd	%ymm7, %ymm1, %ymm0
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC11(%rip), %ymm5
	movslq	%r12d, %r12
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm8
	vcmppd	$2, %ymm5, %ymm0, %ymm6
	movq	%r12, %r13
	vmovmskpd	%ymm8, %edx
	vmovmskpd	%ymm6, %eax
	testl	%edx, %edx
	je	.L148
	vmulpd	%ymm5, %ymm0, %ymm9
	popcntl	%edx, %edx
	leaq	(%rdx,%r12), %r13
	vblendvpd	%ymm8, %ymm9, %ymm0, %ymm0
.L148:
	testl	%eax, %eax
	je	.L149
	vmulpd	%ymm4, %ymm0, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm6, %ymm8, %ymm0, %ymm0
.L149:
	vmulpd	%ymm1, %ymm1, %ymm8
	vandnpd	%ymm8, %ymm3, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm9
	vcmppd	$2, %ymm5, %ymm8, %ymm6
	vmovmskpd	%ymm9, %edx
	vmovmskpd	%ymm6, %eax
	testl	%edx, %edx
	je	.L150
	vmulpd	%ymm5, %ymm8, %ymm10
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm9, %ymm10, %ymm8, %ymm8
.L150:
	testl	%eax, %eax
	je	.L151
	vmulpd	%ymm4, %ymm8, %ymm9
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm6, %ymm9, %ymm8, %ymm8
.L151:
	vmulpd	%ymm0, %ymm8, %ymm8
	vandnpd	%ymm8, %ymm3, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm6
	vcmppd	$2, %ymm5, %ymm8, %ymm0
	vmovmskpd	%ymm6, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L152
	vmulpd	%ymm5, %ymm8, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm6, %ymm9, %ymm8, %ymm8
.L152:
	testl	%eax, %eax
	je	.L153
	vmulpd	%ymm4, %ymm8, %ymm6
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm0, %ymm6, %ymm8, %ymm8
.L153:
	vmovapd	.LC4(%rip), %ymm6
	vinsertf128	$1, %xmm6, %ymm8, %ymm0
	vperm2f128	$33, %ymm6, %ymm8, %ymm8
	vmulpd	%ymm8, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm9
	vcmppd	$2, %ymm5, %ymm0, %ymm8
	vmovmskpd	%ymm9, %edx
	vmovmskpd	%ymm8, %eax
	testl	%edx, %edx
	je	.L154
	vmulpd	%ymm5, %ymm0, %ymm10
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm0
.L154:
	testl	%eax, %eax
	je	.L155
	vmulpd	%ymm4, %ymm0, %ymm9
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm8, %ymm9, %ymm0, %ymm0
.L155:
	vunpckhpd	%xmm0, %xmm0, %xmm8
	vmulsd	%xmm8, %xmm0, %xmm0
	movq	.LC14(%rip), %rbx
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC13(%rip), %xmm0
	jbe	.L285
	vmovq	%rbx, %xmm13
	vmulsd	%xmm13, %xmm0, %xmm0
	incq	%r13
.L158:
	vucomisd	.LC3(%rip), %xmm0
	jp	.L199
	jne	.L199
.L160:
	testq	%r13, %r13
	je	.L162
	movq	%r13, %rsi
	xorl	%edi, %edi
	vmovapd	%ymm1, -112(%rbp)
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovq	.LC12(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC20(%rip), %ymm7
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm6
	vmovapd	-112(%rbp), %ymm1
.L162:
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm9
	vmulpd	.LC21(%rip), %ymm1, %ymm8
	vmulpd	%ymm7, %ymm9, %ymm7
	vmulpd	%ymm1, %ymm9, %ymm9
	vmulpd	%ymm8, %ymm7, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm10
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L163
	vmulpd	%ymm5, %ymm0, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L163:
	testl	%eax, %eax
	je	.L164
	vmulpd	%ymm4, %ymm0, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm10, %ymm0, %ymm0
.L164:
	vmulpd	%ymm9, %ymm9, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm11
	vcmppd	$2, %ymm5, %ymm1, %ymm10
	vmovmskpd	%ymm11, %edx
	vmovmskpd	%ymm10, %eax
	testl	%edx, %edx
	je	.L165
	vmulpd	%ymm5, %ymm1, %ymm12
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm11, %ymm12, %ymm1, %ymm1
.L165:
	testl	%eax, %eax
	je	.L166
	vmulpd	%ymm4, %ymm1, %ymm11
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm10, %ymm11, %ymm1, %ymm1
.L166:
	vmulpd	%ymm0, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm10
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L167
	vmulpd	%ymm5, %ymm1, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm1, %ymm1
.L167:
	testl	%eax, %eax
	je	.L168
	vmulpd	%ymm4, %ymm1, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm10, %ymm1, %ymm1
.L168:
	vinsertf128	$1, %xmm6, %ymm1, %ymm0
	vperm2f128	$33, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm10
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L169
	vmulpd	%ymm5, %ymm0, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L169:
	testl	%eax, %eax
	je	.L170
	vmulpd	%ymm4, %ymm0, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm10, %ymm0, %ymm0
.L170:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm1
	vcomisd	.LC13(%rip), %xmm1
	vmovq	%rbx, %xmm0
	jbe	.L286
	vmulsd	%xmm0, %xmm1, %xmm1
	incq	%r12
.L173:
	vmovsd	.LC22(%rip), %xmm10
	vdivsd	%xmm1, %xmm10, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC16(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC17(%rip), %xmm0
	ja	.L293
.L175:
	cmpq	$1, %r12
	je	.L177
	movq	%r12, %rsi
	movl	$1, %edi
	vmovapd	%ymm9, -176(%rbp)
	vmovapd	%ymm8, -144(%rbp)
	vmovapd	%ymm7, -112(%rbp)
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovq	.LC12(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm6
	vmovapd	-176(%rbp), %ymm9
	vmovapd	-144(%rbp), %ymm8
	vmovapd	-112(%rbp), %ymm7
.L177:
	vmulpd	.LC23(%rip), %ymm7, %ymm7
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm1
	vmulpd	%ymm8, %ymm1, %ymm8
	vmulpd	%ymm9, %ymm1, %ymm1
	vandnpd	%ymm7, %ymm3, %ymm7
	vmulpd	%ymm5, %ymm7, %ymm11
	vcmppd	$13, %ymm4, %ymm7, %ymm10
	vandnpd	%ymm8, %ymm3, %ymm8
	vandnpd	%ymm1, %ymm3, %ymm1
	vandpd	%ymm6, %ymm10, %ymm0
	vblendvpd	%ymm10, %ymm11, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm7, %ymm11
	vcmppd	$2, %ymm5, %ymm7, %ymm10
	vcmppd	$13, %ymm4, %ymm1, %ymm9
	vandpd	%ymm6, %ymm10, %ymm13
	vblendvpd	%ymm10, %ymm11, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm8, %ymm11
	vcmppd	$13, %ymm4, %ymm8, %ymm10
	vandpd	%ymm6, %ymm10, %ymm12
	vblendvpd	%ymm10, %ymm11, %ymm8, %ymm8
	vmulpd	%ymm4, %ymm8, %ymm14
	vcmppd	$2, %ymm5, %ymm8, %ymm10
	vandpd	%ymm6, %ymm10, %ymm11
	vblendvpd	%ymm10, %ymm14, %ymm8, %ymm8
	vmulpd	%ymm5, %ymm1, %ymm14
	vandpd	%ymm6, %ymm9, %ymm10
	vmulpd	%ymm8, %ymm7, %ymm7
	vblendvpd	%ymm9, %ymm14, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm15
	vcmppd	$2, %ymm5, %ymm1, %ymm14
	vandnpd	%ymm7, %ymm3, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm8
	vandpd	%ymm6, %ymm14, %ymm9
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
	vxorpd	%xmm14, %xmm14, %xmm14
	vaddpd	%ymm14, %ymm0, %ymm0
	vmovmskpd	%ymm8, %edx
	vsubpd	%ymm13, %ymm0, %ymm0
	vaddpd	%ymm12, %ymm0, %ymm0
	vsubpd	%ymm11, %ymm0, %ymm0
	vaddpd	%ymm10, %ymm0, %ymm0
	vsubpd	%ymm9, %ymm0, %ymm0
	vaddpd	%ymm10, %ymm0, %ymm0
	vsubpd	%ymm9, %ymm0, %ymm0
	vcvtpd2dqy	%ymm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %r12d
	vcmppd	$2, %ymm5, %ymm7, %ymm0
	movslq	%r12d, %r12
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L178
	vmulpd	%ymm5, %ymm7, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm8, %ymm9, %ymm7, %ymm7
.L178:
	testl	%eax, %eax
	je	.L179
	vmulpd	%ymm4, %ymm7, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm8, %ymm7, %ymm7
.L179:
	vmulpd	%ymm1, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm8
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vmovmskpd	%ymm8, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L180
	vmulpd	%ymm5, %ymm1, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm8, %ymm9, %ymm1, %ymm1
.L180:
	testl	%eax, %eax
	je	.L181
	vmulpd	%ymm4, %ymm1, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm8, %ymm1, %ymm1
.L181:
	vmulpd	%ymm7, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm7
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vmovmskpd	%ymm7, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L182
	vmulpd	%ymm5, %ymm1, %ymm8
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm7, %ymm8, %ymm1, %ymm1
.L182:
	testl	%eax, %eax
	je	.L183
	vmulpd	%ymm4, %ymm1, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm7, %ymm1, %ymm1
.L183:
	vinsertf128	$1, %xmm6, %ymm1, %ymm0
	vperm2f128	$33, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm3
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm3, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L184
	vmulpd	%ymm5, %ymm0, %ymm5
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm3, %ymm5, %ymm0, %ymm0
.L184:
	testl	%eax, %eax
	je	.L185
	vmulpd	%ymm4, %ymm0, %ymm4
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm4, %ymm0, %ymm0
.L185:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	%rbx, %xmm6
	vandpd	%xmm2, %xmm0, %xmm1
	vcomisd	.LC13(%rip), %xmm1
	jbe	.L287
	vmulsd	%xmm6, %xmm1, %xmm1
	incq	%r12
.L188:
	vmovsd	.LC24(%rip), %xmm3
	vdivsd	%xmm1, %xmm3, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC16(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC17(%rip), %xmm0
	ja	.L294
	vzeroupper
.L190:
	cmpq	$2, %r12
	jne	.L295
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L291
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L286:
	.cfi_restore_state
	vcomisd	%xmm1, %xmm0
	jbe	.L173
	vmulsd	.LC13(%rip), %xmm1, %xmm1
	decq	%r12
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L285:
	vmovq	%rbx, %xmm15
	vcomisd	%xmm0, %xmm15
	jbe	.L158
	vmulsd	.LC13(%rip), %xmm0, %xmm0
	decq	%r13
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L287:
	vcomisd	%xmm1, %xmm6
	jbe	.L188
	vmulsd	.LC13(%rip), %xmm1, %xmm1
	decq	%r12
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L295:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L291
	addq	$152, %rsp
	popq	%rbx
	movq	%r12, %rsi
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	movl	$2, %edi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_Z9assert_eqIlEvT_S0_.part.0
	.p2align 4,,10
	.p2align 3
.L294:
	.cfi_restore_state
	vmovsd	%xmm3, %xmm3, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
	jmp	.L190
	.p2align 4,,10
	.p2align 3
.L293:
	vmovsd	%xmm10, %xmm10, %xmm0
	vmovapd	%ymm9, -176(%rbp)
	vmovapd	%ymm8, -144(%rbp)
	vmovapd	%ymm7, -112(%rbp)
	vzeroupper
	call	_Z13assert_approxdd.part.0
	vmovq	.LC12(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm6
	vmovapd	-176(%rbp), %ymm9
	vmovapd	-144(%rbp), %ymm8
	vmovapd	-112(%rbp), %ymm7
	jmp	.L175
	.p2align 4,,10
	.p2align 3
.L199:
	vmovapd	%ymm1, -112(%rbp)
	vzeroupper
	call	_Z9assert_eqIdEvT_S0_.part.0.constprop.0
	vmovq	.LC12(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC20(%rip), %ymm7
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm6
	vmovapd	-112(%rbp), %ymm1
	jmp	.L160
	.p2align 4,,10
	.p2align 3
.L292:
	call	_Z13assert_approxdd.part.0
	vmovq	.LC12(%rip), %xmm2
	jmp	.L145
.L291:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE8816:
	.size	_Z10test_vprodv, .-_Z10test_vprodv
	.section	.rodata.str1.1
.LC25:
	.string	"N % ELEMENTS_PER_LOOP == 0"
	.text
	.p2align 4
	.globl	_Z13prod_realreallldPKdRdRl
	.type	_Z13prod_realreallldPKdRdRl, @function
_Z13prod_realreallldPKdRdRl:
.LFB8828:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %r11
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$640, %rsp
	testb	$31, %dil
	jne	.L357
	movq	%rdx, %r9
	movq	%rdx, %rax
	testb	$31, %dl
	jne	.L358
	vmovapd	.LC8(%rip), %ymm5
	vmovq	%xmm0, %rdi
	vmovlpd	(%rcx), %xmm5, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm5, %ymm5
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	(%r8), %xmm0, %xmm0
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm4
	movq	%rsi, %r10
	andq	$-32, %r10
	vmovq	%xmm0, %xmm7
	vmovapd	%ymm7, 576(%rsp)
	vmovq	%rdi, %xmm7
	vbroadcastsd	%xmm7, %ymm3
	vmovapd	%ymm4, %ymm10
	vmovapd	%ymm4, %ymm12
	vmovapd	%ymm4, %ymm13
	vmovapd	%ymm4, %ymm14
	testq	%r11, %r11
	jle	.L323
	vmovapd	.LC4(%rip), %ymm2
	vmovapd	.LC9(%rip), %ymm11
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%ymm1, 608(%rsp)
	vmovapd	.LC10(%rip), %ymm0
	vmovapd	.LC11(%rip), %ymm1
	vmovapd	%ymm4, %ymm9
	vmovapd	%ymm2, %ymm15
	xorl	%edx, %edx
	vmovapd	%ymm4, %ymm7
	vmovapd	%ymm11, %ymm10
	jmp	.L302
	.p2align 4,,10
	.p2align 3
.L301:
	addq	$32, %rdx
	addq	$256, %rax
	cmpq	%rdx, %r11
	jle	.L359
.L302:
	cmpq	%rdx, %r10
	je	.L300
	vsubpd	(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm5, %ymm5
	vsubpd	32(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm4, %ymm4
	vsubpd	64(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm9, %ymm9
	vsubpd	96(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm14, %ymm14
	vsubpd	128(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm15, %ymm15
	vsubpd	160(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm13, %ymm13
	vsubpd	192(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm12, %ymm12
	vsubpd	224(%rax), %ymm3, %ymm6
	vmulpd	%ymm6, %ymm7, %ymm7
.L300:
	testb	$-32, %dl
	jne	.L301
	vandnpd	%ymm5, %ymm10, %ymm5
	vmulpd	%ymm1, %ymm5, %ymm8
	vcmppd	$13, %ymm0, %ymm5, %ymm6
	vandnpd	%ymm4, %ymm10, %ymm4
	vandnpd	%ymm14, %ymm10, %ymm14
	vandpd	%ymm2, %ymm6, %ymm11
	vblendvpd	%ymm6, %ymm8, %ymm5, %ymm5
	vcmppd	$2, %ymm1, %ymm5, %ymm6
	vmovapd	%ymm11, 544(%rsp)
	vandnpd	%ymm15, %ymm10, %ymm15
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 512(%rsp)
	vmulpd	%ymm0, %ymm5, %ymm8
	vandnpd	%ymm13, %ymm10, %ymm13
	vandnpd	%ymm12, %ymm10, %ymm12
	addq	$32, %rdx
	addq	$256, %rax
	vblendvpd	%ymm6, %ymm8, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm4, %ymm8
	vcmppd	$13, %ymm0, %ymm4, %ymm6
	vandpd	%ymm2, %ymm6, %ymm11
	vblendvpd	%ymm6, %ymm8, %ymm4, %ymm4
	vcmppd	$2, %ymm1, %ymm4, %ymm6
	vmovapd	%ymm11, 480(%rsp)
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 448(%rsp)
	vmulpd	%ymm0, %ymm4, %ymm8
	vblendvpd	%ymm6, %ymm8, %ymm4, %ymm4
	vandnpd	%ymm9, %ymm10, %ymm6
	vcmppd	$13, %ymm0, %ymm6, %ymm8
	vandpd	%ymm2, %ymm8, %ymm9
	vmovapd	%ymm9, 416(%rsp)
	vmulpd	%ymm1, %ymm6, %ymm9
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm6
	vcmppd	$2, %ymm1, %ymm6, %ymm8
	vandpd	%ymm2, %ymm8, %ymm9
	vmovapd	%ymm9, 384(%rsp)
	vmulpd	%ymm0, %ymm6, %ymm9
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm9
	vmulpd	%ymm1, %ymm14, %ymm8
	vcmppd	$13, %ymm0, %ymm14, %ymm6
	vandpd	%ymm2, %ymm6, %ymm11
	vblendvpd	%ymm6, %ymm8, %ymm14, %ymm14
	vcmppd	$2, %ymm1, %ymm14, %ymm8
	vandpd	%ymm2, %ymm8, %ymm6
	vmovapd	%ymm6, 352(%rsp)
	vmovapd	544(%rsp), %ymm6
	vaddpd	576(%rsp), %ymm6, %ymm6
	vsubpd	512(%rsp), %ymm6, %ymm6
	vaddpd	480(%rsp), %ymm6, %ymm6
	vsubpd	448(%rsp), %ymm6, %ymm6
	vaddpd	416(%rsp), %ymm6, %ymm6
	vsubpd	384(%rsp), %ymm6, %ymm6
	vaddpd	%ymm11, %ymm6, %ymm6
	vsubpd	352(%rsp), %ymm6, %ymm6
	vmovapd	%ymm6, 576(%rsp)
	vmulpd	%ymm0, %ymm14, %ymm6
	vblendvpd	%ymm8, %ymm6, %ymm14, %ymm14
	vmulpd	%ymm1, %ymm15, %ymm8
	vcmppd	$13, %ymm0, %ymm15, %ymm6
	vandpd	%ymm2, %ymm6, %ymm11
	vblendvpd	%ymm6, %ymm8, %ymm15, %ymm15
	vcmppd	$2, %ymm1, %ymm15, %ymm6
	vmovapd	%ymm11, 544(%rsp)
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 512(%rsp)
	vmulpd	%ymm0, %ymm15, %ymm8
	vblendvpd	%ymm6, %ymm8, %ymm15, %ymm15
	vmulpd	%ymm1, %ymm13, %ymm8
	vcmppd	$13, %ymm0, %ymm13, %ymm6
	vandpd	%ymm2, %ymm6, %ymm11
	vblendvpd	%ymm6, %ymm8, %ymm13, %ymm13
	vcmppd	$2, %ymm1, %ymm13, %ymm6
	vmovapd	%ymm11, 480(%rsp)
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 448(%rsp)
	vmulpd	%ymm0, %ymm13, %ymm8
	vblendvpd	%ymm6, %ymm8, %ymm13, %ymm13
	vmulpd	%ymm1, %ymm12, %ymm8
	vcmppd	$13, %ymm0, %ymm12, %ymm6
	vandpd	%ymm2, %ymm6, %ymm11
	vblendvpd	%ymm6, %ymm8, %ymm12, %ymm12
	vcmppd	$2, %ymm1, %ymm12, %ymm6
	vmovapd	%ymm11, 416(%rsp)
	vandpd	%ymm2, %ymm6, %ymm8
	vmovapd	%ymm8, 384(%rsp)
	vmulpd	%ymm0, %ymm12, %ymm8
	vblendvpd	%ymm6, %ymm8, %ymm12, %ymm12
	vandnpd	%ymm7, %ymm10, %ymm6
	vmulpd	%ymm1, %ymm6, %ymm7
	vcmppd	$13, %ymm0, %ymm6, %ymm8
	vandpd	%ymm2, %ymm8, %ymm11
	vblendvpd	%ymm8, %ymm7, %ymm6, %ymm7
	vcmppd	$2, %ymm1, %ymm7, %ymm8
	vandpd	%ymm2, %ymm8, %ymm6
	vmovapd	%ymm6, 352(%rsp)
	vmovapd	544(%rsp), %ymm6
	vaddpd	608(%rsp), %ymm6, %ymm6
	vsubpd	512(%rsp), %ymm6, %ymm6
	vaddpd	480(%rsp), %ymm6, %ymm6
	vsubpd	448(%rsp), %ymm6, %ymm6
	vaddpd	416(%rsp), %ymm6, %ymm6
	vsubpd	384(%rsp), %ymm6, %ymm6
	vaddpd	%ymm11, %ymm6, %ymm6
	vsubpd	352(%rsp), %ymm6, %ymm6
	vmovapd	%ymm6, 608(%rsp)
	vmulpd	%ymm0, %ymm7, %ymm6
	vblendvpd	%ymm8, %ymm6, %ymm7, %ymm7
	cmpq	%rdx, %r11
	jg	.L302
.L359:
	vmovapd	%ymm10, %ymm11
	vmovapd	%ymm9, %ymm8
	vmovapd	%ymm7, %ymm10
.L299:
	vandnpd	%ymm5, %ymm11, %ymm5
	vcmppd	$13, %ymm0, %ymm5, %ymm3
	vandnpd	%ymm4, %ymm11, %ymm4
	vandpd	%ymm2, %ymm3, %ymm6
	vmovapd	%ymm6, 544(%rsp)
	vmulpd	%ymm1, %ymm5, %ymm6
	vblendvpd	%ymm3, %ymm6, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm6
	vcmppd	$2, %ymm1, %ymm5, %ymm3
	vandpd	%ymm2, %ymm3, %ymm7
	vblendvpd	%ymm3, %ymm6, %ymm5, %ymm6
	vcmppd	$13, %ymm0, %ymm4, %ymm3
	vmovapd	%ymm7, 512(%rsp)
	vandpd	%ymm2, %ymm3, %ymm5
	vmovapd	%ymm5, 480(%rsp)
	vmulpd	%ymm1, %ymm4, %ymm5
	vblendvpd	%ymm3, %ymm5, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm4, %ymm5
	vcmppd	$2, %ymm1, %ymm4, %ymm3
	vandpd	%ymm2, %ymm3, %ymm9
	vblendvpd	%ymm3, %ymm5, %ymm4, %ymm7
	vandnpd	%ymm8, %ymm11, %ymm3
	vmulpd	%ymm1, %ymm3, %ymm5
	vcmppd	$13, %ymm0, %ymm3, %ymm4
	vmovapd	%ymm9, 448(%rsp)
	vandpd	%ymm2, %ymm4, %ymm8
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm3
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovapd	%ymm8, 416(%rsp)
	vandpd	%ymm2, %ymm4, %ymm5
	vmovapd	%ymm5, 384(%rsp)
	vmulpd	%ymm0, %ymm3, %ymm5
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm4
	vandnpd	%ymm14, %ymm11, %ymm3
	vmulpd	%ymm1, %ymm3, %ymm5
	vmovapd	%ymm4, 352(%rsp)
	vcmppd	$13, %ymm0, %ymm3, %ymm4
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm3
	vandpd	%ymm2, %ymm4, %ymm9
	vmulpd	%ymm0, %ymm3, %ymm5
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovapd	%ymm9, 320(%rsp)
	vandpd	%ymm2, %ymm4, %ymm8
	vmovapd	%ymm8, 288(%rsp)
	vandnpd	%ymm15, %ymm11, %ymm8
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm3
	vmulpd	%ymm1, %ymm8, %ymm4
	vmovapd	%ymm3, %ymm14
	vcmppd	$13, %ymm0, %ymm8, %ymm3
	vandnpd	%ymm13, %ymm11, %ymm5
	vblendvpd	%ymm3, %ymm4, %ymm8, %ymm8
	vandpd	%ymm2, %ymm3, %ymm15
	vcmppd	$2, %ymm1, %ymm8, %ymm3
	vmovapd	%ymm15, 256(%rsp)
	vandpd	%ymm2, %ymm3, %ymm4
	vmovapd	%ymm4, 224(%rsp)
	vmulpd	%ymm0, %ymm8, %ymm4
	vblendvpd	%ymm3, %ymm4, %ymm8, %ymm8
	vmulpd	%ymm1, %ymm5, %ymm4
	vcmppd	$13, %ymm0, %ymm5, %ymm3
	vmulpd	%ymm6, %ymm8, %ymm6
	vandpd	%ymm2, %ymm3, %ymm13
	vblendvpd	%ymm3, %ymm4, %ymm5, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm4
	vcmppd	$2, %ymm1, %ymm5, %ymm3
	vandnpd	%ymm6, %ymm11, %ymm6
	vmovapd	%ymm13, 192(%rsp)
	vandpd	%ymm2, %ymm3, %ymm15
	vblendvpd	%ymm3, %ymm4, %ymm5, %ymm5
	vandnpd	%ymm12, %ymm11, %ymm3
	vmulpd	%ymm1, %ymm3, %ymm9
	vcmppd	$13, %ymm0, %ymm3, %ymm4
	vcmppd	$13, %ymm0, %ymm6, %ymm8
	vmulpd	%ymm7, %ymm5, %ymm5
	vandpd	%ymm2, %ymm4, %ymm12
	vblendvpd	%ymm4, %ymm9, %ymm3, %ymm3
	vmulpd	%ymm0, %ymm3, %ymm9
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovapd	%ymm12, 128(%rsp)
	vandnpd	%ymm5, %ymm11, %ymm5
	vandpd	%ymm2, %ymm4, %ymm12
	vblendvpd	%ymm4, %ymm9, %ymm3, %ymm3
	vandnpd	%ymm10, %ymm11, %ymm4
	vcmppd	$13, %ymm0, %ymm4, %ymm9
	vmovapd	%ymm15, 160(%rsp)
	vandpd	%ymm2, %ymm8, %ymm15
	vandpd	%ymm2, %ymm9, %ymm10
	vmovapd	%ymm10, 64(%rsp)
	vmulpd	%ymm1, %ymm4, %ymm10
	vmulpd	%ymm1, %ymm5, %ymm7
	vmovapd	%ymm12, 96(%rsp)
	vmulpd	352(%rsp), %ymm3, %ymm3
	vblendvpd	%ymm9, %ymm10, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm4, %ymm10
	vcmppd	$2, %ymm1, %ymm4, %ymm9
	vandnpd	%ymm3, %ymm11, %ymm3
	vandpd	%ymm2, %ymm9, %ymm13
	vblendvpd	%ymm9, %ymm10, %ymm4, %ymm4
	vmulpd	%ymm1, %ymm6, %ymm9
	vmovapd	%ymm13, 32(%rsp)
	vmulpd	%ymm14, %ymm4, %ymm4
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm6
	vmulpd	%ymm0, %ymm6, %ymm9
	vcmppd	$2, %ymm1, %ymm6, %ymm8
	vandnpd	%ymm4, %ymm11, %ymm4
	vandpd	%ymm2, %ymm8, %ymm13
	vblendvpd	%ymm8, %ymm9, %ymm6, %ymm8
	vcmppd	$13, %ymm0, %ymm5, %ymm6
	vblendvpd	%ymm6, %ymm7, %ymm5, %ymm5
	vandpd	%ymm2, %ymm6, %ymm12
	vcmppd	$2, %ymm1, %ymm5, %ymm6
	vandpd	%ymm2, %ymm6, %ymm7
	vmovapd	%ymm7, (%rsp)
	vmulpd	%ymm0, %ymm5, %ymm7
	vblendvpd	%ymm6, %ymm7, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm3, %ymm7
	vcmppd	$13, %ymm0, %ymm3, %ymm6
	vmulpd	%ymm5, %ymm8, %ymm5
	vandpd	%ymm2, %ymm6, %ymm10
	vblendvpd	%ymm6, %ymm7, %ymm3, %ymm3
	vmulpd	%ymm0, %ymm3, %ymm7
	vcmppd	$2, %ymm1, %ymm3, %ymm6
	vandnpd	%ymm5, %ymm11, %ymm5
	vandpd	%ymm2, %ymm6, %ymm9
	vblendvpd	%ymm6, %ymm7, %ymm3, %ymm3
	vcmppd	$13, %ymm0, %ymm4, %ymm6
	vandpd	%ymm2, %ymm6, %ymm7
	vmovapd	%ymm7, 352(%rsp)
	vmulpd	%ymm1, %ymm4, %ymm7
	vblendvpd	%ymm6, %ymm7, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm4, %ymm14
	vcmppd	$2, %ymm1, %ymm4, %ymm6
	vandpd	%ymm2, %ymm6, %ymm7
	vblendvpd	%ymm6, %ymm14, %ymm4, %ymm4
	vmovapd	544(%rsp), %ymm6
	vaddpd	576(%rsp), %ymm6, %ymm6
	vsubpd	512(%rsp), %ymm6, %ymm6
	vaddpd	480(%rsp), %ymm6, %ymm6
	vsubpd	448(%rsp), %ymm6, %ymm6
	vaddpd	416(%rsp), %ymm6, %ymm6
	vsubpd	384(%rsp), %ymm6, %ymm6
	vaddpd	320(%rsp), %ymm6, %ymm6
	vsubpd	288(%rsp), %ymm6, %ymm6
	vaddpd	%ymm15, %ymm6, %ymm6
	vsubpd	%ymm13, %ymm6, %ymm6
	vaddpd	%ymm12, %ymm6, %ymm6
	vsubpd	(%rsp), %ymm6, %ymm6
	vaddpd	%ymm10, %ymm6, %ymm6
	vsubpd	%ymm9, %ymm6, %ymm6
	vaddpd	352(%rsp), %ymm6, %ymm6
	vsubpd	%ymm7, %ymm6, %ymm6
	vmovapd	256(%rsp), %ymm7
	vaddpd	608(%rsp), %ymm7, %ymm7
	vsubpd	224(%rsp), %ymm7, %ymm7
	vaddpd	192(%rsp), %ymm7, %ymm7
	vsubpd	160(%rsp), %ymm7, %ymm7
	vaddpd	128(%rsp), %ymm7, %ymm7
	vsubpd	96(%rsp), %ymm7, %ymm7
	vaddpd	64(%rsp), %ymm7, %ymm7
	vsubpd	32(%rsp), %ymm7, %ymm7
	vaddpd	%ymm7, %ymm6, %ymm6
	vcmppd	$13, %ymm0, %ymm5, %ymm7
	vcvtpd2dqy	%ymm6, %xmm6
	vphaddd	%xmm6, %xmm6, %xmm6
	vphaddd	%xmm6, %xmm6, %xmm6
	vmovd	%xmm6, %eax
	vcmppd	$2, %ymm1, %ymm5, %ymm6
	vmovmskpd	%ymm7, %r11d
	cltq
	vmovmskpd	%ymm6, %edx
	testl	%r11d, %r11d
	je	.L303
	vmulpd	%ymm1, %ymm5, %ymm8
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm7, %ymm8, %ymm5, %ymm5
.L303:
	testl	%edx, %edx
	je	.L304
	vmulpd	%ymm0, %ymm5, %ymm7
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm6, %ymm7, %ymm5, %ymm5
.L304:
	vmulpd	%ymm4, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm11, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm6
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovmskpd	%ymm6, %r11d
	vmovmskpd	%ymm4, %edx
	testl	%r11d, %r11d
	je	.L305
	vmulpd	%ymm1, %ymm3, %ymm7
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm6, %ymm7, %ymm3, %ymm3
.L305:
	testl	%edx, %edx
	je	.L306
	vmulpd	%ymm0, %ymm3, %ymm6
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm4, %ymm6, %ymm3, %ymm3
.L306:
	vmulpd	%ymm5, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm11, %ymm3
	vcmppd	$13, %ymm0, %ymm3, %ymm5
	vcmppd	$2, %ymm1, %ymm3, %ymm4
	vmovmskpd	%ymm5, %r11d
	vmovmskpd	%ymm4, %edx
	testl	%r11d, %r11d
	je	.L307
	vmulpd	%ymm1, %ymm3, %ymm6
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm5, %ymm6, %ymm3, %ymm3
.L307:
	testl	%edx, %edx
	je	.L308
	vmulpd	%ymm0, %ymm3, %ymm5
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm4, %ymm5, %ymm3, %ymm3
.L308:
	vinsertf128	$1, %xmm2, %ymm3, %ymm4
	vperm2f128	$33, %ymm2, %ymm3, %ymm3
	vmulpd	%ymm3, %ymm4, %ymm2
	vandnpd	%ymm2, %ymm11, %ymm2
	vcmppd	$13, %ymm0, %ymm2, %ymm4
	vcmppd	$2, %ymm1, %ymm2, %ymm3
	vmovmskpd	%ymm4, %r11d
	vmovmskpd	%ymm3, %edx
	testl	%r11d, %r11d
	je	.L309
	vmulpd	%ymm1, %ymm2, %ymm1
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm4, %ymm1, %ymm2, %ymm2
.L309:
	testl	%edx, %edx
	je	.L310
	vmulpd	%ymm0, %ymm2, %ymm0
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm3, %ymm0, %ymm2, %ymm2
.L310:
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm2
	vmovq	.LC12(%rip), %xmm3
	vmovsd	.LC13(%rip), %xmm1
	vmovsd	.LC14(%rip), %xmm4
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm1, %xmm2
	ja	.L360
	vcomisd	%xmm2, %xmm4
	jbe	.L313
	vmulsd	%xmm1, %xmm2, %xmm2
	decq	%rax
.L313:
	vmovsd	%xmm2, (%rcx)
	leaq	31(%r10), %rdx
	movq	%rax, (%r8)
	movslq	%r10d, %rax
	cmpq	%rax, %rdx
	jl	.L355
	leaq	32(%r10), %rdx
	jmp	.L322
	.p2align 4,,10
	.p2align 3
.L361:
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	incq	(%r8)
.L317:
	incq	%rax
	cmpq	%rdx, %rax
	je	.L355
.L322:
	cmpq	%rax, %rsi
	je	.L317
	vmovq	%rdi, %xmm7
	vsubsd	(%r9,%rax,8), %xmm7, %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vmulsd	(%rcx), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L361
	vcomisd	%xmm0, %xmm4
	ja	.L320
	incq	%rax
	vmovsd	%xmm0, (%rcx)
	cmpq	%rdx, %rax
	jne	.L322
.L355:
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L360:
	.cfi_restore_state
	vmulsd	%xmm4, %xmm2, %xmm2
	incq	%rax
	jmp	.L313
	.p2align 4,,10
	.p2align 3
.L320:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	decq	(%r8)
	jmp	.L317
.L323:
	vmovapd	.LC4(%rip), %ymm2
	vxorpd	%xmm7, %xmm7, %xmm7
	vmovapd	.LC9(%rip), %ymm11
	vmovapd	.LC10(%rip), %ymm0
	vmovapd	.LC11(%rip), %ymm1
	vmovapd	%ymm4, %ymm8
	vmovapd	%ymm7, 608(%rsp)
	vmovapd	%ymm2, %ymm15
	jmp	.L299
.L357:
	leaq	.LC5(%rip), %rcx
	movl	$111, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L358:
	leaq	.LC5(%rip), %rcx
	movl	$112, %edx
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE8828:
	.size	_Z13prod_realreallldPKdRdRl, .-_Z13prod_realreallldPKdRdRl
	.p2align 4
	.globl	_Z16prod_realcomplexldPKdS0_RdRl
	.type	_Z16prod_realcomplexldPKdS0_RdRl, @function
_Z16prod_realcomplexldPKdS0_RdRl:
.LFB8829:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rdx, %rdi
	testq	%rax, %rax
	jle	.L373
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	.LC14(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L374:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L366:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L373
.L368:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L374
	vcomisd	%xmm1, %xmm5
	ja	.L367
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L368
.L373:
	ret
	.p2align 4,,10
	.p2align 3
.L367:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L366
	.cfi_endproc
.LFE8829:
	.size	_Z16prod_realcomplexldPKdS0_RdRl, .-_Z16prod_realcomplexldPKdS0_RdRl
	.p2align 4
	.globl	_Z16prod_complexreallddPKdRdRl
	.type	_Z16prod_complexreallddPKdRdRl, @function
_Z16prod_complexreallddPKdRdRl:
.LFB8830:
	.cfi_startproc
	endbr64
	vmulsd	%xmm1, %xmm1, %xmm1
	testq	%rdi, %rdi
	jle	.L386
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	.LC14(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L381
	.p2align 4,,10
	.p2align 3
.L387:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L379:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L386
.L381:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L387
	vcomisd	%xmm2, %xmm5
	ja	.L380
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L381
.L386:
	ret
	.p2align 4,,10
	.p2align 3
.L380:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L379
	.cfi_endproc
.LFE8830:
	.size	_Z16prod_complexreallddPKdRdRl, .-_Z16prod_complexreallddPKdRdRl
	.p2align 4
	.globl	_Z19prod_complexcomplexllddPKdS0_RdRl
	.type	_Z19prod_complexcomplexllddPKdS0_RdRl, @function
_Z19prod_complexcomplexllddPKdS0_RdRl:
.LFB8831:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	movq	%rdx, %rsi
	testq	%rax, %rax
	jle	.L397
	vmovsd	(%r8), %xmm2
	vmovsd	.LC13(%rip), %xmm5
	vmovsd	.LC14(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L410:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L394:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L397
.L396:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L410
	vcomisd	%xmm2, %xmm6
	ja	.L395
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L396
.L397:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L411
	vmovsd	(%r8), %xmm2
	vmovsd	.LC13(%rip), %xmm5
	vmovsd	.LC14(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L402
	.p2align 4,,10
	.p2align 3
.L413:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L400:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L412
.L402:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L413
	vcomisd	%xmm2, %xmm6
	ja	.L401
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L402
.L412:
	ret
	.p2align 4,,10
	.p2align 3
.L395:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L394
	.p2align 4,,10
	.p2align 3
.L401:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L411:
	ret
	.cfi_endproc
.LFE8831:
	.size	_Z19prod_complexcomplexllddPKdS0_RdRl, .-_Z19prod_complexcomplexllddPKdS0_RdRl
	.section	.text._ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv:
.LFB9245:
	.cfi_startproc
	endbr64
	vmovdqa	.LC26(%rip), %ymm2
	vmovdqa	.LC27(%rip), %ymm3
	vmovdqa	.LC28(%rip), %ymm4
	vmovdqa	.LC29(%rip), %ymm5
	movq	%rdi, %rax
	leaq	1248(%rdi), %rcx
	movq	%rdi, %rdx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L415:
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
	jne	.L415
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L416:
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
	jne	.L416
	vmovdqa	.LC30(%rip), %xmm0
	vmovdqa	.LC31(%rip), %xmm1
	vpand	2464(%rax), %xmm0, %xmm0
	vpand	2472(%rax), %xmm1, %xmm1
	movq	2488(%rax), %rsi
	vpor	%xmm1, %xmm0, %xmm0
	movq	2480(%rax), %rdx
	vpsrlq	$1, %xmm0, %xmm1
	movq	%rsi, %rcx
	vpand	.LC32(%rip), %xmm0, %xmm0
	andl	$2147483647, %ecx
	vpxor	1216(%rax), %xmm1, %xmm1
	andq	$-2147483648, %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	orq	%rcx, %rdx
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	movq	%rdx, %rcx
	vpxor	.LC33(%rip), %xmm1, %xmm2
	shrq	%rcx
	vpblendvb	%xmm0, %xmm1, %xmm2, %xmm0
	xorq	1232(%rax), %rcx
	andl	$1, %edx
	vmovdqu	%xmm0, 2464(%rax)
	je	.L420
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L420:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L419
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L419:
	movq	%rcx, 2488(%rax)
	movq	$0, 2496(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE9245:
	.size	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, .-_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.text
	.p2align 4
	.globl	_Z21init_random_positionslddPd
	.type	_Z21init_random_positionslddPd, @function
_Z21init_random_positionslddPd:
.LFB8818:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	jle	.L437
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
	jmp	.L432
	.p2align 4,,10
	.p2align 3
.L439:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L426:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC35(%rip), %xmm0, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	jnb	.L427
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L433
.L428:
	movq	%rdx, %rax
.L432:
	cmpq	$311, %rax
	ja	.L438
.L431:
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
	jns	.L439
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L438:
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
	jmp	.L431
	.p2align 4,,10
	.p2align 3
.L427:
	vmovsd	.LC36(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L428
.L433:
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
.L437:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE8818:
	.size	_Z21init_random_positionslddPd, .-_Z21init_random_positionslddPd
	.p2align 4
	.globl	_Z13test_realrealv
	.type	_Z13test_realrealv, @function
_Z13test_realrealv:
.LFB8832:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$128000, %edx
	movl	$32, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$1, %ebx
	subq	$2568, %rsp
	.cfi_def_cfa_offset 2624
	movq	%fs:40, %rax
	movq	%rax, 2552(%rsp)
	xorl	%eax, %eax
	leaq	40(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)
	call	posix_memalign@PLT
	testl	%eax, %eax
	movq	$42, 48(%rsp)
	cmove	40(%rsp), %rbp
	movl	$42, %edx
	leaq	48(%rsp), %rsi
	movabsq	$6364136223846793005, %rcx
	.p2align 4,,10
	.p2align 3
.L442:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	leaq	(%rax,%rbx), %rdx
	movq	%rdx, (%rsi,%rbx,8)
	incq	%rbx
	cmpq	$312, %rbx
	jne	.L442
	leaq	_ZL3gen(%rip), %r14
	movl	$2504, %edx
	movq	%r14, %rdi
	movq	$312, 2544(%rsp)
	call	memcpy@PLT
	vmovsd	_ZL5distu(%rip), %xmm2
	vmovsd	8+_ZL5distu(%rip), %xmm1
	movq	%rbp, %r13
	vsubsd	%xmm2, %xmm1, %xmm1
	leaq	128000(%rbp), %rsi
	movabsq	$6148914691236517205, %rcx
	movabsq	$8202884508482404352, %r12
	movabsq	$-2270628950310912, %r15
	vxorps	%xmm3, %xmm3, %xmm3
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L470:
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L445:
	vxorpd	%xmm4, %xmm4, %xmm4
	vaddsd	%xmm4, %xmm0, %xmm0
	vmulsd	.LC35(%rip), %xmm0, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	jnb	.L446
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	.LC38(%rip), %xmm5
	addq	$8, %r13
	vfmadd132sd	.LC37(%rip), %xmm5, %xmm0
	vmovsd	%xmm0, -8(%r13)
	cmpq	%r13, %rsi
	je	.L447
.L450:
	movq	%rdi, %rbx
.L443:
	cmpq	$311, %rbx
	ja	.L469
.L449:
	movq	(%r14,%rbx,8), %rax
	leaq	1(%rbx), %rdi
	movq	%rax, %r8
	shrq	$29, %r8
	andq	%rcx, %r8
	xorq	%r8, %rax
	movq	%rax, %r8
	salq	$17, %r8
	andq	%r12, %r8
	xorq	%r8, %rax
	movq	%rax, %r8
	salq	$37, %r8
	andq	%r15, %r8
	xorq	%r8, %rax
	movq	%rax, %r8
	shrq	$43, %r8
	movq	%rdi, 2496+_ZL3gen(%rip)
	xorq	%r8, %rax
	jns	.L470
	movq	%rax, %r8
	shrq	%r8
	andl	$1, %eax
	orq	%rax, %r8
	vcvtsi2sdq	%r8, %xmm3, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L469:
	movq	%r14, %rdi
	movq	%rsi, (%rsp)
	vmovsd	%xmm1, 16(%rsp)
	vmovsd	%xmm2, 8(%rsp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rbx
	vmovsd	16(%rsp), %xmm1
	vmovsd	8(%rsp), %xmm2
	movq	(%rsp), %rsi
	vxorps	%xmm3, %xmm3, %xmm3
	movabsq	$6148914691236517205, %rcx
	jmp	.L449
.L446:
	vmovsd	.LC36(%rip), %xmm0
	vmovsd	.LC38(%rip), %xmm6
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	addq	$8, %r13
	vfmadd132sd	.LC37(%rip), %xmm6, %xmm0
	vmovsd	%xmm0, -8(%r13)
	cmpq	%r13, %rsi
	jne	.L450
.L447:
	movq	.LC39(%rip), %rax
	vmovsd	.LC40(%rip), %xmm0
	movq	24(%rsp), %rcx
	leaq	32(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movl	$61, %edi
	movq	%rax, 32(%rsp)
	movq	$42, 40(%rsp)
	call	_Z13prod_realreallldPKdRdRl.constprop.0
	vmovsd	32(%rsp), %xmm1
	vmovsd	.LC41(%rip), %xmm3
	vmovq	.LC12(%rip), %xmm2
	vdivsd	%xmm1, %xmm3, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC16(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC17(%rip), %xmm0
	ja	.L471
.L451:
	movq	40(%rsp), %rsi
	cmpq	$-3, %rsi
	je	.L453
	movq	$-3, %rdi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L453:
	vmovsd	.LC42(%rip), %xmm0
	movq	24(%rsp), %rcx
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movl	$256, %edi
	call	_Z13prod_realreallldPKdRdRl.constprop.0
	vmovsd	32(%rsp), %xmm1
	vmovsd	.LC43(%rip), %xmm3
	vmovq	.LC12(%rip), %xmm2
	vdivsd	%xmm1, %xmm3, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC16(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC17(%rip), %xmm0
	ja	.L472
.L454:
	movq	40(%rsp), %rsi
	cmpq	$101, %rsi
	jne	.L473
	movq	2552(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L468
	addq	$2568, %rsp
	.cfi_remember_state
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
.L473:
	.cfi_restore_state
	movq	2552(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L468
	addq	$2568, %rsp
	.cfi_remember_state
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
	movl	$101, %edi
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z9assert_eqIlEvT_S0_.part.0
.L472:
	.cfi_restore_state
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
	jmp	.L454
.L471:
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
	jmp	.L451
.L468:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE8832:
	.size	_Z13test_realrealv, .-_Z13test_realrealv
	.p2align 4
	.globl	_Z8test_allv
	.type	_Z8test_allv, @function
_Z8test_allv:
.LFB8833:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	leaq	-64(%rbp), %rdi
	pushq	%r12
	pushq	%rbx
	subq	$152, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	vmovapd	.LC18(%rip), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	$0, -64(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	.LC19(%rip), %xmm0
	vmovq	.LC12(%rip), %xmm2
	vdivsd	%xmm1, %xmm0, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vsubsd	.LC16(%rip), %xmm3, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vcomisd	.LC17(%rip), %xmm3
	ja	.L623
.L475:
	movq	-64(%rbp), %rsi
	cmpq	$1, %rsi
	je	.L477
	movl	$1, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovq	.LC12(%rip), %xmm2
.L477:
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm9
	vxorpd	%xmm0, %xmm0, %xmm0
	vmulpd	%ymm9, %ymm9, %ymm9
	vmovapd	.LC20(%rip), %ymm7
	vcvtpd2dqy	%ymm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %r12d
	vmulpd	%ymm7, %ymm9, %ymm0
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC11(%rip), %ymm5
	movslq	%r12d, %r12
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm6
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	movq	%r12, %r13
	vmovmskpd	%ymm6, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L478
	vmulpd	%ymm5, %ymm0, %ymm8
	popcntl	%edx, %edx
	leaq	(%rdx,%r12), %r13
	vblendvpd	%ymm6, %ymm8, %ymm0, %ymm0
.L478:
	testl	%eax, %eax
	je	.L479
	vmulpd	%ymm4, %ymm0, %ymm6
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm1, %ymm6, %ymm0, %ymm0
.L479:
	vmulpd	%ymm9, %ymm9, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm8
	vcmppd	$2, %ymm5, %ymm1, %ymm6
	vmovmskpd	%ymm8, %edx
	vmovmskpd	%ymm6, %eax
	testl	%edx, %edx
	je	.L480
	vmulpd	%ymm5, %ymm1, %ymm10
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm8, %ymm10, %ymm1, %ymm1
.L480:
	testl	%eax, %eax
	je	.L481
	vmulpd	%ymm4, %ymm1, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm6, %ymm8, %ymm1, %ymm1
.L481:
	vmulpd	%ymm0, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm6
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vmovmskpd	%ymm6, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L482
	vmulpd	%ymm5, %ymm1, %ymm8
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm6, %ymm8, %ymm1, %ymm1
.L482:
	testl	%eax, %eax
	je	.L483
	vmulpd	%ymm4, %ymm1, %ymm6
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm0, %ymm6, %ymm1, %ymm1
.L483:
	vmovapd	.LC4(%rip), %ymm6
	vinsertf128	$1, %xmm6, %ymm1, %ymm0
	vperm2f128	$33, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm8
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm8, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L484
	vmulpd	%ymm5, %ymm0, %ymm10
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm8, %ymm10, %ymm0, %ymm0
.L484:
	testl	%eax, %eax
	je	.L485
	vmulpd	%ymm4, %ymm0, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm1, %ymm8, %ymm0, %ymm0
.L485:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	movq	.LC14(%rip), %rbx
	vmovq	%rbx, %xmm1
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC13(%rip), %xmm0
	jbe	.L618
	vmulsd	%xmm1, %xmm0, %xmm0
	incq	%r13
.L488:
	vucomisd	.LC3(%rip), %xmm0
	jp	.L529
	jne	.L529
.L490:
	testq	%r13, %r13
	je	.L492
	movq	%r13, %rsi
	xorl	%edi, %edi
	vmovapd	%ymm9, -112(%rbp)
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovq	.LC12(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC20(%rip), %ymm7
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm6
	vmovapd	-112(%rbp), %ymm9
.L492:
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm0
	vmulpd	.LC21(%rip), %ymm9, %ymm8
	vmulpd	%ymm7, %ymm0, %ymm7
	vmulpd	%ymm0, %ymm9, %ymm9
	vmulpd	%ymm8, %ymm7, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm10
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L493
	vmulpd	%ymm5, %ymm1, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm1, %ymm1
.L493:
	testl	%eax, %eax
	je	.L494
	vmulpd	%ymm4, %ymm1, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm10, %ymm1, %ymm1
.L494:
	vmulpd	%ymm9, %ymm9, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm11
	vcmppd	$2, %ymm5, %ymm0, %ymm10
	vmovmskpd	%ymm11, %edx
	vmovmskpd	%ymm10, %eax
	testl	%edx, %edx
	je	.L495
	vmulpd	%ymm5, %ymm0, %ymm12
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm11, %ymm12, %ymm0, %ymm0
.L495:
	testl	%eax, %eax
	je	.L496
	vmulpd	%ymm4, %ymm0, %ymm11
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L496:
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm10
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L497
	vmulpd	%ymm5, %ymm0, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L497:
	testl	%eax, %eax
	je	.L498
	vmulpd	%ymm4, %ymm0, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm10, %ymm0, %ymm0
.L498:
	vinsertf128	$1, %xmm6, %ymm0, %ymm1
	vperm2f128	$33, %ymm6, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm10
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L499
	vmulpd	%ymm5, %ymm1, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm1, %ymm1
.L499:
	testl	%eax, %eax
	je	.L500
	vmulpd	%ymm4, %ymm1, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm10, %ymm1, %ymm1
.L500:
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovq	%rbx, %xmm0
	vandpd	%xmm2, %xmm1, %xmm1
	vcomisd	.LC13(%rip), %xmm1
	jbe	.L619
	vmulsd	%xmm0, %xmm1, %xmm1
	incq	%r12
.L503:
	vmovsd	.LC22(%rip), %xmm10
	vdivsd	%xmm1, %xmm10, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC16(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC17(%rip), %xmm0
	ja	.L624
.L505:
	cmpq	$1, %r12
	je	.L507
	movq	%r12, %rsi
	movl	$1, %edi
	vmovapd	%ymm9, -176(%rbp)
	vmovapd	%ymm8, -144(%rbp)
	vmovapd	%ymm7, -112(%rbp)
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovq	.LC12(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm6
	vmovapd	-176(%rbp), %ymm9
	vmovapd	-144(%rbp), %ymm8
	vmovapd	-112(%rbp), %ymm7
.L507:
	vmulpd	.LC23(%rip), %ymm7, %ymm7
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm0
	vmulpd	%ymm0, %ymm8, %ymm8
	vmulpd	%ymm0, %ymm9, %ymm0
	vandnpd	%ymm7, %ymm3, %ymm7
	vmulpd	%ymm5, %ymm7, %ymm11
	vcmppd	$13, %ymm4, %ymm7, %ymm10
	vandnpd	%ymm8, %ymm3, %ymm8
	vandnpd	%ymm0, %ymm3, %ymm0
	vandpd	%ymm6, %ymm10, %ymm1
	vblendvpd	%ymm10, %ymm11, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm7, %ymm11
	vcmppd	$2, %ymm5, %ymm7, %ymm10
	vcmppd	$13, %ymm4, %ymm0, %ymm9
	vandpd	%ymm6, %ymm10, %ymm13
	vblendvpd	%ymm10, %ymm11, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm8, %ymm11
	vcmppd	$13, %ymm4, %ymm8, %ymm10
	vandpd	%ymm6, %ymm10, %ymm12
	vblendvpd	%ymm10, %ymm11, %ymm8, %ymm8
	vmulpd	%ymm4, %ymm8, %ymm14
	vcmppd	$2, %ymm5, %ymm8, %ymm10
	vandpd	%ymm6, %ymm10, %ymm11
	vblendvpd	%ymm10, %ymm14, %ymm8, %ymm8
	vmulpd	%ymm5, %ymm0, %ymm14
	vandpd	%ymm6, %ymm9, %ymm10
	vmulpd	%ymm8, %ymm7, %ymm7
	vblendvpd	%ymm9, %ymm14, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm15
	vcmppd	$2, %ymm5, %ymm0, %ymm14
	vandnpd	%ymm7, %ymm3, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm8
	vandpd	%ymm6, %ymm14, %ymm9
	vblendvpd	%ymm14, %ymm15, %ymm0, %ymm0
	vxorpd	%xmm14, %xmm14, %xmm14
	vaddpd	%ymm14, %ymm1, %ymm1
	vmovmskpd	%ymm8, %edx
	vsubpd	%ymm13, %ymm1, %ymm1
	vaddpd	%ymm12, %ymm1, %ymm1
	vsubpd	%ymm11, %ymm1, %ymm1
	vaddpd	%ymm10, %ymm1, %ymm1
	vsubpd	%ymm9, %ymm1, %ymm1
	vaddpd	%ymm10, %ymm1, %ymm1
	vsubpd	%ymm9, %ymm1, %ymm1
	vcvtpd2dqy	%ymm1, %xmm1
	vphaddd	%xmm1, %xmm1, %xmm1
	vphaddd	%xmm1, %xmm1, %xmm1
	vmovd	%xmm1, %r12d
	vcmppd	$2, %ymm5, %ymm7, %ymm1
	movslq	%r12d, %r12
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L508
	vmulpd	%ymm5, %ymm7, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm8, %ymm9, %ymm7, %ymm7
.L508:
	testl	%eax, %eax
	je	.L509
	vmulpd	%ymm4, %ymm7, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm8, %ymm7, %ymm7
.L509:
	vmulpd	%ymm0, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm8
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm8, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L510
	vmulpd	%ymm5, %ymm0, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm8, %ymm9, %ymm0, %ymm0
.L510:
	testl	%eax, %eax
	je	.L511
	vmulpd	%ymm4, %ymm0, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm8, %ymm0, %ymm0
.L511:
	vmulpd	%ymm7, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm7
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm7, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L512
	vmulpd	%ymm5, %ymm0, %ymm8
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm7, %ymm8, %ymm0, %ymm0
.L512:
	testl	%eax, %eax
	je	.L513
	vmulpd	%ymm4, %ymm0, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm7, %ymm0, %ymm0
.L513:
	vinsertf128	$1, %xmm6, %ymm0, %ymm1
	vperm2f128	$33, %ymm6, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm3
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm3, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L514
	vmulpd	%ymm5, %ymm0, %ymm5
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm3, %ymm5, %ymm0, %ymm0
.L514:
	testl	%eax, %eax
	je	.L515
	vmulpd	%ymm4, %ymm0, %ymm4
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm4, %ymm0, %ymm0
.L515:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	%rbx, %xmm6
	vandpd	%xmm2, %xmm0, %xmm1
	vcomisd	.LC13(%rip), %xmm1
	jbe	.L620
	vmulsd	%xmm6, %xmm1, %xmm1
	incq	%r12
.L518:
	vmovsd	.LC24(%rip), %xmm3
	vdivsd	%xmm1, %xmm3, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC16(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC17(%rip), %xmm0
	ja	.L625
	vzeroupper
.L520:
	cmpq	$2, %r12
	je	.L522
	movq	%r12, %rsi
	movl	$2, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L522:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L626
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_Z13test_realrealv
	.p2align 4,,10
	.p2align 3
.L619:
	.cfi_restore_state
	vcomisd	%xmm1, %xmm0
	jbe	.L503
	vmulsd	.LC13(%rip), %xmm1, %xmm1
	decq	%r12
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L618:
	vcomisd	%xmm0, %xmm1
	jbe	.L488
	vmulsd	.LC13(%rip), %xmm0, %xmm0
	decq	%r13
	jmp	.L488
	.p2align 4,,10
	.p2align 3
.L620:
	vcomisd	%xmm1, %xmm6
	jbe	.L518
	vmulsd	.LC13(%rip), %xmm1, %xmm1
	decq	%r12
	jmp	.L518
	.p2align 4,,10
	.p2align 3
.L625:
	vmovsd	%xmm3, %xmm3, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
	jmp	.L520
	.p2align 4,,10
	.p2align 3
.L624:
	vmovsd	%xmm10, %xmm10, %xmm0
	vmovapd	%ymm9, -176(%rbp)
	vmovapd	%ymm8, -144(%rbp)
	vmovapd	%ymm7, -112(%rbp)
	vzeroupper
	call	_Z13assert_approxdd.part.0
	vmovq	.LC12(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm6
	vmovapd	-176(%rbp), %ymm9
	vmovapd	-144(%rbp), %ymm8
	vmovapd	-112(%rbp), %ymm7
	jmp	.L505
	.p2align 4,,10
	.p2align 3
.L529:
	vmovapd	%ymm9, -112(%rbp)
	vzeroupper
	call	_Z9assert_eqIdEvT_S0_.part.0.constprop.0
	vmovq	.LC12(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	.LC20(%rip), %ymm7
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC4(%rip), %ymm6
	vmovapd	-112(%rbp), %ymm9
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L623:
	call	_Z13assert_approxdd.part.0
	vmovq	.LC12(%rip), %xmm2
	jmp	.L475
.L626:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE8833:
	.size	_Z8test_allv, .-_Z8test_allv
	.section	.rodata.str1.1
.LC44:
	.string	"M N\n"
	.section	.rodata.str1.8
	.align 8
.LC45:
	.string	"M number of runs, N number of particles\n"
	.section	.rodata.str1.1
.LC46:
	.string	"example: "
.LC47:
	.string	" 10 10000\n"
.LC48:
	.string	" product: "
.LC50:
	.string	" exponent: "
.LC52:
	.string	"prod_realreal: prod="
.LC53:
	.string	" exponent="
.LC54:
	.string	" timing="
.LC55:
	.string	" seconds\n"
.LC56:
	.string	"prod_complexcomplex: prod="
.LC57:
	.string	"prod_realcomplex: prod="
.LC58:
	.string	"prod_complexreal: prod="
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8834:
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
	call	_Z10test_vprodv
	call	_Z13test_realrealv
	movq	$5489, -2560(%rbp)
	movl	$5489, %eax
	movl	$1, %ecx
	leaq	-2560(%rbp), %rsi
	movabsq	$6364136223846793005, %rdi
	movq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L628:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	leaq	(%rax,%rcx), %rdx
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
	cmpq	$312, %rcx
	jne	.L628
	leaq	_ZL3gen(%rip), %r12
	movl	$2504, %edx
	movq	%r12, %rdi
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	cmpl	$3, %r13d
	je	.L629
	leaq	_ZSt4cout(%rip), %r12
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC44(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r12, %rdi
	leaq	.LC45(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$9, %edx
	movq	%r12, %rdi
	leaq	.LC46(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC47(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %r12d
.L627:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L733
	addq	$2720, %rsp
	popq	%rbx
	popq	%r10
	movl	%r12d, %eax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L629:
	.cfi_restore_state
	movl	$10, %edx
	leaq	.LC48(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	$0, -2632(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	.LC49(%rip), %ymm0
	leaq	-2632(%rbp), %rdi
	call	_Z18horizontal_productDv4_dRl
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$11, %edx
	leaq	.LC50(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2632(%rbp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol@PLT
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	cltq
	movl	$10, %edx
	movq	%rax, -2736(%rbp)
	call	strtol@PLT
	cltq
	leaq	0(,%rax,8), %rbx
	movq	%rax, -2688(%rbp)
	leaq	-2608(%rbp), %rax
	movq	%rbx, %rdx
	movl	$32, %esi
	movq	%rax, %rdi
	movq	%rax, -2760(%rbp)
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L699
	movq	-2608(%rbp), %r15
.L631:
	movq	-2760(%rbp), %rdi
	movq	%rbx, %rdx
	movl	$32, %esi
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L700
	movq	-2608(%rbp), %r13
.L632:
	movq	.LC16(%rip), %rax
	movq	-2688(%rbp), %r14
	vmovq	%rax, %xmm1
	movq	.LC38(%rip), %rax
	movq	%r15, %rsi
	vmovq	%rax, %xmm0
	movq	%r14, %rdi
	call	_Z21init_random_positionslddPd
	movq	.LC16(%rip), %rax
	movq	%r13, %rsi
	vmovq	%rax, %xmm1
	movq	.LC38(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC16(%rip), %rax
	movq	$0, -2616(%rbp)
	movq	%rax, -2624(%rbp)
	call	clock@PLT
	movq	%rax, -2608(%rbp)
	movq	.LC51(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -2592(%rbp)
	movq	%rax, -2568(%rbp)
	movb	$1, -2576(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	cmpq	$0, -2736(%rbp)
	vmovsd	%xmm0, -2600(%rbp)
	jle	.L633
	testq	%r14, %r14
	jle	.L633
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	-2616(%rbp), %rax
	movq	%rax, -2704(%rbp)
	vmovsd	%xmm4, -2648(%rbp)
	leaq	-2624(%rbp), %rax
	vmovsd	.LC35(%rip), %xmm4
	movq	%rax, -2696(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	%xmm4, -2656(%rbp)
	movq	$0, -2712(%rbp)
	vmovsd	.LC37(%rip), %xmm4
	movq	%rax, -2744(%rbp)
	movq	%r13, -2720(%rbp)
	movq	%rbx, -2728(%rbp)
	movq	-2688(%rbp), %rbx
	vmovsd	%xmm4, -2664(%rbp)
	.p2align 4,,10
	.p2align 3
.L634:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -2672(%rbp)
	vmovsd	%xmm7, -2680(%rbp)
	jmp	.L642
	.p2align 4,,10
	.p2align 3
.L735:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L636:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	jnb	.L637
	vmovsd	-2672(%rbp), %xmm6
	vmovsd	.LC38(%rip), %xmm7
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm7, %xmm0
.L731:
	movq	-2704(%rbp), %r8
	movq	-2696(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L638
	movq	%r14, %rax
.L642:
	cmpq	$311, %rax
	ja	.L734
.L640:
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
	jns	.L735
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L636
	.p2align 4,,10
	.p2align 3
.L734:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L640
	.p2align 4,,10
	.p2align 3
.L638:
	incq	-2712(%rbp)
	movq	-2712(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L634
	movq	-2720(%rbp), %r13
	movq	-2728(%rbp), %rbx
.L633:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC52(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC53(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC54(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L736
.L643:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC55(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC16(%rip), %rax
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
	jle	.L644
	cmpq	$0, -2688(%rbp)
	jle	.L644
	leaq	-2616(%rbp), %rax
	movq	%rax, -2704(%rbp)
	leaq	-2624(%rbp), %rax
	movq	%rax, -2696(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC35(%rip), %xmm4
	vmovsd	.LC37(%rip), %xmm6
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
.L645:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -2672(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -2680(%rbp)
	jmp	.L658
	.p2align 4,,10
	.p2align 3
.L740:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L647:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmovsd	.LC16(%rip), %xmm7
	vmovsd	.LC36(%rip), %xmm6
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-2672(%rbp), %xmm6
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vmovsd	.LC38(%rip), %xmm6
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L737
.L652:
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
	js	.L653
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L654:
	vaddsd	-2648(%rbp), %xmm1, %xmm1
	vmulsd	-2656(%rbp), %xmm1, %xmm1
	vcomisd	.LC16(%rip), %xmm1
	jnb	.L655
	vmovsd	-2672(%rbp), %xmm4
	movq	-2704(%rbp), %r9
	vfmadd132sd	-2680(%rbp), %xmm4, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L732:
	vmovsd	.LC38(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L738
.L658:
	cmpq	$311, %r11
	ja	.L739
.L651:
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
	jns	.L740
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L647
	.p2align 4,,10
	.p2align 3
.L653:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L654
	.p2align 4,,10
	.p2align 3
.L737:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2712(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-2712(%rbp), %xmm0
	jmp	.L652
	.p2align 4,,10
	.p2align 3
.L739:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L651
	.p2align 4,,10
	.p2align 3
.L738:
	incq	-2720(%rbp)
	movq	-2720(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L645
	movq	-2728(%rbp), %rbx
.L644:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC56(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC53(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC54(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L741
.L659:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC55(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC16(%rip), %rax
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
	jle	.L660
	cmpq	$0, -2688(%rbp)
	jle	.L660
	movq	.LC16(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC35(%rip), %xmm6
	vmovsd	.LC37(%rip), %xmm7
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
.L661:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm6
	vmovsd	(%rax), %xmm7
	xorl	%r11d, %r11d
	vsubsd	%xmm7, %xmm6, %xmm6
	movq	2496+_ZL3gen(%rip), %rdi
	movq	%r14, %r10
	movq	%rbx, %r14
	movq	%r11, %rbx
	.p2align 4,,10
	.p2align 3
.L674:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L742
.L667:
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
	js	.L662
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L663:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC16(%rip), %xmm2
	vmovsd	.LC36(%rip), %xmm1
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	movq	%r10, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC38(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	jmp	.L672
	.p2align 4,,10
	.p2align 3
.L744:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L670:
	addq	$8, %rax
	cmpq	%rax, %r14
	je	.L743
.L672:
	vmovsd	0(%r13,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L744
	vcomisd	%xmm0, %xmm4
	jbe	.L670
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r14
	jne	.L672
.L743:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L673
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r10
.L673:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L674
	incq	-2728(%rbp)
	movq	%r14, %rbx
	movq	%r10, %r14
	movq	-2728(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L661
.L660:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC57(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC53(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC54(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L745
.L675:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC55(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC16(%rip), %rax
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
	jle	.L676
	cmpq	$0, -2688(%rbp)
	jle	.L676
	movq	.LC16(%rip), %rax
	vmovsd	.LC37(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC35(%rip), %xmm7
	movq	$0, -2752(%rbp)
	movq	%rax, -2744(%rbp)
	movq	%r15, -2672(%rbp)
	xorl	%edi, %edi
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
	movq	%rdi, %r13
	.p2align 4,,10
	.p2align 3
.L677:
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
.L695:
	cmpq	$311, %rdi
	ja	.L746
.L683:
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
	js	.L678
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L679:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC16(%rip), %xmm2
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC36(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC38(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L747
.L684:
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
	js	.L685
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L686:
	vaddsd	-2648(%rbp), %xmm2, %xmm2
	vmovsd	.LC16(%rip), %xmm1
	vmovsd	.LC38(%rip), %xmm9
	vmulsd	-2656(%rbp), %xmm2, %xmm2
	movq	-2672(%rbp), %rax
	movq	%r15, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC36(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	-2664(%rbp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L693
	.p2align 4,,10
	.p2align 3
.L749:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L691:
	addq	$8, %rax
	cmpq	%rax, %r13
	je	.L748
.L693:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L749
	vcomisd	%xmm0, %xmm4
	jbe	.L691
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r13
	jne	.L693
.L748:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L694
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r15
.L694:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L695
	incq	-2752(%rbp)
	movq	%r13, %rbx
	movq	%r15, %r13
	movq	-2752(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L677
	movq	-2768(%rbp), %r13
	movq	-2672(%rbp), %r15
.L676:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC58(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC53(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC54(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L750
.L696:
	movq	%r12, %rdi
	vmovsd	%xmm1, %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC55(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	testq	%r15, %r15
	je	.L697
	movq	%r15, %rdi
	call	_ZdaPv@PLT
.L697:
	xorl	%r12d, %r12d
	testq	%r13, %r13
	je	.L627
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	jmp	.L627
	.p2align 4,,10
	.p2align 3
.L685:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L686
	.p2align 4,,10
	.p2align 3
.L678:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L679
	.p2align 4,,10
	.p2align 3
.L662:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L663
	.p2align 4,,10
	.p2align 3
.L742:
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
	jmp	.L667
	.p2align 4,,10
	.p2align 3
.L747:
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
	jmp	.L684
	.p2align 4,,10
	.p2align 3
.L746:
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
	jmp	.L683
	.p2align 4,,10
	.p2align 3
.L655:
	vmovsd	-2680(%rbp), %xmm1
	vmovsd	-2672(%rbp), %xmm7
	movq	-2704(%rbp), %r9
	vfmadd132sd	.LC36(%rip), %xmm7, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L732
	.p2align 4,,10
	.p2align 3
.L637:
	vmovsd	.LC36(%rip), %xmm0
	vmovsd	-2672(%rbp), %xmm3
	vmovsd	.LC38(%rip), %xmm4
	vfmadd132sd	-2680(%rbp), %xmm3, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm4, %xmm0
	jmp	.L731
.L699:
	xorl	%r15d, %r15d
	jmp	.L631
.L750:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L696
.L745:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L675
.L741:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L659
.L736:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L643
.L700:
	xorl	%r13d, %r13d
	jmp	.L632
.L733:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE8834:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I__Z5printDv4_d, @function
_GLOBAL__sub_I__Z5printDv4_d:
.LFB9251:
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
	vmovapd	.LC4(%rip), %ymm0
	movq	$5489, _ZL3gen(%rip)
	vmovapd	%ymm0, _ZL10_MM256_ONE(%rip)
	movl	$5489, %ecx
	movl	$1, %edx
	leaq	_ZL3gen(%rip), %rdi
	movabsq	$6364136223846793005, %rsi
	.p2align 4,,10
	.p2align 3
.L752:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L752
	vmovapd	.LC59(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	vzeroupper
	addq	$8, %rsp
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9251:
	.size	_GLOBAL__sub_I__Z5printDv4_d, .-_GLOBAL__sub_I__Z5printDv4_d
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z5printDv4_d
	.local	_ZL5distu
	.comm	_ZL5distu,16,16
	.local	_ZL3gen
	.comm	_ZL3gen,2504,32
	.local	_ZL10_MM256_ONE
	.comm	_ZL10_MM256_ONE,32,32
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1082310656
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
	.set	.LC16,.LC4
	.section	.rodata.cst8
	.align 8
.LC17:
	.long	-1998362383
	.long	1055193269
	.section	.rodata.cst32
	.align 32
.LC18:
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
.LC19:
	.long	478481221
	.long	1491110742
	.section	.rodata.cst32
	.align 32
.LC20:
	.long	0
	.long	1077149696
	.long	0
	.long	1075052544
	.long	0
	.long	1074266112
	.long	0
	.long	1073741824
	.align 32
.LC21:
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
.LC22:
	.long	1350305698
	.long	1243119313
	.section	.rodata.cst32
	.align 32
.LC23:
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
.LC24:
	.long	-519963160
	.long	1316942624
	.section	.rodata.cst32
	.align 32
.LC26:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC27:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC28:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC29:
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.set	.LC30,.LC26
	.set	.LC31,.LC27
	.set	.LC32,.LC28
	.set	.LC33,.LC29
	.section	.rodata.cst8
	.align 8
.LC35:
	.long	0
	.long	1005584384
	.align 8
.LC36:
	.long	-1
	.long	1072693247
	.set	.LC37,.LC20+24
	.align 8
.LC38:
	.long	0
	.long	-1074790400
	.align 8
.LC39:
	.long	1717986918
	.long	1075603046
	.align 8
.LC40:
	.long	-398572965
	.long	1068149977
	.align 8
.LC41:
	.long	-789117515
	.long	731179629
	.align 8
.LC42:
	.long	-1889785610
	.long	-1071352382
	.align 8
.LC43:
	.long	-1935337750
	.long	1246898371
	.section	.rodata.cst32
	.align 32
.LC49:
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
.LC51:
	.long	-1598689907
	.long	1051772663
	.set	.LC59,.LC8
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
