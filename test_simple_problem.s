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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"void prod_realreal(long int, long int, double, const double*, double&, long int&)"
	.section	.rodata.str1.1
.LC5:
	.string	"test_simple_problem.cpp"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"reinterpret_cast<uintptr_t>(x) % 32 == 0"
	.text
	.p2align 4
	.type	_Z13prod_realreallldPKdRdRl.constprop.0, @function
_Z13prod_realreallldPKdRdRl.constprop.0:
.LFB9262:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$64, %rsp
	testb	$31, %sil
	jne	.L124
	vxorps	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	(%rcx), %xmm7, %xmm7
	vmovapd	.LC7(%rip), %ymm6
	vmovq	%xmm0, %r8
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm3
	vmovlpd	(%rdx), %xmm6, %xmm0
	vmovq	%r8, %xmm5
	vmovapd	.LC3(%rip), %ymm13
	vinsertf128	$0x0, %xmm0, %ymm6, %ymm6
	vmovq	%xmm7, %xmm7
	vbroadcastsd	%xmm5, %ymm0
	movq	%rdi, %r10
	vxorpd	%xmm5, %xmm5, %xmm5
	movq	%rdx, %r9
	vmovapd	%ymm5, 32(%rsp)
	vmovapd	.LC8(%rip), %ymm2
	vmovapd	.LC9(%rip), %ymm4
	vmovapd	.LC10(%rip), %ymm5
	movq	%rsi, %rax
	andq	$-32, %r10
	vmovapd	%ymm3, %ymm9
	vmovapd	%ymm3, %ymm10
	vmovapd	%ymm3, %ymm11
	vmovapd	%ymm3, %ymm1
	vmovapd	%ymm3, %ymm8
	vmovapd	%ymm13, %ymm12
	xorl	%edx, %edx
	vmovapd	%ymm7, (%rsp)
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L29:
	addq	$32, %rdx
	addq	$256, %rax
	cmpq	$16000, %rdx
	je	.L125
.L46:
	cmpq	%r10, %rdx
	je	.L28
	vsubpd	(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm6, %ymm6
	vsubpd	32(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm3, %ymm3
	vsubpd	64(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm8, %ymm8
	vsubpd	96(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm1, %ymm1
	vsubpd	128(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm12, %ymm12
	vsubpd	160(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm11, %ymm11
	vsubpd	192(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm10, %ymm10
	vsubpd	224(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm9, %ymm9
.L28:
	testb	$-32, %dl
	jne	.L29
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L126
.L30:
	vcmppd	$2, %ymm5, %ymm6, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L127
.L31:
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L128
.L32:
	vcmppd	$2, %ymm5, %ymm3, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L129
.L33:
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L130
.L34:
	vcmppd	$2, %ymm5, %ymm8, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L131
.L35:
	vandnpd	%ymm1, %ymm2, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L132
.L36:
	vcmppd	$2, %ymm5, %ymm1, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L133
.L37:
	vandnpd	%ymm12, %ymm2, %ymm12
	vcmppd	$13, %ymm4, %ymm12, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L134
.L38:
	vcmppd	$2, %ymm5, %ymm12, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L135
.L39:
	vandnpd	%ymm11, %ymm2, %ymm11
	vcmppd	$13, %ymm4, %ymm11, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L136
.L40:
	vcmppd	$2, %ymm5, %ymm11, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L137
.L41:
	vandnpd	%ymm10, %ymm2, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L138
.L42:
	vcmppd	$2, %ymm5, %ymm10, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L139
.L43:
	vandnpd	%ymm9, %ymm2, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L140
.L44:
	vcmppd	$2, %ymm5, %ymm9, %ymm14
	vtestpd	%ymm14, %ymm14
	je	.L29
	vmovapd	32(%rsp), %ymm7
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm9, %ymm15
	vmovapd	%ymm7, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L125:
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm0
	vmovapd	(%rsp), %ymm7
	vtestpd	%ymm0, %ymm0
	jne	.L141
.L47:
	vcmppd	$2, %ymm5, %ymm6, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L142
.L48:
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L143
.L49:
	vcmppd	$2, %ymm5, %ymm3, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L144
.L50:
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L145
.L51:
	vcmppd	$2, %ymm5, %ymm8, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L146
.L52:
	vandnpd	%ymm1, %ymm2, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L147
.L53:
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L148
.L54:
	vandnpd	%ymm12, %ymm2, %ymm12
	vcmppd	$13, %ymm4, %ymm12, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L149
.L55:
	vcmppd	$2, %ymm5, %ymm12, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L150
.L56:
	vandnpd	%ymm11, %ymm2, %ymm11
	vcmppd	$13, %ymm4, %ymm11, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L151
.L57:
	vcmppd	$2, %ymm5, %ymm11, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L152
.L58:
	vandnpd	%ymm10, %ymm2, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L153
.L59:
	vcmppd	$2, %ymm5, %ymm10, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L154
.L60:
	vandnpd	%ymm9, %ymm2, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L155
.L61:
	vcmppd	$2, %ymm5, %ymm9, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L156
.L62:
	vmulpd	%ymm12, %ymm6, %ymm6
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L157
.L63:
	vcmppd	$2, %ymm5, %ymm6, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L158
.L64:
	vmulpd	%ymm11, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L159
.L65:
	vcmppd	$2, %ymm5, %ymm3, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L160
.L66:
	vmulpd	%ymm10, %ymm8, %ymm8
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L161
.L67:
	vcmppd	$2, %ymm5, %ymm8, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L162
.L68:
	vmulpd	%ymm9, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm2, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L163
.L69:
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L164
.L70:
	vmulpd	%ymm6, %ymm3, %ymm3
	vaddpd	32(%rsp), %ymm7, %ymm7
	vcvtpd2dqy	%ymm7, %xmm7
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm6
	vcmppd	$2, %ymm5, %ymm3, %ymm0
	vphaddd	%xmm7, %xmm7, %xmm7
	vphaddd	%xmm7, %xmm7, %xmm7
	vmovd	%xmm7, %eax
	vmovmskpd	%ymm6, %r11d
	cltq
	vmovmskpd	%ymm0, %edx
	testl	%r11d, %r11d
	je	.L71
	vmulpd	%ymm5, %ymm3, %ymm7
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm6, %ymm7, %ymm3, %ymm3
.L71:
	testl	%edx, %edx
	je	.L72
	vmulpd	%ymm4, %ymm3, %ymm6
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm0, %ymm6, %ymm3, %ymm3
.L72:
	vmulpd	%ymm8, %ymm1, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm6
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm6, %r11d
	vmovmskpd	%ymm1, %edx
	testl	%r11d, %r11d
	je	.L73
	vmulpd	%ymm5, %ymm0, %ymm7
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm6, %ymm7, %ymm0, %ymm0
.L73:
	testl	%edx, %edx
	je	.L74
	vmulpd	%ymm4, %ymm0, %ymm6
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm1, %ymm6, %ymm0, %ymm0
.L74:
	vmulpd	%ymm3, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm3
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm3, %r11d
	vmovmskpd	%ymm1, %edx
	testl	%r11d, %r11d
	je	.L75
	vmulpd	%ymm5, %ymm0, %ymm6
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm3, %ymm6, %ymm0, %ymm0
.L75:
	testl	%edx, %edx
	je	.L76
	vmulpd	%ymm4, %ymm0, %ymm3
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm0
.L76:
	vinsertf128	$1, %xmm13, %ymm0, %ymm1
	vperm2f128	$33, %ymm13, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm4, %ymm2, %ymm1
	vcmppd	$2, %ymm5, %ymm2, %ymm0
	vmovmskpd	%ymm1, %r11d
	vmovmskpd	%ymm0, %edx
	testl	%r11d, %r11d
	je	.L77
	vmulpd	%ymm5, %ymm2, %ymm5
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm1, %ymm5, %ymm2, %ymm2
.L77:
	testl	%edx, %edx
	je	.L78
	vmulpd	%ymm4, %ymm2, %ymm4
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm0, %ymm4, %ymm2, %ymm2
.L78:
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm2
	vmovq	.LC11(%rip), %xmm3
	vmovsd	.LC12(%rip), %xmm1
	vmovsd	.LC13(%rip), %xmm4
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm1, %xmm2
	ja	.L165
	vcomisd	%xmm2, %xmm4
	jbe	.L81
	vmulsd	%xmm1, %xmm2, %xmm2
	decq	%rax
.L81:
	vmovsd	%xmm2, (%r9)
	leaq	31(%r10), %rdx
	movq	%rax, (%rcx)
	movslq	%r10d, %rax
	cmpq	%rax, %rdx
	jl	.L122
	addq	$32, %r10
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L166:
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
	incq	(%rcx)
.L85:
	incq	%rax
	cmpq	%rax, %r10
	je	.L122
.L90:
	cmpq	%rax, %rdi
	je	.L85
	vmovq	%r8, %xmm7
	vsubsd	(%rsi,%rax,8), %xmm7, %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vmulsd	(%r9), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L166
	vcomisd	%xmm0, %xmm4
	ja	.L88
	incq	%rax
	vmovsd	%xmm0, (%r9)
	cmpq	%rax, %r10
	jne	.L90
.L122:
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	.cfi_restore_state
	vmulsd	%xmm4, %xmm2, %xmm2
	incq	%rax
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L88:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
	decq	(%rcx)
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L140:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	32(%rsp), %ymm15, %ymm7
	vmulpd	%ymm5, %ymm9, %ymm15
	vmovapd	%ymm7, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L139:
	vmovapd	32(%rsp), %ymm7
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm10, %ymm15
	vmovapd	%ymm7, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L138:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	32(%rsp), %ymm15, %ymm7
	vmulpd	%ymm5, %ymm10, %ymm15
	vmovapd	%ymm7, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L137:
	vmovapd	32(%rsp), %ymm7
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm11, %ymm15
	vmovapd	%ymm7, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L136:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	32(%rsp), %ymm15, %ymm7
	vmulpd	%ymm5, %ymm11, %ymm15
	vmovapd	%ymm7, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L135:
	vmovapd	32(%rsp), %ymm7
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm7, %ymm15
	vmovapd	%ymm15, 32(%rsp)
	vmulpd	%ymm4, %ymm12, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm12, %ymm12
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L134:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	32(%rsp), %ymm15, %ymm15
	vmovapd	%ymm15, 32(%rsp)
	vmulpd	%ymm5, %ymm12, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm12, %ymm12
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L133:
	vmovapd	(%rsp), %ymm7
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm1, %ymm15
	vmovapd	%ymm7, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L132:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	(%rsp), %ymm15, %ymm7
	vmulpd	%ymm5, %ymm1, %ymm15
	vmovapd	%ymm7, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L131:
	vmovapd	(%rsp), %ymm7
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm8, %ymm15
	vmovapd	%ymm7, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L130:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	(%rsp), %ymm15, %ymm7
	vmulpd	%ymm5, %ymm8, %ymm15
	vmovapd	%ymm7, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L129:
	vmovapd	(%rsp), %ymm7
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm3, %ymm15
	vmovapd	%ymm7, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L128:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	(%rsp), %ymm15, %ymm7
	vmulpd	%ymm5, %ymm3, %ymm15
	vmovapd	%ymm7, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L127:
	vmovapd	(%rsp), %ymm7
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm6, %ymm15
	vmovapd	%ymm7, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L126:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	(%rsp), %ymm15, %ymm7
	vmulpd	%ymm5, %ymm6, %ymm15
	vmovapd	%ymm7, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
	jmp	.L30
.L163:
	vandpd	%ymm13, %ymm0, %ymm9
	vaddpd	%ymm9, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm1, %ymm9
	vblendvpd	%ymm0, %ymm9, %ymm1, %ymm1
	jmp	.L69
.L148:
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm1, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm1, %ymm1
	jmp	.L54
.L149:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	32(%rsp), %ymm14, %ymm15
	vmulpd	%ymm5, %ymm12, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm12, %ymm12
	jmp	.L55
.L150:
	vmovapd	32(%rsp), %ymm15
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm12, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm12, %ymm12
	jmp	.L56
.L151:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	32(%rsp), %ymm14, %ymm15
	vmulpd	%ymm5, %ymm11, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm11, %ymm11
	jmp	.L57
.L152:
	vmovapd	32(%rsp), %ymm15
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm11, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm11, %ymm11
	jmp	.L58
.L153:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	32(%rsp), %ymm14, %ymm15
	vmulpd	%ymm5, %ymm10, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm10, %ymm10
	jmp	.L59
.L154:
	vmovapd	32(%rsp), %ymm15
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm10, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm10, %ymm10
	jmp	.L60
.L155:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	32(%rsp), %ymm14, %ymm15
	vmulpd	%ymm5, %ymm9, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm9, %ymm9
	jmp	.L61
.L144:
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm3, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm3, %ymm3
	jmp	.L50
.L145:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	%ymm14, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm8, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm8, %ymm8
	jmp	.L51
.L146:
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm8, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm8, %ymm8
	jmp	.L52
.L147:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	%ymm14, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm1, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm1, %ymm1
	jmp	.L53
.L142:
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm6, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm6, %ymm6
	jmp	.L48
.L143:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	%ymm14, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm3, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm3, %ymm3
	jmp	.L49
.L141:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	%ymm14, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm6, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm6, %ymm6
	jmp	.L47
.L164:
	vandpd	%ymm13, %ymm0, %ymm9
	vsubpd	%ymm9, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm1, %ymm9
	vblendvpd	%ymm0, %ymm9, %ymm1, %ymm1
	jmp	.L70
.L156:
	vmovapd	32(%rsp), %ymm15
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm9, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm9, %ymm9
	jmp	.L62
.L157:
	vandpd	%ymm13, %ymm0, %ymm12
	vaddpd	%ymm12, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm6, %ymm12
	vblendvpd	%ymm0, %ymm12, %ymm6, %ymm6
	jmp	.L63
.L158:
	vandpd	%ymm13, %ymm0, %ymm12
	vsubpd	%ymm12, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm6, %ymm12
	vblendvpd	%ymm0, %ymm12, %ymm6, %ymm6
	jmp	.L64
.L159:
	vandpd	%ymm13, %ymm0, %ymm11
	vaddpd	%ymm11, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm3, %ymm11
	vblendvpd	%ymm0, %ymm11, %ymm3, %ymm3
	jmp	.L65
.L160:
	vandpd	%ymm13, %ymm0, %ymm11
	vsubpd	%ymm11, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm3, %ymm11
	vblendvpd	%ymm0, %ymm11, %ymm3, %ymm3
	jmp	.L66
.L161:
	vandpd	%ymm13, %ymm0, %ymm10
	vaddpd	%ymm10, %ymm7, %ymm7
	vmulpd	%ymm5, %ymm8, %ymm10
	vblendvpd	%ymm0, %ymm10, %ymm8, %ymm8
	jmp	.L67
.L162:
	vandpd	%ymm13, %ymm0, %ymm10
	vsubpd	%ymm10, %ymm7, %ymm7
	vmulpd	%ymm4, %ymm8, %ymm10
	vblendvpd	%ymm0, %ymm10, %ymm8, %ymm8
	jmp	.L68
.L124:
	leaq	.LC4(%rip), %rcx
	movl	$112, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE9262:
	.size	_Z13prod_realreallldPKdRdRl.constprop.0, .-_Z13prod_realreallldPKdRdRl.constprop.0
	.section	.rodata.str1.1
.LC14:
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
	leaq	.LC14(%rip), %r13
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
	je	.L173
	cmpb	$0, 56(%r13)
	je	.L169
	movsbl	67(%r13), %esi
.L170:
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
.L169:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L170
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L170
.L173:
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
	jne	.L180
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L180:
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
	vmovapd	.LC8(%rip), %ymm0
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
	vmovapd	.LC8(%rip), %ymm0
	vmovapd	.LC10(%rip), %ymm2
	vandnpd	%ymm1, %ymm0, %ymm0
	vmovapd	.LC9(%rip), %ymm1
	vcmppd	$2, %ymm2, %ymm0, %ymm3
	vcmppd	$13, %ymm1, %ymm0, %ymm4
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm4, %edx
	testl	%edx, %edx
	je	.L184
	vmulpd	%ymm2, %ymm0, %ymm2
	popcntl	%edx, %edx
	addq	%rdx, (%rdi)
	vblendvpd	%ymm4, %ymm2, %ymm0, %ymm0
.L184:
	testl	%eax, %eax
	je	.L183
	vmulpd	%ymm1, %ymm0, %ymm1
	popcntl	%eax, %eax
	subq	%rax, (%rdi)
	vblendvpd	%ymm3, %ymm1, %ymm0, %ymm0
.L183:
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
	vmovapd	.LC8(%rip), %ymm0
	vmovapd	.LC9(%rip), %ymm3
	vandnpd	%ymm1, %ymm0, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm2
	vtestpd	%ymm2, %ymm2
	jne	.L196
	vmovapd	.LC10(%rip), %ymm1
.L193:
	vcmppd	$2, %ymm1, %ymm0, %ymm1
	vtestpd	%ymm1, %ymm1
	jne	.L197
	ret
	.p2align 4,,10
	.p2align 3
.L197:
	vmovapd	(%rdi), %ymm5
	vmulpd	%ymm3, %ymm0, %ymm3
	vandpd	.LC3(%rip), %ymm1, %ymm2
	vsubpd	%ymm2, %ymm5, %ymm2
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm0
	vmovapd	%ymm2, (%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L196:
	vandpd	.LC3(%rip), %ymm2, %ymm1
	vaddpd	(%rdi), %ymm1, %ymm1
	vmovapd	%ymm1, (%rdi)
	vmovapd	.LC10(%rip), %ymm1
	vmulpd	%ymm1, %ymm0, %ymm4
	vblendvpd	%ymm2, %ymm4, %ymm0, %ymm0
	jmp	.L193
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
	vmovapd	.LC3(%rip), %ymm1
	vinsertf128	$1, %xmm1, %ymm0, %ymm2
	vperm2f128	$33, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm1
	vmovapd	.LC8(%rip), %ymm0
	vmovapd	.LC10(%rip), %ymm2
	vandnpd	%ymm1, %ymm0, %ymm0
	vmovapd	.LC9(%rip), %ymm1
	vcmppd	$2, %ymm2, %ymm0, %ymm3
	vcmppd	$13, %ymm1, %ymm0, %ymm4
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm4, %edx
	testl	%edx, %edx
	je	.L199
	vmulpd	%ymm2, %ymm0, %ymm2
	popcntl	%edx, %edx
	addq	%rdx, (%rdi)
	vblendvpd	%ymm4, %ymm2, %ymm0, %ymm0
.L199:
	testl	%eax, %eax
	je	.L200
	vmulpd	%ymm1, %ymm0, %ymm1
	popcntl	%eax, %eax
	subq	%rax, (%rdi)
	vblendvpd	%ymm3, %ymm1, %ymm0, %ymm0
.L200:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC12(%rip), %xmm1
	vandpd	.LC11(%rip), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L213
	vmulsd	.LC13(%rip), %xmm0, %xmm0
	incq	(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L213:
	vmovsd	.LC13(%rip), %xmm2
	vcomisd	%xmm0, %xmm2
	jbe	.L198
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	(%rdi)
.L198:
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
	vmovq	.LC11(%rip), %xmm3
	vandpd	%xmm3, %xmm2, %xmm2
	vsubsd	.LC15(%rip), %xmm2, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	.LC16(%rip), %xmm2
	ja	.L220
	ret
	.p2align 4,,10
	.p2align 3
.L220:
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
	pushq	%r15
	leaq	-64(%rbp), %rdi
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	vmovapd	.LC17(%rip), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	$0, -64(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	.LC18(%rip), %xmm0
	vmovq	.LC11(%rip), %xmm2
	vdivsd	%xmm1, %xmm0, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vsubsd	.LC15(%rip), %xmm3, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vcomisd	.LC16(%rip), %xmm3
	ja	.L384
.L222:
	movq	-64(%rbp), %rsi
	cmpq	$1, %rsi
	je	.L224
	movl	$1, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovq	.LC11(%rip), %xmm2
.L224:
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm10
	vxorpd	%xmm0, %xmm0, %xmm0
	vmulpd	%ymm10, %ymm10, %ymm10
	vmovapd	.LC19(%rip), %ymm8
	vcvtpd2dqy	%ymm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	vmulpd	%ymm8, %ymm10, %ymm0
	vmovapd	.LC8(%rip), %ymm5
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC10(%rip), %ymm4
	movslq	%eax, %r12
	vandnpd	%ymm0, %ymm5, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm6
	vcmppd	$2, %ymm4, %ymm0, %ymm1
	movq	%r12, %r13
	vmovmskpd	%ymm6, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L225
	vmulpd	%ymm4, %ymm0, %ymm7
	popcntl	%edx, %edx
	leaq	(%rdx,%r12), %r13
	vblendvpd	%ymm6, %ymm7, %ymm0, %ymm0
.L225:
	testl	%eax, %eax
	je	.L226
	vmulpd	%ymm3, %ymm0, %ymm6
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm1, %ymm6, %ymm0, %ymm0
.L226:
	vmulpd	%ymm10, %ymm10, %ymm1
	vandnpd	%ymm1, %ymm5, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm7
	vcmppd	$2, %ymm4, %ymm1, %ymm6
	vmovmskpd	%ymm7, %edx
	vmovmskpd	%ymm6, %eax
	testl	%edx, %edx
	je	.L227
	vmulpd	%ymm4, %ymm1, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm7, %ymm9, %ymm1, %ymm1
.L227:
	testl	%eax, %eax
	je	.L228
	vmulpd	%ymm3, %ymm1, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm6, %ymm7, %ymm1, %ymm1
.L228:
	vmulpd	%ymm0, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm5, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm6
	vcmppd	$2, %ymm4, %ymm1, %ymm0
	vmovmskpd	%ymm6, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L229
	vmulpd	%ymm4, %ymm1, %ymm7
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm6, %ymm7, %ymm1, %ymm1
.L229:
	testl	%eax, %eax
	je	.L230
	vmulpd	%ymm3, %ymm1, %ymm6
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm0, %ymm6, %ymm1, %ymm1
.L230:
	vmovapd	.LC3(%rip), %ymm6
	vinsertf128	$1, %xmm6, %ymm1, %ymm0
	vperm2f128	$33, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm5, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm7
	vcmppd	$2, %ymm4, %ymm0, %ymm1
	vmovmskpd	%ymm7, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L231
	vmulpd	%ymm4, %ymm0, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r13
	vblendvpd	%ymm7, %ymm9, %ymm0, %ymm0
.L231:
	testl	%eax, %eax
	je	.L232
	vmulpd	%ymm3, %ymm0, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r13
	vblendvpd	%ymm1, %ymm7, %ymm0, %ymm0
.L232:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	movq	.LC13(%rip), %rbx
	vmovq	%rbx, %xmm7
	vandpd	%xmm2, %xmm0, %xmm1
	vcomisd	.LC12(%rip), %xmm1
	jbe	.L376
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%r13
.L235:
	vmovsd	.LC20(%rip), %xmm0
	vucomisd	%xmm0, %xmm1
	jp	.L290
	jne	.L290
.L237:
	testq	%r13, %r13
	je	.L242
	movq	%r13, %rsi
	xorl	%edi, %edi
	vmovapd	%ymm10, -112(%rbp)
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC8(%rip), %ymm5
	vmovapd	.LC3(%rip), %ymm6
	vmovapd	.LC19(%rip), %ymm8
	vmovq	.LC11(%rip), %xmm2
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	-112(%rbp), %ymm10
.L242:
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm9
	vmulpd	.LC21(%rip), %ymm10, %ymm7
	vmulpd	%ymm8, %ymm9, %ymm8
	vmulpd	%ymm10, %ymm9, %ymm9
	vmulpd	%ymm7, %ymm8, %ymm0
	vandnpd	%ymm0, %ymm5, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm10
	vcmppd	$2, %ymm4, %ymm0, %ymm1
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L243
	vmulpd	%ymm4, %ymm0, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L243:
	testl	%eax, %eax
	je	.L244
	vmulpd	%ymm3, %ymm0, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm10, %ymm0, %ymm0
.L244:
	vmulpd	%ymm9, %ymm9, %ymm1
	vandnpd	%ymm1, %ymm5, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm11
	vcmppd	$2, %ymm4, %ymm1, %ymm10
	vmovmskpd	%ymm11, %edx
	vmovmskpd	%ymm10, %eax
	testl	%edx, %edx
	je	.L245
	vmulpd	%ymm4, %ymm1, %ymm12
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm11, %ymm12, %ymm1, %ymm1
.L245:
	testl	%eax, %eax
	je	.L246
	vmulpd	%ymm3, %ymm1, %ymm11
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm10, %ymm11, %ymm1, %ymm1
.L246:
	vmulpd	%ymm0, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm5, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm10
	vcmppd	$2, %ymm4, %ymm1, %ymm0
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L247
	vmulpd	%ymm4, %ymm1, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm1, %ymm1
.L247:
	testl	%eax, %eax
	je	.L248
	vmulpd	%ymm3, %ymm1, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm10, %ymm1, %ymm1
.L248:
	vinsertf128	$1, %xmm6, %ymm1, %ymm0
	vperm2f128	$33, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm5, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm10
	vcmppd	$2, %ymm4, %ymm0, %ymm1
	vmovmskpd	%ymm10, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L249
	vmulpd	%ymm4, %ymm0, %ymm11
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L249:
	testl	%eax, %eax
	je	.L250
	vmulpd	%ymm3, %ymm0, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm10, %ymm0, %ymm0
.L250:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm1
	vcomisd	.LC12(%rip), %xmm1
	vmovq	%rbx, %xmm0
	ja	.L385
	vcomisd	%xmm1, %xmm0
	jbe	.L253
	vmulsd	.LC12(%rip), %xmm1, %xmm1
	decq	%r12
.L253:
	vmovsd	.LC22(%rip), %xmm10
	vdivsd	%xmm1, %xmm10, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC15(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	ja	.L386
.L255:
	cmpq	$1, %r12
	je	.L257
	movq	%r12, %rsi
	movl	$1, %edi
	vmovapd	%ymm9, -176(%rbp)
	vmovapd	%ymm7, -144(%rbp)
	vmovapd	%ymm8, -112(%rbp)
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC8(%rip), %ymm5
	vmovapd	.LC3(%rip), %ymm6
	vmovq	.LC11(%rip), %xmm2
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	-176(%rbp), %ymm9
	vmovapd	-144(%rbp), %ymm7
	vmovapd	-112(%rbp), %ymm8
.L257:
	vmulpd	.LC23(%rip), %ymm8, %ymm8
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmulpd	%ymm7, %ymm1, %ymm7
	vmulpd	%ymm9, %ymm1, %ymm1
	vandnpd	%ymm8, %ymm5, %ymm8
	vcmppd	$13, %ymm3, %ymm8, %ymm9
	vtestpd	%ymm9, %ymm9
	jne	.L387
.L258:
	vcmppd	$2, %ymm4, %ymm8, %ymm9
	vtestpd	%ymm9, %ymm9
	jne	.L388
.L259:
	vandnpd	%ymm7, %ymm5, %ymm7
	vcmppd	$13, %ymm3, %ymm7, %ymm9
	vtestpd	%ymm9, %ymm9
	jne	.L389
.L260:
	vcmppd	$2, %ymm4, %ymm7, %ymm9
	vtestpd	%ymm9, %ymm9
	jne	.L390
.L261:
	vandnpd	%ymm1, %ymm5, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm9
	vtestpd	%ymm9, %ymm9
	jne	.L391
	vcmppd	$2, %ymm4, %ymm1, %ymm9
	vtestpd	%ymm9, %ymm9
	jne	.L392
.L281:
	vmulpd	%ymm8, %ymm7, %ymm7
	vcvtpd2dqy	%ymm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %r12d
	vandnpd	%ymm7, %ymm5, %ymm7
	vcmppd	$13, %ymm3, %ymm7, %ymm8
	vcmppd	$2, %ymm4, %ymm7, %ymm0
	movslq	%r12d, %r12
	vmovmskpd	%ymm8, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L265
	vmulpd	%ymm4, %ymm7, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm8, %ymm9, %ymm7, %ymm7
.L265:
	testl	%eax, %eax
	je	.L266
	vmulpd	%ymm3, %ymm7, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm8, %ymm7, %ymm7
.L266:
	vmulpd	%ymm1, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm5, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm8
	vcmppd	$2, %ymm4, %ymm1, %ymm0
	vmovmskpd	%ymm8, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L267
	vmulpd	%ymm4, %ymm1, %ymm9
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm8, %ymm9, %ymm1, %ymm1
.L267:
	testl	%eax, %eax
	je	.L268
	vmulpd	%ymm3, %ymm1, %ymm8
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm8, %ymm1, %ymm1
.L268:
	vmulpd	%ymm7, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm5, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm7
	vcmppd	$2, %ymm4, %ymm1, %ymm0
	vmovmskpd	%ymm7, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L269
	vmulpd	%ymm4, %ymm1, %ymm8
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm7, %ymm8, %ymm1, %ymm1
.L269:
	testl	%eax, %eax
	je	.L270
	vmulpd	%ymm3, %ymm1, %ymm7
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm0, %ymm7, %ymm1, %ymm1
.L270:
	vinsertf128	$1, %xmm6, %ymm1, %ymm0
	vperm2f128	$33, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm5, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm5
	vcmppd	$2, %ymm4, %ymm0, %ymm1
	vmovmskpd	%ymm5, %edx
	vmovmskpd	%ymm1, %eax
	testl	%edx, %edx
	je	.L271
	vmulpd	%ymm4, %ymm0, %ymm4
	popcntl	%edx, %edx
	addq	%rdx, %r12
	vblendvpd	%ymm5, %ymm4, %ymm0, %ymm0
.L271:
	testl	%eax, %eax
	je	.L272
	vmulpd	%ymm3, %ymm0, %ymm3
	popcntl	%eax, %eax
	subq	%rax, %r12
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm0
.L272:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	%rbx, %xmm6
	vandpd	%xmm2, %xmm0, %xmm1
	vcomisd	.LC12(%rip), %xmm1
	jbe	.L379
	vmulsd	%xmm6, %xmm1, %xmm1
	incq	%r12
.L275:
	vmovsd	.LC24(%rip), %xmm3
	vdivsd	%xmm1, %xmm3, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC15(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	ja	.L393
	vzeroupper
.L277:
	cmpq	$2, %r12
	je	.L221
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L383
	addq	$136, %rsp
	popq	%rbx
	movq	%r12, %rsi
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	movl	$2, %edi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_Z9assert_eqIlEvT_S0_.part.0
	.p2align 4,,10
	.p2align 3
.L376:
	.cfi_restore_state
	vcomisd	%xmm1, %xmm7
	jbe	.L235
	vmulsd	.LC12(%rip), %xmm1, %xmm1
	decq	%r13
	jmp	.L235
	.p2align 4,,10
	.p2align 3
.L385:
	vmulsd	%xmm0, %xmm1, %xmm1
	incq	%r12
	jmp	.L253
	.p2align 4,,10
	.p2align 3
.L221:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L383
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L379:
	.cfi_restore_state
	vcomisd	%xmm1, %xmm6
	jbe	.L275
	vmulsd	.LC12(%rip), %xmm1, %xmm1
	decq	%r12
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L386:
	vmovsd	%xmm10, %xmm10, %xmm0
	vmovapd	%ymm9, -176(%rbp)
	vmovapd	%ymm7, -144(%rbp)
	vmovapd	%ymm8, -112(%rbp)
	vzeroupper
	call	_Z13assert_approxdd.part.0
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC8(%rip), %ymm5
	vmovapd	.LC3(%rip), %ymm6
	vmovq	.LC11(%rip), %xmm2
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	-176(%rbp), %ymm9
	vmovapd	-144(%rbp), %ymm7
	vmovapd	-112(%rbp), %ymm8
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L393:
	vmovsd	%xmm3, %xmm3, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
	jmp	.L277
	.p2align 4,,10
	.p2align 3
.L290:
	leaq	_ZSt4cerr(%rip), %r14
	movl	$20, %edx
	leaq	.LC2(%rip), %rsi
	movq	%r14, %rdi
	vmovsd	%xmm1, -144(%rbp)
	vmovapd	%ymm10, -112(%rbp)
	vzeroupper
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	.LC20(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$4, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-144(%rbp), %xmm1
	movq	%r14, %rdi
	vmovsd	%xmm1, %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	vmovapd	-112(%rbp), %ymm10
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %r15
	testq	%r15, %r15
	je	.L394
	cmpb	$0, 56(%r15)
	je	.L240
	movsbl	67(%r15), %esi
.L241:
	movq	%r14, %rdi
	vmovapd	%ymm10, -112(%rbp)
	vzeroupper
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC8(%rip), %ymm5
	vmovapd	.LC3(%rip), %ymm6
	vmovapd	.LC19(%rip), %ymm8
	vmovq	.LC11(%rip), %xmm2
	vmovapd	.LC10(%rip), %ymm4
	vmovapd	-112(%rbp), %ymm10
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L384:
	call	_Z13assert_approxdd.part.0
	vmovq	.LC11(%rip), %xmm2
	jmp	.L222
	.p2align 4,,10
	.p2align 3
.L240:
	movq	%r15, %rdi
	vmovapd	%ymm10, -112(%rbp)
	vzeroupper
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r15), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	vmovapd	-112(%rbp), %ymm10
	cmpq	%rdx, %rax
	movl	$10, %esi
	je	.L241
	movq	%r15, %rdi
	vzeroupper
	call	*%rax
	movsbl	%al, %esi
	vmovapd	-112(%rbp), %ymm10
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L387:
	vandpd	%ymm6, %ymm9, %ymm10
	vaddpd	%ymm0, %ymm10, %ymm0
	vmulpd	%ymm4, %ymm8, %ymm10
	vblendvpd	%ymm9, %ymm10, %ymm8, %ymm8
	jmp	.L258
	.p2align 4,,10
	.p2align 3
.L389:
	vandpd	%ymm6, %ymm9, %ymm10
	vaddpd	%ymm10, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm7, %ymm10
	vblendvpd	%ymm9, %ymm10, %ymm7, %ymm7
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L388:
	vandpd	%ymm6, %ymm9, %ymm10
	vsubpd	%ymm10, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm8, %ymm10
	vblendvpd	%ymm9, %ymm10, %ymm8, %ymm8
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L391:
	vmulpd	%ymm4, %ymm1, %ymm11
	vandpd	%ymm6, %ymm9, %ymm10
	vaddpd	%ymm10, %ymm0, %ymm0
	vblendvpd	%ymm9, %ymm11, %ymm1, %ymm1
	vcmppd	$2, %ymm4, %ymm1, %ymm9
	vtestpd	%ymm9, %ymm9
	jne	.L395
	vaddpd	%ymm0, %ymm10, %ymm0
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L390:
	vandpd	%ymm6, %ymm9, %ymm10
	vsubpd	%ymm10, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm7, %ymm10
	vblendvpd	%ymm9, %ymm10, %ymm7, %ymm7
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L392:
	vmulpd	%ymm3, %ymm1, %ymm10
	vandpd	%ymm6, %ymm9, %ymm11
	vsubpd	%ymm11, %ymm0, %ymm0
	vblendvpd	%ymm9, %ymm10, %ymm1, %ymm1
.L282:
	vsubpd	%ymm11, %ymm0, %ymm0
	jmp	.L281
.L395:
	vmulpd	%ymm3, %ymm1, %ymm12
	vandpd	%ymm6, %ymm9, %ymm11
	vsubpd	%ymm11, %ymm0, %ymm0
	vblendvpd	%ymm9, %ymm12, %ymm1, %ymm1
	vaddpd	%ymm10, %ymm0, %ymm0
	jmp	.L282
.L383:
	call	__stack_chk_fail@PLT
.L394:
	vzeroupper
	call	_ZSt16__throw_bad_castv@PLT
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
	subq	$64, %rsp
	testb	$31, %dil
	jne	.L497
	movq	%rdx, %r9
	movq	%rdx, %rax
	testb	$31, %dl
	jne	.L498
	vxorps	%xmm12, %xmm12, %xmm12
	vcvtsi2sdq	(%r8), %xmm12, %xmm12
	vmovapd	.LC7(%rip), %ymm6
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm3
	vmovq	%xmm0, %rdi
	vmovapd	.LC3(%rip), %ymm13
	vmovlpd	(%rcx), %xmm6, %xmm0
	vmovq	%rdi, %xmm7
	movq	%rsi, %r10
	vxorpd	%xmm5, %xmm5, %xmm5
	vinsertf128	$0x0, %xmm0, %ymm6, %ymm6
	vmovq	%xmm12, %xmm12
	vbroadcastsd	%xmm7, %ymm0
	andq	$-32, %r10
	vmovapd	%ymm3, %ymm8
	vmovapd	%ymm3, %ymm9
	vmovapd	%ymm3, %ymm10
	vmovapd	%ymm3, %ymm1
	vmovapd	%ymm3, %ymm7
	vmovapd	%ymm5, 32(%rsp)
	vmovapd	%ymm13, %ymm11
	testq	%r11, %r11
	jle	.L463
	vmovapd	.LC8(%rip), %ymm2
	vmovapd	.LC9(%rip), %ymm4
	vmovapd	.LC10(%rip), %ymm5
	xorl	%edx, %edx
	vmovapd	%ymm12, (%rsp)
	jmp	.L418
	.p2align 4,,10
	.p2align 3
.L401:
	addq	$32, %rdx
	addq	$256, %rax
	cmpq	%rdx, %r11
	jle	.L499
.L418:
	cmpq	%rdx, %r10
	je	.L400
	vsubpd	(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm6, %ymm6
	vsubpd	32(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm3, %ymm3
	vsubpd	64(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm7, %ymm7
	vsubpd	96(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm1, %ymm1
	vsubpd	128(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm11, %ymm11
	vsubpd	160(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm10, %ymm10
	vsubpd	192(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm9, %ymm9
	vsubpd	224(%rax), %ymm0, %ymm14
	vmulpd	%ymm14, %ymm8, %ymm8
.L400:
	testb	$-32, %dl
	jne	.L401
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L500
.L402:
	vcmppd	$2, %ymm5, %ymm6, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L501
.L403:
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L502
.L404:
	vcmppd	$2, %ymm5, %ymm3, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L503
.L405:
	vandnpd	%ymm7, %ymm2, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L504
.L406:
	vcmppd	$2, %ymm5, %ymm7, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L505
.L407:
	vandnpd	%ymm1, %ymm2, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L506
.L408:
	vcmppd	$2, %ymm5, %ymm1, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L507
.L409:
	vandnpd	%ymm11, %ymm2, %ymm11
	vcmppd	$13, %ymm4, %ymm11, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L508
.L410:
	vcmppd	$2, %ymm5, %ymm11, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L509
.L411:
	vandnpd	%ymm10, %ymm2, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L510
.L412:
	vcmppd	$2, %ymm5, %ymm10, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L511
.L413:
	vandnpd	%ymm9, %ymm2, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L512
.L414:
	vcmppd	$2, %ymm5, %ymm9, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L513
.L415:
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm14
	vtestpd	%ymm14, %ymm14
	jne	.L514
.L416:
	vcmppd	$2, %ymm5, %ymm8, %ymm14
	vtestpd	%ymm14, %ymm14
	je	.L401
	vmovapd	32(%rsp), %ymm12
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm8, %ymm15
	addq	$32, %rdx
	vmovapd	%ymm12, 32(%rsp)
	addq	$256, %rax
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
	cmpq	%rdx, %r11
	jg	.L418
	.p2align 4,,10
	.p2align 3
.L499:
	vmovapd	(%rsp), %ymm12
.L399:
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L515
.L419:
	vcmppd	$2, %ymm5, %ymm6, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L516
.L420:
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L517
.L421:
	vcmppd	$2, %ymm5, %ymm3, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L518
.L422:
	vandnpd	%ymm7, %ymm2, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L519
.L423:
	vcmppd	$2, %ymm5, %ymm7, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L520
.L424:
	vandnpd	%ymm1, %ymm2, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L521
.L425:
	vcmppd	$2, %ymm5, %ymm1, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L522
.L426:
	vandnpd	%ymm11, %ymm2, %ymm11
	vcmppd	$13, %ymm4, %ymm11, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L523
.L427:
	vcmppd	$2, %ymm5, %ymm11, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L524
.L428:
	vandnpd	%ymm10, %ymm2, %ymm10
	vcmppd	$13, %ymm4, %ymm10, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L525
.L429:
	vcmppd	$2, %ymm5, %ymm10, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L526
.L430:
	vandnpd	%ymm9, %ymm2, %ymm9
	vcmppd	$13, %ymm4, %ymm9, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L527
.L431:
	vcmppd	$2, %ymm5, %ymm9, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L528
.L432:
	vandnpd	%ymm8, %ymm2, %ymm8
	vcmppd	$13, %ymm4, %ymm8, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L529
.L433:
	vcmppd	$2, %ymm5, %ymm8, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L530
.L434:
	vmulpd	%ymm11, %ymm6, %ymm6
	vandnpd	%ymm6, %ymm2, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L531
.L435:
	vcmppd	$2, %ymm5, %ymm6, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L532
.L436:
	vmulpd	%ymm10, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L533
.L437:
	vcmppd	$2, %ymm5, %ymm3, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L534
.L438:
	vmulpd	%ymm9, %ymm7, %ymm7
	vandnpd	%ymm7, %ymm2, %ymm7
	vcmppd	$13, %ymm4, %ymm7, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L535
.L439:
	vcmppd	$2, %ymm5, %ymm7, %ymm0
	vtestpd	%ymm0, %ymm0
	jne	.L536
.L440:
	vmulpd	%ymm8, %ymm1, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm1
	vtestpd	%ymm1, %ymm1
	jne	.L537
.L441:
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vtestpd	%ymm1, %ymm1
	jne	.L538
.L442:
	vmulpd	%ymm6, %ymm3, %ymm3
	vaddpd	32(%rsp), %ymm12, %ymm8
	vcvtpd2dqy	%ymm8, %xmm8
	vandnpd	%ymm3, %ymm2, %ymm3
	vcmppd	$13, %ymm4, %ymm3, %ymm6
	vcmppd	$2, %ymm5, %ymm3, %ymm1
	vphaddd	%xmm8, %xmm8, %xmm8
	vphaddd	%xmm8, %xmm8, %xmm8
	vmovd	%xmm8, %eax
	vmovmskpd	%ymm6, %r11d
	cltq
	vmovmskpd	%ymm1, %edx
	testl	%r11d, %r11d
	je	.L443
	vmulpd	%ymm5, %ymm3, %ymm8
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm6, %ymm8, %ymm3, %ymm3
.L443:
	testl	%edx, %edx
	je	.L444
	vmulpd	%ymm4, %ymm3, %ymm6
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm1, %ymm6, %ymm3, %ymm3
.L444:
	vmulpd	%ymm7, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm6
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm6, %r11d
	vmovmskpd	%ymm1, %edx
	testl	%r11d, %r11d
	je	.L445
	vmulpd	%ymm5, %ymm0, %ymm7
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm6, %ymm7, %ymm0, %ymm0
.L445:
	testl	%edx, %edx
	je	.L446
	vmulpd	%ymm4, %ymm0, %ymm6
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm1, %ymm6, %ymm0, %ymm0
.L446:
	vmulpd	%ymm3, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm3
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm3, %r11d
	vmovmskpd	%ymm1, %edx
	testl	%r11d, %r11d
	je	.L447
	vmulpd	%ymm5, %ymm0, %ymm6
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm3, %ymm6, %ymm0, %ymm0
.L447:
	testl	%edx, %edx
	je	.L448
	vmulpd	%ymm4, %ymm0, %ymm3
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm0
.L448:
	vinsertf128	$1, %xmm13, %ymm0, %ymm1
	vperm2f128	$33, %ymm13, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm4, %ymm2, %ymm1
	vcmppd	$2, %ymm5, %ymm2, %ymm0
	vmovmskpd	%ymm1, %r11d
	vmovmskpd	%ymm0, %edx
	testl	%r11d, %r11d
	je	.L449
	vmulpd	%ymm5, %ymm2, %ymm5
	popcntl	%r11d, %r11d
	addq	%r11, %rax
	vblendvpd	%ymm1, %ymm5, %ymm2, %ymm2
.L449:
	testl	%edx, %edx
	je	.L450
	vmulpd	%ymm4, %ymm2, %ymm4
	popcntl	%edx, %edx
	subq	%rdx, %rax
	vblendvpd	%ymm0, %ymm4, %ymm2, %ymm2
.L450:
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm2
	vmovq	.LC11(%rip), %xmm3
	vmovsd	.LC12(%rip), %xmm1
	vmovsd	.LC13(%rip), %xmm4
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm1, %xmm2
	ja	.L539
	vcomisd	%xmm2, %xmm4
	jbe	.L453
	vmulsd	%xmm1, %xmm2, %xmm2
	decq	%rax
.L453:
	vmovsd	%xmm2, (%rcx)
	leaq	31(%r10), %rdx
	movq	%rax, (%r8)
	movslq	%r10d, %rax
	cmpq	%rax, %rdx
	jl	.L495
	addq	$32, %r10
	jmp	.L462
	.p2align 4,,10
	.p2align 3
.L540:
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	incq	(%r8)
.L457:
	incq	%rax
	cmpq	%r10, %rax
	je	.L495
.L462:
	cmpq	%rax, %rsi
	je	.L457
	vmovq	%rdi, %xmm7
	vsubsd	(%r9,%rax,8), %xmm7, %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vmulsd	(%rcx), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L540
	vcomisd	%xmm0, %xmm4
	ja	.L460
	incq	%rax
	vmovsd	%xmm0, (%rcx)
	cmpq	%r10, %rax
	jne	.L462
.L495:
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L539:
	.cfi_restore_state
	vmulsd	%xmm4, %xmm2, %xmm2
	incq	%rax
	jmp	.L453
	.p2align 4,,10
	.p2align 3
.L460:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	decq	(%r8)
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L514:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	32(%rsp), %ymm15, %ymm12
	vmulpd	%ymm5, %ymm8, %ymm15
	vmovapd	%ymm12, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm8, %ymm8
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L513:
	vmovapd	32(%rsp), %ymm12
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm9, %ymm15
	vmovapd	%ymm12, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
	jmp	.L415
	.p2align 4,,10
	.p2align 3
.L512:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	32(%rsp), %ymm15, %ymm12
	vmulpd	%ymm5, %ymm9, %ymm15
	vmovapd	%ymm12, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
	jmp	.L414
	.p2align 4,,10
	.p2align 3
.L511:
	vmovapd	32(%rsp), %ymm12
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm10, %ymm15
	vmovapd	%ymm12, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L510:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	32(%rsp), %ymm15, %ymm12
	vmulpd	%ymm5, %ymm10, %ymm15
	vmovapd	%ymm12, 32(%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm10, %ymm10
	jmp	.L412
	.p2align 4,,10
	.p2align 3
.L509:
	vmovapd	32(%rsp), %ymm12
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm12, %ymm15
	vmovapd	%ymm15, 32(%rsp)
	vmulpd	%ymm4, %ymm11, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
	jmp	.L411
	.p2align 4,,10
	.p2align 3
.L508:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	32(%rsp), %ymm15, %ymm15
	vmovapd	%ymm15, 32(%rsp)
	vmulpd	%ymm5, %ymm11, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
	jmp	.L410
	.p2align 4,,10
	.p2align 3
.L507:
	vmovapd	(%rsp), %ymm12
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm1, %ymm15
	vmovapd	%ymm12, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L506:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	(%rsp), %ymm15, %ymm12
	vmulpd	%ymm5, %ymm1, %ymm15
	vmovapd	%ymm12, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L505:
	vmovapd	(%rsp), %ymm12
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm7, %ymm15
	vmovapd	%ymm12, (%rsp)
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
	jmp	.L407
	.p2align 4,,10
	.p2align 3
.L504:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	(%rsp), %ymm15, %ymm15
	vmovapd	%ymm15, (%rsp)
	vmulpd	%ymm5, %ymm7, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm7, %ymm7
	jmp	.L406
	.p2align 4,,10
	.p2align 3
.L503:
	vmovapd	(%rsp), %ymm12
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm12, %ymm15
	vmovapd	%ymm15, (%rsp)
	vmulpd	%ymm4, %ymm3, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
	jmp	.L405
	.p2align 4,,10
	.p2align 3
.L502:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	(%rsp), %ymm15, %ymm15
	vmovapd	%ymm15, (%rsp)
	vmulpd	%ymm5, %ymm3, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm3, %ymm3
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L501:
	vmovapd	(%rsp), %ymm12
	vandpd	%ymm13, %ymm14, %ymm15
	vsubpd	%ymm15, %ymm12, %ymm15
	vmovapd	%ymm15, (%rsp)
	vmulpd	%ymm4, %ymm6, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
	jmp	.L403
	.p2align 4,,10
	.p2align 3
.L500:
	vandpd	%ymm13, %ymm14, %ymm15
	vaddpd	(%rsp), %ymm15, %ymm15
	vmovapd	%ymm15, (%rsp)
	vmulpd	%ymm5, %ymm6, %ymm15
	vblendvpd	%ymm14, %ymm15, %ymm6, %ymm6
	jmp	.L402
.L463:
	vmovapd	.LC8(%rip), %ymm2
	vmovapd	.LC9(%rip), %ymm4
	vmovapd	.LC10(%rip), %ymm5
	jmp	.L399
	.p2align 4,,10
	.p2align 3
.L520:
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm7, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm7, %ymm7
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L521:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	%ymm14, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm1, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm1, %ymm1
	jmp	.L425
	.p2align 4,,10
	.p2align 3
.L522:
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm1, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm1, %ymm1
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L523:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	32(%rsp), %ymm14, %ymm15
	vmulpd	%ymm5, %ymm11, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm11, %ymm11
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L524:
	vmovapd	32(%rsp), %ymm15
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm11, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm11, %ymm11
	jmp	.L428
	.p2align 4,,10
	.p2align 3
.L525:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	32(%rsp), %ymm14, %ymm15
	vmulpd	%ymm5, %ymm10, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm10, %ymm10
	jmp	.L429
	.p2align 4,,10
	.p2align 3
.L526:
	vmovapd	32(%rsp), %ymm15
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm10, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm10, %ymm10
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L527:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	32(%rsp), %ymm14, %ymm15
	vmulpd	%ymm5, %ymm9, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm9, %ymm9
	jmp	.L431
	.p2align 4,,10
	.p2align 3
.L516:
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm6, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm6, %ymm6
	jmp	.L420
	.p2align 4,,10
	.p2align 3
.L517:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	%ymm14, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm3, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm3, %ymm3
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L518:
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm3, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm3, %ymm3
	jmp	.L422
	.p2align 4,,10
	.p2align 3
.L519:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	%ymm14, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm7, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm7, %ymm7
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L515:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	%ymm14, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm6, %ymm14
	vblendvpd	%ymm0, %ymm14, %ymm6, %ymm6
	jmp	.L419
	.p2align 4,,10
	.p2align 3
.L538:
	vandpd	%ymm13, %ymm1, %ymm8
	vsubpd	%ymm8, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm0, %ymm8
	vblendvpd	%ymm1, %ymm8, %ymm0, %ymm0
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L536:
	vandpd	%ymm13, %ymm0, %ymm9
	vsubpd	%ymm9, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm7, %ymm9
	vblendvpd	%ymm0, %ymm9, %ymm7, %ymm7
	jmp	.L440
	.p2align 4,,10
	.p2align 3
.L537:
	vandpd	%ymm13, %ymm1, %ymm8
	vaddpd	%ymm8, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm0, %ymm8
	vblendvpd	%ymm1, %ymm8, %ymm0, %ymm0
	jmp	.L441
	.p2align 4,,10
	.p2align 3
.L528:
	vmovapd	32(%rsp), %ymm15
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm9, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm9, %ymm9
	jmp	.L432
	.p2align 4,,10
	.p2align 3
.L529:
	vandpd	%ymm13, %ymm0, %ymm14
	vaddpd	32(%rsp), %ymm14, %ymm15
	vmulpd	%ymm5, %ymm8, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm8, %ymm8
	jmp	.L433
	.p2align 4,,10
	.p2align 3
.L530:
	vmovapd	32(%rsp), %ymm15
	vandpd	%ymm13, %ymm0, %ymm14
	vsubpd	%ymm14, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm8, %ymm14
	vmovapd	%ymm15, 32(%rsp)
	vblendvpd	%ymm0, %ymm14, %ymm8, %ymm8
	jmp	.L434
	.p2align 4,,10
	.p2align 3
.L531:
	vandpd	%ymm13, %ymm0, %ymm11
	vaddpd	%ymm11, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm6, %ymm11
	vblendvpd	%ymm0, %ymm11, %ymm6, %ymm6
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L532:
	vandpd	%ymm13, %ymm0, %ymm11
	vsubpd	%ymm11, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm6, %ymm11
	vblendvpd	%ymm0, %ymm11, %ymm6, %ymm6
	jmp	.L436
	.p2align 4,,10
	.p2align 3
.L533:
	vandpd	%ymm13, %ymm0, %ymm10
	vaddpd	%ymm10, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm3, %ymm10
	vblendvpd	%ymm0, %ymm10, %ymm3, %ymm3
	jmp	.L437
	.p2align 4,,10
	.p2align 3
.L534:
	vandpd	%ymm13, %ymm0, %ymm10
	vsubpd	%ymm10, %ymm12, %ymm12
	vmulpd	%ymm4, %ymm3, %ymm10
	vblendvpd	%ymm0, %ymm10, %ymm3, %ymm3
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L535:
	vandpd	%ymm13, %ymm0, %ymm9
	vaddpd	%ymm9, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm7, %ymm9
	vblendvpd	%ymm0, %ymm9, %ymm7, %ymm7
	jmp	.L439
.L497:
	leaq	.LC4(%rip), %rcx
	movl	$111, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L498:
	leaq	.LC4(%rip), %rcx
	movl	$112, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC6(%rip), %rdi
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
	jle	.L552
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC12(%rip), %xmm4
	vmovsd	.LC13(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L547
	.p2align 4,,10
	.p2align 3
.L553:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L545:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L552
.L547:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L553
	vcomisd	%xmm1, %xmm5
	ja	.L546
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L547
.L552:
	ret
	.p2align 4,,10
	.p2align 3
.L546:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L545
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
	jle	.L565
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC12(%rip), %xmm4
	vmovsd	.LC13(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L560
	.p2align 4,,10
	.p2align 3
.L566:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L558:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L565
.L560:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L566
	vcomisd	%xmm2, %xmm5
	ja	.L559
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L560
.L565:
	ret
	.p2align 4,,10
	.p2align 3
.L559:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L558
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
	jle	.L576
	vmovsd	(%r8), %xmm2
	vmovsd	.LC12(%rip), %xmm5
	vmovsd	.LC13(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L575
	.p2align 4,,10
	.p2align 3
.L589:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L573:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L576
.L575:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L589
	vcomisd	%xmm2, %xmm6
	ja	.L574
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L575
.L576:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L590
	vmovsd	(%r8), %xmm2
	vmovsd	.LC12(%rip), %xmm5
	vmovsd	.LC13(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L581
	.p2align 4,,10
	.p2align 3
.L592:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L579:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L591
.L581:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L592
	vcomisd	%xmm2, %xmm6
	ja	.L580
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L581
.L591:
	ret
	.p2align 4,,10
	.p2align 3
.L574:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L573
	.p2align 4,,10
	.p2align 3
.L580:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L579
	.p2align 4,,10
	.p2align 3
.L590:
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
.L594:
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
	jne	.L594
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L595:
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
	jne	.L595
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
	je	.L599
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L599:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L598
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L598:
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
	jle	.L616
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
	jmp	.L611
	.p2align 4,,10
	.p2align 3
.L618:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L605:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC35(%rip), %xmm0, %xmm0
	vcomisd	.LC15(%rip), %xmm0
	jnb	.L606
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L612
.L607:
	movq	%rdx, %rax
.L611:
	cmpq	$311, %rax
	ja	.L617
.L610:
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
	jns	.L618
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L605
	.p2align 4,,10
	.p2align 3
.L617:
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
	jmp	.L610
	.p2align 4,,10
	.p2align 3
.L606:
	vmovsd	.LC36(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L607
.L612:
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
.L616:
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
.L621:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	leaq	(%rax,%rbx), %rdx
	movq	%rdx, (%rsi,%rbx,8)
	incq	%rbx
	cmpq	$312, %rbx
	jne	.L621
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
	jmp	.L622
	.p2align 4,,10
	.p2align 3
.L649:
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L624:
	vxorpd	%xmm4, %xmm4, %xmm4
	vaddsd	%xmm4, %xmm0, %xmm0
	vmulsd	.LC35(%rip), %xmm0, %xmm0
	vcomisd	.LC15(%rip), %xmm0
	jnb	.L625
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	.LC38(%rip), %xmm5
	addq	$8, %r13
	vfmadd132sd	.LC37(%rip), %xmm5, %xmm0
	vmovsd	%xmm0, -8(%r13)
	cmpq	%r13, %rsi
	je	.L626
.L629:
	movq	%rdi, %rbx
.L622:
	cmpq	$311, %rbx
	ja	.L648
.L628:
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
	jns	.L649
	movq	%rax, %r8
	shrq	%r8
	andl	$1, %eax
	orq	%rax, %r8
	vcvtsi2sdq	%r8, %xmm3, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L624
	.p2align 4,,10
	.p2align 3
.L648:
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
	jmp	.L628
.L625:
	vmovsd	.LC36(%rip), %xmm0
	vmovsd	.LC38(%rip), %xmm6
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	addq	$8, %r13
	vfmadd132sd	.LC37(%rip), %xmm6, %xmm0
	vmovsd	%xmm0, -8(%r13)
	cmpq	%r13, %rsi
	jne	.L629
.L626:
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
	vmovq	.LC11(%rip), %xmm2
	vdivsd	%xmm1, %xmm3, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC15(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	ja	.L650
.L630:
	movq	40(%rsp), %rsi
	cmpq	$-3, %rsi
	je	.L632
	movq	$-3, %rdi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L632:
	vmovsd	.LC42(%rip), %xmm0
	movq	24(%rsp), %rcx
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movl	$256, %edi
	call	_Z13prod_realreallldPKdRdRl.constprop.0
	vmovsd	32(%rsp), %xmm1
	vmovsd	.LC43(%rip), %xmm3
	vmovq	.LC11(%rip), %xmm2
	vdivsd	%xmm1, %xmm3, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC15(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	ja	.L651
.L633:
	movq	40(%rsp), %rsi
	cmpq	$101, %rsi
	jne	.L652
	movq	2552(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L647
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
.L652:
	.cfi_restore_state
	movq	2552(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L647
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
.L651:
	.cfi_restore_state
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
	jmp	.L633
.L650:
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
	jmp	.L630
.L647:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_Z10test_vprodv
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	_Z13test_realrealv
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
.L656:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	leaq	(%rax,%rcx), %rdx
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
	cmpq	$312, %rcx
	jne	.L656
	leaq	_ZL3gen(%rip), %r12
	movl	$2504, %edx
	movq	%r12, %rdi
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	cmpl	$3, %r13d
	je	.L657
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
.L655:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L761
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
.L657:
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
	jne	.L727
	movq	-2608(%rbp), %r15
.L659:
	movq	-2760(%rbp), %rdi
	movq	%rbx, %rdx
	movl	$32, %esi
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L728
	movq	-2608(%rbp), %r13
.L660:
	movq	.LC15(%rip), %rax
	movq	-2688(%rbp), %r14
	vmovq	%rax, %xmm1
	movq	.LC38(%rip), %rax
	movq	%r15, %rsi
	vmovq	%rax, %xmm0
	movq	%r14, %rdi
	call	_Z21init_random_positionslddPd
	movq	.LC15(%rip), %rax
	movq	%r13, %rsi
	vmovq	%rax, %xmm1
	movq	.LC38(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC15(%rip), %rax
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
	jle	.L661
	testq	%r14, %r14
	jle	.L661
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
.L662:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -2672(%rbp)
	vmovsd	%xmm7, -2680(%rbp)
	jmp	.L670
	.p2align 4,,10
	.p2align 3
.L763:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L664:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcomisd	.LC15(%rip), %xmm0
	jnb	.L665
	vmovsd	-2672(%rbp), %xmm6
	vmovsd	.LC38(%rip), %xmm7
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm7, %xmm0
.L759:
	movq	-2704(%rbp), %r8
	movq	-2696(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L666
	movq	%r14, %rax
.L670:
	cmpq	$311, %rax
	ja	.L762
.L668:
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
	jns	.L763
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L664
	.p2align 4,,10
	.p2align 3
.L762:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L668
	.p2align 4,,10
	.p2align 3
.L666:
	incq	-2712(%rbp)
	movq	-2712(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L662
	movq	-2720(%rbp), %r13
	movq	-2728(%rbp), %rbx
.L661:
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
	jne	.L764
.L671:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC55(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC15(%rip), %rax
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
	jle	.L672
	cmpq	$0, -2688(%rbp)
	jle	.L672
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
.L673:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -2672(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -2680(%rbp)
	jmp	.L686
	.p2align 4,,10
	.p2align 3
.L768:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L675:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmovsd	.LC15(%rip), %xmm7
	vmovsd	.LC36(%rip), %xmm6
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-2672(%rbp), %xmm6
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vmovsd	.LC38(%rip), %xmm6
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L765
.L680:
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
	js	.L681
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L682:
	vaddsd	-2648(%rbp), %xmm1, %xmm1
	vmulsd	-2656(%rbp), %xmm1, %xmm1
	vcomisd	.LC15(%rip), %xmm1
	jnb	.L683
	vmovsd	-2672(%rbp), %xmm4
	movq	-2704(%rbp), %r9
	vfmadd132sd	-2680(%rbp), %xmm4, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L760:
	vmovsd	.LC38(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L766
.L686:
	cmpq	$311, %r11
	ja	.L767
.L679:
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
	jns	.L768
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L675
	.p2align 4,,10
	.p2align 3
.L681:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L682
	.p2align 4,,10
	.p2align 3
.L765:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2712(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-2712(%rbp), %xmm0
	jmp	.L680
	.p2align 4,,10
	.p2align 3
.L767:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L679
	.p2align 4,,10
	.p2align 3
.L766:
	incq	-2720(%rbp)
	movq	-2720(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L673
	movq	-2728(%rbp), %rbx
.L672:
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
	jne	.L769
.L687:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC55(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC15(%rip), %rax
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
	jle	.L688
	cmpq	$0, -2688(%rbp)
	jle	.L688
	movq	.LC15(%rip), %rax
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
	vmovsd	.LC12(%rip), %xmm3
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	%xmm6, -2656(%rbp)
	vmovsd	%xmm7, -2664(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	salq	$37, %rsi
	movq	%r10, %r14
	.p2align 4,,10
	.p2align 3
.L689:
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
.L702:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L770
.L695:
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
	js	.L690
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L691:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC15(%rip), %xmm2
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
	jmp	.L700
	.p2align 4,,10
	.p2align 3
.L772:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L698:
	addq	$8, %rax
	cmpq	%rax, %r14
	je	.L771
.L700:
	vmovsd	0(%r13,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L772
	vcomisd	%xmm0, %xmm4
	jbe	.L698
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r14
	jne	.L700
.L771:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L701
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r10
.L701:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L702
	incq	-2728(%rbp)
	movq	%r14, %rbx
	movq	%r10, %r14
	movq	-2728(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L689
.L688:
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
	jne	.L773
.L703:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC55(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC15(%rip), %rax
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
	jle	.L704
	cmpq	$0, -2688(%rbp)
	jle	.L704
	movq	.LC15(%rip), %rax
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
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	.LC12(%rip), %xmm3
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
.L705:
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
.L723:
	cmpq	$311, %rdi
	ja	.L774
.L711:
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
	js	.L706
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L707:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC15(%rip), %xmm2
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC36(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC38(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L775
.L712:
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
	js	.L713
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L714:
	vaddsd	-2648(%rbp), %xmm2, %xmm2
	vmovsd	.LC15(%rip), %xmm1
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
	jmp	.L721
	.p2align 4,,10
	.p2align 3
.L777:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L719:
	addq	$8, %rax
	cmpq	%rax, %r13
	je	.L776
.L721:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L777
	vcomisd	%xmm0, %xmm4
	jbe	.L719
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r13
	jne	.L721
.L776:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L722
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r15
.L722:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L723
	incq	-2752(%rbp)
	movq	%r13, %rbx
	movq	%r15, %r13
	movq	-2752(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L705
	movq	-2768(%rbp), %r13
	movq	-2672(%rbp), %r15
.L704:
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
	jne	.L778
.L724:
	movq	%r12, %rdi
	vmovsd	%xmm1, %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC55(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	testq	%r15, %r15
	je	.L725
	movq	%r15, %rdi
	call	_ZdaPv@PLT
.L725:
	xorl	%r12d, %r12d
	testq	%r13, %r13
	je	.L655
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	jmp	.L655
	.p2align 4,,10
	.p2align 3
.L713:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L714
	.p2align 4,,10
	.p2align 3
.L706:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L707
	.p2align 4,,10
	.p2align 3
.L690:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L691
	.p2align 4,,10
	.p2align 3
.L770:
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
	jmp	.L695
	.p2align 4,,10
	.p2align 3
.L775:
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
	jmp	.L712
	.p2align 4,,10
	.p2align 3
.L774:
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
	jmp	.L711
	.p2align 4,,10
	.p2align 3
.L683:
	vmovsd	-2680(%rbp), %xmm1
	vmovsd	-2672(%rbp), %xmm7
	movq	-2704(%rbp), %r9
	vfmadd132sd	.LC36(%rip), %xmm7, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L760
	.p2align 4,,10
	.p2align 3
.L665:
	vmovsd	.LC36(%rip), %xmm0
	vmovsd	-2672(%rbp), %xmm3
	vmovsd	.LC38(%rip), %xmm4
	vfmadd132sd	-2680(%rbp), %xmm3, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm4, %xmm0
	jmp	.L759
.L727:
	xorl	%r15d, %r15d
	jmp	.L659
.L778:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L724
.L773:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L703
.L769:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L687
.L764:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L671
.L728:
	xorl	%r13d, %r13d
	jmp	.L660
.L761:
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
	vmovapd	.LC3(%rip), %ymm0
	movq	$5489, _ZL3gen(%rip)
	vmovapd	%ymm0, _ZL10_MM256_ONE(%rip)
	movl	$5489, %ecx
	movl	$1, %edx
	leaq	_ZL3gen(%rip), %rdi
	movabsq	$6364136223846793005, %rsi
	.p2align 4,,10
	.p2align 3
.L780:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L780
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
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC3:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC7:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC8:
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.align 32
.LC9:
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.align 32
.LC10:
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
.LC11:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.set	.LC12,.LC9
	.set	.LC13,.LC10
	.set	.LC15,.LC3
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC16:
	.long	-1998362383
	.long	1055193269
	.section	.rodata.cst32
	.align 32
.LC17:
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
.LC18:
	.long	478481221
	.long	1491110742
	.section	.rodata.cst32
	.align 32
.LC19:
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
.LC20:
	.long	0
	.long	1082310656
	.section	.rodata.cst32
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
	.set	.LC37,.LC19+24
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
	.set	.LC59,.LC7
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
