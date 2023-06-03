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
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x78
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	pushq	%rbx
	subq	$48, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x60
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	testb	$7, %dil
	jne	.L102
	movq	%rsi, %r9
	movq	%rdx, %rsi
	testb	$7, %dl
	jne	.L103
	vmovapd	.LC17(%rip), %ymm1
	movq	%rcx, %r11
	vmovsd	%xmm0, %xmm0, %xmm6
	movq	%r9, %r10
	vmovlpd	(%r11), %xmm1, %xmm0
	movq	(%r8), %rcx
	vmovapd	.LC9(%rip), %ymm2
	vinsertf128	$0x0, %xmm0, %ymm1, %ymm1
	vbroadcastsd	%xmm6, %ymm8
	andq	$-8, %r10
	xorl	%ebx, %ebx
	testq	%rdi, %rdi
	jle	.L80
	vmovapd	.LC6(%rip), %ymm0
	vmovapd	.LC7(%rip), %ymm4
	vmovapd	.LC8(%rip), %ymm7
	xorl	%eax, %eax
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L65:
	addq	$8, %rax
	cmpq	%rax, %rdi
	jle	.L64
.L67:
	cmpq	%rax, %r10
	je	.L65
	vsubpd	(%rsi,%rax,8), %ymm8, %ymm3
	vmulpd	%ymm3, %ymm1, %ymm1
	vsubpd	32(%rsi,%rax,8), %ymm8, %ymm3
	vmulpd	%ymm3, %ymm2, %ymm2
	testb	$56, %al
	jne	.L65
	vandnpd	%ymm1, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm5
	vcmppd	$2, %ymm7, %ymm1, %ymm3
	vmovmskpd	%ymm5, %edx
	vmovmskpd	%ymm3, %r12d
	movl	%edx, %r13d
	orl	%r12d, %r13d
	jne	.L104
.L66:
	vandnpd	%ymm2, %ymm0, %ymm2
	vcmppd	$13, %ymm4, %ymm2, %ymm5
	vcmppd	$2, %ymm7, %ymm2, %ymm3
	vmovmskpd	%ymm5, %edx
	vmovmskpd	%ymm3, %r12d
	movl	%edx, %r13d
	orl	%r12d, %r13d
	je	.L65
	vmulpd	%ymm7, %ymm2, %ymm9
	popcntl	%edx, %edx
	popcntl	%r12d, %r12d
	subl	%r12d, %edx
	movslq	%edx, %rdx
	vblendvpd	%ymm5, %ymm9, %ymm2, %ymm5
	vmulpd	%ymm4, %ymm5, %ymm2
	addq	$8, %rax
	addq	%rdx, %rbx
	vblendvpd	%ymm3, %ymm2, %ymm5, %ymm2
	cmpq	%rax, %rdi
	jg	.L67
	.p2align 4,,10
	.p2align 3
.L64:
	vandnpd	%ymm1, %ymm0, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm5
	vcmppd	$2, %ymm7, %ymm1, %ymm3
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm3, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L105
.L68:
	vandnpd	%ymm2, %ymm0, %ymm2
	vcmppd	$13, %ymm4, %ymm2, %ymm5
	vcmppd	$2, %ymm7, %ymm2, %ymm3
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm3, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L106
.L69:
	vmulpd	%ymm2, %ymm1, %ymm1
	addq	%rbx, %rcx
	vandnpd	%ymm1, %ymm0, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm3
	vcmppd	$2, %ymm7, %ymm0, %ymm2
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm2, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L107
.L70:
	leaq	-72(%rbp), %rdi
	movq	%rcx, -72(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovq	.LC10(%rip), %xmm2
	movq	-72(%rbp), %rax
	vandpd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, (%r11)
	leaq	7(%r10), %rdx
	movq	%rax, (%r8)
	movslq	%r10d, %rax
	cmpq	%rdx, %rax
	jg	.L61
	vmovsd	.LC11(%rip), %xmm1
	vmovsd	.LC12(%rip), %xmm3
	addq	$8, %r10
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L108:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%r11)
	incq	(%r8)
.L73:
	incq	%rax
	cmpq	%r10, %rax
	je	.L61
.L78:
	cmpq	%rax, %r9
	je	.L73
	vsubsd	(%rsi,%rax,8), %xmm6, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%r11), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L108
	vcomisd	%xmm0, %xmm3
	ja	.L76
	incq	%rax
	vmovsd	%xmm0, (%r11)
	cmpq	%r10, %rax
	jne	.L78
	.p2align 4,,10
	.p2align 3
.L61:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L109
	addq	$48, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r11)
	decq	(%r8)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L104:
	vmulpd	%ymm7, %ymm1, %ymm9
	popcntl	%edx, %edx
	popcntl	%r12d, %r12d
	subl	%r12d, %edx
	movslq	%edx, %rdx
	vblendvpd	%ymm5, %ymm9, %ymm1, %ymm5
	vmulpd	%ymm4, %ymm5, %ymm1
	addq	%rdx, %rcx
	vblendvpd	%ymm3, %ymm1, %ymm5, %ymm1
	jmp	.L66
.L80:
	vmovapd	.LC6(%rip), %ymm0
	vmovapd	.LC7(%rip), %ymm4
	vmovapd	.LC8(%rip), %ymm7
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L105:
	vmulpd	%ymm7, %ymm1, %ymm8
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm8, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm5
	addq	%rax, %rcx
	vblendvpd	%ymm3, %ymm5, %ymm1, %ymm1
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L106:
	vmulpd	%ymm7, %ymm2, %ymm8
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm8, %ymm2, %ymm2
	vmulpd	%ymm4, %ymm2, %ymm5
	addq	%rax, %rbx
	vblendvpd	%ymm3, %ymm5, %ymm2, %ymm2
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L107:
	vmulpd	%ymm7, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm3, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm4
	addq	%rax, %rcx
	vblendvpd	%ymm2, %ymm4, %ymm0, %ymm0
	jmp	.L70
.L109:
	call	__stack_chk_fail@PLT
.L103:
	leaq	.LC13(%rip), %rcx
	movl	$256, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	call	__assert_fail@PLT
.L102:
	leaq	.LC13(%rip), %rcx
	movl	$255, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC15(%rip), %rdi
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
	jle	.L121
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC11(%rip), %xmm4
	vmovsd	.LC12(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L122:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L114:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L121
.L116:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L122
	vcomisd	%xmm1, %xmm5
	ja	.L115
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L116
.L121:
	ret
	.p2align 4,,10
	.p2align 3
.L115:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L114
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
	jle	.L134
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC11(%rip), %xmm4
	vmovsd	.LC12(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L135:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L127:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L134
.L129:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L135
	vcomisd	%xmm2, %xmm5
	ja	.L128
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L129
.L134:
	ret
	.p2align 4,,10
	.p2align 3
.L128:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L127
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
	jle	.L145
	vmovsd	(%r8), %xmm2
	vmovsd	.LC11(%rip), %xmm5
	vmovsd	.LC12(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L144
	.p2align 4,,10
	.p2align 3
.L158:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L142:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L145
.L144:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L158
	vcomisd	%xmm2, %xmm6
	ja	.L143
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L144
.L145:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L159
	vmovsd	(%r8), %xmm2
	vmovsd	.LC11(%rip), %xmm5
	vmovsd	.LC12(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L161:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L148:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L160
.L150:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L161
	vcomisd	%xmm2, %xmm6
	ja	.L149
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L150
.L160:
	ret
	.p2align 4,,10
	.p2align 3
.L143:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L149:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L159:
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
	ja	.L171
	ret
.L171:
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
.L173:
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
	jne	.L173
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L174:
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
	jne	.L174
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
	je	.L178
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L178:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L177
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L177:
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
	leaq	-2576(%rbp), %rdi
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
	vmovapd	.LC29(%rip), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	$0, -2576(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC30(%rip), %xmm4
	vmovq	.LC10(%rip), %xmm2
	vdivsd	%xmm0, %xmm4, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vsubsd	.LC18(%rip), %xmm3, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vcomisd	.LC19(%rip), %xmm3
	ja	.L357
	movq	-2576(%rbp), %rsi
	cmpq	$1, %rsi
	jne	.L356
	vmovapd	.LC31(%rip), %ymm0
	leaq	-2568(%rbp), %r12
	movq	%r12, %rdi
	movq	$0, -2568(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	.LC32(%rip), %xmm0
	movq	-2568(%rbp), %rsi
	vucomisd	%xmm0, %xmm1
	jp	.L281
	jne	.L281
	testq	%rsi, %rsi
	jne	.L358
	vmovapd	.LC33(%rip), %ymm0
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC34(%rip), %xmm4
	vmovq	.LC10(%rip), %xmm2
	vdivsd	%xmm0, %xmm4, %xmm3
	movq	-2568(%rbp), %r8
	vmovsd	%xmm0, %xmm0, %xmm1
	vandpd	%xmm2, %xmm3, %xmm3
	vsubsd	.LC18(%rip), %xmm3, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vcomisd	.LC19(%rip), %xmm3
	ja	.L359
	cmpq	$1, %r8
	jne	.L360
	vmovapd	.LC6(%rip), %ymm3
	vmovapd	.LC7(%rip), %ymm4
	vandnpd	.LC35(%rip), %ymm3, %ymm6
	vmovapd	.LC8(%rip), %ymm5
	vcmppd	$13, %ymm4, %ymm6, %ymm1
	vcmppd	$2, %ymm5, %ymm6, %ymm0
	vmovmskpd	%ymm1, %eax
	vmovmskpd	%ymm0, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L361
.L194:
	movq	%r12, %rdi
	vmovapd	%ymm6, %ymm0
	movq	%rsi, -2568(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC36(%rip), %xmm8
	vmovq	.LC10(%rip), %xmm2
	vdivsd	%xmm0, %xmm8, %xmm7
	movq	-2568(%rbp), %r8
	vmovapd	.LC6(%rip), %ymm3
	vmovapd	.LC7(%rip), %ymm4
	vmovapd	.LC8(%rip), %ymm5
	vmovsd	%xmm0, %xmm0, %xmm1
	vandpd	%xmm2, %xmm7, %xmm7
	vsubsd	.LC18(%rip), %xmm7, %xmm7
	vandpd	%xmm2, %xmm7, %xmm7
	vcomisd	.LC19(%rip), %xmm7
	ja	.L362
	cmpq	$2, %r8
	jne	.L363
	vmulpd	.LC37(%rip), %ymm6, %ymm0
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm6
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm6, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L364
.L198:
	movq	%r12, %rdi
	movq	%rsi, -2568(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC38(%rip), %xmm7
	vmovq	.LC10(%rip), %xmm2
	vdivsd	%xmm0, %xmm7, %xmm6
	movq	-2568(%rbp), %r14
	vmovsd	%xmm0, %xmm0, %xmm1
	vandpd	%xmm2, %xmm6, %xmm6
	vsubsd	.LC18(%rip), %xmm6, %xmm6
	vandpd	%xmm2, %xmm6, %xmm6
	vcomisd	.LC19(%rip), %xmm6
	ja	.L365
	testq	%r14, %r14
	jne	.L366
	movl	$128000, %edi
	vzeroupper
	call	_Znam@PLT
	movq	$42, -2560(%rbp)
	movq	%rax, %r13
	movl	$42, %edx
	movl	$1, %ebx
	leaq	-2560(%rbp), %rsi
	movabsq	$6364136223846793005, %rcx
	.p2align 4,,10
	.p2align 3
.L202:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	leaq	(%rbx,%rax), %rdx
	movq	%rdx, (%rsi,%rbx,8)
	incq	%rbx
	cmpq	$312, %rbx
	jne	.L202
	leaq	_ZL3gen(%rip), %rcx
	movl	$2504, %edx
	movq	%rcx, %rdi
	movq	$312, -64(%rbp)
	vzeroupper
	call	memcpy@PLT
	vmovsd	_ZL5distu(%rip), %xmm6
	vmovsd	8+_ZL5distu(%rip), %xmm1
	vmovapd	.LC6(%rip), %ymm3
	vsubsd	%xmm6, %xmm1, %xmm1
	vmovapd	.LC7(%rip), %ymm4
	vmovapd	.LC8(%rip), %ymm5
	movq	%rax, %rcx
	leaq	128000(%r13), %r9
	movq	%r13, %r15
	movabsq	$6148914691236517205, %r8
	movabsq	$8202884508482404352, %rsi
	movabsq	$-2270628950310912, %rdx
	vxorps	%xmm7, %xmm7, %xmm7
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L368:
	vcvtsi2sdq	%rax, %xmm7, %xmm0
.L205:
	vxorpd	%xmm12, %xmm12, %xmm12
	vaddsd	%xmm12, %xmm0, %xmm0
	vmulsd	.LC40(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L206
	vfmadd132sd	%xmm1, %xmm6, %xmm0
	vmovsd	.LC42(%rip), %xmm13
	addq	$8, %r15
	vfmadd132sd	.LC41(%rip), %xmm13, %xmm0
	vmovsd	%xmm0, -8(%r15)
	cmpq	%r9, %r15
	je	.L207
.L210:
	movq	%rdi, %rbx
.L203:
	cmpq	$311, %rbx
	ja	.L367
.L209:
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
	andq	%rdx, %r10
	xorq	%r10, %rax
	movq	%rax, %r10
	shrq	$43, %r10
	movq	%rdi, 2496+_ZL3gen(%rip)
	xorq	%r10, %rax
	jns	.L368
	movq	%rax, %r10
	shrq	%r10
	andl	$1, %eax
	orq	%rax, %r10
	vcvtsi2sdq	%r10, %xmm7, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L367:
	movq	%rcx, %rdi
	movq	%r9, -2592(%rbp)
	vmovsd	%xmm1, -2600(%rbp)
	vmovsd	%xmm6, -2584(%rbp)
	vzeroupper
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rbx
	vmovsd	-2600(%rbp), %xmm1
	vmovapd	.LC8(%rip), %ymm5
	vmovapd	.LC7(%rip), %ymm4
	vmovapd	.LC6(%rip), %ymm3
	movq	-2592(%rbp), %r9
	vmovsd	-2584(%rbp), %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	movabsq	$-2270628950310912, %rdx
	movabsq	$8202884508482404352, %rsi
	movabsq	$6148914691236517205, %r8
	leaq	_ZL3gen(%rip), %rcx
	jmp	.L209
.L206:
	vmovsd	.LC43(%rip), %xmm0
	vmovsd	.LC42(%rip), %xmm14
	vfmadd132sd	%xmm1, %xmm6, %xmm0
	addq	$8, %r15
	vfmadd132sd	.LC41(%rip), %xmm14, %xmm0
	vmovsd	%xmm0, -8(%r15)
	cmpq	%r9, %r15
	jne	.L210
.L207:
	testb	$7, %r13b
	jne	.L369
	vmovapd	.LC9(%rip), %ymm6
	vmovapd	.LC28(%rip), %ymm1
	vmovapd	.LC44(%rip), %ymm7
	xorl	%esi, %esi
	xorl	%edx, %edx
	vmovapd	%ymm6, %ymm0
	movl	$42, %ecx
	jmp	.L211
	.p2align 4,,10
	.p2align 3
.L213:
	cmpq	$16000, %rax
	je	.L215
.L212:
	movq	%rax, %rdx
.L211:
	leaq	8(%rdx), %rax
	cmpq	$56, %rdx
	je	.L212
	vsubpd	-64(%r13,%rax,8), %ymm7, %ymm8
	andl	$56, %edx
	vmulpd	%ymm8, %ymm1, %ymm1
	vsubpd	-32(%r13,%rax,8), %ymm7, %ymm8
	vmulpd	%ymm8, %ymm0, %ymm0
	jne	.L213
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm9
	vcmppd	$2, %ymm5, %ymm1, %ymm8
	vmovmskpd	%ymm9, %edx
	vmovmskpd	%ymm8, %edi
	movl	%edx, %ebx
	orl	%edi, %ebx
	jne	.L370
.L214:
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm9
	vcmppd	$2, %ymm5, %ymm0, %ymm8
	vmovmskpd	%ymm9, %edx
	vmovmskpd	%ymm8, %edi
	movl	%edx, %ebx
	orl	%edi, %ebx
	je	.L213
	vmulpd	%ymm5, %ymm0, %ymm10
	popcntl	%edx, %edx
	popcntl	%edi, %edi
	subl	%edi, %edx
	movslq	%edx, %rdx
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm9
	vmulpd	%ymm4, %ymm9, %ymm0
	addq	%rdx, %rsi
	vblendvpd	%ymm8, %ymm0, %ymm9, %ymm0
	cmpq	$16000, %rax
	jne	.L212
.L215:
	vandnpd	%ymm1, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm8
	vcmppd	$2, %ymm5, %ymm1, %ymm7
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm7, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L371
.L216:
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm8
	vcmppd	$2, %ymm5, %ymm0, %ymm7
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm7, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L372
.L217:
	vmulpd	%ymm1, %ymm0, %ymm0
	addq	%rsi, %rcx
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm7
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L373
.L218:
	movq	%r12, %rdi
	movq	%rcx, -2568(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC45(%rip), %xmm1
	vmovq	.LC10(%rip), %xmm2
	vsubsd	448(%r13), %xmm1, %xmm9
	vandpd	%xmm2, %xmm0, %xmm0
	vmovsd	.LC11(%rip), %xmm7
	vandpd	%xmm2, %xmm9, %xmm9
	vmulsd	%xmm0, %xmm9, %xmm9
	movq	-2568(%rbp), %rsi
	vmovsd	.LC12(%rip), %xmm8
	vmovapd	.LC6(%rip), %ymm3
	vmovapd	.LC7(%rip), %ymm4
	vcomisd	%xmm7, %xmm9
	vmovapd	.LC8(%rip), %ymm5
	jbe	.L374
	vmulsd	%xmm8, %xmm9, %xmm9
	incq	%rsi
.L220:
	vsubsd	456(%r13), %xmm1, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vcomisd	%xmm7, %xmm0
	ja	.L222
	vcomisd	%xmm0, %xmm8
	ja	.L375
.L223:
	vsubsd	464(%r13), %xmm1, %xmm9
	vandpd	%xmm2, %xmm9, %xmm9
	vmulsd	%xmm0, %xmm9, %xmm9
	vcomisd	%xmm7, %xmm9
	ja	.L225
	vcomisd	%xmm9, %xmm8
	ja	.L376
.L226:
	vsubsd	472(%r13), %xmm1, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vcomisd	%xmm7, %xmm0
	ja	.L228
	vcomisd	%xmm0, %xmm8
	ja	.L377
.L229:
	vsubsd	480(%r13), %xmm1, %xmm9
	vandpd	%xmm2, %xmm9, %xmm9
	vmulsd	%xmm0, %xmm9, %xmm9
	vcomisd	%xmm7, %xmm9
	ja	.L231
	vcomisd	%xmm9, %xmm8
	ja	.L378
.L232:
	vsubsd	496(%r13), %xmm1, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vcomisd	%xmm7, %xmm0
	ja	.L234
	vcomisd	%xmm0, %xmm8
	ja	.L379
.L235:
	vsubsd	504(%r13), %xmm1, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vcomisd	%xmm7, %xmm1
	jbe	.L350
	vmulsd	%xmm8, %xmm1, %xmm1
	incq	%rsi
.L239:
	vmovsd	.LC46(%rip), %xmm9
	vdivsd	%xmm1, %xmm9, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L380
	cmpq	$-3, %rsi
	jne	.L381
	vmovapd	.LC17(%rip), %ymm0
	xorl	%ecx, %ecx
	vmovsd	%xmm1, %xmm0, %xmm9
	vinsertf128	$0x0, %xmm9, %ymm0, %ymm0
	vmovapd	.LC47(%rip), %ymm9
	jmp	.L248
	.p2align 4,,10
	.p2align 3
.L245:
	cmpq	$16000, %rax
	je	.L247
.L244:
	movq	%rax, %r14
.L248:
	leaq	8(%r14), %rax
	cmpq	$256, %r14
	je	.L244
	vsubpd	-64(%r13,%rax,8), %ymm9, %ymm10
	andl	$56, %r14d
	vmulpd	%ymm10, %ymm0, %ymm0
	vsubpd	-32(%r13,%rax,8), %ymm9, %ymm10
	vmulpd	%ymm10, %ymm6, %ymm6
	jne	.L245
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm11
	vcmppd	$2, %ymm5, %ymm0, %ymm10
	vmovmskpd	%ymm11, %edx
	vmovmskpd	%ymm10, %edi
	movl	%edx, %ebx
	orl	%edi, %ebx
	jne	.L382
.L246:
	vandnpd	%ymm6, %ymm3, %ymm6
	vcmppd	$13, %ymm4, %ymm6, %ymm11
	vcmppd	$2, %ymm5, %ymm6, %ymm10
	vmovmskpd	%ymm11, %edx
	vmovmskpd	%ymm10, %edi
	movl	%edx, %ebx
	orl	%edi, %ebx
	je	.L245
	vmulpd	%ymm5, %ymm6, %ymm1
	popcntl	%edx, %edx
	popcntl	%edi, %edi
	subl	%edi, %edx
	movslq	%edx, %rdx
	vblendvpd	%ymm11, %ymm1, %ymm6, %ymm11
	vmulpd	%ymm4, %ymm11, %ymm6
	addq	%rdx, %rcx
	vblendvpd	%ymm10, %ymm6, %ymm11, %ymm6
	cmpq	$16000, %rax
	jne	.L244
.L247:
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm9
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L383
.L249:
	vandnpd	%ymm6, %ymm3, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm9
	vcmppd	$2, %ymm5, %ymm1, %ymm6
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L384
.L250:
	vmulpd	%ymm1, %ymm0, %ymm0
	addq	%rcx, %rsi
	vandnpd	%ymm0, %ymm3, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm3
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L385
.L251:
	movq	%r12, %rdi
	movq	%rsi, -2568(%rbp)
	call	_Z18horizontal_productDv4_dRl
	vmovsd	.LC48(%rip), %xmm1
	vmovq	.LC10(%rip), %xmm2
	vsubsd	2056(%r13), %xmm1, %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	movq	-2568(%rbp), %rsi
	vandpd	%xmm2, %xmm3, %xmm3
	vmulsd	%xmm0, %xmm3, %xmm3
	vcomisd	%xmm7, %xmm3
	ja	.L252
	vcomisd	%xmm3, %xmm8
	jbe	.L253
	vmulsd	%xmm7, %xmm3, %xmm3
	decq	%rsi
.L253:
	vsubsd	2064(%r13), %xmm1, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vcomisd	%xmm7, %xmm0
	ja	.L255
	vcomisd	%xmm0, %xmm8
	jbe	.L256
	vmulsd	%xmm7, %xmm0, %xmm0
	decq	%rsi
.L256:
	vsubsd	2072(%r13), %xmm1, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vmulsd	%xmm0, %xmm3, %xmm3
	vcomisd	%xmm7, %xmm3
	ja	.L258
	vcomisd	%xmm3, %xmm8
	jbe	.L259
	vmulsd	%xmm7, %xmm3, %xmm3
	decq	%rsi
.L259:
	vsubsd	2080(%r13), %xmm1, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vcomisd	%xmm7, %xmm0
	ja	.L261
	vcomisd	%xmm0, %xmm8
	jbe	.L262
	vmulsd	%xmm7, %xmm0, %xmm0
	decq	%rsi
.L262:
	vsubsd	2088(%r13), %xmm1, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vmulsd	%xmm0, %xmm3, %xmm3
	vcomisd	%xmm7, %xmm3
	ja	.L264
	vcomisd	%xmm3, %xmm8
	jbe	.L265
	vmulsd	%xmm7, %xmm3, %xmm3
	decq	%rsi
.L265:
	vsubsd	2096(%r13), %xmm1, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vcomisd	%xmm7, %xmm0
	ja	.L267
	vcomisd	%xmm0, %xmm8
	jbe	.L268
	vmulsd	%xmm7, %xmm0, %xmm0
	decq	%rsi
.L268:
	vsubsd	2104(%r13), %xmm1, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vcomisd	%xmm7, %xmm1
	jbe	.L352
	vmulsd	%xmm8, %xmm1, %xmm1
	incq	%rsi
.L272:
	vmovsd	.LC49(%rip), %xmm3
	vdivsd	%xmm1, %xmm3, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L386
	cmpq	$101, %rsi
	jne	.L387
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L388
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
.L374:
	.cfi_restore_state
	vcomisd	%xmm9, %xmm8
	jbe	.L220
	vmulsd	%xmm7, %xmm9, %xmm9
	decq	%rsi
	jmp	.L220
.L267:
	vmulsd	%xmm8, %xmm0, %xmm0
	incq	%rsi
	jmp	.L268
.L264:
	vmulsd	%xmm8, %xmm3, %xmm3
	incq	%rsi
	jmp	.L265
.L352:
	vcomisd	%xmm1, %xmm8
	jbe	.L272
	vmulsd	%xmm7, %xmm1, %xmm1
	decq	%rsi
	jmp	.L272
.L261:
	vmulsd	%xmm8, %xmm0, %xmm0
	incq	%rsi
	jmp	.L262
.L258:
	vmulsd	%xmm8, %xmm3, %xmm3
	incq	%rsi
	jmp	.L259
.L255:
	vmulsd	%xmm8, %xmm0, %xmm0
	incq	%rsi
	jmp	.L256
.L252:
	vmulsd	%xmm8, %xmm3, %xmm3
	incq	%rsi
	jmp	.L253
.L350:
	vcomisd	%xmm1, %xmm8
	jbe	.L239
	vmulsd	%xmm7, %xmm1, %xmm1
	decq	%rsi
	jmp	.L239
.L234:
	vmulsd	%xmm8, %xmm0, %xmm0
	incq	%rsi
	jmp	.L235
.L231:
	vmulsd	%xmm8, %xmm9, %xmm9
	incq	%rsi
	jmp	.L232
.L228:
	vmulsd	%xmm8, %xmm0, %xmm0
	incq	%rsi
	jmp	.L229
.L225:
	vmulsd	%xmm8, %xmm9, %xmm9
	incq	%rsi
	jmp	.L226
.L222:
	vmulsd	%xmm8, %xmm0, %xmm0
	incq	%rsi
	jmp	.L223
.L382:
	vmulpd	%ymm5, %ymm0, %ymm1
	popcntl	%edx, %edx
	popcntl	%edi, %edi
	subl	%edi, %edx
	movslq	%edx, %rdx
	vblendvpd	%ymm11, %ymm1, %ymm0, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm0
	addq	%rdx, %rsi
	vblendvpd	%ymm10, %ymm0, %ymm1, %ymm0
	jmp	.L246
.L370:
	vmulpd	%ymm5, %ymm1, %ymm10
	popcntl	%edx, %edx
	popcntl	%edi, %edi
	subl	%edi, %edx
	movslq	%edx, %rdx
	vblendvpd	%ymm9, %ymm10, %ymm1, %ymm9
	vmulpd	%ymm4, %ymm9, %ymm1
	addq	%rdx, %rcx
	vblendvpd	%ymm8, %ymm1, %ymm9, %ymm1
	jmp	.L214
.L379:
	vmulsd	%xmm7, %xmm0, %xmm0
	decq	%rsi
	jmp	.L235
.L378:
	vmulsd	%xmm7, %xmm9, %xmm9
	decq	%rsi
	jmp	.L232
.L377:
	vmulsd	%xmm7, %xmm0, %xmm0
	decq	%rsi
	jmp	.L229
.L376:
	vmulsd	%xmm7, %xmm9, %xmm9
	decq	%rsi
	jmp	.L226
.L375:
	vmulsd	%xmm7, %xmm0, %xmm0
	decq	%rsi
	jmp	.L223
.L385:
	vmulpd	%ymm5, %ymm0, %ymm5
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm3, %ymm5, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm4
	addq	%rax, %rsi
	vblendvpd	%ymm1, %ymm4, %ymm0, %ymm0
	jmp	.L251
.L384:
	vmulpd	%ymm5, %ymm1, %ymm10
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm9, %ymm10, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm9
	addq	%rax, %rcx
	vblendvpd	%ymm6, %ymm9, %ymm1, %ymm1
	jmp	.L250
.L383:
	vmulpd	%ymm5, %ymm0, %ymm10
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm9
	vmulpd	%ymm4, %ymm9, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm1, %ymm0, %ymm9, %ymm0
	jmp	.L249
.L361:
	vmulpd	%ymm5, %ymm6, %ymm7
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rsi
	vblendvpd	%ymm1, %ymm7, %ymm6, %ymm6
	vmulpd	%ymm4, %ymm6, %ymm1
	vblendvpd	%ymm0, %ymm1, %ymm6, %ymm6
	jmp	.L194
.L364:
	vmulpd	%ymm5, %ymm0, %ymm7
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm6, %ymm7, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm6
	addq	%rax, %rsi
	vblendvpd	%ymm1, %ymm6, %ymm0, %ymm0
	jmp	.L198
.L372:
	vmulpd	%ymm5, %ymm0, %ymm9
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm9, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm8
	addq	%rax, %rsi
	vblendvpd	%ymm7, %ymm8, %ymm0, %ymm0
	jmp	.L217
.L373:
	vmulpd	%ymm5, %ymm0, %ymm8
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm7, %ymm8, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm7
	addq	%rax, %rcx
	vblendvpd	%ymm1, %ymm7, %ymm0, %ymm0
	jmp	.L218
.L371:
	vmulpd	%ymm5, %ymm1, %ymm9
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm9, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm8
	addq	%rax, %rcx
	vblendvpd	%ymm7, %ymm8, %ymm1, %ymm1
	jmp	.L216
.L388:
	call	__stack_chk_fail@PLT
.L369:
	leaq	.LC13(%rip), %rcx
	movl	$256, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	vzeroupper
	call	__assert_fail@PLT
.L363:
	movq	%r8, %rsi
	movl	$2, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L366:
	movq	%r14, %rsi
	xorl	%edi, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L365:
	vmovsd	%xmm7, %xmm7, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L358:
	xorl	%edi, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L281:
	leaq	_ZSt4cerr(%rip), %r12
	movl	$20, %edx
	leaq	.LC3(%rip), %rsi
	movq	%r12, %rdi
	vmovsd	%xmm1, -2584(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	.LC32(%rip), %rax
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
	je	.L389
	cmpb	$0, 56(%r12)
	je	.L188
	movzbl	67(%r12), %eax
.L189:
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
.L360:
	movq	%r8, %rsi
.L356:
	movl	$1, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L188:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	%rcx, %rdx
	je	.L189
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rdx
	jmp	.L189
.L389:
	call	_ZSt16__throw_bad_castv@PLT
.L357:
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm4, %xmm4, %xmm0
	call	_Z13assert_approxdd.part.0
.L359:
	vmovsd	%xmm4, %xmm4, %xmm0
	call	_Z13assert_approxdd.part.0
.L362:
	vmovsd	%xmm8, %xmm8, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L386:
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
.L380:
	vmovsd	%xmm9, %xmm9, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L381:
	movq	$-3, %rdi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L387:
	movl	$101, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
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
	jle	.L404
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
	jmp	.L399
	.p2align 4,,10
	.p2align 3
.L406:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L393:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC40(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L394
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L400
.L395:
	movq	%rdx, %rax
.L399:
	cmpq	$311, %rax
	ja	.L405
.L398:
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
	jns	.L406
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L393
	.p2align 4,,10
	.p2align 3
.L405:
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
	jmp	.L398
	.p2align 4,,10
	.p2align 3
.L394:
	vmovsd	.LC43(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L395
.L400:
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
.L404:
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
.LC51:
	.string	"M N\n"
	.section	.rodata.str1.8
	.align 8
.LC52:
	.string	"M number of runs, N number of particles\n"
	.section	.rodata.str1.1
.LC53:
	.string	"example: "
.LC54:
	.string	" 10 10000\n"
.LC55:
	.string	" product: "
.LC57:
	.string	" exponent: "
.LC59:
	.string	"prod_realreal: orod="
.LC60:
	.string	" exponent="
.LC61:
	.string	" timing="
.LC62:
	.string	" seconds\n"
.LC63:
	.string	"prod_complexcomplex: orod="
.LC64:
	.string	"prod_realcomplex: orod="
.LC65:
	.string	"prod_complexreal: orod="
	.section	.text.unlikely,"ax",@progbits
.LCOLDB66:
	.section	.text.startup,"ax",@progbits
.LHOTB66:
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
.L408:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	leaq	(%rax,%rcx), %rdx
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
	cmpq	$312, %rcx
	jne	.L408
	leaq	_ZL3gen(%rip), %r12
	movl	$2504, %edx
	movq	%r12, %rdi
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	cmpl	$3, %r13d
	je	.L409
	leaq	_ZSt4cout(%rip), %r12
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC51(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC52(%rip), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$9, %edx
	leaq	.LC53(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC54(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %eax
.L407:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L504
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
.L409:
	.cfi_restore_state
	movl	$10, %edx
	leaq	.LC55(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	$0, -2632(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	.LC56(%rip), %ymm0
	leaq	-2632(%rbp), %rdi
	call	_Z18horizontal_productDv4_dRl
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$11, %edx
	leaq	.LC57(%rip), %rsi
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
	ja	.L411
	leaq	0(,%r14,8), %rbx
	movq	%rbx, %rdi
	call	_Znam@PLT
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	_Znam@PLT
	movq	.LC18(%rip), %rdi
	movq	%r15, %rsi
	vmovq	%rdi, %xmm1
	movq	.LC42(%rip), %rdi
	movq	%rax, %r13
	vmovq	%rdi, %xmm0
	movq	%r14, %rdi
	call	_Z21init_random_positionslddPd
	movq	.LC18(%rip), %rdi
	movq	%r13, %rsi
	vmovq	%rdi, %xmm1
	movq	.LC42(%rip), %rdi
	vmovq	%rdi, %xmm0
	movq	%r14, %rdi
	call	_Z21init_random_positionslddPd
	movq	.LC18(%rip), %rsi
	movq	$0, -2616(%rbp)
	movq	%rsi, -2624(%rbp)
	call	clock@PLT
	movq	.LC58(%rip), %rsi
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
	jle	.L412
	testq	%r14, %r14
	jle	.L412
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	-2616(%rbp), %rax
	movq	%rax, -2704(%rbp)
	vmovsd	%xmm4, -2648(%rbp)
	leaq	-2624(%rbp), %rax
	vmovsd	.LC40(%rip), %xmm4
	movq	%rax, -2696(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	%xmm4, -2656(%rbp)
	movq	$0, -2712(%rbp)
	vmovsd	.LC41(%rip), %xmm4
	movq	%rax, -2744(%rbp)
	movq	%r13, -2728(%rbp)
	movq	%rbx, -2720(%rbp)
	movq	-2688(%rbp), %rbx
	vmovsd	%xmm4, -2664(%rbp)
	.p2align 4,,10
	.p2align 3
.L413:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -2672(%rbp)
	vmovsd	%xmm7, -2680(%rbp)
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L506:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L415:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L416
	vmovsd	-2672(%rbp), %xmm6
	vmovsd	.LC42(%rip), %xmm7
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm7, %xmm0
.L502:
	movq	-2704(%rbp), %r8
	movq	-2696(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L417
	movq	%r14, %rax
.L421:
	cmpq	$311, %rax
	ja	.L505
.L419:
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
	jns	.L506
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L415
	.p2align 4,,10
	.p2align 3
.L417:
	incq	-2712(%rbp)
	movq	-2712(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L413
	movq	-2720(%rbp), %rbx
	movq	-2728(%rbp), %r13
.L412:
	leaq	-2608(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -2760(%rbp)
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC59(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC60(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC61(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L507
.L422:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC62(%rip), %rsi
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
	jle	.L423
	cmpq	$0, -2688(%rbp)
	jle	.L423
	leaq	-2616(%rbp), %rax
	movq	%rax, -2704(%rbp)
	leaq	-2624(%rbp), %rax
	movq	%rax, -2696(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC40(%rip), %xmm4
	vmovsd	.LC41(%rip), %xmm6
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
.L424:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -2672(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -2680(%rbp)
	jmp	.L437
	.p2align 4,,10
	.p2align 3
.L511:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L426:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmovsd	.LC18(%rip), %xmm7
	vmovsd	.LC43(%rip), %xmm6
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-2672(%rbp), %xmm6
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vmovsd	.LC42(%rip), %xmm6
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L508
.L431:
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
	js	.L432
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L433:
	vaddsd	-2648(%rbp), %xmm1, %xmm1
	vmulsd	-2656(%rbp), %xmm1, %xmm1
	vcomisd	.LC18(%rip), %xmm1
	jnb	.L434
	vmovsd	-2672(%rbp), %xmm4
	movq	-2704(%rbp), %r9
	vfmadd132sd	-2680(%rbp), %xmm4, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L503:
	vmovsd	.LC42(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L509
.L437:
	cmpq	$311, %r11
	ja	.L510
.L430:
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
	jns	.L511
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L509:
	incq	-2720(%rbp)
	movq	-2720(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L424
	movq	-2728(%rbp), %rbx
.L423:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC63(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC60(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC61(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L512
.L438:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC62(%rip), %rsi
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
	jle	.L439
	cmpq	$0, -2688(%rbp)
	jle	.L439
	movq	.LC18(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC40(%rip), %xmm6
	vmovsd	.LC41(%rip), %xmm7
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
.L440:
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
.L453:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L513
.L446:
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
	js	.L441
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L442:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC18(%rip), %xmm2
	vmovsd	.LC43(%rip), %xmm1
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	movq	%r10, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC42(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L515:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L449:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L514
.L451:
	vmovsd	(%r14,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L515
	vcomisd	%xmm0, %xmm4
	jbe	.L449
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L451
.L514:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L452
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r10
.L452:
	incq	%r13
	cmpq	%r13, -2688(%rbp)
	jne	.L453
	incq	-2728(%rbp)
	movq	%r14, %r13
	movq	%r10, %r14
	movq	-2728(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L440
.L439:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC64(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC60(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC61(%rip), %rsi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L516
.L454:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r14, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC62(%rip), %rsi
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
	jle	.L455
	cmpq	$0, -2688(%rbp)
	jle	.L455
	movq	.LC18(%rip), %rax
	vmovsd	.LC41(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC40(%rip), %xmm7
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
.L456:
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
.L474:
	cmpq	$311, %rdi
	ja	.L517
.L462:
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
	js	.L457
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L458:
	vaddsd	-2648(%rbp), %xmm5, %xmm5
	vmovsd	.LC18(%rip), %xmm2
	vmulsd	-2656(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC43(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC42(%rip), %xmm1
	vfmadd132sd	-2664(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L518
.L463:
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
	js	.L464
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L465:
	vaddsd	-2648(%rbp), %xmm2, %xmm2
	vmovsd	.LC18(%rip), %xmm1
	vmovsd	.LC42(%rip), %xmm9
	vmulsd	-2656(%rbp), %xmm2, %xmm2
	movq	-2672(%rbp), %rax
	movq	%r15, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC43(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	-2664(%rbp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L472
	.p2align 4,,10
	.p2align 3
.L520:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L470:
	addq	$8, %rax
	cmpq	%rax, %r13
	je	.L519
.L472:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L520
	vcomisd	%xmm0, %xmm4
	jbe	.L470
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r13
	jne	.L472
.L519:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L473
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r15
.L473:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L474
	incq	-2752(%rbp)
	movq	%r13, %rbx
	movq	%r15, %r13
	movq	-2752(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L456
	movq	-2672(%rbp), %r15
	movq	-2768(%rbp), %r13
.L455:
	movq	-2760(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC65(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-2624(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC60(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-2616(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC61(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -2576(%rbp)
	vmovsd	-2584(%rbp), %xmm1
	jne	.L521
.L475:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC62(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZdaPv@PLT
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L407
	.p2align 4,,10
	.p2align 3
.L441:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L457:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L458
	.p2align 4,,10
	.p2align 3
.L464:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L432:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L433
	.p2align 4,,10
	.p2align 3
.L505:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L419
	.p2align 4,,10
	.p2align 3
.L518:
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
	jmp	.L463
	.p2align 4,,10
	.p2align 3
.L508:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2712(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-2712(%rbp), %xmm0
	jmp	.L431
	.p2align 4,,10
	.p2align 3
.L513:
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
	jmp	.L446
	.p2align 4,,10
	.p2align 3
.L517:
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
	jmp	.L462
	.p2align 4,,10
	.p2align 3
.L510:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L416:
	vmovsd	.LC43(%rip), %xmm0
	vmovsd	-2672(%rbp), %xmm3
	vmovsd	.LC42(%rip), %xmm4
	vfmadd132sd	-2680(%rbp), %xmm3, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm4, %xmm0
	jmp	.L502
	.p2align 4,,10
	.p2align 3
.L434:
	vmovsd	-2680(%rbp), %xmm1
	vmovsd	-2672(%rbp), %xmm7
	movq	-2704(%rbp), %r9
	vfmadd132sd	.LC43(%rip), %xmm7, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L503
.L521:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L475
.L516:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L454
.L512:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L438
.L507:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L422
.L504:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8829:
.L411:
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
.LCOLDE66:
	.section	.text.startup
.LHOTE66:
	.p2align 4
	.type	_GLOBAL__sub_I__Z21init_random_positionslddPd, @function
_GLOBAL__sub_I__Z21init_random_positionslddPd:
.LFB9246:
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
.L523:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L523
	vmovapd	.LC67(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9246:
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
	.long	1717986918
	.long	1075603046
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC29:
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
.LC30:
	.long	478481221
	.long	1491110742
	.section	.rodata.cst32
	.align 32
.LC31:
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
.LC32:
	.long	0
	.long	1082310656
	.section	.rodata.cst32
	.align 32
.LC33:
	.long	-1221459147
	.long	1164226036
	.long	-1221459147
	.long	1162128884
	.long	675124967
	.long	-899045226
	.long	630506365
	.long	1422018989
	.section	.rodata.cst8
	.align 8
.LC34:
	.long	1350305698
	.long	1243119313
	.section	.rodata.cst32
	.align 32
.LC35:
	.long	-925821018
	.long	-1679841147
	.long	2045033563
	.long	-549949310
	.long	1136857992
	.long	1771002533
	.long	-673750438
	.long	1770317592
	.section	.rodata.cst8
	.align 8
.LC36:
	.long	-519963160
	.long	1316942624
	.section	.rodata.cst32
	.align 32
.LC37:
	.long	-1614553673
	.long	654616690
	.long	-2070344081
	.long	759188441
	.long	-1760660904
	.long	811397809
	.long	390947107
	.long	-1353516884
	.section	.rodata.cst8
	.align 8
.LC38:
	.long	2038431744
	.long	1117115375
	.align 8
.LC40:
	.long	0
	.long	1005584384
	.set	.LC41,.LC31+24
	.align 8
.LC42:
	.long	0
	.long	-1074790400
	.align 8
.LC43:
	.long	-1
	.long	1072693247
	.section	.rodata.cst32
	.align 32
.LC44:
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.long	-398572965
	.long	1068149977
	.set	.LC45,.LC44
	.section	.rodata.cst8
	.align 8
.LC46:
	.long	-789117515
	.long	731179629
	.section	.rodata.cst32
	.align 32
.LC47:
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.long	-1889785610
	.long	-1071352382
	.set	.LC48,.LC47
	.section	.rodata.cst8
	.align 8
.LC49:
	.long	-1935337750
	.long	1246898371
	.section	.rodata.cst32
	.align 32
.LC56:
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
.LC58:
	.long	-1598689907
	.long	1051772663
	.set	.LC67,.LC17
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
