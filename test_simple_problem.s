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
.LFB9236:
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
.LFE9236:
	.size	_ZN9stopwatch4stopEv.part.0, .-_ZN9stopwatch4stopEv.part.0
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB9238:
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
.LFE9238:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
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
	je	.L18
	cmpb	$0, 56(%r13)
	je	.L14
	movsbl	67(%r13), %esi
.L15:
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
.L14:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L15
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L15
.L18:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE8796:
	.size	_Z5debugDv4_d, .-_Z5debugDv4_d
	.section	.rodata.str1.1
.LC1:
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
	leaq	.LC1(%rip), %r13
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
	je	.L25
	cmpb	$0, 56(%r13)
	je	.L21
	movsbl	67(%r13), %esi
.L22:
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
.L21:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L22
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L22
.L25:
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
	vmovapd	.LC2(%rip), %ymm0
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
	vmovapd	.LC2(%rip), %ymm2
	vmovapd	.LC3(%rip), %ymm1
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm1, %ymm2, %ymm4
	vcmppd	$2, .LC4(%rip), %ymm2, %ymm3
	vmovmskpd	%ymm4, %eax
	vmovmskpd	%ymm3, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L33
	ret
	.p2align 4,,10
	.p2align 3
.L33:
	vmulpd	%ymm1, %ymm2, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, (%rdi)
	vblendvpd	%ymm3, %ymm1, %ymm2, %ymm0
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
	vmovapd	.LC5(%rip), %ymm1
	vinsertf128	$1, %xmm1, %ymm0, %ymm2
	vperm2f128	$33, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vmovapd	.LC2(%rip), %ymm1
	vmovapd	.LC3(%rip), %ymm2
	vandnpd	%ymm0, %ymm1, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm4
	vcmppd	$2, .LC4(%rip), %ymm1, %ymm3
	vmovmskpd	%ymm4, %eax
	vmovmskpd	%ymm3, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L46
.L35:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC7(%rip), %xmm1
	vandpd	.LC6(%rip), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L45
	vmulsd	.LC8(%rip), %xmm0, %xmm0
	incq	(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	vmovsd	.LC8(%rip), %xmm2
	vcomisd	%xmm0, %xmm2
	jbe	.L34
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	(%rdi)
.L34:
	ret
	.p2align 4,,10
	.p2align 3
.L46:
	vmulpd	%ymm2, %ymm1, %ymm2
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, (%rdi)
	vblendvpd	%ymm3, %ymm2, %ymm1, %ymm0
	jmp	.L35
	.cfi_endproc
.LFE8813:
	.size	_Z18horizontal_productDv4_dRl, .-_Z18horizontal_productDv4_dRl
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC9:
	.string	"void prod_realreal(long int, long int, double, const double*, double&, long int&)"
	.section	.rodata.str1.1
.LC10:
	.string	"test_simple_problem.cpp"
.LC11:
	.string	"N % ELEMENTS_PER_LOOP == 0"
	.text
	.p2align 4
	.globl	_Z13prod_realreallldPKdRdRl
	.type	_Z13prod_realreallldPKdRdRl, @function
_Z13prod_realreallldPKdRdRl:
.LFB8814:
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
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	andq	$-32, %rsp
	testb	$31, %dil
	jne	.L166
	vmovapd	.LC12(%rip), %ymm6
	vmovq	%xmm0, %rdi
	vmovq	%rdi, %xmm5
	vmovlpd	(%rcx), %xmm6, %xmm0
	movq	%rsi, %r11
	movq	%rcx, %r10
	vinsertf128	$0x0, %xmm0, %ymm6, %ymm6
	movq	(%r8), %rcx
	movq	%rdx, %r9
	vbroadcastsd	%xmm5, %ymm0
	andq	$-32, %r11
	testq	%rbx, %rbx
	jle	.L85
	vmovapd	.LC5(%rip), %ymm13
	vmovapd	.LC2(%rip), %ymm2
	vmovapd	.LC3(%rip), %ymm1
	vmovapd	.LC4(%rip), %ymm3
	movq	%rdx, %rax
	vmovapd	%ymm13, %ymm9
	vmovapd	%ymm13, %ymm5
	vmovapd	%ymm13, %ymm8
	vmovapd	%ymm13, %ymm7
	vmovapd	%ymm13, %ymm4
	vmovapd	%ymm13, %ymm11
	vmovapd	%ymm13, %ymm10
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L58:
	cmpq	%rdx, %r11
	je	.L50
	vsubpd	(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm6, %ymm6
	vsubpd	32(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm10, %ymm10
	vsubpd	64(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm11, %ymm11
	vsubpd	96(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm4, %ymm4
	vsubpd	128(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm7, %ymm7
	vsubpd	160(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm8, %ymm8
	vsubpd	192(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm5, %ymm5
	vsubpd	224(%rax), %ymm0, %ymm12
	vmulpd	%ymm12, %ymm9, %ymm9
	testb	$-32, %dl
	jne	.L50
	vandnpd	%ymm6, %ymm2, %ymm12
	vcmppd	$13, %ymm1, %ymm12, %ymm15
	vcmppd	$2, %ymm3, %ymm12, %ymm14
	vmovmskpd	%ymm15, %r12d
	vmovmskpd	%ymm14, %r13d
	movl	%r12d, %r14d
	orl	%r13d, %r14d
	jne	.L167
.L51:
	vandnpd	%ymm10, %ymm2, %ymm12
	vcmppd	$13, %ymm1, %ymm12, %ymm15
	vcmppd	$2, %ymm3, %ymm12, %ymm14
	vmovmskpd	%ymm15, %r12d
	vmovmskpd	%ymm14, %r13d
	movl	%r12d, %r14d
	orl	%r13d, %r14d
	jne	.L168
.L52:
	vandnpd	%ymm11, %ymm2, %ymm12
	vcmppd	$13, %ymm1, %ymm12, %ymm15
	vcmppd	$2, %ymm3, %ymm12, %ymm14
	vmovmskpd	%ymm15, %r12d
	vmovmskpd	%ymm14, %r13d
	movl	%r12d, %r14d
	orl	%r13d, %r14d
	jne	.L169
.L53:
	vandnpd	%ymm4, %ymm2, %ymm12
	vcmppd	$13, %ymm1, %ymm12, %ymm15
	vcmppd	$2, %ymm3, %ymm12, %ymm14
	vmovmskpd	%ymm15, %r12d
	vmovmskpd	%ymm14, %r13d
	movl	%r12d, %r14d
	orl	%r13d, %r14d
	jne	.L170
.L54:
	vandnpd	%ymm7, %ymm2, %ymm12
	vcmppd	$13, %ymm1, %ymm12, %ymm15
	vcmppd	$2, %ymm3, %ymm12, %ymm14
	vmovmskpd	%ymm15, %r12d
	vmovmskpd	%ymm14, %r13d
	movl	%r12d, %r14d
	orl	%r13d, %r14d
	jne	.L171
.L55:
	vandnpd	%ymm8, %ymm2, %ymm12
	vcmppd	$13, %ymm1, %ymm12, %ymm15
	vcmppd	$2, %ymm3, %ymm12, %ymm14
	vmovmskpd	%ymm15, %r12d
	vmovmskpd	%ymm14, %r13d
	movl	%r12d, %r14d
	orl	%r13d, %r14d
	jne	.L172
.L56:
	vandnpd	%ymm5, %ymm2, %ymm12
	vcmppd	$13, %ymm1, %ymm12, %ymm15
	vcmppd	$2, %ymm3, %ymm12, %ymm14
	vmovmskpd	%ymm15, %r12d
	vmovmskpd	%ymm14, %r13d
	movl	%r12d, %r14d
	orl	%r13d, %r14d
	jne	.L173
.L57:
	vandnpd	%ymm9, %ymm2, %ymm12
	vcmppd	$13, %ymm1, %ymm12, %ymm15
	vcmppd	$2, %ymm3, %ymm12, %ymm14
	vmovmskpd	%ymm15, %r12d
	vmovmskpd	%ymm14, %r13d
	movl	%r12d, %r14d
	orl	%r13d, %r14d
	jne	.L174
.L50:
	addq	$32, %rdx
	addq	$256, %rax
	cmpq	%rdx, %rbx
	jg	.L58
.L49:
	vandnpd	%ymm6, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm14
	vcmppd	$2, %ymm3, %ymm0, %ymm12
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L175
.L59:
	vandnpd	%ymm10, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm14
	vcmppd	$2, %ymm3, %ymm0, %ymm12
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L176
.L60:
	vandnpd	%ymm11, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm14
	vcmppd	$2, %ymm3, %ymm0, %ymm12
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L177
.L61:
	vandnpd	%ymm4, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm14
	vcmppd	$2, %ymm3, %ymm0, %ymm12
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L178
.L62:
	vandnpd	%ymm7, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm14
	vcmppd	$2, %ymm3, %ymm0, %ymm12
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L179
.L63:
	vandnpd	%ymm8, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm14
	vcmppd	$2, %ymm3, %ymm0, %ymm12
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L180
.L64:
	vandnpd	%ymm5, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm14
	vcmppd	$2, %ymm3, %ymm0, %ymm12
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L181
.L65:
	vandnpd	%ymm9, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm14
	vcmppd	$2, %ymm3, %ymm0, %ymm12
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L182
.L66:
	vmulpd	%ymm4, %ymm11, %ymm4
	vandnpd	%ymm4, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm12
	vcmppd	$2, %ymm3, %ymm0, %ymm11
	vmovmskpd	%ymm12, %eax
	vmovmskpd	%ymm11, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L183
.L67:
	vmulpd	%ymm10, %ymm6, %ymm6
	vandnpd	%ymm6, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm11
	vcmppd	$2, %ymm3, %ymm0, %ymm10
	vmovmskpd	%ymm11, %eax
	vmovmskpd	%ymm10, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L184
.L68:
	vmulpd	%ymm6, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm10
	vcmppd	$2, %ymm3, %ymm0, %ymm6
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L185
.L69:
	vmulpd	%ymm9, %ymm5, %ymm5
	vandnpd	%ymm5, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm9
	vcmppd	$2, %ymm3, %ymm0, %ymm6
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L186
.L70:
	vmulpd	%ymm8, %ymm7, %ymm7
	vandnpd	%ymm7, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm8
	vcmppd	$2, %ymm3, %ymm0, %ymm6
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L187
.L71:
	vmulpd	%ymm7, %ymm5, %ymm5
	vandnpd	%ymm5, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm7
	vcmppd	$2, %ymm3, %ymm0, %ymm6
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L188
.L72:
	vmulpd	%ymm5, %ymm4, %ymm4
	vandnpd	%ymm4, %ymm2, %ymm0
	vcmppd	$13, %ymm1, %ymm0, %ymm6
	vcmppd	$2, %ymm3, %ymm0, %ymm5
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L189
.L73:
	vinsertf128	$1, %xmm13, %ymm4, %ymm0
	vperm2f128	$33, %ymm13, %ymm4, %ymm4
	vmulpd	%ymm4, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm1, %ymm2, %ymm4
	vcmppd	$2, %ymm3, %ymm2, %ymm3
	vmovmskpd	%ymm4, %eax
	vmovmskpd	%ymm3, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L190
.L74:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	.LC6(%rip), %xmm2
	vmovsd	.LC7(%rip), %xmm1
	vmovsd	.LC8(%rip), %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L191
	vcomisd	%xmm0, %xmm3
	jbe	.L77
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rcx
.L77:
	leaq	31(%r11), %rdx
	movslq	%r11d, %rax
	vmovsd	%xmm0, (%r10)
	cmpq	%rax, %rdx
	jl	.L79
	addq	$32, %r11
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L192:
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%rcx
	vmovsd	%xmm0, (%r10)
.L80:
	incq	%rax
	cmpq	%rax, %r11
	je	.L79
.L84:
	cmpq	%rax, %rsi
	je	.L80
	vmovq	%rdi, %xmm7
	vsubsd	(%r9,%rax,8), %xmm7, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%r10), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L192
	vcomisd	%xmm0, %xmm3
	ja	.L83
	incq	%rax
	vmovsd	%xmm0, (%r10)
	cmpq	%rax, %r11
	jne	.L84
.L79:
	movq	%rcx, (%r8)
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
.L191:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%rcx
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L83:
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rcx
	vmovsd	%xmm0, (%r10)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L174:
	vmulpd	%ymm1, %ymm12, %ymm9
	popcntl	%r12d, %r12d
	popcntl	%r13d, %r13d
	subl	%r13d, %r12d
	movslq	%r12d, %r12
	addq	%r12, %rcx
	vblendvpd	%ymm14, %ymm9, %ymm12, %ymm9
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L173:
	vmulpd	%ymm1, %ymm12, %ymm5
	popcntl	%r12d, %r12d
	popcntl	%r13d, %r13d
	subl	%r13d, %r12d
	movslq	%r12d, %r12
	addq	%r12, %rcx
	vblendvpd	%ymm14, %ymm5, %ymm12, %ymm5
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L172:
	vmulpd	%ymm1, %ymm12, %ymm8
	popcntl	%r12d, %r12d
	popcntl	%r13d, %r13d
	subl	%r13d, %r12d
	movslq	%r12d, %r12
	addq	%r12, %rcx
	vblendvpd	%ymm14, %ymm8, %ymm12, %ymm8
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L171:
	vmulpd	%ymm1, %ymm12, %ymm7
	popcntl	%r12d, %r12d
	popcntl	%r13d, %r13d
	subl	%r13d, %r12d
	movslq	%r12d, %r12
	addq	%r12, %rcx
	vblendvpd	%ymm14, %ymm7, %ymm12, %ymm7
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L170:
	vmulpd	%ymm1, %ymm12, %ymm4
	popcntl	%r12d, %r12d
	popcntl	%r13d, %r13d
	subl	%r13d, %r12d
	movslq	%r12d, %r12
	addq	%r12, %rcx
	vblendvpd	%ymm14, %ymm4, %ymm12, %ymm4
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L169:
	vmulpd	%ymm1, %ymm12, %ymm11
	popcntl	%r12d, %r12d
	popcntl	%r13d, %r13d
	subl	%r13d, %r12d
	movslq	%r12d, %r12
	addq	%r12, %rcx
	vblendvpd	%ymm14, %ymm11, %ymm12, %ymm11
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L168:
	vmulpd	%ymm1, %ymm12, %ymm10
	popcntl	%r12d, %r12d
	popcntl	%r13d, %r13d
	subl	%r13d, %r12d
	movslq	%r12d, %r12
	addq	%r12, %rcx
	vblendvpd	%ymm14, %ymm10, %ymm12, %ymm10
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L167:
	vmulpd	%ymm1, %ymm12, %ymm6
	popcntl	%r12d, %r12d
	popcntl	%r13d, %r13d
	subl	%r13d, %r12d
	movslq	%r12d, %r12
	addq	%r12, %rcx
	vblendvpd	%ymm14, %ymm6, %ymm12, %ymm6
	jmp	.L51
.L85:
	vmovapd	.LC5(%rip), %ymm13
	vmovapd	.LC2(%rip), %ymm2
	vmovapd	.LC3(%rip), %ymm1
	vmovapd	.LC4(%rip), %ymm3
	vmovapd	%ymm13, %ymm9
	vmovapd	%ymm13, %ymm5
	vmovapd	%ymm13, %ymm8
	vmovapd	%ymm13, %ymm7
	vmovapd	%ymm13, %ymm4
	vmovapd	%ymm13, %ymm11
	vmovapd	%ymm13, %ymm10
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L177:
	vmulpd	%ymm1, %ymm0, %ymm11
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm12, %ymm11, %ymm0, %ymm11
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L178:
	vmulpd	%ymm1, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm12, %ymm4, %ymm0, %ymm4
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L179:
	vmulpd	%ymm1, %ymm0, %ymm7
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm12, %ymm7, %ymm0, %ymm7
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L180:
	vmulpd	%ymm1, %ymm0, %ymm8
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm12, %ymm8, %ymm0, %ymm8
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L175:
	vmulpd	%ymm1, %ymm0, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm12, %ymm6, %ymm0, %ymm6
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L176:
	vmulpd	%ymm1, %ymm0, %ymm10
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm12, %ymm10, %ymm0, %ymm10
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L189:
	vmulpd	%ymm1, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm5, %ymm4, %ymm0, %ymm4
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L190:
	vmulpd	%ymm1, %ymm2, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm3, %ymm1, %ymm2, %ymm0
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L181:
	vmulpd	%ymm1, %ymm0, %ymm5
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm12, %ymm5, %ymm0, %ymm5
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L182:
	vmulpd	%ymm1, %ymm0, %ymm9
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm12, %ymm9, %ymm0, %ymm9
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L183:
	vmulpd	%ymm1, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm11, %ymm4, %ymm0, %ymm4
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L184:
	vmulpd	%ymm1, %ymm0, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm10, %ymm6, %ymm0, %ymm6
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L185:
	vmulpd	%ymm1, %ymm0, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm6, %ymm4, %ymm0, %ymm4
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L186:
	vmulpd	%ymm1, %ymm0, %ymm5
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm6, %ymm5, %ymm0, %ymm5
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L187:
	vmulpd	%ymm1, %ymm0, %ymm7
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm6, %ymm7, %ymm0, %ymm7
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L188:
	vmulpd	%ymm1, %ymm0, %ymm5
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	addq	%rax, %rcx
	vblendvpd	%ymm6, %ymm5, %ymm0, %ymm5
	jmp	.L72
.L166:
	leaq	.LC9(%rip), %rcx
	movl	$189, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE8814:
	.size	_Z13prod_realreallldPKdRdRl, .-_Z13prod_realreallldPKdRdRl
	.p2align 4
	.globl	_Z16prod_realcomplexldPKdS0_RdRl
	.type	_Z16prod_realcomplexldPKdS0_RdRl, @function
_Z16prod_realcomplexldPKdS0_RdRl:
.LFB8815:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rdx, %rdi
	testq	%rax, %rax
	jle	.L204
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC7(%rip), %xmm4
	vmovsd	.LC8(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L205:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L197:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L204
.L199:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L205
	vcomisd	%xmm1, %xmm5
	ja	.L198
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L199
.L204:
	ret
	.p2align 4,,10
	.p2align 3
.L198:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L197
	.cfi_endproc
.LFE8815:
	.size	_Z16prod_realcomplexldPKdS0_RdRl, .-_Z16prod_realcomplexldPKdS0_RdRl
	.p2align 4
	.globl	_Z16prod_complexreallddPKdRdRl
	.type	_Z16prod_complexreallddPKdRdRl, @function
_Z16prod_complexreallddPKdRdRl:
.LFB8816:
	.cfi_startproc
	endbr64
	vmulsd	%xmm1, %xmm1, %xmm1
	testq	%rdi, %rdi
	jle	.L217
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC7(%rip), %xmm4
	vmovsd	.LC8(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L218:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L210:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L217
.L212:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L218
	vcomisd	%xmm2, %xmm5
	ja	.L211
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L212
.L217:
	ret
	.p2align 4,,10
	.p2align 3
.L211:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L210
	.cfi_endproc
.LFE8816:
	.size	_Z16prod_complexreallddPKdRdRl, .-_Z16prod_complexreallddPKdRdRl
	.p2align 4
	.globl	_Z19prod_complexcomplexllddPKdS0_RdRl
	.type	_Z19prod_complexcomplexllddPKdS0_RdRl, @function
_Z19prod_complexcomplexllddPKdS0_RdRl:
.LFB8817:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	movq	%rdx, %rsi
	testq	%rax, %rax
	jle	.L228
	vmovsd	(%r8), %xmm2
	vmovsd	.LC7(%rip), %xmm5
	vmovsd	.LC8(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L227
	.p2align 4,,10
	.p2align 3
.L241:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L225:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L228
.L227:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L241
	vcomisd	%xmm2, %xmm6
	ja	.L226
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L227
.L228:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L242
	vmovsd	(%r8), %xmm2
	vmovsd	.LC7(%rip), %xmm5
	vmovsd	.LC8(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L233
	.p2align 4,,10
	.p2align 3
.L244:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L231:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L243
.L233:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L244
	vcomisd	%xmm2, %xmm6
	ja	.L232
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L233
.L243:
	ret
	.p2align 4,,10
	.p2align 3
.L226:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L225
	.p2align 4,,10
	.p2align 3
.L232:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L242:
	ret
	.cfi_endproc
.LFE8817:
	.size	_Z19prod_complexcomplexllddPKdS0_RdRl, .-_Z19prod_complexcomplexllddPKdS0_RdRl
	.section	.text._ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv:
.LFB9227:
	.cfi_startproc
	endbr64
	vmovdqa	.LC13(%rip), %ymm3
	vmovdqa	.LC14(%rip), %ymm4
	vmovdqa	.LC15(%rip), %ymm5
	vmovdqa	.LC16(%rip), %ymm2
	movq	%rdi, %rax
	leaq	1248(%rdi), %rcx
	movq	%rdi, %rdx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L246:
	vpand	8(%rdx), %ymm4, %ymm1
	vpand	(%rdx), %ymm3, %ymm0
	addq	$32, %rdx
	vpor	%ymm1, %ymm0, %ymm0
	vpsrlq	$1, %ymm0, %ymm1
	vpand	%ymm5, %ymm0, %ymm0
	vpxor	1216(%rdx), %ymm1, %ymm1
	vpcmpeqq	%ymm7, %ymm0, %ymm0
	vpxor	%ymm2, %ymm1, %ymm6
	vpblendvb	%ymm0, %ymm1, %ymm6, %ymm0
	vmovdqu	%ymm0, -32(%rdx)
	cmpq	%rcx, %rdx
	jne	.L246
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L247:
	vpand	8(%rdx), %ymm4, %ymm1
	vpand	(%rdx), %ymm3, %ymm0
	addq	$32, %rdx
	vpor	%ymm1, %ymm0, %ymm0
	vpsrlq	$1, %ymm0, %ymm1
	vpand	%ymm5, %ymm0, %ymm0
	vpxor	-1280(%rdx), %ymm1, %ymm1
	vpcmpeqq	%ymm7, %ymm0, %ymm0
	vpxor	%ymm2, %ymm1, %ymm6
	vpblendvb	%ymm0, %ymm1, %ymm6, %ymm0
	vmovdqu	%ymm0, -32(%rdx)
	cmpq	%rdx, %rcx
	jne	.L247
	vmovdqa	.LC17(%rip), %xmm0
	vmovdqa	.LC18(%rip), %xmm1
	vpand	2464(%rax), %xmm0, %xmm0
	vpand	2472(%rax), %xmm1, %xmm1
	movq	2488(%rax), %rsi
	vpor	%xmm1, %xmm0, %xmm0
	movq	2480(%rax), %rdx
	vpsrlq	$1, %xmm0, %xmm1
	movq	%rsi, %rcx
	vpand	.LC19(%rip), %xmm0, %xmm0
	andl	$2147483647, %ecx
	vpxor	1216(%rax), %xmm1, %xmm1
	andq	$-2147483648, %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	orq	%rcx, %rdx
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	movq	%rdx, %rcx
	vpxor	.LC20(%rip), %xmm1, %xmm2
	shrq	%rcx
	vpblendvb	%xmm0, %xmm1, %xmm2, %xmm0
	xorq	1232(%rax), %rcx
	andl	$1, %edx
	vmovdqu	%xmm0, 2464(%rax)
	je	.L251
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L251:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L250
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L250:
	movq	%rcx, 2488(%rax)
	movq	$0, 2496(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE9227:
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
	jle	.L268
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
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L270:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L257:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC22(%rip), %xmm0, %xmm0
	vcomisd	.LC23(%rip), %xmm0
	jnb	.L258
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L264
.L259:
	movq	%rdx, %rax
.L263:
	cmpq	$311, %rax
	ja	.L269
.L262:
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
	jns	.L270
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L269:
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
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L258:
	vmovsd	.LC24(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L259
.L264:
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
.L268:
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
.LC25:
	.string	"M N\n"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"M number of runs, N number of particles\n"
	.section	.rodata.str1.1
.LC27:
	.string	"example: "
.LC28:
	.string	" 10 10000\n"
.LC29:
	.string	" product: "
.LC31:
	.string	" exponent: "
.LC35:
	.string	"prod_realreal: orod="
.LC36:
	.string	" exponent="
.LC37:
	.string	" timing="
.LC38:
	.string	" seconds\n"
.LC39:
	.string	"prod_complexcomplex: orod="
.LC40:
	.string	"prod_realcomplex: orod="
.LC41:
	.string	"prod_complexreal: orod="
	.section	.text.unlikely,"ax",@progbits
.LCOLDB42:
	.section	.text.startup,"ax",@progbits
.LHOTB42:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8818:
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
	subq	$224, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$3, %edi
	je	.L272
	leaq	_ZSt4cout(%rip), %r12
	movq	(%rsi), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC25(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC26(%rip), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$9, %edx
	leaq	.LC27(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC28(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %eax
.L271:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L366
	addq	$224, %rsp
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
.L272:
	.cfi_restore_state
	movl	$10, %edx
	leaq	.LC29(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	$0, -136(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	.LC30(%rip), %ymm0
	leaq	-136(%rbp), %rdi
	call	_Z18horizontal_productDv4_dRl
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$11, %edx
	leaq	.LC31(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-136(%rbp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movslq	%eax, %r12
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r12, -240(%rbp)
	call	strtol@PLT
	movslq	%eax, %r14
	movabsq	$1152921504606846975, %rax
	movq	%r14, -192(%rbp)
	cmpq	%rax, %r14
	ja	.L274
	leaq	0(,%r14,8), %rbx
	movq	%rbx, %rdi
	call	_Znam@PLT
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	_Znam@PLT
	movq	%rax, %r13
	movq	.LC23(%rip), %rax
	movq	%r15, %rsi
	vmovq	%rax, %xmm1
	movq	.LC32(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC23(%rip), %rax
	movq	%r13, %rsi
	vmovq	%rax, %xmm1
	movq	.LC32(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC23(%rip), %rax
	movq	$0, -120(%rbp)
	movq	%rax, -128(%rbp)
	call	clock@PLT
	movq	%rax, -112(%rbp)
	movq	.LC33(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -72(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	testq	%r12, %r12
	jle	.L275
	testq	%r14, %r14
	jle	.L275
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	-120(%rbp), %rax
	movq	%rax, -208(%rbp)
	vmovsd	%xmm4, -152(%rbp)
	leaq	-128(%rbp), %rax
	vmovsd	.LC22(%rip), %xmm4
	movq	%rax, -200(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	%xmm4, -160(%rbp)
	movq	$0, -216(%rbp)
	vmovsd	.LC34(%rip), %xmm4
	movq	%rax, -248(%rbp)
	movq	%r13, -232(%rbp)
	movq	%rbx, -224(%rbp)
	movq	-192(%rbp), %rbx
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm4, -168(%rbp)
	.p2align 4,,10
	.p2align 3
.L276:
	movq	-248(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -176(%rbp)
	vmovsd	%xmm7, -184(%rbp)
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L368:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L278:
	vaddsd	-152(%rbp), %xmm0, %xmm0
	vmulsd	-160(%rbp), %xmm0, %xmm0
	vcomisd	.LC23(%rip), %xmm0
	jnb	.L279
	vmovsd	-176(%rbp), %xmm6
	vmovsd	.LC32(%rip), %xmm7
	vfmadd132sd	-184(%rbp), %xmm6, %xmm0
	vfmadd132sd	-168(%rbp), %xmm7, %xmm0
.L364:
	movq	-208(%rbp), %r8
	movq	-200(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L280
	movq	%r14, %rax
.L284:
	cmpq	$311, %rax
	ja	.L367
.L282:
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
	jns	.L368
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L278
	.p2align 4,,10
	.p2align 3
.L280:
	incq	-216(%rbp)
	movq	-216(%rbp), %rax
	cmpq	%rax, -240(%rbp)
	jne	.L276
	movq	-224(%rbp), %rbx
	movq	-232(%rbp), %r13
.L275:
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -264(%rbp)
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC35(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC37(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L369
.L285:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC38(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC23(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -128(%rbp)
	movq	$0, -120(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	cmpq	$0, -240(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L286
	cmpq	$0, -192(%rbp)
	jle	.L286
	leaq	-120(%rbp), %rax
	movq	%rax, -208(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC22(%rip), %xmm4
	vmovsd	.LC34(%rip), %xmm6
	movq	$0, -224(%rbp)
	movq	%rax, -248(%rbp)
	movq	%rbx, -232(%rbp)
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	-192(%rbp), %rbx
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm3, -152(%rbp)
	vmovsd	%xmm4, -160(%rbp)
	vmovsd	%xmm6, -168(%rbp)
	.p2align 4,,10
	.p2align 3
.L287:
	movq	-248(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -176(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -184(%rbp)
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L373:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L289:
	vaddsd	-152(%rbp), %xmm0, %xmm0
	vmovsd	.LC23(%rip), %xmm7
	vmovsd	.LC24(%rip), %xmm6
	vmulsd	-160(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-176(%rbp), %xmm6
	vfmadd132sd	-184(%rbp), %xmm6, %xmm0
	vmovsd	.LC32(%rip), %xmm6
	vfmadd132sd	-168(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L370
.L294:
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
	js	.L295
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L296:
	vaddsd	-152(%rbp), %xmm1, %xmm1
	vmulsd	-160(%rbp), %xmm1, %xmm1
	vcomisd	.LC23(%rip), %xmm1
	jnb	.L297
	vmovsd	-176(%rbp), %xmm4
	movq	-208(%rbp), %r9
	vfmadd132sd	-184(%rbp), %xmm4, %xmm1
	movq	-200(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L365:
	vmovsd	.LC32(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-168(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L371
.L300:
	cmpq	$311, %r11
	ja	.L372
.L293:
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
	jns	.L373
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L289
	.p2align 4,,10
	.p2align 3
.L371:
	incq	-224(%rbp)
	movq	-224(%rbp), %rax
	cmpq	%rax, -240(%rbp)
	jne	.L287
	movq	-232(%rbp), %rbx
.L286:
	movq	-264(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC39(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC37(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L374
.L301:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC38(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC23(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -128(%rbp)
	movq	$0, -120(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	cmpq	$0, -240(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L302
	cmpq	$0, -192(%rbp)
	jle	.L302
	movq	.LC23(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC22(%rip), %xmm6
	vmovsd	.LC34(%rip), %xmm7
	movq	$0, -232(%rbp)
	movq	%rax, -248(%rbp)
	xorl	%r10d, %r10d
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm4, -152(%rbp)
	movl	$134201207, %esi
	vmovsd	.LC7(%rip), %xmm3
	vmovsd	.LC8(%rip), %xmm4
	vmovsd	%xmm6, -160(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	salq	$37, %rsi
	movq	%r10, %r14
	movq	%r12, %r11
	.p2align 4,,10
	.p2align 3
.L303:
	movq	-248(%rbp), %rax
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
.L316:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L375
.L309:
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
	js	.L304
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L305:
	vaddsd	-152(%rbp), %xmm5, %xmm5
	vmovsd	.LC23(%rip), %xmm2
	vmovsd	.LC24(%rip), %xmm1
	vmulsd	-160(%rbp), %xmm5, %xmm5
	movq	%r12, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC32(%rip), %xmm1
	vfmadd132sd	-168(%rbp), %xmm1, %xmm5
	jmp	.L314
	.p2align 4,,10
	.p2align 3
.L377:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L312:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L376
.L314:
	vmovsd	0(%r13,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L377
	vcomisd	%xmm0, %xmm4
	jbe	.L312
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L314
.L376:
	vmovsd	%xmm0, -128(%rbp)
	testb	%cl, %cl
	je	.L315
	movq	%rdx, -120(%rbp)
	movq	%rdx, %r12
.L315:
	incq	%r14
	cmpq	%r14, -192(%rbp)
	jne	.L316
	incq	-232(%rbp)
	movq	%r12, %r14
	movq	-232(%rbp), %rax
	cmpq	%rax, -240(%rbp)
	jne	.L303
.L302:
	movq	-264(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC40(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC37(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L378
.L317:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC38(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC23(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -128(%rbp)
	movq	$0, -120(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	cmpq	$0, -240(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L318
	cmpq	$0, -192(%rbp)
	jle	.L318
	movq	.LC23(%rip), %rax
	vmovsd	.LC34(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC22(%rip), %xmm7
	movq	$0, -256(%rbp)
	movq	%rax, -248(%rbp)
	movq	%r15, -176(%rbp)
	addq	%r15, %rbx
	xorl	%esi, %esi
	leaq	_ZL3gen(%rip), %r12
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	%xmm3, -168(%rbp)
	vmovsd	.LC8(%rip), %xmm4
	vmovsd	.LC7(%rip), %xmm3
	movq	%r13, -272(%rbp)
	vmovsd	%xmm6, -152(%rbp)
	vmovsd	%xmm7, -160(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	movabsq	$-2270628950310912, %r14
	movq	%rsi, %r13
	xchgq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L319:
	movq	-248(%rbp), %rax
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
.L337:
	cmpq	$311, %rdi
	ja	.L379
.L325:
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
	js	.L320
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L321:
	vaddsd	-152(%rbp), %xmm5, %xmm5
	vmovsd	.LC23(%rip), %xmm2
	vmulsd	-160(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC24(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC32(%rip), %xmm1
	vfmadd132sd	-168(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L380
.L326:
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
	js	.L327
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L328:
	vaddsd	-152(%rbp), %xmm2, %xmm2
	vmovsd	.LC23(%rip), %xmm1
	vmovsd	.LC32(%rip), %xmm9
	vmulsd	-160(%rbp), %xmm2, %xmm2
	movq	-176(%rbp), %rax
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC24(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	-168(%rbp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L382:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L333:
	addq	$8, %rax
	cmpq	%rax, %r12
	je	.L381
.L335:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L382
	vcomisd	%xmm0, %xmm4
	jbe	.L333
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r12
	jne	.L335
.L381:
	vmovsd	%xmm0, -128(%rbp)
	testb	%cl, %cl
	je	.L336
	movq	%rdx, -120(%rbp)
	movq	%rdx, %rbx
.L336:
	incq	%r13
	cmpq	%r13, -192(%rbp)
	jne	.L337
	incq	-256(%rbp)
	movq	%rbx, %r13
	movq	%r15, %rbx
	movq	-256(%rbp), %rax
	cmpq	%rax, -240(%rbp)
	jne	.L319
	movq	-176(%rbp), %r15
	movq	-272(%rbp), %r13
.L318:
	movq	-264(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC41(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC37(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L383
.L338:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC38(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZdaPv@PLT
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L271
	.p2align 4,,10
	.p2align 3
.L304:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L305
	.p2align 4,,10
	.p2align 3
.L320:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L321
	.p2align 4,,10
	.p2align 3
.L327:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L295:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L367:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L282
	.p2align 4,,10
	.p2align 3
.L380:
	movq	%r15, %rdi
	vmovsd	%xmm0, -232(%rbp)
	vmovsd	%xmm6, -224(%rbp)
	vmovsd	%xmm4, -216(%rbp)
	vmovsd	%xmm3, -208(%rbp)
	vmovsd	%xmm7, -200(%rbp)
	vmovsd	%xmm5, -184(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	-232(%rbp), %xmm0
	vmovsd	-224(%rbp), %xmm6
	vmovsd	-216(%rbp), %xmm4
	vmovsd	-208(%rbp), %xmm3
	vmovsd	-200(%rbp), %xmm7
	vmovsd	-184(%rbp), %xmm5
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L370:
	movq	%r12, %rdi
	vmovsd	%xmm0, -216(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-216(%rbp), %xmm0
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L375:
	movq	%r11, %rdi
	movq	%r11, -176(%rbp)
	vmovsd	%xmm0, -224(%rbp)
	vmovsd	%xmm6, -216(%rbp)
	vmovsd	%xmm4, -208(%rbp)
	vmovsd	%xmm3, -200(%rbp)
	vmovsd	%xmm7, -184(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	-224(%rbp), %xmm0
	vmovsd	-216(%rbp), %xmm6
	vmovsd	-208(%rbp), %xmm4
	vmovsd	-200(%rbp), %xmm3
	vmovsd	-184(%rbp), %xmm7
	movq	-176(%rbp), %r11
	movabsq	$-2270628950310912, %rsi
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L309
	.p2align 4,,10
	.p2align 3
.L379:
	movq	%r15, %rdi
	vmovsd	%xmm0, -224(%rbp)
	vmovsd	%xmm6, -216(%rbp)
	vmovsd	%xmm4, -208(%rbp)
	vmovsd	%xmm3, -200(%rbp)
	vmovsd	%xmm7, -184(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdi
	vmovsd	-224(%rbp), %xmm0
	vmovsd	-216(%rbp), %xmm6
	vmovsd	-208(%rbp), %xmm4
	vmovsd	-200(%rbp), %xmm3
	vmovsd	-184(%rbp), %xmm7
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L372:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L293
	.p2align 4,,10
	.p2align 3
.L279:
	vmovsd	.LC24(%rip), %xmm0
	vmovsd	-176(%rbp), %xmm3
	vmovsd	.LC32(%rip), %xmm4
	vfmadd132sd	-184(%rbp), %xmm3, %xmm0
	vfmadd132sd	-168(%rbp), %xmm4, %xmm0
	jmp	.L364
	.p2align 4,,10
	.p2align 3
.L297:
	vmovsd	-184(%rbp), %xmm1
	vmovsd	-176(%rbp), %xmm7
	movq	-208(%rbp), %r9
	vfmadd132sd	.LC24(%rip), %xmm7, %xmm1
	movq	-200(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L365
.L383:
	vmovsd	%xmm1, -152(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-152(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L338
.L378:
	vmovsd	%xmm1, -152(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-152(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L317
.L374:
	vmovsd	%xmm1, -152(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-152(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L301
.L369:
	vmovsd	%xmm1, -152(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-152(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L285
.L366:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8818:
.L274:
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
.LFE8818:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE42:
	.section	.text.startup
.LHOTE42:
	.p2align 4
	.type	_GLOBAL__sub_I__Z21init_random_positionslddPd, @function
_GLOBAL__sub_I__Z21init_random_positionslddPd:
.LFB9233:
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
.L385:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L385
	vmovapd	.LC43(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9233:
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
.LC2:
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.align 32
.LC3:
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.align 32
.LC4:
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.align 32
.LC5:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.set	.LC7,.LC3
	.set	.LC8,.LC4
	.section	.rodata.cst32
	.align 32
.LC12:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC13:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC14:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC15:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC16:
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.set	.LC17,.LC13
	.set	.LC18,.LC14
	.set	.LC19,.LC15
	.set	.LC20,.LC16
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC22:
	.long	0
	.long	1005584384
	.set	.LC23,.LC5
	.align 8
.LC24:
	.long	-1
	.long	1072693247
	.section	.rodata.cst32
	.align 32
.LC30:
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
.LC32:
	.long	0
	.long	-1074790400
	.align 8
.LC33:
	.long	-1598689907
	.long	1051772663
	.set	.LC34,.LC30+16
	.set	.LC43,.LC12
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
