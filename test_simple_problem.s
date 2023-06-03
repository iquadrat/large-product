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
.LFB9249:
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
.LFE9249:
	.size	_ZN9stopwatch4stopEv.part.0, .-_ZN9stopwatch4stopEv.part.0
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB9254:
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
.LFE9254:
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
.LFB9250:
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
.LFE9250:
	.size	_Z13assert_approxdd.part.0, .-_Z13assert_approxdd.part.0
	.section	.rodata.str1.1
.LC3:
	.string	"Expected a == b but "
	.text
	.p2align 4
	.type	_Z9assert_eqIlEvT_S0_.part.0, @function
_Z9assert_eqIlEvT_S0_.part.0:
.LFB9251:
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
.LFE9251:
	.size	_Z9assert_eqIlEvT_S0_.part.0, .-_Z9assert_eqIlEvT_S0_.part.0
	.section	.rodata.str1.1
.LC4:
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
	leaq	.LC4(%rip), %r13
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
	je	.L32
	cmpb	$0, 56(%r13)
	je	.L28
	movsbl	67(%r13), %esi
.L29:
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
.L28:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L29
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L29
.L32:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE8796:
	.size	_Z5debugDv4_d, .-_Z5debugDv4_d
	.section	.rodata.str1.1
.LC5:
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
	leaq	.LC5(%rip), %r13
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
	je	.L39
	cmpb	$0, 56(%r13)
	je	.L35
	movsbl	67(%r13), %esi
.L36:
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
.L35:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L36
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L36
.L39:
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
	vmovapd	.LC6(%rip), %ymm0
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
	vmovapd	.LC6(%rip), %ymm2
	vmovapd	.LC7(%rip), %ymm1
	vmovapd	.LC8(%rip), %ymm3
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm1, %ymm2, %ymm5
	vcmppd	$2, %ymm3, %ymm2, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L47
	ret
	.p2align 4,,10
	.p2align 3
.L47:
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
	vmovapd	.LC9(%rip), %ymm1
	vmovapd	.LC8(%rip), %ymm3
	vinsertf128	$1, %xmm1, %ymm0, %ymm2
	vperm2f128	$33, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vmovapd	.LC6(%rip), %ymm1
	vmovapd	.LC7(%rip), %ymm2
	vandnpd	%ymm0, %ymm1, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm5
	vcmppd	$2, %ymm3, %ymm1, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L60
.L49:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC11(%rip), %xmm1
	vandpd	.LC10(%rip), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L59
	vmulsd	.LC12(%rip), %xmm0, %xmm0
	incq	(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L59:
	vmovsd	.LC12(%rip), %xmm2
	vcomisd	%xmm0, %xmm2
	jbe	.L48
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	(%rdi)
.L48:
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	vmulpd	%ymm3, %ymm1, %ymm3
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm3, %ymm1, %ymm1
	vmulpd	%ymm2, %ymm1, %ymm2
	addq	%rax, (%rdi)
	vblendvpd	%ymm4, %ymm2, %ymm1, %ymm0
	jmp	.L49
	.cfi_endproc
.LFE8813:
	.size	_Z18horizontal_productDv4_dRl, .-_Z18horizontal_productDv4_dRl
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC13:
	.string	"void prod_realreal(long int, long int, double, const double*, double&, long int&)"
	.section	.rodata.str1.1
.LC14:
	.string	"test_simple_problem.cpp"
.LC15:
	.string	"N % ELEMENTS_PER_LOOP == 0"
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"reinterpret_cast<uintptr_t>(x) % 8 == 0"
	.text
	.p2align 4
	.globl	_Z13prod_realreallldPKdRdRl
	.type	_Z13prod_realreallldPKdRdRl, @function
_Z13prod_realreallldPKdRdRl:
.LFB8822:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	testb	$15, %dil
	jne	.L235
	testb	$7, %dl
	jne	.L236
	vmovapd	.LC17(%rip), %ymm2
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm3
	vmovsd	%xmm0, %xmm0, %xmm8
	movq	%rsi, %r11
	vmovlpd	(%rcx), %xmm2, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm2, %ymm2
	movq	(%r8), %rbx
	movq	%rdi, %r10
	vbroadcastsd	%xmm8, %ymm5
	vmovapd	%ymm3, %ymm0
	vmovapd	%ymm3, %ymm4
	andq	$-16, %r11
	jle	.L116
	vmovapd	.LC6(%rip), %ymm7
	vmovapd	.LC7(%rip), %ymm6
	vmovapd	.LC8(%rip), %ymm1
	xorl	%eax, %eax
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L65:
	addq	$16, %rax
	cmpq	%rax, %r11
	jle	.L64
.L73:
	vsubpd	(%rdx,%rax,8), %ymm5, %ymm9
	vmulpd	%ymm9, %ymm2, %ymm2
	vsubpd	32(%rdx,%rax,8), %ymm5, %ymm9
	vmulpd	%ymm9, %ymm3, %ymm3
	vsubpd	64(%rdx,%rax,8), %ymm5, %ymm9
	vmulpd	%ymm9, %ymm4, %ymm4
	vsubpd	96(%rdx,%rax,8), %ymm5, %ymm9
	vmulpd	%ymm9, %ymm0, %ymm0
	testb	$112, %al
	jne	.L65
	vandnpd	%ymm2, %ymm7, %ymm2
	vcmppd	$13, %ymm6, %ymm2, %ymm10
	vcmppd	$2, %ymm1, %ymm2, %ymm9
	vmovmskpd	%ymm10, %r9d
	vmovmskpd	%ymm9, %edi
	testl	%r9d, %r9d
	je	.L66
	vmulpd	%ymm1, %ymm2, %ymm11
	popcntl	%r9d, %r9d
	addq	%r9, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm2, %ymm2
.L66:
	testl	%edi, %edi
	je	.L67
	vmulpd	%ymm6, %ymm2, %ymm10
	popcntl	%edi, %edi
	subq	%rdi, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm2, %ymm2
.L67:
	vandnpd	%ymm3, %ymm7, %ymm3
	vcmppd	$13, %ymm6, %ymm3, %ymm10
	vcmppd	$2, %ymm1, %ymm3, %ymm9
	vmovmskpd	%ymm10, %r9d
	vmovmskpd	%ymm9, %edi
	testl	%r9d, %r9d
	je	.L68
	vmulpd	%ymm1, %ymm3, %ymm11
	popcntl	%r9d, %r9d
	addq	%r9, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm3, %ymm3
.L68:
	testl	%edi, %edi
	je	.L69
	vmulpd	%ymm6, %ymm3, %ymm10
	popcntl	%edi, %edi
	subq	%rdi, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm3, %ymm3
.L69:
	vandnpd	%ymm4, %ymm7, %ymm4
	vcmppd	$13, %ymm6, %ymm4, %ymm10
	vcmppd	$2, %ymm1, %ymm4, %ymm9
	vmovmskpd	%ymm10, %r9d
	vmovmskpd	%ymm9, %edi
	testl	%r9d, %r9d
	je	.L70
	vmulpd	%ymm1, %ymm4, %ymm11
	popcntl	%r9d, %r9d
	addq	%r9, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm4, %ymm4
.L70:
	testl	%edi, %edi
	je	.L71
	vmulpd	%ymm6, %ymm4, %ymm10
	popcntl	%edi, %edi
	subq	%rdi, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm4, %ymm4
.L71:
	vandnpd	%ymm0, %ymm7, %ymm0
	vcmppd	$13, %ymm6, %ymm0, %ymm10
	vcmppd	$2, %ymm1, %ymm0, %ymm9
	vmovmskpd	%ymm10, %r9d
	vmovmskpd	%ymm9, %edi
	testl	%r9d, %r9d
	je	.L72
	vmulpd	%ymm1, %ymm0, %ymm11
	popcntl	%r9d, %r9d
	addq	%r9, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L72:
	testl	%edi, %edi
	je	.L65
	vmulpd	%ymm6, %ymm0, %ymm10
	addq	$16, %rax
	popcntl	%edi, %edi
	subq	%rdi, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm0
	cmpq	%rax, %r11
	jg	.L73
	.p2align 4,,10
	.p2align 3
.L64:
	vandnpd	%ymm2, %ymm7, %ymm2
	vcmppd	$13, %ymm6, %ymm2, %ymm10
	vcmppd	$2, %ymm1, %ymm2, %ymm9
	vmovmskpd	%ymm10, %edi
	vmovmskpd	%ymm9, %eax
	testl	%edi, %edi
	je	.L74
	vmulpd	%ymm1, %ymm2, %ymm11
	popcntl	%edi, %edi
	addq	%rdi, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm2, %ymm2
.L74:
	testl	%eax, %eax
	je	.L75
	vmulpd	%ymm6, %ymm2, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm2, %ymm2
.L75:
	vandnpd	%ymm3, %ymm7, %ymm3
	vcmppd	$13, %ymm6, %ymm3, %ymm10
	vcmppd	$2, %ymm1, %ymm3, %ymm9
	vmovmskpd	%ymm10, %edi
	vmovmskpd	%ymm9, %eax
	testl	%edi, %edi
	je	.L76
	vmulpd	%ymm1, %ymm3, %ymm11
	popcntl	%edi, %edi
	addq	%rdi, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm3, %ymm3
.L76:
	testl	%eax, %eax
	je	.L77
	vmulpd	%ymm6, %ymm3, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm3, %ymm3
.L77:
	vandnpd	%ymm4, %ymm7, %ymm4
	vcmppd	$13, %ymm6, %ymm4, %ymm10
	vcmppd	$2, %ymm1, %ymm4, %ymm9
	vmovmskpd	%ymm10, %edi
	vmovmskpd	%ymm9, %eax
	testl	%edi, %edi
	je	.L78
	vmulpd	%ymm1, %ymm4, %ymm11
	popcntl	%edi, %edi
	addq	%rdi, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm4, %ymm4
.L78:
	testl	%eax, %eax
	je	.L79
	vmulpd	%ymm6, %ymm4, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm4, %ymm4
.L79:
	vandnpd	%ymm0, %ymm7, %ymm0
	vcmppd	$13, %ymm6, %ymm0, %ymm10
	vcmppd	$2, %ymm1, %ymm0, %ymm9
	vmovmskpd	%ymm10, %edi
	vmovmskpd	%ymm9, %eax
	testl	%edi, %edi
	je	.L80
	vmulpd	%ymm1, %ymm0, %ymm11
	popcntl	%edi, %edi
	addq	%rdi, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L80:
	testl	%eax, %eax
	jne	.L237
.L81:
	leaq	16(%r11), %rdi
	movq	%rdi, %r9
	cmpq	%rdi, %r10
	jg	.L91
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L83:
	addq	$16, %r9
	cmpq	%r9, %r10
	jle	.L82
.L91:
	vsubpd	(%rdx,%r9,8), %ymm5, %ymm9
	leaq	15(%r9), %rax
	testq	%r9, %r9
	vmulpd	%ymm9, %ymm2, %ymm2
	vsubpd	32(%rdx,%r9,8), %ymm5, %ymm9
	cmovns	%r9, %rax
	vmulpd	%ymm9, %ymm3, %ymm3
	vsubpd	64(%rdx,%r9,8), %ymm5, %ymm9
	vmulpd	%ymm9, %ymm4, %ymm4
	vsubpd	96(%rdx,%r9,8), %ymm5, %ymm9
	vmulpd	%ymm9, %ymm0, %ymm0
	testb	$112, %al
	jne	.L83
	vandnpd	%ymm2, %ymm7, %ymm2
	vcmppd	$13, %ymm6, %ymm2, %ymm10
	vcmppd	$2, %ymm1, %ymm2, %ymm9
	vmovmskpd	%ymm10, %r12d
	vmovmskpd	%ymm9, %eax
	testl	%r12d, %r12d
	je	.L84
	vmulpd	%ymm1, %ymm2, %ymm11
	popcntl	%r12d, %r12d
	addq	%r12, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm2, %ymm2
.L84:
	testl	%eax, %eax
	je	.L85
	vmulpd	%ymm6, %ymm2, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm2, %ymm2
.L85:
	vandnpd	%ymm3, %ymm7, %ymm3
	vcmppd	$13, %ymm6, %ymm3, %ymm10
	vcmppd	$2, %ymm1, %ymm3, %ymm9
	vmovmskpd	%ymm10, %r12d
	vmovmskpd	%ymm9, %eax
	testl	%r12d, %r12d
	je	.L86
	vmulpd	%ymm1, %ymm3, %ymm11
	popcntl	%r12d, %r12d
	addq	%r12, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm3, %ymm3
.L86:
	testl	%eax, %eax
	je	.L87
	vmulpd	%ymm6, %ymm3, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm3, %ymm3
.L87:
	vandnpd	%ymm4, %ymm7, %ymm4
	vcmppd	$13, %ymm6, %ymm4, %ymm10
	vcmppd	$2, %ymm1, %ymm4, %ymm9
	vmovmskpd	%ymm10, %r12d
	vmovmskpd	%ymm9, %eax
	testl	%r12d, %r12d
	je	.L88
	vmulpd	%ymm1, %ymm4, %ymm11
	popcntl	%r12d, %r12d
	addq	%r12, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm4, %ymm4
.L88:
	testl	%eax, %eax
	je	.L89
	vmulpd	%ymm6, %ymm4, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm4, %ymm4
.L89:
	vandnpd	%ymm0, %ymm7, %ymm0
	vcmppd	$13, %ymm6, %ymm0, %ymm10
	vcmppd	$2, %ymm1, %ymm0, %ymm9
	vmovmskpd	%ymm10, %r12d
	vmovmskpd	%ymm9, %eax
	testl	%r12d, %r12d
	je	.L90
	vmulpd	%ymm1, %ymm0, %ymm11
	popcntl	%r12d, %r12d
	addq	%r12, %rbx
	vblendvpd	%ymm10, %ymm11, %ymm0, %ymm0
.L90:
	testl	%eax, %eax
	je	.L83
	vmulpd	%ymm6, %ymm0, %ymm10
	addq	$16, %r9
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm0
	cmpq	%r9, %r10
	jg	.L91
	.p2align 4,,10
	.p2align 3
.L82:
	vandnpd	%ymm2, %ymm7, %ymm2
	vcmppd	$13, %ymm6, %ymm2, %ymm9
	vcmppd	$2, %ymm1, %ymm2, %ymm5
	vmovmskpd	%ymm9, %r9d
	vmovmskpd	%ymm5, %eax
	testl	%r9d, %r9d
	je	.L92
	vmulpd	%ymm1, %ymm2, %ymm10
	popcntl	%r9d, %r9d
	addq	%r9, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm2, %ymm2
.L92:
	testl	%eax, %eax
	je	.L93
	vmulpd	%ymm6, %ymm2, %ymm9
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm5, %ymm9, %ymm2, %ymm2
.L93:
	vandnpd	%ymm3, %ymm7, %ymm3
	vcmppd	$13, %ymm6, %ymm3, %ymm9
	vcmppd	$2, %ymm1, %ymm3, %ymm5
	vmovmskpd	%ymm9, %r9d
	vmovmskpd	%ymm5, %eax
	testl	%r9d, %r9d
	je	.L94
	vmulpd	%ymm1, %ymm3, %ymm10
	popcntl	%r9d, %r9d
	addq	%r9, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm3, %ymm3
.L94:
	testl	%eax, %eax
	je	.L95
	vmulpd	%ymm6, %ymm3, %ymm9
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm5, %ymm9, %ymm3, %ymm3
.L95:
	vandnpd	%ymm4, %ymm7, %ymm4
	vcmppd	$13, %ymm6, %ymm4, %ymm9
	vcmppd	$2, %ymm1, %ymm4, %ymm5
	vmovmskpd	%ymm9, %r9d
	vmovmskpd	%ymm5, %eax
	testl	%r9d, %r9d
	je	.L96
	vmulpd	%ymm1, %ymm4, %ymm10
	popcntl	%r9d, %r9d
	addq	%r9, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm4, %ymm4
.L96:
	testl	%eax, %eax
	je	.L97
	vmulpd	%ymm6, %ymm4, %ymm9
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm5, %ymm9, %ymm4, %ymm4
.L97:
	vandnpd	%ymm0, %ymm7, %ymm0
	vcmppd	$13, %ymm6, %ymm0, %ymm9
	vcmppd	$2, %ymm1, %ymm0, %ymm5
	vmovmskpd	%ymm9, %r9d
	vmovmskpd	%ymm5, %eax
	testl	%r9d, %r9d
	je	.L98
	vmulpd	%ymm1, %ymm0, %ymm10
	popcntl	%r9d, %r9d
	addq	%r9, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm0
.L98:
	testl	%eax, %eax
	jne	.L238
.L99:
	vmulpd	%ymm2, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm7, %ymm2
	vcmppd	$13, %ymm6, %ymm2, %ymm9
	vcmppd	$2, %ymm1, %ymm2, %ymm5
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm5, %r9d
	movl	%eax, %r10d
	orl	%r9d, %r10d
	jne	.L239
.L100:
	vmulpd	%ymm4, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm7, %ymm2
	vcmppd	$13, %ymm6, %ymm2, %ymm5
	vcmppd	$2, %ymm1, %ymm2, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %r9d
	movl	%eax, %r10d
	orl	%r9d, %r10d
	jne	.L240
.L101:
	vmulpd	%ymm3, %ymm0, %ymm2
	vandnpd	%ymm2, %ymm7, %ymm0
	vcmppd	$13, %ymm6, %ymm0, %ymm4
	vcmppd	$2, %ymm1, %ymm0, %ymm3
	vmovmskpd	%ymm4, %eax
	vmovmskpd	%ymm3, %r9d
	movl	%eax, %r10d
	orl	%r9d, %r10d
	jne	.L241
.L102:
	vmovapd	.LC9(%rip), %ymm3
	vinsertf128	$1, %xmm3, %ymm2, %ymm0
	vperm2f128	$33, %ymm3, %ymm2, %ymm2
	vmulpd	%ymm2, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm7, %ymm7
	vcmppd	$13, %ymm6, %ymm7, %ymm3
	vcmppd	$2, %ymm1, %ymm7, %ymm2
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm2, %r9d
	movl	%eax, %r10d
	orl	%r9d, %r10d
	jne	.L242
.L103:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	.LC10(%rip), %xmm2
	vmovsd	.LC11(%rip), %xmm1
	vmovsd	.LC12(%rip), %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L243
	vcomisd	%xmm0, %xmm3
	jbe	.L106
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rbx
.L106:
	movslq	%r11d, %rax
	addq	$15, %r11
	vmovsd	%xmm0, (%rcx)
	movq	%rbx, (%r8)
	cmpq	%r11, %rax
	jle	.L115
	jmp	.L233
	.p2align 4,,10
	.p2align 3
.L244:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	incq	(%r8)
.L110:
	incq	%rax
	cmpq	%rdi, %rax
	je	.L233
.L115:
	cmpq	%rax, %rsi
	je	.L110
	vsubsd	(%rdx,%rax,8), %xmm8, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%rcx), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L244
	vcomisd	%xmm0, %xmm3
	ja	.L113
	incq	%rax
	vmovsd	%xmm0, (%rcx)
	cmpq	%rdi, %rax
	jne	.L115
.L233:
	vzeroupper
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L243:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%rbx
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L238:
	vmulpd	%ymm6, %ymm0, %ymm9
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm5, %ymm9, %ymm0, %ymm0
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L237:
	vmulpd	%ymm6, %ymm0, %ymm10
	popcntl	%eax, %eax
	subq	%rax, %rbx
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm0
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L113:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	decq	(%r8)
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L239:
	vmulpd	%ymm1, %ymm2, %ymm3
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm9, %ymm3, %ymm2, %ymm2
	vmulpd	%ymm6, %ymm2, %ymm3
	addq	%rax, %rbx
	vblendvpd	%ymm5, %ymm3, %ymm2, %ymm3
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L240:
	vmulpd	%ymm1, %ymm2, %ymm0
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm5, %ymm0, %ymm2, %ymm2
	vmulpd	%ymm6, %ymm2, %ymm0
	addq	%rax, %rbx
	vblendvpd	%ymm4, %ymm0, %ymm2, %ymm0
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L241:
	vmulpd	%ymm1, %ymm0, %ymm2
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm4, %ymm2, %ymm0, %ymm0
	vmulpd	%ymm6, %ymm0, %ymm2
	addq	%rax, %rbx
	vblendvpd	%ymm3, %ymm2, %ymm0, %ymm2
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L242:
	vmulpd	%ymm1, %ymm7, %ymm1
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm3, %ymm1, %ymm7, %ymm7
	vmulpd	%ymm6, %ymm7, %ymm0
	addq	%rax, %rbx
	vblendvpd	%ymm2, %ymm0, %ymm7, %ymm0
	jmp	.L103
.L116:
	vmovapd	.LC6(%rip), %ymm7
	vmovapd	.LC7(%rip), %ymm6
	vmovapd	.LC8(%rip), %ymm1
	jmp	.L64
.L235:
	leaq	.LC13(%rip), %rcx
	movl	$281, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	call	__assert_fail@PLT
.L236:
	leaq	.LC13(%rip), %rcx
	movl	$282, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE8822:
	.size	_Z13prod_realreallldPKdRdRl, .-_Z13prod_realreallldPKdRdRl
	.p2align 4
	.globl	_Z16prod_realcomplexldPKdS0_RdRl
	.type	_Z16prod_realcomplexldPKdS0_RdRl, @function
_Z16prod_realcomplexldPKdS0_RdRl:
.LFB8823:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rdx, %rdi
	testq	%rax, %rax
	jle	.L256
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC11(%rip), %xmm4
	vmovsd	.LC12(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L257:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L249:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L256
.L251:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L257
	vcomisd	%xmm1, %xmm5
	ja	.L250
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L251
.L256:
	ret
	.p2align 4,,10
	.p2align 3
.L250:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L249
	.cfi_endproc
.LFE8823:
	.size	_Z16prod_realcomplexldPKdS0_RdRl, .-_Z16prod_realcomplexldPKdS0_RdRl
	.p2align 4
	.globl	_Z16prod_complexreallddPKdRdRl
	.type	_Z16prod_complexreallddPKdRdRl, @function
_Z16prod_complexreallddPKdRdRl:
.LFB8824:
	.cfi_startproc
	endbr64
	vmulsd	%xmm1, %xmm1, %xmm1
	testq	%rdi, %rdi
	jle	.L269
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC11(%rip), %xmm4
	vmovsd	.LC12(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L270:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L262:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L269
.L264:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L270
	vcomisd	%xmm2, %xmm5
	ja	.L263
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L264
.L269:
	ret
	.p2align 4,,10
	.p2align 3
.L263:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L262
	.cfi_endproc
.LFE8824:
	.size	_Z16prod_complexreallddPKdRdRl, .-_Z16prod_complexreallddPKdRdRl
	.p2align 4
	.globl	_Z19prod_complexcomplexllddPKdS0_RdRl
	.type	_Z19prod_complexcomplexllddPKdS0_RdRl, @function
_Z19prod_complexcomplexllddPKdS0_RdRl:
.LFB8825:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	movq	%rdx, %rsi
	testq	%rax, %rax
	jle	.L280
	vmovsd	(%r8), %xmm2
	vmovsd	.LC11(%rip), %xmm5
	vmovsd	.LC12(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L279
	.p2align 4,,10
	.p2align 3
.L293:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L277:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L280
.L279:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L293
	vcomisd	%xmm2, %xmm6
	ja	.L278
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L279
.L280:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L294
	vmovsd	(%r8), %xmm2
	vmovsd	.LC11(%rip), %xmm5
	vmovsd	.LC12(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L285
	.p2align 4,,10
	.p2align 3
.L296:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L283:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L295
.L285:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L296
	vcomisd	%xmm2, %xmm6
	ja	.L284
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L285
.L295:
	ret
	.p2align 4,,10
	.p2align 3
.L278:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L277
	.p2align 4,,10
	.p2align 3
.L284:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L294:
	ret
	.cfi_endproc
.LFE8825:
	.size	_Z19prod_complexcomplexllddPKdS0_RdRl, .-_Z19prod_complexcomplexllddPKdS0_RdRl
	.p2align 4
	.globl	_Z13assert_approxdd
	.type	_Z13assert_approxdd, @function
_Z13assert_approxdd:
.LFB8827:
	.cfi_startproc
	endbr64
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovq	.LC10(%rip), %xmm3
	vandpd	%xmm3, %xmm2, %xmm2
	vsubsd	.LC18(%rip), %xmm2, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	.LC19(%rip), %xmm2
	ja	.L306
	ret
.L306:
	pushq	%rax
	.cfi_def_cfa_offset 16
	call	_Z13assert_approxdd.part.0
	.cfi_endproc
.LFE8827:
	.size	_Z13assert_approxdd, .-_Z13assert_approxdd
	.section	.text._ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv:
.LFB9240:
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
.L308:
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
	jne	.L308
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L309:
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
	jne	.L309
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
	je	.L313
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L313:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L312
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L312:
	movq	%rcx, 2488(%rax)
	movq	$0, 2496(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE9240:
	.size	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, .-_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.text
	.p2align 4
	.globl	_Z8test_allv
	.type	_Z8test_allv, @function
_Z8test_allv:
.LFB8828:
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
	leaq	-2568(%rbp), %rdi
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
	subq	$2560, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	vmovapd	.LC28(%rip), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	$0, -2568(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC29(%rip), %xmm3
	vmovq	.LC10(%rip), %xmm5
	vdivsd	%xmm0, %xmm3, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vsubsd	.LC18(%rip), %xmm2, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vcomisd	.LC19(%rip), %xmm2
	ja	.L874
	movq	-2568(%rbp), %rsi
	cmpq	$1, %rsi
	jne	.L875
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm12
	vmovapd	.LC30(%rip), %ymm11
	vmulpd	%ymm12, %ymm12, %ymm9
	vmovapd	.LC6(%rip), %ymm4
	vmovapd	.LC7(%rip), %ymm3
	vmovapd	.LC8(%rip), %ymm2
	xorl	%r13d, %r13d
	vmulpd	%ymm11, %ymm9, %ymm6
	vandnpd	%ymm6, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm7
	vcmppd	$2, %ymm2, %ymm0, %ymm1
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L876
.L320:
	vmulpd	%ymm9, %ymm9, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm8
	vcmppd	$2, %ymm2, %ymm0, %ymm7
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm7, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L877
.L321:
	vmulpd	%ymm6, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm7
	vcmppd	$2, %ymm2, %ymm0, %ymm6
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L878
.L322:
	vmovapd	.LC9(%rip), %ymm8
	vinsertf128	$1, %xmm8, %ymm1, %ymm0
	vperm2f128	$33, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm7
	vcmppd	$2, %ymm2, %ymm1, %ymm6
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L879
.L323:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC11(%rip), %xmm6
	vmovsd	.LC12(%rip), %xmm7
	vandpd	%xmm5, %xmm0, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L880
	vcomisd	%xmm1, %xmm7
	jbe	.L326
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%r13
.L326:
	vmovsd	.LC31(%rip), %xmm0
	vucomisd	%xmm0, %xmm1
	jp	.L571
	jne	.L571
	testq	%r13, %r13
	jne	.L881
	vmulpd	.LC32(%rip), %ymm9, %ymm10
	vmulpd	%ymm11, %ymm12, %ymm11
	xorl	%esi, %esi
	vmulpd	%ymm9, %ymm12, %ymm9
	vmulpd	%ymm10, %ymm11, %ymm13
	vandnpd	%ymm13, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm14
	vcmppd	$2, %ymm2, %ymm0, %ymm1
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L882
.L334:
	vmulpd	%ymm9, %ymm9, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm15
	vcmppd	$2, %ymm2, %ymm0, %ymm14
	vmovmskpd	%ymm15, %eax
	vmovmskpd	%ymm14, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L883
.L335:
	vmulpd	%ymm13, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm14
	vcmppd	$2, %ymm2, %ymm0, %ymm13
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm13, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L884
.L336:
	vinsertf128	$1, %xmm8, %ymm1, %ymm0
	vperm2f128	$33, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm14
	vcmppd	$2, %ymm2, %ymm1, %ymm13
	vmovmskpd	%ymm14, %eax
	vmovmskpd	%ymm13, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L885
.L337:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	%xmm5, %xmm0, %xmm1
	vcomisd	%xmm6, %xmm1
	jbe	.L859
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
.L340:
	vmovsd	.LC33(%rip), %xmm13
	vdivsd	%xmm1, %xmm13, %xmm0
	vandpd	%xmm5, %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	%xmm5, %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L886
	cmpq	$1, %rsi
	jne	.L887
	vmulpd	.LC34(%rip), %ymm11, %ymm11
	vmulpd	%ymm10, %ymm12, %ymm10
	vmulpd	%ymm9, %ymm12, %ymm9
	xorl	%esi, %esi
	vandnpd	%ymm11, %ymm4, %ymm11
	vcmppd	$13, %ymm3, %ymm11, %ymm1
	vcmppd	$2, %ymm2, %ymm11, %ymm0
	vmovmskpd	%ymm1, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L345
	vmulpd	%ymm2, %ymm11, %ymm12
	xorl	%esi, %esi
	popcntl	%edx, %esi
	vblendvpd	%ymm1, %ymm12, %ymm11, %ymm11
.L345:
	testl	%eax, %eax
	je	.L346
	vmulpd	%ymm3, %ymm11, %ymm1
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm0, %ymm1, %ymm11, %ymm11
.L346:
	vandnpd	%ymm10, %ymm4, %ymm10
	vcmppd	$13, %ymm3, %ymm10, %ymm1
	vcmppd	$2, %ymm2, %ymm10, %ymm0
	vmovmskpd	%ymm1, %edx
	vmovmskpd	%ymm0, %eax
	testl	%edx, %edx
	je	.L347
	vmulpd	%ymm2, %ymm10, %ymm12
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm1, %ymm12, %ymm10, %ymm10
.L347:
	testl	%eax, %eax
	je	.L348
	vmulpd	%ymm3, %ymm10, %ymm1
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm0, %ymm1, %ymm10, %ymm10
.L348:
	vandnpd	%ymm9, %ymm4, %ymm12
	vcmppd	$13, %ymm3, %ymm12, %ymm0
	vcmppd	$2, %ymm2, %ymm12, %ymm9
	vmovmskpd	%ymm0, %eax
	vmovmskpd	%ymm9, %edx
	testl	%eax, %eax
	je	.L349
	vmulpd	%ymm2, %ymm12, %ymm1
	popcntl	%eax, %eax
	addq	%rax, %rsi
	vblendvpd	%ymm0, %ymm1, %ymm12, %ymm1
	testl	%edx, %edx
	je	.L350
	vmulpd	%ymm3, %ymm1, %ymm0
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm0, %ymm1, %ymm1
	vmovapd	%ymm1, %ymm0
.L560:
	subq	%rdx, %rsi
	vmovapd	%ymm0, %ymm12
.L562:
	vmulpd	%ymm11, %ymm10, %ymm10
	vandnpd	%ymm10, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm11
	vcmppd	$2, %ymm2, %ymm0, %ymm9
	vmovmskpd	%ymm11, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L888
.L351:
	vmulpd	%ymm1, %ymm12, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm11
	vcmppd	$2, %ymm2, %ymm0, %ymm9
	vmovmskpd	%ymm11, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L889
.L352:
	vmulpd	%ymm10, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm10
	vcmppd	$2, %ymm2, %ymm0, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L890
.L353:
	vinsertf128	$1, %xmm8, %ymm1, %ymm0
	vperm2f128	$33, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm10
	vcmppd	$2, %ymm2, %ymm1, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L891
.L354:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	%xmm5, %xmm0, %xmm1
	vcomisd	%xmm6, %xmm1
	jbe	.L861
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
.L357:
	vmovsd	.LC35(%rip), %xmm9
	vdivsd	%xmm1, %xmm9, %xmm0
	vandpd	%xmm5, %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	%xmm5, %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L873
	cmpq	$2, %rsi
	jne	.L892
	movl	$128000, %edi
	vmovsd	%xmm7, -2584(%rbp)
	vzeroupper
	call	_Znam@PLT
	movq	$42, -2560(%rbp)
	vmovsd	-2584(%rbp), %xmm7
	movq	%rax, %r12
	movl	$1, %ebx
	movl	$42, %eax
	leaq	-2560(%rbp), %rsi
	movabsq	$6364136223846793005, %rcx
	.p2align 4,,10
	.p2align 3
.L362:
	movq	%rax, %rdx
	shrq	$62, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	addq	%rbx, %rax
	movq	%rax, (%rsi,%rbx,8)
	incq	%rbx
	cmpq	$312, %rbx
	jne	.L362
	leaq	_ZL3gen(%rip), %r15
	movl	$2504, %edx
	movq	%r15, %rdi
	movq	$312, -64(%rbp)
	vmovsd	%xmm7, -2584(%rbp)
	vzeroupper
	call	memcpy@PLT
	vmovsd	_ZL5distu(%rip), %xmm9
	vmovsd	8+_ZL5distu(%rip), %xmm1
	vmovsd	-2584(%rbp), %xmm7
	movq	.LC11(%rip), %rax
	vsubsd	%xmm9, %xmm1, %xmm1
	vmovq	.LC10(%rip), %xmm5
	vmovapd	.LC6(%rip), %ymm4
	vmovapd	.LC7(%rip), %ymm3
	vmovapd	.LC8(%rip), %ymm2
	vmovapd	.LC9(%rip), %ymm8
	leaq	128000(%r12), %r8
	movq	%r12, %r14
	movabsq	$6148914691236517205, %rsi
	movabsq	$8202884508482404352, %rcx
	movabsq	$-2270628950310912, %rdx
	vmovsd	%xmm7, -2608(%rbp)
	vxorps	%xmm10, %xmm10, %xmm10
	vmovq	%rax, %xmm6
	jmp	.L363
	.p2align 4,,10
	.p2align 3
.L894:
	vcvtsi2sdq	%rax, %xmm10, %xmm0
.L365:
	vxorpd	%xmm7, %xmm7, %xmm7
	vaddsd	%xmm7, %xmm0, %xmm0
	vmulsd	.LC37(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L366
.L872:
	vfmadd132sd	%xmm1, %xmm9, %xmm0
	vmovsd	.LC39(%rip), %xmm7
	addq	$8, %r14
	vfmadd132sd	.LC38(%rip), %xmm7, %xmm0
	vmovsd	%xmm0, -8(%r14)
	cmpq	%r8, %r14
	je	.L367
	movq	%rdi, %rbx
.L363:
	cmpq	$311, %rbx
	ja	.L893
.L369:
	movq	(%r15,%rbx,8), %rax
	leaq	1(%rbx), %rdi
	movq	%rax, %r9
	shrq	$29, %r9
	andq	%rsi, %r9
	xorq	%r9, %rax
	movq	%rax, %r9
	salq	$17, %r9
	andq	%rcx, %r9
	xorq	%r9, %rax
	movq	%rax, %r9
	salq	$37, %r9
	andq	%rdx, %r9
	xorq	%r9, %rax
	movq	%rax, %r9
	shrq	$43, %r9
	movq	%rdi, 2496+_ZL3gen(%rip)
	xorq	%r9, %rax
	jns	.L894
	movq	%rax, %r9
	shrq	%r9
	andl	$1, %eax
	orq	%rax, %r9
	vcvtsi2sdq	%r9, %xmm10, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L365
.L880:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%r13
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L893:
	movq	%r15, %rdi
	movq	%r8, -2584(%rbp)
	vmovsd	%xmm1, -2600(%rbp)
	vmovsd	%xmm9, -2592(%rbp)
	vzeroupper
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	.LC11(%rip), %rax
	movq	2496+_ZL3gen(%rip), %rbx
	vmovsd	-2600(%rbp), %xmm1
	vmovsd	-2592(%rbp), %xmm9
	vmovapd	.LC9(%rip), %ymm8
	vmovapd	.LC8(%rip), %ymm2
	vmovapd	.LC7(%rip), %ymm3
	vmovapd	.LC6(%rip), %ymm4
	vmovq	.LC10(%rip), %xmm5
	movq	-2584(%rbp), %r8
	vxorps	%xmm10, %xmm10, %xmm10
	vmovq	%rax, %xmm6
	movabsq	$-2270628950310912, %rdx
	movabsq	$8202884508482404352, %rcx
	movabsq	$6148914691236517205, %rsi
	jmp	.L369
.L367:
	vmovsd	-2608(%rbp), %xmm7
	testb	$7, %r12b
	jne	.L895
	vmovapd	.LC41(%rip), %ymm12
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm10
	vsubpd	(%r12), %ymm12, %ymm13
	vsubpd	32(%r12), %ymm12, %ymm11
	vsubpd	64(%r12), %ymm12, %ymm0
	vmulpd	.LC42(%rip), %ymm13, %ymm13
	vsubpd	96(%r12), %ymm12, %ymm9
	vmulpd	%ymm10, %ymm11, %ymm11
	vmulpd	%ymm10, %ymm0, %ymm0
	vmulpd	%ymm10, %ymm9, %ymm9
	vandnpd	%ymm13, %ymm4, %ymm13
	vcmppd	$13, %ymm3, %ymm13, %ymm1
	vcmppd	$2, %ymm2, %ymm13, %ymm14
	vmovmskpd	%ymm1, %eax
	vmovmskpd	%ymm14, %edx
	testl	%eax, %eax
	je	.L896
	vmulpd	%ymm2, %ymm13, %ymm15
	xorl	%esi, %esi
	popcntl	%eax, %esi
	addl	$42, %esi
	movslq	%esi, %rsi
	vblendvpd	%ymm1, %ymm15, %ymm13, %ymm13
	testl	%edx, %edx
	je	.L385
.L373:
	vmulpd	%ymm3, %ymm13, %ymm1
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm14, %ymm1, %ymm13, %ymm13
.L385:
	vandnpd	%ymm11, %ymm4, %ymm11
	vcmppd	$13, %ymm3, %ymm11, %ymm1
	vcmppd	$2, %ymm2, %ymm11, %ymm14
	vmovmskpd	%ymm1, %eax
	vmovmskpd	%ymm14, %edx
	testl	%eax, %eax
	je	.L384
	vmulpd	%ymm2, %ymm11, %ymm15
	popcntl	%eax, %eax
	addq	%rax, %rsi
	vblendvpd	%ymm1, %ymm15, %ymm11, %ymm11
.L384:
	testl	%edx, %edx
	je	.L383
	vmulpd	%ymm3, %ymm11, %ymm1
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm14, %ymm1, %ymm11, %ymm11
.L383:
	vandnpd	%ymm0, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm1
	vcmppd	$2, %ymm2, %ymm0, %ymm14
	vmovmskpd	%ymm1, %eax
	vmovmskpd	%ymm14, %edx
	testl	%eax, %eax
	je	.L382
	vmulpd	%ymm2, %ymm0, %ymm15
	popcntl	%eax, %eax
	addq	%rax, %rsi
	vblendvpd	%ymm1, %ymm15, %ymm0, %ymm0
.L382:
	testl	%edx, %edx
	je	.L381
	vmulpd	%ymm3, %ymm0, %ymm1
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm14, %ymm1, %ymm0, %ymm0
.L381:
	vandnpd	%ymm9, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm1
	vcmppd	$2, %ymm2, %ymm9, %ymm14
	vmovmskpd	%ymm1, %eax
	vmovmskpd	%ymm14, %edx
	testl	%eax, %eax
	je	.L380
	vmulpd	%ymm2, %ymm9, %ymm15
	popcntl	%eax, %eax
	addq	%rax, %rsi
	vblendvpd	%ymm1, %ymm15, %ymm9, %ymm9
.L380:
	testl	%edx, %edx
	jne	.L897
.L379:
	vsubpd	160(%r12), %ymm12, %ymm1
	vmulpd	%ymm11, %ymm1, %ymm1
	vsubpd	288(%r12), %ymm12, %ymm11
	vmulpd	%ymm11, %ymm1, %ymm1
	vsubpd	192(%r12), %ymm12, %ymm11
	vmulpd	%ymm0, %ymm11, %ymm0
	vsubpd	320(%r12), %ymm12, %ymm11
	vmulpd	%ymm11, %ymm0, %ymm0
	vsubpd	224(%r12), %ymm12, %ymm11
	vmulpd	%ymm9, %ymm11, %ymm9
	vsubpd	352(%r12), %ymm12, %ymm11
	vmulpd	%ymm11, %ymm9, %ymm9
	vsubpd	128(%r12), %ymm12, %ymm11
	vmulpd	%ymm13, %ymm11, %ymm11
	vsubpd	256(%r12), %ymm12, %ymm13
	vmulpd	%ymm13, %ymm11, %ymm11
	vandnpd	%ymm11, %ymm4, %ymm11
	vcmppd	$13, %ymm3, %ymm11, %ymm14
	vcmppd	$2, %ymm2, %ymm11, %ymm13
	vmovmskpd	%ymm14, %edx
	vmovmskpd	%ymm13, %eax
	testl	%edx, %edx
	je	.L387
	vmulpd	%ymm2, %ymm11, %ymm15
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
.L387:
	testl	%eax, %eax
	je	.L388
	vmulpd	%ymm3, %ymm11, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
.L388:
	vandnpd	%ymm1, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm14
	vcmppd	$2, %ymm2, %ymm1, %ymm13
	vmovmskpd	%ymm14, %edx
	vmovmskpd	%ymm13, %eax
	testl	%edx, %edx
	je	.L389
	vmulpd	%ymm2, %ymm1, %ymm15
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
.L389:
	testl	%eax, %eax
	je	.L390
	vmulpd	%ymm3, %ymm1, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm1, %ymm1
.L390:
	vandnpd	%ymm0, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm14
	vcmppd	$2, %ymm2, %ymm0, %ymm13
	vmovmskpd	%ymm14, %edx
	vmovmskpd	%ymm13, %eax
	testl	%edx, %edx
	je	.L391
	vmulpd	%ymm2, %ymm0, %ymm15
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm14, %ymm15, %ymm0, %ymm0
.L391:
	testl	%eax, %eax
	je	.L392
	vmulpd	%ymm3, %ymm0, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm0, %ymm0
.L392:
	vandnpd	%ymm9, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm14
	vcmppd	$2, %ymm2, %ymm9, %ymm13
	vmovmskpd	%ymm14, %edx
	vmovmskpd	%ymm13, %eax
	testl	%edx, %edx
	je	.L393
	vmulpd	%ymm2, %ymm9, %ymm15
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L393:
	testl	%eax, %eax
	je	.L394
	vmulpd	%ymm3, %ymm9, %ymm14
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L394:
	movl	$64, %eax
	jmp	.L403
	.p2align 4,,10
	.p2align 3
.L395:
	addq	$16, %rax
	cmpq	$16000, %rax
	je	.L898
.L403:
	vsubpd	(%r12,%rax,8), %ymm12, %ymm13
	vmulpd	%ymm13, %ymm11, %ymm11
	vsubpd	32(%r12,%rax,8), %ymm12, %ymm13
	vmulpd	%ymm13, %ymm1, %ymm1
	vsubpd	64(%r12,%rax,8), %ymm12, %ymm13
	vmulpd	%ymm13, %ymm0, %ymm0
	vsubpd	96(%r12,%rax,8), %ymm12, %ymm13
	vmulpd	%ymm13, %ymm9, %ymm9
	testb	$112, %al
	jne	.L395
	vandnpd	%ymm11, %ymm4, %ymm11
	vcmppd	$13, %ymm3, %ymm11, %ymm14
	vcmppd	$2, %ymm2, %ymm11, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %edx
	testl	%ecx, %ecx
	je	.L396
	vmulpd	%ymm2, %ymm11, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rsi
	vblendvpd	%ymm14, %ymm15, %ymm11, %ymm11
.L396:
	testl	%edx, %edx
	je	.L397
	vmulpd	%ymm3, %ymm11, %ymm14
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
.L397:
	vandnpd	%ymm1, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm14
	vcmppd	$2, %ymm2, %ymm1, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %edx
	testl	%ecx, %ecx
	je	.L398
	vmulpd	%ymm2, %ymm1, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rsi
	vblendvpd	%ymm14, %ymm15, %ymm1, %ymm1
.L398:
	testl	%edx, %edx
	je	.L399
	vmulpd	%ymm3, %ymm1, %ymm14
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm1, %ymm1
.L399:
	vandnpd	%ymm0, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm14
	vcmppd	$2, %ymm2, %ymm0, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %edx
	testl	%ecx, %ecx
	je	.L400
	vmulpd	%ymm2, %ymm0, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rsi
	vblendvpd	%ymm14, %ymm15, %ymm0, %ymm0
.L400:
	testl	%edx, %edx
	je	.L401
	vmulpd	%ymm3, %ymm0, %ymm14
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm0, %ymm0
.L401:
	vandnpd	%ymm9, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm14
	vcmppd	$2, %ymm2, %ymm9, %ymm13
	vmovmskpd	%ymm14, %ecx
	vmovmskpd	%ymm13, %edx
	testl	%ecx, %ecx
	je	.L402
	vmulpd	%ymm2, %ymm9, %ymm15
	popcntl	%ecx, %ecx
	addq	%rcx, %rsi
	vblendvpd	%ymm14, %ymm15, %ymm9, %ymm9
.L402:
	testl	%edx, %edx
	je	.L395
	vmulpd	%ymm3, %ymm9, %ymm14
	addq	$16, %rax
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
	cmpq	$16000, %rax
	jne	.L403
.L898:
	vandnpd	%ymm11, %ymm4, %ymm11
	vcmppd	$13, %ymm3, %ymm11, %ymm13
	vcmppd	$2, %ymm2, %ymm11, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L404
	vmulpd	%ymm2, %ymm11, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm11, %ymm11
.L404:
	testl	%eax, %eax
	je	.L405
	vmulpd	%ymm3, %ymm11, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm11, %ymm11
.L405:
	vandnpd	%ymm1, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm13
	vcmppd	$2, %ymm2, %ymm1, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L406
	vmulpd	%ymm2, %ymm1, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm1, %ymm1
.L406:
	testl	%eax, %eax
	je	.L407
	vmulpd	%ymm3, %ymm1, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
.L407:
	vandnpd	%ymm0, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm13
	vcmppd	$2, %ymm2, %ymm0, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L408
	vmulpd	%ymm2, %ymm0, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm0, %ymm0
.L408:
	testl	%eax, %eax
	je	.L409
	vmulpd	%ymm3, %ymm0, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm0, %ymm0
.L409:
	vandnpd	%ymm9, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm13
	vcmppd	$2, %ymm2, %ymm9, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L410
	vmulpd	%ymm2, %ymm9, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L410:
	testl	%eax, %eax
	je	.L411
	vmulpd	%ymm3, %ymm9, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L411:
	vmulpd	%ymm11, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm11
	vcmppd	$13, %ymm3, %ymm11, %ymm13
	vcmppd	$2, %ymm2, %ymm11, %ymm12
	vmovmskpd	%ymm13, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L899
.L412:
	vmulpd	%ymm9, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm12
	vcmppd	$2, %ymm2, %ymm9, %ymm11
	vmovmskpd	%ymm12, %eax
	vmovmskpd	%ymm11, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L900
.L413:
	vmulpd	%ymm1, %ymm0, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm11
	vcmppd	$2, %ymm2, %ymm0, %ymm9
	vmovmskpd	%ymm11, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L901
.L414:
	vinsertf128	$1, %xmm8, %ymm1, %ymm0
	vperm2f128	$33, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm11
	vcmppd	$2, %ymm2, %ymm1, %ymm9
	vmovmskpd	%ymm11, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L902
.L415:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	%xmm5, %xmm0, %xmm1
	vcomisd	%xmm6, %xmm1
	jbe	.L863
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
.L418:
	vmovsd	.LC43(%rip), %xmm0
	vsubsd	384(%r12), %xmm0, %xmm9
	vandpd	%xmm5, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L420
	vcomisd	%xmm1, %xmm7
	ja	.L903
.L421:
	vsubsd	392(%r12), %xmm0, %xmm9
	vandpd	%xmm5, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm9
	vcomisd	%xmm6, %xmm9
	ja	.L423
	vcomisd	%xmm9, %xmm7
	ja	.L904
.L424:
	vsubsd	400(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm9, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L426
	vcomisd	%xmm1, %xmm7
	ja	.L905
.L427:
	vsubsd	408(%r12), %xmm0, %xmm9
	vandpd	%xmm5, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm9
	vcomisd	%xmm6, %xmm9
	ja	.L429
	vcomisd	%xmm9, %xmm7
	ja	.L906
.L430:
	vsubsd	416(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm9, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L432
	vcomisd	%xmm1, %xmm7
	ja	.L907
.L433:
	vsubsd	424(%r12), %xmm0, %xmm9
	vandpd	%xmm5, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm9
	vcomisd	%xmm6, %xmm9
	ja	.L435
	vcomisd	%xmm9, %xmm7
	ja	.L908
.L436:
	vsubsd	432(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm9, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L438
	vcomisd	%xmm1, %xmm7
	ja	.L909
.L439:
	vsubsd	440(%r12), %xmm0, %xmm9
	vandpd	%xmm5, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm9
	vcomisd	%xmm6, %xmm9
	ja	.L441
	vcomisd	%xmm9, %xmm7
	ja	.L910
.L442:
	vsubsd	448(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm9, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L444
	vcomisd	%xmm1, %xmm7
	ja	.L911
.L445:
	vsubsd	456(%r12), %xmm0, %xmm9
	vandpd	%xmm5, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm9
	vcomisd	%xmm6, %xmm9
	ja	.L447
	vcomisd	%xmm9, %xmm7
	ja	.L912
.L448:
	vsubsd	464(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm9, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L450
	vcomisd	%xmm1, %xmm7
	ja	.L913
.L451:
	vsubsd	472(%r12), %xmm0, %xmm9
	vandpd	%xmm5, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm9
	vcomisd	%xmm6, %xmm9
	ja	.L453
	vcomisd	%xmm9, %xmm7
	ja	.L914
.L454:
	vsubsd	480(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm9, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L456
	vcomisd	%xmm1, %xmm7
	ja	.L915
.L457:
	vsubsd	496(%r12), %xmm0, %xmm9
	vandpd	%xmm5, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm9
	vcomisd	%xmm6, %xmm9
	ja	.L459
	vcomisd	%xmm9, %xmm7
	ja	.L916
.L460:
	vsubsd	504(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm9, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	jbe	.L864
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
.L464:
	vmovsd	.LC44(%rip), %xmm9
	vdivsd	%xmm1, %xmm9, %xmm0
	vandpd	%xmm5, %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	%xmm5, %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L873
	cmpq	$-3, %rsi
	jne	.L917
	vmovapd	.LC17(%rip), %ymm9
	vmovapd	.LC45(%rip), %ymm11
	vmovsd	%xmm1, %xmm9, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm9, %ymm9
	vmovapd	%ymm10, %ymm1
	vmovapd	%ymm10, %ymm0
	jmp	.L477
	.p2align 4,,10
	.p2align 3
.L469:
	addq	$16, %r13
	cmpq	$256, %r13
	je	.L918
.L477:
	vsubpd	(%r12,%r13,8), %ymm11, %ymm12
	vmulpd	%ymm12, %ymm9, %ymm9
	vsubpd	32(%r12,%r13,8), %ymm11, %ymm12
	vmulpd	%ymm12, %ymm10, %ymm10
	vsubpd	64(%r12,%r13,8), %ymm11, %ymm12
	vmulpd	%ymm12, %ymm0, %ymm0
	vsubpd	96(%r12,%r13,8), %ymm11, %ymm12
	vmulpd	%ymm12, %ymm1, %ymm1
	testb	$112, %r13b
	jne	.L469
	vandnpd	%ymm9, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm13
	vcmppd	$2, %ymm2, %ymm9, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L470
	vmulpd	%ymm2, %ymm9, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L470:
	testl	%eax, %eax
	je	.L471
	vmulpd	%ymm3, %ymm9, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L471:
	vandnpd	%ymm10, %ymm4, %ymm10
	vcmppd	$13, %ymm3, %ymm10, %ymm13
	vcmppd	$2, %ymm2, %ymm10, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L472
	vmulpd	%ymm2, %ymm10, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
.L472:
	testl	%eax, %eax
	je	.L473
	vmulpd	%ymm3, %ymm10, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm10, %ymm10
.L473:
	vandnpd	%ymm0, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm13
	vcmppd	$2, %ymm2, %ymm0, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L474
	vmulpd	%ymm2, %ymm0, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm0, %ymm0
.L474:
	testl	%eax, %eax
	je	.L475
	vmulpd	%ymm3, %ymm0, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm0, %ymm0
.L475:
	vandnpd	%ymm1, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm13
	vcmppd	$2, %ymm2, %ymm1, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L476
	vmulpd	%ymm2, %ymm1, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm1, %ymm1
.L476:
	testl	%eax, %eax
	je	.L469
	vmulpd	%ymm3, %ymm1, %ymm13
	addq	$16, %r13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
	cmpq	$256, %r13
	jne	.L477
.L918:
	vandnpd	%ymm9, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm13
	vcmppd	$2, %ymm2, %ymm9, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L478
	vmulpd	%ymm2, %ymm9, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L478:
	testl	%eax, %eax
	je	.L479
	vmulpd	%ymm3, %ymm9, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L479:
	vandnpd	%ymm10, %ymm4, %ymm10
	vcmppd	$13, %ymm3, %ymm10, %ymm13
	vcmppd	$2, %ymm2, %ymm10, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L480
	vmulpd	%ymm2, %ymm10, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
.L480:
	testl	%eax, %eax
	je	.L481
	vmulpd	%ymm3, %ymm10, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm10, %ymm10
.L481:
	vandnpd	%ymm0, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm13
	vcmppd	$2, %ymm2, %ymm0, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L482
	vmulpd	%ymm2, %ymm0, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm0, %ymm0
.L482:
	testl	%eax, %eax
	je	.L483
	vmulpd	%ymm3, %ymm0, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm0, %ymm0
.L483:
	vandnpd	%ymm1, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm13
	vcmppd	$2, %ymm2, %ymm1, %ymm12
	vmovmskpd	%ymm13, %edx
	vmovmskpd	%ymm12, %eax
	testl	%edx, %edx
	je	.L484
	vmulpd	%ymm2, %ymm1, %ymm14
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm1, %ymm1
.L484:
	testl	%eax, %eax
	je	.L485
	vmulpd	%ymm3, %ymm1, %ymm13
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
.L485:
	movl	$272, %eax
	jmp	.L494
	.p2align 4,,10
	.p2align 3
.L486:
	addq	$16, %rax
	cmpq	$16000, %rax
	je	.L919
.L494:
	vsubpd	(%r12,%rax,8), %ymm11, %ymm12
	vmulpd	%ymm12, %ymm9, %ymm9
	vsubpd	32(%r12,%rax,8), %ymm11, %ymm12
	vmulpd	%ymm12, %ymm10, %ymm10
	vsubpd	64(%r12,%rax,8), %ymm11, %ymm12
	vmulpd	%ymm12, %ymm0, %ymm0
	vsubpd	96(%r12,%rax,8), %ymm11, %ymm12
	vmulpd	%ymm12, %ymm1, %ymm1
	testb	$112, %al
	jne	.L486
	vandnpd	%ymm9, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm13
	vcmppd	$2, %ymm2, %ymm9, %ymm12
	vmovmskpd	%ymm13, %ecx
	vmovmskpd	%ymm12, %edx
	testl	%ecx, %ecx
	je	.L487
	vmulpd	%ymm2, %ymm9, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm9, %ymm9
.L487:
	testl	%edx, %edx
	je	.L488
	vmulpd	%ymm3, %ymm9, %ymm13
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L488:
	vandnpd	%ymm10, %ymm4, %ymm10
	vcmppd	$13, %ymm3, %ymm10, %ymm13
	vcmppd	$2, %ymm2, %ymm10, %ymm12
	vmovmskpd	%ymm13, %ecx
	vmovmskpd	%ymm12, %edx
	testl	%ecx, %ecx
	je	.L489
	vmulpd	%ymm2, %ymm10, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm10, %ymm10
.L489:
	testl	%edx, %edx
	je	.L490
	vmulpd	%ymm3, %ymm10, %ymm13
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm10, %ymm10
.L490:
	vandnpd	%ymm0, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm13
	vcmppd	$2, %ymm2, %ymm0, %ymm12
	vmovmskpd	%ymm13, %ecx
	vmovmskpd	%ymm12, %edx
	testl	%ecx, %ecx
	je	.L491
	vmulpd	%ymm2, %ymm0, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm0, %ymm0
.L491:
	testl	%edx, %edx
	je	.L492
	vmulpd	%ymm3, %ymm0, %ymm13
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm0, %ymm0
.L492:
	vandnpd	%ymm1, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm13
	vcmppd	$2, %ymm2, %ymm1, %ymm12
	vmovmskpd	%ymm13, %ecx
	vmovmskpd	%ymm12, %edx
	testl	%ecx, %ecx
	je	.L493
	vmulpd	%ymm2, %ymm1, %ymm14
	popcntl	%ecx, %ecx
	addq	%rcx, %rsi
	vblendvpd	%ymm13, %ymm14, %ymm1, %ymm1
.L493:
	testl	%edx, %edx
	je	.L486
	vmulpd	%ymm3, %ymm1, %ymm13
	addq	$16, %rax
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
	cmpq	$16000, %rax
	jne	.L494
.L919:
	vandnpd	%ymm9, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm12
	vcmppd	$2, %ymm2, %ymm9, %ymm11
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm11, %eax
	testl	%edx, %edx
	je	.L495
	vmulpd	%ymm2, %ymm9, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm9, %ymm9
.L495:
	testl	%eax, %eax
	je	.L496
	vmulpd	%ymm3, %ymm9, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm11, %ymm12, %ymm9, %ymm9
.L496:
	vandnpd	%ymm10, %ymm4, %ymm10
	vcmppd	$13, %ymm3, %ymm10, %ymm12
	vcmppd	$2, %ymm2, %ymm10, %ymm11
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm11, %eax
	testl	%edx, %edx
	je	.L497
	vmulpd	%ymm2, %ymm10, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm10, %ymm10
.L497:
	testl	%eax, %eax
	je	.L498
	vmulpd	%ymm3, %ymm10, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm11, %ymm12, %ymm10, %ymm10
.L498:
	vandnpd	%ymm0, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm12
	vcmppd	$2, %ymm2, %ymm0, %ymm11
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm11, %eax
	testl	%edx, %edx
	je	.L499
	vmulpd	%ymm2, %ymm0, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm0, %ymm0
.L499:
	testl	%eax, %eax
	je	.L500
	vmulpd	%ymm3, %ymm0, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm11, %ymm12, %ymm0, %ymm0
.L500:
	vandnpd	%ymm1, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm12
	vcmppd	$2, %ymm2, %ymm1, %ymm11
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm11, %eax
	testl	%edx, %edx
	je	.L501
	vmulpd	%ymm2, %ymm1, %ymm13
	popcntl	%edx, %edx
	addq	%rdx, %rsi
	vblendvpd	%ymm12, %ymm13, %ymm1, %ymm1
.L501:
	testl	%eax, %eax
	je	.L502
	vmulpd	%ymm3, %ymm1, %ymm12
	popcntl	%eax, %eax
	subq	%rax, %rsi
	vblendvpd	%ymm11, %ymm12, %ymm1, %ymm1
.L502:
	vmulpd	%ymm9, %ymm10, %ymm10
	vandnpd	%ymm10, %ymm4, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm12
	vcmppd	$2, %ymm2, %ymm9, %ymm11
	vmovmskpd	%ymm12, %eax
	vmovmskpd	%ymm11, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L920
.L503:
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm4, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm11
	vcmppd	$2, %ymm2, %ymm1, %ymm9
	vmovmskpd	%ymm11, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L921
.L504:
	vmulpd	%ymm10, %ymm0, %ymm1
	vandnpd	%ymm1, %ymm4, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm10
	vcmppd	$2, %ymm2, %ymm0, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L922
.L505:
	vinsertf128	$1, %xmm8, %ymm1, %ymm0
	vperm2f128	$33, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm4, %ymm4
	vcmppd	$13, %ymm3, %ymm4, %ymm8
	vcmppd	$2, %ymm2, %ymm4, %ymm1
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L923
.L506:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	%xmm5, %xmm0, %xmm1
	vcomisd	%xmm6, %xmm1
	jbe	.L866
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
.L509:
	vmovsd	.LC46(%rip), %xmm0
	vsubsd	2056(%r12), %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L511
	vcomisd	%xmm1, %xmm7
	jbe	.L512
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
.L512:
	vsubsd	2064(%r12), %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vcomisd	%xmm6, %xmm2
	ja	.L514
	vcomisd	%xmm2, %xmm7
	jbe	.L515
	vmulsd	%xmm6, %xmm2, %xmm2
	decq	%rsi
.L515:
	vsubsd	2072(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L517
	vcomisd	%xmm1, %xmm7
	jbe	.L518
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
.L518:
	vsubsd	2080(%r12), %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vcomisd	%xmm6, %xmm2
	ja	.L520
	vcomisd	%xmm2, %xmm7
	jbe	.L521
	vmulsd	%xmm6, %xmm2, %xmm2
	decq	%rsi
.L521:
	vsubsd	2088(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L523
	vcomisd	%xmm1, %xmm7
	jbe	.L524
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
.L524:
	vsubsd	2096(%r12), %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vcomisd	%xmm6, %xmm2
	ja	.L526
	vcomisd	%xmm2, %xmm7
	jbe	.L527
	vmulsd	%xmm6, %xmm2, %xmm2
	decq	%rsi
.L527:
	vsubsd	2104(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L529
	vcomisd	%xmm1, %xmm7
	jbe	.L530
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
.L530:
	vsubsd	2112(%r12), %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vcomisd	%xmm6, %xmm2
	ja	.L532
	vcomisd	%xmm2, %xmm7
	jbe	.L533
	vmulsd	%xmm6, %xmm2, %xmm2
	decq	%rsi
.L533:
	vsubsd	2120(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L535
	vcomisd	%xmm1, %xmm7
	jbe	.L536
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
.L536:
	vsubsd	2128(%r12), %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vcomisd	%xmm6, %xmm2
	ja	.L538
	vcomisd	%xmm2, %xmm7
	jbe	.L539
	vmulsd	%xmm6, %xmm2, %xmm2
	decq	%rsi
.L539:
	vsubsd	2136(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L541
	vcomisd	%xmm1, %xmm7
	jbe	.L542
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
.L542:
	vsubsd	2144(%r12), %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vcomisd	%xmm6, %xmm2
	ja	.L544
	vcomisd	%xmm2, %xmm7
	jbe	.L545
	vmulsd	%xmm6, %xmm2, %xmm2
	decq	%rsi
.L545:
	vsubsd	2152(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L547
	vcomisd	%xmm1, %xmm7
	jbe	.L548
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
.L548:
	vsubsd	2160(%r12), %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vcomisd	%xmm6, %xmm2
	ja	.L550
	vcomisd	%xmm2, %xmm7
	jbe	.L551
	vmulsd	%xmm6, %xmm2, %xmm2
	decq	%rsi
.L551:
	vsubsd	2168(%r12), %xmm0, %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	jbe	.L867
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
.L555:
	vmovsd	.LC47(%rip), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm0
	vandpd	%xmm5, %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	%xmm5, %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L924
	cmpq	$101, %rsi
	jne	.L925
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L926
	vzeroupper
	addq	$2560, %rsp
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
.L366:
	.cfi_restore_state
	vmovsd	.LC40(%rip), %xmm0
	jmp	.L872
.L550:
	vmulsd	%xmm7, %xmm2, %xmm2
	incq	%rsi
	jmp	.L551
.L547:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L548
.L544:
	vmulsd	%xmm7, %xmm2, %xmm2
	incq	%rsi
	jmp	.L545
.L541:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L542
.L538:
	vmulsd	%xmm7, %xmm2, %xmm2
	incq	%rsi
	jmp	.L539
.L535:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L536
.L532:
	vmulsd	%xmm7, %xmm2, %xmm2
	incq	%rsi
	jmp	.L533
.L529:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L530
.L526:
	vmulsd	%xmm7, %xmm2, %xmm2
	incq	%rsi
	jmp	.L527
.L523:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L524
.L520:
	vmulsd	%xmm7, %xmm2, %xmm2
	incq	%rsi
	jmp	.L521
.L517:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L518
.L514:
	vmulsd	%xmm7, %xmm2, %xmm2
	incq	%rsi
	jmp	.L515
.L511:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L512
.L866:
	vcomisd	%xmm1, %xmm7
	jbe	.L509
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L509
.L859:
	vcomisd	%xmm1, %xmm7
	jbe	.L340
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L340
.L861:
	vcomisd	%xmm1, %xmm7
	jbe	.L357
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L357
.L863:
	vcomisd	%xmm1, %xmm7
	jbe	.L418
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L418
.L349:
	testl	%edx, %edx
	je	.L871
	vmulpd	%ymm3, %ymm12, %ymm0
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm9, %ymm0, %ymm12, %ymm0
	vmovapd	%ymm0, %ymm1
	jmp	.L560
.L896:
	movl	$42, %esi
	testl	%edx, %edx
	jne	.L373
	jmp	.L385
.L867:
	vcomisd	%xmm1, %xmm7
	jbe	.L555
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L555
.L350:
	addq	%rax, %rsi
	vmovapd	%ymm1, %ymm12
.L871:
	vmovapd	%ymm12, %ymm1
	jmp	.L562
.L420:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L421
.L426:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L427
.L423:
	vmulsd	%xmm7, %xmm9, %xmm9
	incq	%rsi
	jmp	.L424
.L450:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L451
.L447:
	vmulsd	%xmm7, %xmm9, %xmm9
	incq	%rsi
	jmp	.L448
.L444:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L445
.L441:
	vmulsd	%xmm7, %xmm9, %xmm9
	incq	%rsi
	jmp	.L442
.L438:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L439
.L435:
	vmulsd	%xmm7, %xmm9, %xmm9
	incq	%rsi
	jmp	.L436
.L432:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L433
.L429:
	vmulsd	%xmm7, %xmm9, %xmm9
	incq	%rsi
	jmp	.L430
.L864:
	vcomisd	%xmm1, %xmm7
	jbe	.L464
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L464
.L459:
	vmulsd	%xmm7, %xmm9, %xmm9
	incq	%rsi
	jmp	.L460
.L456:
	vmulsd	%xmm7, %xmm1, %xmm1
	incq	%rsi
	jmp	.L457
.L453:
	vmulsd	%xmm7, %xmm9, %xmm9
	incq	%rsi
	jmp	.L454
.L916:
	vmulsd	%xmm6, %xmm9, %xmm9
	decq	%rsi
	jmp	.L460
.L915:
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L457
.L914:
	vmulsd	%xmm6, %xmm9, %xmm9
	decq	%rsi
	jmp	.L454
.L913:
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L451
.L912:
	vmulsd	%xmm6, %xmm9, %xmm9
	decq	%rsi
	jmp	.L448
.L911:
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L445
.L910:
	vmulsd	%xmm6, %xmm9, %xmm9
	decq	%rsi
	jmp	.L442
.L909:
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L439
.L908:
	vmulsd	%xmm6, %xmm9, %xmm9
	decq	%rsi
	jmp	.L436
.L907:
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L433
.L906:
	vmulsd	%xmm6, %xmm9, %xmm9
	decq	%rsi
	jmp	.L430
.L905:
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L427
.L904:
	vmulsd	%xmm6, %xmm9, %xmm9
	decq	%rsi
	jmp	.L424
.L903:
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L421
.L897:
	vmulpd	%ymm3, %ymm9, %ymm1
	popcntl	%edx, %edx
	subq	%rdx, %rsi
	vblendvpd	%ymm14, %ymm1, %ymm9, %ymm9
	jmp	.L379
.L902:
	vmulpd	%ymm2, %ymm1, %ymm0
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm11, %ymm0, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm0, %ymm1, %ymm0
	jmp	.L415
.L901:
	vmulpd	%ymm2, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm11, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm1, %ymm0, %ymm1
	jmp	.L414
.L900:
	vmulpd	%ymm2, %ymm9, %ymm0
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm12, %ymm0, %ymm9, %ymm9
	vmulpd	%ymm3, %ymm9, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm11, %ymm0, %ymm9, %ymm0
	jmp	.L413
.L899:
	vmulpd	%ymm2, %ymm11, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm13, %ymm1, %ymm11, %ymm11
	vmulpd	%ymm3, %ymm11, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm12, %ymm1, %ymm11, %ymm1
	jmp	.L412
.L891:
	vmulpd	%ymm2, %ymm1, %ymm0
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm0, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm0, %ymm1, %ymm0
	jmp	.L354
.L890:
	vmulpd	%ymm2, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm1, %ymm0, %ymm1
	jmp	.L353
.L923:
	vmulpd	%ymm2, %ymm4, %ymm2
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm2, %ymm4, %ymm4
	vmulpd	%ymm3, %ymm4, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm1, %ymm0, %ymm4, %ymm0
	jmp	.L506
.L922:
	vmulpd	%ymm2, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm1, %ymm0, %ymm1
	jmp	.L505
.L921:
	vmulpd	%ymm2, %ymm1, %ymm0
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm11, %ymm0, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm0, %ymm1, %ymm0
	jmp	.L504
.L920:
	vmulpd	%ymm2, %ymm9, %ymm10
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm12, %ymm10, %ymm9, %ymm9
	vmulpd	%ymm3, %ymm9, %ymm10
	addq	%rax, %rsi
	vblendvpd	%ymm11, %ymm10, %ymm9, %ymm10
	jmp	.L503
.L889:
	vmulpd	%ymm2, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm11, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm1, %ymm0, %ymm1
	jmp	.L352
.L888:
	vmulpd	%ymm2, %ymm0, %ymm10
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm11, %ymm10, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm10
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm10
	jmp	.L351
.L885:
	vmulpd	%ymm2, %ymm1, %ymm0
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm14, %ymm0, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm13, %ymm0, %ymm1, %ymm0
	jmp	.L337
.L884:
	vmulpd	%ymm2, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm14, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm13, %ymm1, %ymm0, %ymm1
	jmp	.L336
.L883:
	vmulpd	%ymm2, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm15, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm14, %ymm1, %ymm0, %ymm1
	jmp	.L335
.L882:
	vmulpd	%ymm2, %ymm0, %ymm13
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rsi
	vblendvpd	%ymm14, %ymm13, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm13
	vblendvpd	%ymm1, %ymm13, %ymm0, %ymm13
	jmp	.L334
.L876:
	vmulpd	%ymm2, %ymm0, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %r13
	vblendvpd	%ymm7, %ymm6, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm6
	vblendvpd	%ymm1, %ymm6, %ymm0, %ymm6
	jmp	.L320
.L877:
	vmulpd	%ymm2, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %r13
	vblendvpd	%ymm7, %ymm1, %ymm0, %ymm1
	jmp	.L321
.L878:
	vmulpd	%ymm2, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm7, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %r13
	vblendvpd	%ymm6, %ymm1, %ymm0, %ymm1
	jmp	.L322
.L879:
	vmulpd	%ymm2, %ymm1, %ymm0
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm7, %ymm0, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm0
	addq	%rax, %r13
	vblendvpd	%ymm6, %ymm0, %ymm1, %ymm0
	jmp	.L323
.L917:
	movq	$-3, %rdi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L886:
	vmovsd	%xmm13, %xmm13, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L887:
	movl	$1, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L925:
	movl	$101, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L926:
	vzeroupper
	call	__stack_chk_fail@PLT
.L924:
	vmovsd	%xmm2, %xmm2, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L895:
	leaq	.LC13(%rip), %rcx
	movl	$282, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	vzeroupper
	call	__assert_fail@PLT
.L873:
	vmovsd	%xmm9, %xmm9, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L892:
	movl	$2, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L875:
	movl	$1, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L874:
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
.L571:
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
	je	.L927
	cmpb	$0, 56(%r12)
	je	.L331
	movzbl	67(%r12), %eax
.L332:
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
.L881:
	movq	%r13, %rsi
	xorl	%edi, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L331:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	%rcx, %rdx
	je	.L332
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rdx
	jmp	.L332
.L927:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE8828:
	.size	_Z8test_allv, .-_Z8test_allv
	.p2align 4
	.globl	_Z21init_random_positionslddPd
	.type	_Z21init_random_positionslddPd, @function
_Z21init_random_positionslddPd:
.LFB8795:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	jle	.L942
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
	jmp	.L937
	.p2align 4,,10
	.p2align 3
.L944:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L931:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC37(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L932
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L938
.L933:
	movq	%rdx, %rax
.L937:
	cmpq	$311, %rax
	ja	.L943
.L936:
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
	jns	.L944
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L931
	.p2align 4,,10
	.p2align 3
.L943:
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
	jmp	.L936
	.p2align 4,,10
	.p2align 3
.L932:
	vmovsd	.LC40(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L933
.L938:
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
.L942:
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
.LFB8829:
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
.L946:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	leaq	(%rax,%rcx), %rdx
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
	cmpq	$312, %rcx
	jne	.L946
	leaq	_ZL3gen(%rip), %r12
	movl	$2504, %edx
	movq	%r12, %rdi
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	cmpl	$3, %r13d
	je	.L947
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
.L945:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L1042
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
.L947:
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
	ja	.L949
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
	jle	.L950
	testq	%r14, %r14
	jle	.L950
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
.L951:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -2672(%rbp)
	vmovsd	%xmm7, -2680(%rbp)
	jmp	.L959
	.p2align 4,,10
	.p2align 3
.L1044:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L953:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L954
	vmovsd	-2672(%rbp), %xmm6
	vmovsd	.LC39(%rip), %xmm7
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm7, %xmm0
.L1040:
	movq	-2704(%rbp), %r8
	movq	-2696(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L955
	movq	%r14, %rax
.L959:
	cmpq	$311, %rax
	ja	.L1043
.L957:
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
	jns	.L1044
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L953
	.p2align 4,,10
	.p2align 3
.L955:
	incq	-2712(%rbp)
	movq	-2712(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L951
	movq	-2720(%rbp), %rbx
	movq	-2728(%rbp), %r13
.L950:
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
	jne	.L1045
.L960:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC59(%rip), %rsi
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
	jle	.L961
	cmpq	$0, -2688(%rbp)
	jle	.L961
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
.L962:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -2672(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -2680(%rbp)
	jmp	.L975
	.p2align 4,,10
	.p2align 3
.L1049:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L964:
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
	ja	.L1046
.L969:
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
	js	.L970
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L971:
	vaddsd	-2648(%rbp), %xmm1, %xmm1
	vmulsd	-2656(%rbp), %xmm1, %xmm1
	vcomisd	.LC18(%rip), %xmm1
	jnb	.L972
	vmovsd	-2672(%rbp), %xmm4
	movq	-2704(%rbp), %r9
	vfmadd132sd	-2680(%rbp), %xmm4, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L1041:
	vmovsd	.LC39(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L1047
.L975:
	cmpq	$311, %r11
	ja	.L1048
.L968:
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
	jns	.L1049
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L964
	.p2align 4,,10
	.p2align 3
.L1047:
	incq	-2720(%rbp)
	movq	-2720(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L962
	movq	-2728(%rbp), %rbx
.L961:
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
	jne	.L1050
.L976:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC59(%rip), %rsi
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
	jle	.L977
	cmpq	$0, -2688(%rbp)
	jle	.L977
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
	vmovsd	.LC11(%rip), %xmm3
	vmovsd	.LC12(%rip), %xmm4
	vmovsd	%xmm6, -2656(%rbp)
	vmovsd	%xmm7, -2664(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	salq	$37, %rsi
	movq	%r10, %r14
	.p2align 4,,10
	.p2align 3
.L978:
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
.L991:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L1051
.L984:
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
	js	.L979
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L980:
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
	jmp	.L989
	.p2align 4,,10
	.p2align 3
.L1053:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L987:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L1052
.L989:
	vmovsd	(%r14,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L1053
	vcomisd	%xmm0, %xmm4
	jbe	.L987
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L989
.L1052:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L990
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r10
.L990:
	incq	%r13
	cmpq	%r13, -2688(%rbp)
	jne	.L991
	incq	-2728(%rbp)
	movq	%r14, %r13
	movq	%r10, %r14
	movq	-2728(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L978
.L977:
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
	jne	.L1054
.L992:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC59(%rip), %rsi
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
	jle	.L993
	cmpq	$0, -2688(%rbp)
	jle	.L993
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
	vmovsd	.LC12(%rip), %xmm4
	vmovsd	.LC11(%rip), %xmm3
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
.L994:
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
.L1012:
	cmpq	$311, %rdi
	ja	.L1055
.L1000:
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
	js	.L995
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L996:
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
	ja	.L1056
.L1001:
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
	js	.L1002
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L1003:
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
	jmp	.L1010
	.p2align 4,,10
	.p2align 3
.L1058:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L1008:
	addq	$8, %rax
	cmpq	%rax, %r13
	je	.L1057
.L1010:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L1058
	vcomisd	%xmm0, %xmm4
	jbe	.L1008
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r13
	jne	.L1010
.L1057:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L1011
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r15
.L1011:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L1012
	incq	-2752(%rbp)
	movq	%r13, %rbx
	movq	%r15, %r13
	movq	-2752(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L994
	movq	-2672(%rbp), %r15
	movq	-2768(%rbp), %r13
.L993:
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
	jne	.L1059
.L1013:
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
	jmp	.L945
	.p2align 4,,10
	.p2align 3
.L979:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L980
	.p2align 4,,10
	.p2align 3
.L995:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L996
	.p2align 4,,10
	.p2align 3
.L1002:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L1003
	.p2align 4,,10
	.p2align 3
.L970:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L971
	.p2align 4,,10
	.p2align 3
.L1043:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L957
	.p2align 4,,10
	.p2align 3
.L1056:
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
	jmp	.L1001
	.p2align 4,,10
	.p2align 3
.L1046:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2712(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-2712(%rbp), %xmm0
	jmp	.L969
	.p2align 4,,10
	.p2align 3
.L1051:
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
	jmp	.L984
	.p2align 4,,10
	.p2align 3
.L1055:
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
	jmp	.L1000
	.p2align 4,,10
	.p2align 3
.L1048:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L968
	.p2align 4,,10
	.p2align 3
.L954:
	vmovsd	.LC40(%rip), %xmm0
	vmovsd	-2672(%rbp), %xmm3
	vmovsd	.LC39(%rip), %xmm4
	vfmadd132sd	-2680(%rbp), %xmm3, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm4, %xmm0
	jmp	.L1040
	.p2align 4,,10
	.p2align 3
.L972:
	vmovsd	-2680(%rbp), %xmm1
	vmovsd	-2672(%rbp), %xmm7
	movq	-2704(%rbp), %r9
	vfmadd132sd	.LC40(%rip), %xmm7, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L1041
.L1059:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L1013
.L1054:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L992
.L1050:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L976
.L1045:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L960
.L1042:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8829:
.L949:
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
.LFE8829:
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
.LFB9246:
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
.L1061:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L1061
	vmovapd	.LC64(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	vmovapd	.LC9(%rip), %ymm0
	vmovapd	%ymm0, _ZL10_MM256_ONE(%rip)
	vzeroupper
	addq	$8, %rsp
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9246:
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
.LC6:
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.align 32
.LC7:
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.long	0
	.long	1608515584
	.align 32
.LC8:
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.long	0
	.long	536870912
	.align 32
.LC9:
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
.LC10:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.set	.LC11,.LC7
	.set	.LC12,.LC8
	.section	.rodata.cst32
	.align 32
.LC17:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.set	.LC18,.LC9
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
	.section	.rodata.cst32
	.align 32
.LC41:
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.align 32
.LC42:
	.long	1717986918
	.long	1075603046
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.set	.LC43,.LC41
	.section	.rodata.cst8
	.align 8
.LC44:
	.long	-789117515
	.long	731179629
	.section	.rodata.cst32
	.align 32
.LC45:
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.set	.LC46,.LC45
	.section	.rodata.cst8
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
	.set	.LC64,.LC17
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
