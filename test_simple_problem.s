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
.LFB9235:
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
.LFE9235:
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
	.globl	_Z18mul_if_index_not_kDv4_dS_S_ll
	.type	_Z18mul_if_index_not_kDv4_dS_S_ll, @function
_Z18mul_if_index_not_kDv4_dS_S_ll:
.LFB8811:
	.cfi_startproc
	endbr64
	vsubpd	%ymm2, %ymm1, %ymm1
	vmovq	%rdi, %xmm4
	vpbroadcastq	%xmm4, %ymm2
	vmulpd	%ymm0, %ymm1, %ymm1
	vpaddq	.LC2(%rip), %ymm2, %ymm2
	vmovq	%rsi, %xmm5
	vpbroadcastq	%xmm5, %ymm3
	vpcmpeqq	%ymm3, %ymm2, %ymm2
	vblendvpd	%ymm2, %ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE8811:
	.size	_Z18mul_if_index_not_kDv4_dS_S_ll, .-_Z18mul_if_index_not_kDv4_dS_S_ll
	.p2align 4
	.globl	_Z15mul_if_not_zeroDv4_dS_S_
	.type	_Z15mul_if_not_zeroDv4_dS_S_, @function
_Z15mul_if_not_zeroDv4_dS_S_:
.LFB8812:
	.cfi_startproc
	endbr64
	vsubpd	%ymm2, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE8812:
	.size	_Z15mul_if_not_zeroDv4_dS_S_, .-_Z15mul_if_not_zeroDv4_dS_S_
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"void prod_realreal(long int, long int, double, const double*, double&, long int&)"
	.section	.rodata.str1.1
.LC5:
	.string	"test_simple_problem.cpp"
.LC6:
	.string	"N % ELEMENTS_PER_LOOP == 0"
	.text
	.p2align 4
	.globl	_Z13prod_realreallldPKdRdRl
	.type	_Z13prod_realreallldPKdRdRl, @function
_Z13prod_realreallldPKdRdRl:
.LFB8813:
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
	subq	$32, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, 16(%rsp)
	movq	%r8, 24(%rsp)
	testb	$15, %dil
	jne	.L60
	vmovapd	.LC7(%rip), %ymm1
	vmovapd	.LC3(%rip), %ymm3
	movq	%rdx, %rsi
	movq	(%r8), %rdx
	movq	16(%rsp), %r8
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovlpd	(%rcx), %xmm1, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm1, %ymm1
	movq	%rdi, %r10
	movq	%rcx, %r9
	vbroadcastsd	%xmm2, %ymm8
	andq	$-16, %r8
	vmovapd	%ymm3, %ymm0
	vmovapd	%ymm3, %ymm7
	testq	%rdi, %rdi
	jle	.L42
	vmovapd	.LC1(%rip), %ymm6
	vmovapd	.LC8(%rip), %ymm4
	vmovapd	.LC9(%rip), %ymm5
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L20:
	cmpq	%rax, %r8
	je	.L19
	vsubpd	(%rsi,%rax,8), %ymm8, %ymm9
	vmulpd	%ymm9, %ymm1, %ymm1
	vsubpd	32(%rsi,%rax,8), %ymm8, %ymm9
	vmulpd	%ymm9, %ymm7, %ymm7
	vsubpd	64(%rsi,%rax,8), %ymm8, %ymm9
	vmulpd	%ymm9, %ymm0, %ymm0
	vsubpd	96(%rsi,%rax,8), %ymm8, %ymm9
	vmulpd	%ymm9, %ymm3, %ymm3
	testb	$112, %al
	jne	.L19
	vandnpd	%ymm1, %ymm6, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm10
	vcmppd	$2, %ymm5, %ymm1, %ymm9
	vandnpd	%ymm7, %ymm6, %ymm7
	vmovmskpd	%ymm10, %ecx
	vmulpd	%ymm4, %ymm1, %ymm10
	vmovmskpd	%ymm9, %r15d
	vandnpd	%ymm0, %ymm6, %ymm0
	vandnpd	%ymm3, %ymm6, %ymm3
	popcntl	%ecx, %ecx
	vblendvpd	%ymm9, %ymm10, %ymm1, %ymm1
	vcmppd	$13, %ymm4, %ymm7, %ymm10
	vcmppd	$2, %ymm5, %ymm7, %ymm9
	addq	%rcx, %rdx
	vmovmskpd	%ymm10, %r14d
	vmulpd	%ymm4, %ymm7, %ymm10
	vmovmskpd	%ymm9, %r13d
	popcntl	%r15d, %r15d
	subq	%r15, %rdx
	popcntl	%r14d, %r14d
	vblendvpd	%ymm9, %ymm10, %ymm7, %ymm7
	vcmppd	$13, %ymm4, %ymm0, %ymm10
	vcmppd	$2, %ymm5, %ymm0, %ymm9
	addq	%r14, %rdx
	vmovmskpd	%ymm10, %r12d
	vmulpd	%ymm4, %ymm0, %ymm10
	vmovmskpd	%ymm9, %ebx
	popcntl	%r13d, %r13d
	subq	%r13, %rdx
	popcntl	%r12d, %r12d
	vblendvpd	%ymm9, %ymm10, %ymm0, %ymm0
	vcmppd	$13, %ymm4, %ymm3, %ymm10
	vcmppd	$2, %ymm5, %ymm3, %ymm9
	addq	%r12, %rdx
	vmovmskpd	%ymm10, %r11d
	vmulpd	%ymm4, %ymm3, %ymm10
	popcntl	%ebx, %ebx
	subq	%rbx, %rdx
	vmovmskpd	%ymm9, %edi
	popcntl	%r11d, %r11d
	addq	%r11, %rdx
	popcntl	%edi, %edi
	vblendvpd	%ymm9, %ymm10, %ymm3, %ymm3
	subq	%rdi, %rdx
.L19:
	addq	$16, %rax
	cmpq	%rax, %r10
	jg	.L20
.L18:
	vandnpd	%ymm1, %ymm6, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm9
	vcmppd	$2, %ymm5, %ymm1, %ymm8
	vandnpd	%ymm7, %ymm6, %ymm7
	vmovmskpd	%ymm9, %ecx
	vmulpd	%ymm4, %ymm1, %ymm9
	vmovmskpd	%ymm8, %r13d
	vandnpd	%ymm0, %ymm6, %ymm0
	vandnpd	%ymm3, %ymm6, %ymm3
	popcntl	%ecx, %ecx
	vblendvpd	%ymm8, %ymm9, %ymm1, %ymm1
	vcmppd	$13, %ymm4, %ymm7, %ymm9
	vcmppd	$2, %ymm5, %ymm7, %ymm8
	addq	%rdx, %rcx
	vmovmskpd	%ymm9, %eax
	vmulpd	%ymm4, %ymm7, %ymm9
	vmovmskpd	%ymm8, %r12d
	popcntl	%r13d, %r13d
	subq	%r13, %rcx
	popcntl	%eax, %eax
	vblendvpd	%ymm8, %ymm9, %ymm7, %ymm7
	vcmppd	$13, %ymm4, %ymm0, %ymm9
	vcmppd	$2, %ymm5, %ymm0, %ymm8
	vmulpd	%ymm7, %ymm1, %ymm1
	vmovmskpd	%ymm9, %r14d
	vmulpd	%ymm4, %ymm0, %ymm9
	vmovmskpd	%ymm8, %r15d
	addq	%rcx, %rax
	popcntl	%r12d, %r12d
	subq	%r12, %rax
	vblendvpd	%ymm8, %ymm9, %ymm0, %ymm0
	vcmppd	$13, %ymm4, %ymm3, %ymm9
	vcmppd	$2, %ymm5, %ymm3, %ymm8
	popcntl	%r14d, %r14d
	vmovmskpd	%ymm9, %edi
	vmulpd	%ymm4, %ymm3, %ymm9
	vmovmskpd	%ymm8, %ebx
	movl	%ebx, 8(%rsp)
	movl	%edi, 12(%rsp)
	addq	%rax, %r14
	vblendvpd	%ymm8, %ymm9, %ymm3, %ymm3
	vmulpd	%ymm3, %ymm0, %ymm0
	xorl	%eax, %eax
	popcntl	%r15d, %eax
	subq	%rax, %r14
	xorl	%eax, %eax
	vmulpd	%ymm1, %ymm0, %ymm0
	xorl	%edx, %edx
	popcntl	12(%rsp), %eax
	addq	%r14, %rax
	popcntl	8(%rsp), %edx
	vandnpd	%ymm0, %ymm6, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm3
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	subq	%rdx, %rax
	vmovmskpd	%ymm3, %r10d
	vmulpd	%ymm4, %ymm0, %ymm3
	vmovmskpd	%ymm1, %r11d
	movl	%r11d, (%rsp)
	movl	%r10d, 4(%rsp)
	xorl	%edx, %edx
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm6, %ymm0
	vcmppd	$13, %ymm4, %ymm0, %ymm3
	vcmppd	$2, %ymm5, %ymm0, %ymm1
	popcntl	4(%rsp), %edx
	vmovmskpd	%ymm3, %ebx
	vmulpd	%ymm4, %ymm0, %ymm3
	vmovmskpd	%ymm1, %r11d
	addq	%rdx, %rax
	xorl	%edx, %edx
	popcntl	(%rsp), %edx
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm6, %ymm1
	vcmppd	$13, %ymm4, %ymm1, %ymm0
	vcmppd	$2, %ymm5, %ymm1, %ymm5
	subq	%rdx, %rax
	vmovmskpd	%ymm0, %r10d
	vmulpd	%ymm4, %ymm1, %ymm0
	popcntl	%ebx, %ebx
	addq	%rbx, %rax
	popcntl	%r11d, %r11d
	subq	%r11, %rax
	vblendvpd	%ymm5, %ymm0, %ymm1, %ymm1
	vmovapd	%xmm1, %xmm0
	vextractf128	$0x1, %ymm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm1
	popcntl	%r10d, %r10d
	vmovmskpd	%ymm5, %edi
	addq	%r10, %rax
	popcntl	%edi, %edi
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC10(%rip), %xmm1
	subq	%rdi, %rax
	movq	24(%rsp), %rbx
	vmovsd	.LC11(%rip), %xmm3
	vcomisd	%xmm1, %xmm0
	vmovsd	%xmm0, (%r9)
	movq	%rax, (%rbx)
	ja	.L61
	vcomisd	%xmm0, %xmm3
	jbe	.L23
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rax
	vmovsd	%xmm0, (%r9)
	movq	%rax, (%rbx)
.L23:
	vcomisd	%xmm1, %xmm0
	jbe	.L54
.L63:
	vmulsd	%xmm3, %xmm0, %xmm0
	movq	24(%rsp), %rdi
	incq	%rax
	vmovsd	%xmm0, (%r9)
	movq	%rax, (%rdi)
.L27:
	vcomisd	%xmm1, %xmm0
	jbe	.L55
.L64:
	vmulsd	%xmm3, %xmm0, %xmm0
	movq	24(%rsp), %rdi
	incq	%rax
	vmovsd	%xmm0, (%r9)
	movq	%rax, (%rdi)
.L31:
	leaq	15(%r8), %rdx
	movslq	%r8d, %rax
	vmovq	.LC12(%rip), %xmm4
	addq	$16, %r8
	cmpq	%rdx, %rax
	jg	.L57
	movq	16(%rsp), %rdx
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L62:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%r9)
.L35:
	incq	%rax
	cmpq	%r8, %rax
	je	.L57
.L40:
	cmpq	%rax, %rdx
	je	.L35
	vsubsd	(%rsi,%rax,8), %xmm2, %xmm0
	vandpd	%xmm4, %xmm0, %xmm0
	vmulsd	(%r9), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L62
	vcomisd	%xmm0, %xmm3
	jbe	.L59
	vmulsd	%xmm1, %xmm0, %xmm0
.L59:
	incq	%rax
	vmovsd	%xmm0, (%r9)
	cmpq	%r8, %rax
	jne	.L40
.L57:
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
.L61:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%rax
	vcomisd	%xmm1, %xmm0
	vmovsd	%xmm0, (%r9)
	movq	%rax, (%rbx)
	ja	.L63
.L54:
	vcomisd	%xmm0, %xmm3
	jbe	.L27
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%rax
	movq	24(%rsp), %rbx
	vcomisd	%xmm1, %xmm0
	vmovsd	%xmm0, (%r9)
	movq	%rax, (%rbx)
	ja	.L64
.L55:
	vcomisd	%xmm0, %xmm3
	jbe	.L31
	vmulsd	%xmm1, %xmm0, %xmm0
	movq	24(%rsp), %rdi
	decq	%rax
	vmovsd	%xmm0, (%r9)
	movq	%rax, (%rdi)
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L42:
	vmovapd	.LC1(%rip), %ymm6
	vmovapd	.LC8(%rip), %ymm4
	vmovapd	.LC9(%rip), %ymm5
	jmp	.L18
.L60:
	leaq	.LC4(%rip), %rcx
	movl	$185, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE8813:
	.size	_Z13prod_realreallldPKdRdRl, .-_Z13prod_realreallldPKdRdRl
	.p2align 4
	.globl	_Z16prod_realcomplexldPKdS0_RdRl
	.type	_Z16prod_realcomplexldPKdS0_RdRl, @function
_Z16prod_realcomplexldPKdS0_RdRl:
.LFB8814:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rdx, %rdi
	testq	%rax, %rax
	jle	.L76
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC10(%rip), %xmm4
	vmovsd	.LC11(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L77:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L69:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L76
.L71:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L77
	vcomisd	%xmm1, %xmm5
	ja	.L70
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L71
.L76:
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L69
	.cfi_endproc
.LFE8814:
	.size	_Z16prod_realcomplexldPKdS0_RdRl, .-_Z16prod_realcomplexldPKdS0_RdRl
	.p2align 4
	.globl	_Z16prod_complexreallddPKdRdRl
	.type	_Z16prod_complexreallddPKdRdRl, @function
_Z16prod_complexreallddPKdRdRl:
.LFB8815:
	.cfi_startproc
	endbr64
	vmulsd	%xmm1, %xmm1, %xmm1
	testq	%rdi, %rdi
	jle	.L89
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC10(%rip), %xmm4
	vmovsd	.LC11(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L90:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L82:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L89
.L84:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L90
	vcomisd	%xmm2, %xmm5
	ja	.L83
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L84
.L89:
	ret
	.p2align 4,,10
	.p2align 3
.L83:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L82
	.cfi_endproc
.LFE8815:
	.size	_Z16prod_complexreallddPKdRdRl, .-_Z16prod_complexreallddPKdRdRl
	.p2align 4
	.globl	_Z19prod_complexcomplexllddPKdS0_RdRl
	.type	_Z19prod_complexcomplexllddPKdS0_RdRl, @function
_Z19prod_complexcomplexllddPKdS0_RdRl:
.LFB8816:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	movq	%rdx, %rsi
	testq	%rax, %rax
	jle	.L100
	vmovsd	(%r8), %xmm2
	vmovsd	.LC10(%rip), %xmm5
	vmovsd	.LC11(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L113:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L97:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L100
.L99:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L113
	vcomisd	%xmm2, %xmm6
	ja	.L98
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L99
.L100:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L114
	vmovsd	(%r8), %xmm2
	vmovsd	.LC10(%rip), %xmm5
	vmovsd	.LC11(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L116:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L103:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L115
.L105:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L116
	vcomisd	%xmm2, %xmm6
	ja	.L104
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L105
.L115:
	ret
	.p2align 4,,10
	.p2align 3
.L98:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L104:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L114:
	ret
	.cfi_endproc
.LFE8816:
	.size	_Z19prod_complexcomplexllddPKdS0_RdRl, .-_Z19prod_complexcomplexllddPKdS0_RdRl
	.section	.text._ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv:
.LFB9226:
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
.L118:
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
	jne	.L118
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L119:
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
	jne	.L119
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
	je	.L123
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L123:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L122
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L122:
	movq	%rcx, 2488(%rax)
	movq	$0, 2496(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE9226:
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
	jle	.L140
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
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L142:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L129:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC22(%rip), %xmm0, %xmm0
	vcomisd	.LC23(%rip), %xmm0
	jnb	.L130
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L136
.L131:
	movq	%rdx, %rax
.L135:
	cmpq	$311, %rax
	ja	.L141
.L134:
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
	jns	.L142
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L141:
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
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L130:
	vmovsd	.LC24(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L131
.L136:
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
.L140:
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
.LC34:
	.string	"prod_realreal: orod="
.LC35:
	.string	" exponent="
.LC36:
	.string	" timing="
.LC37:
	.string	" seconds\n"
.LC38:
	.string	"prod_complexcomplex: orod="
.LC39:
	.string	"prod_realcomplex: orod="
.LC40:
	.string	"prod_complexreal: orod="
	.section	.text.unlikely,"ax",@progbits
.LCOLDB46:
	.section	.text.startup,"ax",@progbits
.LHOTB46:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8817:
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
	je	.L144
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
.L143:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L242
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
.L144:
	.cfi_restore_state
	movl	$10, %edx
	leaq	.LC29(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	.LC30(%rip), %ymm0
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
	je	.L243
	cmpb	$0, 56(%r12)
	je	.L147
	movzbl	67(%r12), %eax
.L148:
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
	ja	.L149
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
	movq	.LC31(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC23(%rip), %rax
	movq	%r13, %rsi
	vmovq	%rax, %xmm1
	movq	.LC31(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC23(%rip), %rax
	movq	$0, -120(%rbp)
	movq	%rax, -128(%rbp)
	call	clock@PLT
	movq	%rax, -112(%rbp)
	movq	.LC32(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -72(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	testq	%r12, %r12
	jle	.L150
	testq	%r14, %r14
	jle	.L150
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	-120(%rbp), %rax
	movq	%rax, -192(%rbp)
	vmovsd	%xmm4, -144(%rbp)
	leaq	-128(%rbp), %rax
	vmovsd	.LC22(%rip), %xmm4
	movq	%rax, -184(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	%xmm4, -152(%rbp)
	movq	$0, -200(%rbp)
	vmovsd	.LC33(%rip), %xmm4
	movq	%rax, -232(%rbp)
	movq	%r13, -216(%rbp)
	movq	%rbx, -208(%rbp)
	movq	-176(%rbp), %rbx
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm4, -136(%rbp)
	.p2align 4,,10
	.p2align 3
.L151:
	movq	-232(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -160(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L245:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L153:
	vaddsd	-144(%rbp), %xmm0, %xmm0
	vmulsd	-152(%rbp), %xmm0, %xmm0
	vcomisd	.LC23(%rip), %xmm0
	jnb	.L154
	vmovsd	-160(%rbp), %xmm6
	vmovsd	.LC31(%rip), %xmm7
	vfmadd132sd	-168(%rbp), %xmm6, %xmm0
	vfmadd132sd	-136(%rbp), %xmm7, %xmm0
.L240:
	movq	-192(%rbp), %r8
	movq	-184(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L155
	movq	%r14, %rax
.L159:
	cmpq	$311, %rax
	ja	.L244
.L157:
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
	jns	.L245
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L244:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L157
	.p2align 4,,10
	.p2align 3
.L155:
	incq	-200(%rbp)
	movq	-200(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L151
	movq	-208(%rbp), %rbx
	movq	-216(%rbp), %r13
.L150:
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -248(%rbp)
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC34(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L246
.L160:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC37(%rip), %rsi
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
	cmpq	$0, -224(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L161
	cmpq	$0, -176(%rbp)
	jle	.L161
	leaq	-120(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, -184(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC22(%rip), %xmm4
	vmovsd	.LC33(%rip), %xmm6
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
.L162:
	movq	-232(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -160(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -168(%rbp)
	jmp	.L175
	.p2align 4,,10
	.p2align 3
.L250:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L164:
	vaddsd	-144(%rbp), %xmm0, %xmm0
	vmovsd	.LC23(%rip), %xmm7
	vmovsd	.LC24(%rip), %xmm6
	vmulsd	-152(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-160(%rbp), %xmm6
	vfmadd132sd	-168(%rbp), %xmm6, %xmm0
	vmovsd	.LC31(%rip), %xmm6
	vfmadd132sd	-136(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L247
.L169:
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
	js	.L170
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L171:
	vaddsd	-144(%rbp), %xmm1, %xmm1
	vmulsd	-152(%rbp), %xmm1, %xmm1
	vcomisd	.LC23(%rip), %xmm1
	jnb	.L172
	vmovsd	-160(%rbp), %xmm4
	movq	-192(%rbp), %r9
	vfmadd132sd	-168(%rbp), %xmm4, %xmm1
	movq	-184(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L241:
	vmovsd	.LC31(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-136(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L248
.L175:
	cmpq	$311, %r11
	ja	.L249
.L168:
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
	jns	.L250
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L170:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L247:
	movq	%r12, %rdi
	vmovsd	%xmm0, -200(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-200(%rbp), %xmm0
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L249:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L248:
	incq	-208(%rbp)
	movq	-208(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L162
	movq	-216(%rbp), %rbx
.L161:
	movq	-248(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC38(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L251
.L176:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC37(%rip), %rsi
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
	cmpq	$0, -224(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L177
	cmpq	$0, -176(%rbp)
	jle	.L177
	movq	.LC23(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC22(%rip), %xmm6
	vmovsd	.LC33(%rip), %xmm7
	movq	$0, -216(%rbp)
	movq	%rax, -232(%rbp)
	xorl	%r10d, %r10d
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm4, -144(%rbp)
	movl	$134201207, %esi
	vmovsd	.LC10(%rip), %xmm3
	vmovsd	.LC11(%rip), %xmm4
	vmovsd	%xmm6, -152(%rbp)
	vmovsd	%xmm7, -136(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	salq	$37, %rsi
	movq	%r10, %r14
	movq	%r12, %r11
	.p2align 4,,10
	.p2align 3
.L178:
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
.L191:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L252
.L184:
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
	js	.L179
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L180:
	vaddsd	-144(%rbp), %xmm5, %xmm5
	vmovsd	.LC23(%rip), %xmm2
	vmovsd	.LC24(%rip), %xmm1
	vmulsd	-152(%rbp), %xmm5, %xmm5
	movq	%r12, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC31(%rip), %xmm1
	vfmadd132sd	-136(%rbp), %xmm1, %xmm5
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L254:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L187:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L253
.L189:
	vmovsd	0(%r13,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L254
	vcomisd	%xmm0, %xmm4
	jbe	.L187
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L189
.L253:
	vmovsd	%xmm0, -128(%rbp)
	testb	%cl, %cl
	je	.L190
	movq	%rdx, -120(%rbp)
	movq	%rdx, %r12
.L190:
	incq	%r14
	cmpq	%r14, -176(%rbp)
	jne	.L191
	incq	-216(%rbp)
	movq	%r12, %r14
	movq	-216(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L178
.L177:
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
	leaq	.LC35(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L255
.L192:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC37(%rip), %rsi
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
	cmpq	$0, -224(%rbp)
	vmovsd	%xmm0, -104(%rbp)
	jle	.L193
	cmpq	$0, -176(%rbp)
	jle	.L193
	movq	.LC23(%rip), %rax
	vmovsd	.LC33(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC22(%rip), %xmm7
	movq	$0, -240(%rbp)
	movq	%rax, -232(%rbp)
	movq	%r15, -160(%rbp)
	addq	%r15, %rbx
	xorl	%esi, %esi
	leaq	_ZL3gen(%rip), %r12
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	%xmm3, -136(%rbp)
	vmovsd	.LC11(%rip), %xmm4
	vmovsd	.LC10(%rip), %xmm3
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
.L194:
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
.L212:
	cmpq	$311, %rdi
	ja	.L256
.L200:
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
	js	.L195
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L196:
	vaddsd	-144(%rbp), %xmm5, %xmm5
	vmovsd	.LC23(%rip), %xmm2
	vmulsd	-152(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC24(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC31(%rip), %xmm1
	vfmadd132sd	-136(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L257
.L201:
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
	js	.L202
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L203:
	vaddsd	-144(%rbp), %xmm2, %xmm2
	vmovsd	.LC23(%rip), %xmm1
	vmovsd	.LC31(%rip), %xmm9
	vmulsd	-152(%rbp), %xmm2, %xmm2
	movq	-160(%rbp), %rax
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC24(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	-136(%rbp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L259:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L208:
	addq	$8, %rax
	cmpq	%rax, %r12
	je	.L258
.L210:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L259
	vcomisd	%xmm0, %xmm4
	jbe	.L208
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r12
	jne	.L210
.L258:
	vmovsd	%xmm0, -128(%rbp)
	testb	%cl, %cl
	je	.L211
	movq	%rdx, -120(%rbp)
	movq	%rdx, %rbx
.L211:
	incq	%r13
	cmpq	%r13, -176(%rbp)
	jne	.L212
	incq	-240(%rbp)
	movq	%rbx, %r13
	movq	%r15, %rbx
	movq	-240(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L194
	movq	-160(%rbp), %r15
	movq	-256(%rbp), %r13
.L193:
	movq	-248(%rbp), %rdi
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
	leaq	.LC35(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L260
.L213:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC37(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZdaPv@PLT
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L202:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L195:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L179:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L257:
	movq	%r15, %rdi
	vmovsd	%xmm0, -216(%rbp)
	vmovsd	%xmm4, -208(%rbp)
	vmovsd	%xmm3, -200(%rbp)
	vmovsd	%xmm6, -192(%rbp)
	vmovsd	%xmm7, -184(%rbp)
	vmovsd	%xmm5, -168(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	-216(%rbp), %xmm0
	vmovsd	-208(%rbp), %xmm4
	vmovsd	-200(%rbp), %xmm3
	vmovsd	-192(%rbp), %xmm6
	vmovsd	-184(%rbp), %xmm7
	vmovsd	-168(%rbp), %xmm5
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L256:
	movq	%r15, %rdi
	vmovsd	%xmm0, -208(%rbp)
	vmovsd	%xmm4, -200(%rbp)
	vmovsd	%xmm3, -192(%rbp)
	vmovsd	%xmm6, -184(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdi
	vmovsd	-208(%rbp), %xmm0
	vmovsd	-200(%rbp), %xmm4
	vmovsd	-192(%rbp), %xmm3
	vmovsd	-184(%rbp), %xmm6
	vmovsd	-168(%rbp), %xmm7
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L252:
	movq	%r11, %rdi
	movq	%r11, -160(%rbp)
	vmovsd	%xmm0, -208(%rbp)
	vmovsd	%xmm6, -200(%rbp)
	vmovsd	%xmm4, -192(%rbp)
	vmovsd	%xmm3, -184(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	-208(%rbp), %xmm0
	vmovsd	-200(%rbp), %xmm6
	vmovsd	-192(%rbp), %xmm4
	vmovsd	-184(%rbp), %xmm3
	vmovsd	-168(%rbp), %xmm7
	movq	-160(%rbp), %r11
	movabsq	$-2270628950310912, %rsi
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L172:
	vmovsd	-168(%rbp), %xmm1
	vmovsd	-160(%rbp), %xmm7
	movq	-192(%rbp), %r9
	vfmadd132sd	.LC24(%rip), %xmm7, %xmm1
	movq	-184(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L154:
	vmovsd	.LC24(%rip), %xmm0
	vmovsd	-160(%rbp), %xmm3
	vmovsd	.LC31(%rip), %xmm4
	vfmadd132sd	-168(%rbp), %xmm3, %xmm0
	vfmadd132sd	-136(%rbp), %xmm4, %xmm0
	jmp	.L240
.L147:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	%rcx, %rdx
	je	.L148
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rdx
	jmp	.L148
.L260:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L213
.L255:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L192
.L251:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L176
.L246:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L160
.L243:
	call	_ZSt16__throw_bad_castv@PLT
.L242:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8817:
.L149:
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
.LFE8817:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE46:
	.section	.text.startup
.LHOTE46:
	.p2align 4
	.type	_GLOBAL__sub_I__Z21init_random_positionslddPd, @function
_GLOBAL__sub_I__Z21init_random_positionslddPd:
.LFB9232:
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
.L262:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L262
	vmovapd	.LC47(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9232:
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
	.quad	0
	.quad	1
	.quad	2
	.quad	3
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
	.long	1340080128
	.long	0
	.long	1340080128
	.long	0
	.long	1340080128
	.long	0
	.long	1340080128
	.align 32
.LC9:
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.set	.LC10,.LC8
	.set	.LC11,.LC9
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC12:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst32
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
	.set	.LC23,.LC3
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
.LC31:
	.long	0
	.long	-1074790400
	.align 8
.LC32:
	.long	-1598689907
	.long	1051772663
	.set	.LC33,.LC30+16
	.set	.LC47,.LC7
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
