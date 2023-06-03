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
	.string	"reinterpret_cast<uintptr_t>(x) % 8 == 0"
	.text
	.p2align 4
	.type	_Z13prod_realreallldPKdRdRl.constprop.0, @function
_Z13prod_realreallldPKdRdRl.constprop.0:
.LFB9257:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	andq	$-32, %rsp
	.cfi_offset 3, -24
	testb	$7, %sil
	jne	.L92
	vmovapd	.LC7(%rip), %ymm1
	vmovsd	%xmm0, %xmm0, %xmm4
	vmovlpd	(%rdx), %xmm1, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm1, %ymm1
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm0
	movq	%rdx, %r8
	movq	%rdi, %rdx
	movq	(%rcx), %r10
	vmovapd	.LC8(%rip), %ymm7
	vmovapd	.LC9(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm6
	vbroadcastsd	%xmm4, %ymm9
	andq	$-8, %rdx
	vmovapd	%ymm0, %ymm8
	xorl	%eax, %eax
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L28:
	addq	$8, %rax
	cmpq	$16000, %rax
	je	.L93
.L31:
	cmpq	%rax, %rdx
	je	.L28
	vsubpd	32(%rsi,%rax,8), %ymm9, %ymm2
	vsubpd	(%rsi,%rax,8), %ymm9, %ymm3
	vmulpd	%ymm2, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vmulpd	%ymm2, %ymm8, %ymm8
	testb	$56, %al
	jne	.L28
	vandnpd	%ymm1, %ymm7, %ymm1
	vcmppd	$13, %ymm5, %ymm1, %ymm3
	vcmppd	$2, %ymm6, %ymm1, %ymm2
	vmovmskpd	%ymm3, %r9d
	vmovmskpd	%ymm2, %r11d
	movl	%r9d, %ebx
	orl	%r11d, %ebx
	jne	.L94
.L29:
	vandnpd	%ymm0, %ymm7, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm3
	vcmppd	$2, %ymm6, %ymm0, %ymm2
	vmovmskpd	%ymm3, %r9d
	vmovmskpd	%ymm2, %r11d
	movl	%r9d, %ebx
	orl	%r11d, %ebx
	jne	.L95
.L30:
	vandnpd	%ymm8, %ymm7, %ymm8
	vcmppd	$13, %ymm5, %ymm8, %ymm3
	vcmppd	$2, %ymm6, %ymm8, %ymm2
	vmovmskpd	%ymm3, %r9d
	vmovmskpd	%ymm2, %r11d
	movl	%r9d, %ebx
	orl	%r11d, %ebx
	je	.L28
	vmulpd	%ymm6, %ymm8, %ymm10
	popcntl	%r9d, %r9d
	popcntl	%r11d, %r11d
	subl	%r11d, %r9d
	movslq	%r9d, %r9
	vblendvpd	%ymm3, %ymm10, %ymm8, %ymm3
	vmulpd	%ymm5, %ymm3, %ymm8
	addq	$8, %rax
	addq	%r9, %r10
	vblendvpd	%ymm2, %ymm8, %ymm3, %ymm8
	cmpq	$16000, %rax
	jne	.L31
	.p2align 4,,10
	.p2align 3
.L93:
	vandnpd	%ymm1, %ymm7, %ymm1
	vcmppd	$13, %ymm5, %ymm1, %ymm3
	vcmppd	$2, %ymm6, %ymm1, %ymm2
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm2, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L96
.L32:
	vandnpd	%ymm0, %ymm7, %ymm3
	vcmppd	$13, %ymm5, %ymm3, %ymm0
	vcmppd	$2, %ymm6, %ymm3, %ymm2
	vmovmskpd	%ymm0, %eax
	vmovmskpd	%ymm2, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L97
.L33:
	vandnpd	%ymm8, %ymm7, %ymm2
	vcmppd	$13, %ymm5, %ymm2, %ymm8
	vcmppd	$2, %ymm6, %ymm2, %ymm0
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm0, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L98
.L34:
	vmulpd	%ymm1, %ymm3, %ymm1
	vandnpd	%ymm1, %ymm7, %ymm8
	vcmppd	$13, %ymm5, %ymm8, %ymm9
	vcmppd	$2, %ymm6, %ymm8, %ymm0
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm0, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L99
.L35:
	vmulpd	%ymm2, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm7, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm8
	vcmppd	$2, %ymm6, %ymm0, %ymm2
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm2, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L100
.L36:
	vmulpd	%ymm1, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm7, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm2
	vcmppd	$2, %ymm6, %ymm0, %ymm1
	vmovmskpd	%ymm2, %eax
	vmovmskpd	%ymm1, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L101
.L37:
	vmovapd	.LC11(%rip), %ymm0
	vinsertf128	$1, %xmm0, %ymm3, %ymm1
	vperm2f128	$33, %ymm0, %ymm3, %ymm3
	vmulpd	%ymm3, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm7, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm7
	vcmppd	$2, %ymm6, %ymm0, %ymm3
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm3, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L102
.L38:
	vmovapd	%xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	.LC12(%rip), %xmm2
	vmovsd	.LC13(%rip), %xmm1
	vmovsd	.LC14(%rip), %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L103
	vcomisd	%xmm0, %xmm3
	jbe	.L41
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%r10
.L41:
	leaq	7(%rdx), %r9
	movslq	%edx, %rax
	vmovsd	%xmm0, (%r8)
	addq	$8, %rdx
	movq	%r10, (%rcx)
	cmpq	%r9, %rax
	jle	.L50
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L104:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	incq	(%rcx)
.L45:
	incq	%rax
	cmpq	%rax, %rdx
	je	.L90
.L50:
	cmpq	%rax, %rdi
	je	.L45
	vsubsd	(%rsi,%rax,8), %xmm4, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%r8), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L104
	vcomisd	%xmm0, %xmm3
	ja	.L48
	incq	%rax
	vmovsd	%xmm0, (%r8)
	cmpq	%rax, %rdx
	jne	.L50
.L90:
	vzeroupper
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L103:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%r10
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L48:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	decq	(%rcx)
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L95:
	vmulpd	%ymm6, %ymm0, %ymm10
	popcntl	%r9d, %r9d
	popcntl	%r11d, %r11d
	subl	%r11d, %r9d
	movslq	%r9d, %r9
	vblendvpd	%ymm3, %ymm10, %ymm0, %ymm3
	vmulpd	%ymm5, %ymm3, %ymm0
	leaq	(%r10,%r9,2), %r10
	vblendvpd	%ymm2, %ymm0, %ymm3, %ymm0
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L94:
	vmulpd	%ymm6, %ymm1, %ymm10
	popcntl	%r9d, %r9d
	popcntl	%r11d, %r11d
	subl	%r11d, %r9d
	movslq	%r9d, %r9
	vblendvpd	%ymm3, %ymm10, %ymm1, %ymm3
	vmulpd	%ymm5, %ymm3, %ymm1
	addq	%r9, %r10
	vblendvpd	%ymm2, %ymm1, %ymm3, %ymm1
	jmp	.L29
.L102:
	vmulpd	%ymm6, %ymm0, %ymm2
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm7, %ymm2, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm3, %ymm1, %ymm0, %ymm1
	jmp	.L38
.L96:
	vmulpd	%ymm6, %ymm1, %ymm9
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm3, %ymm9, %ymm1, %ymm3
	vmulpd	%ymm5, %ymm3, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm2, %ymm1, %ymm3, %ymm1
	jmp	.L32
.L97:
	vmulpd	%ymm6, %ymm3, %ymm9
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm0, %ymm9, %ymm3, %ymm9
	vmulpd	%ymm5, %ymm9, %ymm3
	leaq	(%r10,%rax,2), %r10
	vblendvpd	%ymm2, %ymm3, %ymm9, %ymm3
	jmp	.L33
.L98:
	vmulpd	%ymm6, %ymm2, %ymm9
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm8, %ymm9, %ymm2, %ymm8
	vmulpd	%ymm5, %ymm8, %ymm2
	addq	%rax, %r10
	vblendvpd	%ymm0, %ymm2, %ymm8, %ymm2
	jmp	.L34
.L99:
	vmulpd	%ymm6, %ymm8, %ymm1
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm9, %ymm1, %ymm8, %ymm8
	vmulpd	%ymm5, %ymm8, %ymm1
	addq	%rax, %r10
	vblendvpd	%ymm0, %ymm1, %ymm8, %ymm1
	jmp	.L35
.L100:
	vmulpd	%ymm6, %ymm0, %ymm3
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm8, %ymm3, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm3
	addq	%rax, %r10
	vblendvpd	%ymm2, %ymm3, %ymm0, %ymm3
	jmp	.L36
.L101:
	vmulpd	%ymm6, %ymm0, %ymm3
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm2, %ymm3, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm3
	addq	%rax, %r10
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm3
	jmp	.L37
.L92:
	leaq	.LC4(%rip), %rcx
	movl	$276, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE9257:
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
	je	.L111
	cmpb	$0, 56(%r13)
	je	.L107
	movsbl	67(%r13), %esi
.L108:
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
.L107:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L108
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L108
.L111:
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
	je	.L118
	cmpb	$0, 56(%r13)
	je	.L114
	movsbl	67(%r13), %esi
.L115:
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
.L114:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L115
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L115
.L118:
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
	vmovapd	.LC8(%rip), %ymm0
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
	vmovapd	.LC8(%rip), %ymm2
	vmovapd	.LC9(%rip), %ymm1
	vmovapd	.LC10(%rip), %ymm3
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm1, %ymm2, %ymm5
	vcmppd	$2, %ymm3, %ymm2, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L126
	ret
	.p2align 4,,10
	.p2align 3
.L126:
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
	vmovapd	.LC11(%rip), %ymm1
	vmovapd	.LC10(%rip), %ymm3
	vinsertf128	$1, %xmm1, %ymm0, %ymm2
	vperm2f128	$33, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vmovapd	.LC8(%rip), %ymm1
	vmovapd	.LC9(%rip), %ymm2
	vandnpd	%ymm0, %ymm1, %ymm1
	vcmppd	$13, %ymm2, %ymm1, %ymm5
	vcmppd	$2, %ymm3, %ymm1, %ymm4
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm4, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	.L139
.L128:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC13(%rip), %xmm1
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L138
	vmulsd	.LC14(%rip), %xmm0, %xmm0
	incq	(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L138:
	vmovsd	.LC14(%rip), %xmm2
	vcomisd	%xmm0, %xmm2
	jbe	.L127
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	(%rdi)
.L127:
	ret
	.p2align 4,,10
	.p2align 3
.L139:
	vmulpd	%ymm3, %ymm1, %ymm3
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm3, %ymm1, %ymm1
	vmulpd	%ymm2, %ymm1, %ymm2
	addq	%rax, (%rdi)
	vblendvpd	%ymm4, %ymm2, %ymm1, %ymm0
	jmp	.L128
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
.LFB8822:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %r9
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	testb	$7, %dil
	jne	.L209
	testb	$7, %dl
	jne	.L210
	vmovapd	.LC7(%rip), %ymm1
	vmovsd	%xmm0, %xmm0, %xmm4
	vmovlpd	(%rcx), %xmm1, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm1, %ymm1
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm0
	movq	%rcx, %rdi
	movq	%rsi, %rcx
	movq	(%r8), %r11
	vbroadcastsd	%xmm4, %ymm9
	andq	$-8, %rcx
	vmovapd	%ymm0, %ymm8
	testq	%r9, %r9
	jle	.L168
	vmovapd	.LC8(%rip), %ymm7
	vmovapd	.LC9(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm6
	xorl	%eax, %eax
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L144:
	addq	$8, %rax
	cmpq	%rax, %r9
	jle	.L143
.L147:
	cmpq	%rax, %rcx
	je	.L144
	vsubpd	32(%rdx,%rax,8), %ymm9, %ymm2
	vsubpd	(%rdx,%rax,8), %ymm9, %ymm3
	vmulpd	%ymm2, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vmulpd	%ymm2, %ymm8, %ymm8
	testb	$56, %al
	jne	.L144
	vandnpd	%ymm1, %ymm7, %ymm1
	vcmppd	$13, %ymm5, %ymm1, %ymm3
	vcmppd	$2, %ymm6, %ymm1, %ymm2
	vmovmskpd	%ymm3, %r10d
	vmovmskpd	%ymm2, %ebx
	movl	%r10d, %r12d
	orl	%ebx, %r12d
	jne	.L211
.L145:
	vandnpd	%ymm0, %ymm7, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm3
	vcmppd	$2, %ymm6, %ymm0, %ymm2
	vmovmskpd	%ymm3, %r10d
	vmovmskpd	%ymm2, %ebx
	movl	%r10d, %r12d
	orl	%ebx, %r12d
	jne	.L212
.L146:
	vandnpd	%ymm8, %ymm7, %ymm8
	vcmppd	$13, %ymm5, %ymm8, %ymm3
	vcmppd	$2, %ymm6, %ymm8, %ymm2
	vmovmskpd	%ymm3, %r10d
	vmovmskpd	%ymm2, %ebx
	movl	%r10d, %r12d
	orl	%ebx, %r12d
	je	.L144
	vmulpd	%ymm6, %ymm8, %ymm10
	popcntl	%r10d, %r10d
	popcntl	%ebx, %ebx
	subl	%ebx, %r10d
	movslq	%r10d, %r10
	vblendvpd	%ymm3, %ymm10, %ymm8, %ymm3
	vmulpd	%ymm5, %ymm3, %ymm8
	addq	$8, %rax
	addq	%r10, %r11
	vblendvpd	%ymm2, %ymm8, %ymm3, %ymm8
	cmpq	%rax, %r9
	jg	.L147
	.p2align 4,,10
	.p2align 3
.L143:
	vandnpd	%ymm1, %ymm7, %ymm1
	vcmppd	$13, %ymm5, %ymm1, %ymm3
	vcmppd	$2, %ymm6, %ymm1, %ymm2
	vmovmskpd	%ymm3, %eax
	vmovmskpd	%ymm2, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L213
.L148:
	vandnpd	%ymm0, %ymm7, %ymm3
	vcmppd	$13, %ymm5, %ymm3, %ymm0
	vcmppd	$2, %ymm6, %ymm3, %ymm2
	vmovmskpd	%ymm0, %eax
	vmovmskpd	%ymm2, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L214
.L149:
	vandnpd	%ymm8, %ymm7, %ymm2
	vcmppd	$13, %ymm5, %ymm2, %ymm8
	vcmppd	$2, %ymm6, %ymm2, %ymm0
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm0, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L215
.L150:
	vmulpd	%ymm1, %ymm3, %ymm1
	vandnpd	%ymm1, %ymm7, %ymm8
	vcmppd	$13, %ymm5, %ymm8, %ymm9
	vcmppd	$2, %ymm6, %ymm8, %ymm0
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm0, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L216
.L151:
	vmulpd	%ymm2, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm7, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm8
	vcmppd	$2, %ymm6, %ymm0, %ymm2
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm2, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L217
.L152:
	vmulpd	%ymm1, %ymm3, %ymm3
	vandnpd	%ymm3, %ymm7, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm2
	vcmppd	$2, %ymm6, %ymm0, %ymm1
	vmovmskpd	%ymm2, %eax
	vmovmskpd	%ymm1, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L218
.L153:
	vmovapd	.LC11(%rip), %ymm0
	vinsertf128	$1, %xmm0, %ymm3, %ymm1
	vperm2f128	$33, %ymm0, %ymm3, %ymm3
	vmulpd	%ymm3, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm7, %ymm0
	vcmppd	$13, %ymm5, %ymm0, %ymm7
	vcmppd	$2, %ymm6, %ymm0, %ymm3
	vmovmskpd	%ymm7, %eax
	vmovmskpd	%ymm3, %r9d
	movl	%eax, %ebx
	orl	%r9d, %ebx
	jne	.L219
.L154:
	vmovapd	%xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	.LC12(%rip), %xmm2
	vmovsd	.LC13(%rip), %xmm1
	vmovsd	.LC14(%rip), %xmm3
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L220
	vcomisd	%xmm0, %xmm3
	jbe	.L157
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%r11
.L157:
	leaq	7(%rcx), %r9
	movslq	%ecx, %rax
	vmovsd	%xmm0, (%rdi)
	addq	$8, %rcx
	movq	%r11, (%r8)
	cmpq	%r9, %rax
	jle	.L166
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L221:
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdi)
	incq	(%r8)
.L161:
	incq	%rax
	cmpq	%rax, %rcx
	je	.L207
.L166:
	cmpq	%rax, %rsi
	je	.L161
	vsubsd	(%rdx,%rax,8), %xmm4, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vmulsd	(%rdi), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L221
	vcomisd	%xmm0, %xmm3
	ja	.L164
	incq	%rax
	vmovsd	%xmm0, (%rdi)
	cmpq	%rax, %rcx
	jne	.L166
.L207:
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
.L220:
	.cfi_restore_state
	vmulsd	%xmm3, %xmm0, %xmm0
	incq	%r11
	jmp	.L157
	.p2align 4,,10
	.p2align 3
.L164:
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdi)
	decq	(%r8)
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L212:
	vmulpd	%ymm6, %ymm0, %ymm10
	popcntl	%r10d, %r10d
	popcntl	%ebx, %ebx
	subl	%ebx, %r10d
	movslq	%r10d, %r10
	vblendvpd	%ymm3, %ymm10, %ymm0, %ymm3
	vmulpd	%ymm5, %ymm3, %ymm0
	leaq	(%r11,%r10,2), %r11
	vblendvpd	%ymm2, %ymm0, %ymm3, %ymm0
	jmp	.L146
	.p2align 4,,10
	.p2align 3
.L211:
	vmulpd	%ymm6, %ymm1, %ymm10
	popcntl	%r10d, %r10d
	popcntl	%ebx, %ebx
	subl	%ebx, %r10d
	movslq	%r10d, %r10
	vblendvpd	%ymm3, %ymm10, %ymm1, %ymm3
	vmulpd	%ymm5, %ymm3, %ymm1
	addq	%r10, %r11
	vblendvpd	%ymm2, %ymm1, %ymm3, %ymm1
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L214:
	vmulpd	%ymm6, %ymm3, %ymm9
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm0, %ymm9, %ymm3, %ymm9
	vmulpd	%ymm5, %ymm9, %ymm3
	leaq	(%r11,%rax,2), %r11
	vblendvpd	%ymm2, %ymm3, %ymm9, %ymm3
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L215:
	vmulpd	%ymm6, %ymm2, %ymm9
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm8, %ymm9, %ymm2, %ymm8
	vmulpd	%ymm5, %ymm8, %ymm2
	addq	%rax, %r11
	vblendvpd	%ymm0, %ymm2, %ymm8, %ymm2
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L216:
	vmulpd	%ymm6, %ymm8, %ymm1
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm9, %ymm1, %ymm8, %ymm8
	vmulpd	%ymm5, %ymm8, %ymm1
	addq	%rax, %r11
	vblendvpd	%ymm0, %ymm1, %ymm8, %ymm1
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L217:
	vmulpd	%ymm6, %ymm0, %ymm3
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm8, %ymm3, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm3
	addq	%rax, %r11
	vblendvpd	%ymm2, %ymm3, %ymm0, %ymm3
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L218:
	vmulpd	%ymm6, %ymm0, %ymm3
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm2, %ymm3, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm3
	addq	%rax, %r11
	vblendvpd	%ymm1, %ymm3, %ymm0, %ymm3
	jmp	.L153
.L168:
	vmovapd	.LC8(%rip), %ymm7
	vmovapd	.LC9(%rip), %ymm5
	vmovapd	.LC10(%rip), %ymm6
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L219:
	vmulpd	%ymm6, %ymm0, %ymm2
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm7, %ymm2, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm1
	addq	%rax, %r11
	vblendvpd	%ymm3, %ymm1, %ymm0, %ymm1
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L213:
	vmulpd	%ymm6, %ymm1, %ymm9
	popcntl	%eax, %eax
	popcntl	%r9d, %r9d
	subl	%r9d, %eax
	cltq
	vblendvpd	%ymm3, %ymm9, %ymm1, %ymm3
	vmulpd	%ymm5, %ymm3, %ymm1
	addq	%rax, %r11
	vblendvpd	%ymm2, %ymm1, %ymm3, %ymm1
	jmp	.L148
.L209:
	leaq	.LC4(%rip), %rcx
	movl	$275, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	__assert_fail@PLT
.L210:
	leaq	.LC4(%rip), %rcx
	movl	$276, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC6(%rip), %rdi
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
	jle	.L233
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	.LC14(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L234:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L226:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L233
.L228:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L234
	vcomisd	%xmm1, %xmm5
	ja	.L227
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L228
.L233:
	ret
	.p2align 4,,10
	.p2align 3
.L227:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L226
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
	jle	.L246
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	.LC14(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L247:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L239:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L246
.L241:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L247
	vcomisd	%xmm2, %xmm5
	ja	.L240
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L241
.L246:
	ret
	.p2align 4,,10
	.p2align 3
.L240:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L239
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
	jle	.L257
	vmovsd	(%r8), %xmm2
	vmovsd	.LC13(%rip), %xmm5
	vmovsd	.LC14(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L270:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L254:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L257
.L256:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L270
	vcomisd	%xmm2, %xmm6
	ja	.L255
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L256
.L257:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L271
	vmovsd	(%r8), %xmm2
	vmovsd	.LC13(%rip), %xmm5
	vmovsd	.LC14(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L273:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L260:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L272
.L262:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L273
	vcomisd	%xmm2, %xmm6
	ja	.L261
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L262
.L272:
	ret
	.p2align 4,,10
	.p2align 3
.L255:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L254
	.p2align 4,,10
	.p2align 3
.L261:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L271:
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
	vmovq	.LC12(%rip), %xmm3
	vandpd	%xmm3, %xmm2, %xmm2
	vsubsd	.LC18(%rip), %xmm2, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vcomisd	.LC19(%rip), %xmm2
	ja	.L283
	ret
.L283:
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
.L285:
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
	jne	.L285
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L286:
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
	jne	.L286
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
	je	.L290
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L290:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L289
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L289:
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
	ja	.L416
	movq	-2568(%rbp), %rsi
	cmpq	$1, %rsi
	jne	.L417
	vmovapd	_ZL10_MM256_ONE(%rip), %ymm0
	vmovapd	.LC30(%rip), %ymm7
	vmulpd	%ymm0, %ymm0, %ymm8
	vmovapd	.LC8(%rip), %ymm2
	vmovapd	.LC9(%rip), %ymm3
	vmovapd	.LC10(%rip), %ymm4
	xorl	%esi, %esi
	vmulpd	%ymm7, %ymm8, %ymm5
	vandnpd	%ymm5, %ymm2, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm9
	vcmppd	$2, %ymm4, %ymm1, %ymm6
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm6, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L418
.L297:
	vmulpd	%ymm8, %ymm8, %ymm6
	vandnpd	%ymm6, %ymm2, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm10
	vcmppd	$2, %ymm4, %ymm1, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L419
.L298:
	vmulpd	%ymm5, %ymm6, %ymm6
	vandnpd	%ymm6, %ymm2, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm9
	vcmppd	$2, %ymm4, %ymm1, %ymm5
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm5, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L420
.L299:
	vmovapd	.LC11(%rip), %ymm5
	vinsertf128	$1, %xmm5, %ymm6, %ymm1
	vperm2f128	$33, %ymm5, %ymm6, %ymm6
	vmulpd	%ymm6, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm2, %ymm6
	vcmppd	$13, %ymm3, %ymm6, %ymm10
	vcmppd	$2, %ymm4, %ymm6, %ymm9
	vmovmskpd	%ymm10, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L421
.L300:
	vunpckhpd	%xmm1, %xmm1, %xmm6
	vmulsd	%xmm6, %xmm1, %xmm1
	vmovsd	.LC13(%rip), %xmm6
	vmovsd	.LC14(%rip), %xmm10
	vandpd	.LC12(%rip), %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	ja	.L422
	vcomisd	%xmm1, %xmm10
	jbe	.L303
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
.L303:
	vmovsd	.LC31(%rip), %xmm9
	vucomisd	%xmm9, %xmm1
	jp	.L357
	jne	.L357
	testq	%rsi, %rsi
	jne	.L423
	vmulpd	%ymm7, %ymm0, %ymm7
	vmulpd	.LC32(%rip), %ymm8, %ymm8
	xorl	%r8d, %r8d
	vmulpd	%ymm8, %ymm7, %ymm11
	vandnpd	%ymm11, %ymm2, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm12
	vcmppd	$2, %ymm4, %ymm1, %ymm9
	vmovmskpd	%ymm12, %eax
	vmovmskpd	%ymm9, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L424
.L311:
	vmulpd	%ymm8, %ymm8, %ymm9
	vandnpd	%ymm9, %ymm2, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm13
	vcmppd	$2, %ymm4, %ymm1, %ymm12
	vmovmskpd	%ymm13, %eax
	vmovmskpd	%ymm12, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L425
.L312:
	vmulpd	%ymm11, %ymm9, %ymm9
	vandnpd	%ymm9, %ymm2, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm12
	vcmppd	$2, %ymm4, %ymm1, %ymm11
	vmovmskpd	%ymm12, %eax
	vmovmskpd	%ymm11, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L426
.L313:
	vinsertf128	$1, %xmm5, %ymm9, %ymm1
	vperm2f128	$33, %ymm5, %ymm9, %ymm9
	vmulpd	%ymm9, %ymm1, %ymm1
	vandnpd	%ymm1, %ymm2, %ymm9
	vcmppd	$13, %ymm3, %ymm9, %ymm12
	vcmppd	$2, %ymm4, %ymm9, %ymm11
	vmovmskpd	%ymm12, %eax
	vmovmskpd	%ymm11, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L427
.L314:
	vunpckhpd	%xmm1, %xmm1, %xmm9
	vmulsd	%xmm9, %xmm1, %xmm1
	vandpd	.LC12(%rip), %xmm1, %xmm1
	vcomisd	%xmm6, %xmm1
	jbe	.L407
	vmulsd	%xmm10, %xmm1, %xmm1
	incq	%r8
.L317:
	vmovsd	.LC33(%rip), %xmm11
	vdivsd	%xmm1, %xmm11, %xmm9
	vandpd	.LC12(%rip), %xmm9, %xmm9
	vsubsd	.LC18(%rip), %xmm9, %xmm9
	vandpd	.LC12(%rip), %xmm9, %xmm9
	vcomisd	.LC19(%rip), %xmm9
	ja	.L428
	cmpq	$1, %r8
	jne	.L429
	vmulpd	.LC34(%rip), %ymm7, %ymm1
	vmulpd	%ymm8, %ymm0, %ymm0
	vandnpd	%ymm1, %ymm2, %ymm1
	vcmppd	$13, %ymm3, %ymm1, %ymm8
	vcmppd	$2, %ymm4, %ymm1, %ymm7
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm7, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L430
.L322:
	vandnpd	%ymm0, %ymm2, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm8
	vcmppd	$2, %ymm4, %ymm0, %ymm7
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm7, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L431
.L323:
	vmulpd	%ymm1, %ymm0, %ymm1
	vandnpd	%ymm1, %ymm2, %ymm7
	vcmppd	$13, %ymm3, %ymm7, %ymm9
	vcmppd	$2, %ymm4, %ymm7, %ymm8
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L432
.L324:
	vmulpd	%ymm0, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm7
	vcmppd	$13, %ymm3, %ymm7, %ymm9
	vcmppd	$2, %ymm4, %ymm7, %ymm8
	vmovmskpd	%ymm9, %eax
	vmovmskpd	%ymm8, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L433
.L325:
	vmulpd	%ymm1, %ymm0, %ymm1
	vandnpd	%ymm1, %ymm2, %ymm0
	vcmppd	$13, %ymm3, %ymm0, %ymm8
	vcmppd	$2, %ymm4, %ymm0, %ymm7
	vmovmskpd	%ymm8, %eax
	vmovmskpd	%ymm7, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L434
.L326:
	vinsertf128	$1, %xmm5, %ymm1, %ymm0
	vperm2f128	$33, %ymm5, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vandnpd	%ymm0, %ymm2, %ymm2
	vcmppd	$13, %ymm3, %ymm2, %ymm5
	vcmppd	$2, %ymm4, %ymm2, %ymm1
	vmovmskpd	%ymm5, %eax
	vmovmskpd	%ymm1, %edx
	movl	%eax, %edi
	orl	%edx, %edi
	jne	.L435
.L327:
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm1
	vcomisd	%xmm6, %xmm1
	jbe	.L409
	vmulsd	%xmm10, %xmm1, %xmm1
	incq	%rsi
.L330:
	vmovsd	.LC35(%rip), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vsubsd	.LC18(%rip), %xmm0, %xmm0
	vandpd	.LC12(%rip), %xmm0, %xmm0
	vcomisd	.LC19(%rip), %xmm0
	ja	.L436
	cmpq	$2, %rsi
	jne	.L437
	movl	$128000, %edi
	vzeroupper
	call	_Znam@PLT
	movq	%rax, -2608(%rbp)
	movq	$42, -2560(%rbp)
	movl	$42, %edx
	movl	$1, %ebx
	leaq	-2560(%rbp), %rsi
	movabsq	$6364136223846793005, %rcx
	.p2align 4,,10
	.p2align 3
.L335:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	leaq	(%rax,%rbx), %rdx
	movq	%rdx, (%rsi,%rbx,8)
	incq	%rbx
	cmpq	$312, %rbx
	jne	.L335
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
	jmp	.L336
	.p2align 4,,10
	.p2align 3
.L439:
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L338:
	vxorpd	%xmm5, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm0, %xmm0
	vmulsd	.LC37(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L339
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	.LC39(%rip), %xmm4
	addq	$8, %r14
	vfmadd132sd	.LC38(%rip), %xmm4, %xmm0
	vmovsd	%xmm0, -8(%r14)
	cmpq	%r14, %r8
	je	.L340
.L343:
	movq	%rdi, %rbx
.L336:
	cmpq	$311, %rbx
	ja	.L438
.L342:
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
	jns	.L439
	movq	%rax, %r9
	shrq	%r9
	andl	$1, %eax
	orq	%rax, %r9
	vcvtsi2sdq	%r9, %xmm3, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L338
.L422:
	vmulsd	%xmm10, %xmm1, %xmm1
	incq	%rsi
	jmp	.L303
	.p2align 4,,10
	.p2align 3
.L438:
	movq	%r15, %rdi
	movq	%r8, -2592(%rbp)
	vmovsd	%xmm1, -2600(%rbp)
	vmovsd	%xmm2, -2584(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rbx
	vmovsd	-2600(%rbp), %xmm1
	movq	-2592(%rbp), %r8
	vmovsd	-2584(%rbp), %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	movabsq	$6148914691236517205, %rsi
	jmp	.L342
.L339:
	vmovsd	.LC40(%rip), %xmm0
	vmovsd	.LC39(%rip), %xmm7
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	addq	$8, %r14
	vfmadd132sd	.LC38(%rip), %xmm7, %xmm0
	vmovsd	%xmm0, -8(%r14)
	cmpq	%r14, %r8
	jne	.L343
.L340:
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
	ja	.L415
	movq	-2568(%rbp), %rsi
	cmpq	$-3, %rsi
	jne	.L440
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
	ja	.L415
	movq	-2568(%rbp), %rsi
	cmpq	$101, %rsi
	jne	.L441
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L442
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
.L407:
	.cfi_restore_state
	vcomisd	%xmm1, %xmm10
	jbe	.L317
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%r8
	jmp	.L317
.L409:
	vcomisd	%xmm1, %xmm10
	jbe	.L330
	vmulsd	%xmm6, %xmm1, %xmm1
	decq	%rsi
	jmp	.L330
.L424:
	vmulpd	%ymm4, %ymm1, %ymm11
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %r8
	vblendvpd	%ymm12, %ymm11, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm11
	vblendvpd	%ymm9, %ymm11, %ymm1, %ymm11
	jmp	.L311
.L418:
	vmulpd	%ymm4, %ymm1, %ymm5
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rsi
	vblendvpd	%ymm9, %ymm5, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm5
	vblendvpd	%ymm6, %ymm5, %ymm1, %ymm5
	jmp	.L297
.L419:
	vmulpd	%ymm4, %ymm1, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm6
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm6, %ymm1, %ymm6
	jmp	.L298
.L420:
	vmulpd	%ymm4, %ymm1, %ymm6
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm9, %ymm6, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm6
	addq	%rax, %rsi
	vblendvpd	%ymm5, %ymm6, %ymm1, %ymm6
	jmp	.L299
.L421:
	vmulpd	%ymm4, %ymm6, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm10, %ymm1, %ymm6, %ymm6
	vmulpd	%ymm3, %ymm6, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm9, %ymm1, %ymm6, %ymm1
	jmp	.L300
.L435:
	vmulpd	%ymm4, %ymm2, %ymm4
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm5, %ymm4, %ymm2, %ymm2
	vmulpd	%ymm3, %ymm2, %ymm3
	addq	%rax, %rsi
	vblendvpd	%ymm1, %ymm3, %ymm2, %ymm0
	jmp	.L327
.L434:
	vmulpd	%ymm4, %ymm0, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm7, %ymm1, %ymm0, %ymm1
	jmp	.L326
.L433:
	vmulpd	%ymm4, %ymm7, %ymm0
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm9, %ymm0, %ymm7, %ymm7
	vmulpd	%ymm3, %ymm7, %ymm0
	addq	%rax, %rsi
	vblendvpd	%ymm8, %ymm0, %ymm7, %ymm0
	jmp	.L325
.L432:
	vmulpd	%ymm4, %ymm7, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm9, %ymm1, %ymm7, %ymm7
	vmulpd	%ymm3, %ymm7, %ymm1
	addq	%rax, %rsi
	vblendvpd	%ymm8, %ymm1, %ymm7, %ymm1
	jmp	.L324
.L431:
	vmulpd	%ymm4, %ymm0, %ymm9
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm8, %ymm9, %ymm0, %ymm8
	vmulpd	%ymm3, %ymm8, %ymm0
	leaq	(%rsi,%rax,2), %rsi
	addq	%rax, %rsi
	vblendvpd	%ymm7, %ymm0, %ymm8, %ymm0
	jmp	.L323
.L430:
	vmulpd	%ymm4, %ymm1, %ymm9
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rsi
	vblendvpd	%ymm8, %ymm9, %ymm1, %ymm8
	vmulpd	%ymm3, %ymm8, %ymm1
	vblendvpd	%ymm7, %ymm1, %ymm8, %ymm1
	jmp	.L322
.L427:
	vmulpd	%ymm4, %ymm9, %ymm1
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm12, %ymm1, %ymm9, %ymm9
	vmulpd	%ymm3, %ymm9, %ymm1
	addq	%rax, %r8
	vblendvpd	%ymm11, %ymm1, %ymm9, %ymm1
	jmp	.L314
.L426:
	vmulpd	%ymm4, %ymm1, %ymm9
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm12, %ymm9, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm9
	addq	%rax, %r8
	vblendvpd	%ymm11, %ymm9, %ymm1, %ymm9
	jmp	.L313
.L425:
	vmulpd	%ymm4, %ymm1, %ymm9
	popcntl	%eax, %eax
	popcntl	%edx, %edx
	subl	%edx, %eax
	cltq
	vblendvpd	%ymm13, %ymm9, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm9
	addq	%rax, %r8
	vblendvpd	%ymm12, %ymm9, %ymm1, %ymm9
	jmp	.L312
.L442:
	call	__stack_chk_fail@PLT
.L437:
	movl	$2, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L415:
	vmovsd	%xmm2, %xmm2, %xmm0
	call	_Z13assert_approxdd.part.0
.L440:
	movq	$-3, %rdi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L441:
	movl	$101, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L416:
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13assert_approxdd.part.0
.L357:
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
	je	.L443
	cmpb	$0, 56(%r12)
	je	.L308
	movzbl	67(%r12), %eax
.L309:
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
.L417:
	movl	$1, %edi
	call	_Z9assert_eqIlEvT_S0_.part.0
.L308:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	%rcx, %rdx
	je	.L309
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rdx
	jmp	.L309
.L443:
	call	_ZSt16__throw_bad_castv@PLT
.L423:
	xorl	%edi, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L428:
	vmovsd	%xmm11, %xmm11, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
.L429:
	movq	%r8, %rsi
	movl	$1, %edi
	vzeroupper
	call	_Z9assert_eqIlEvT_S0_.part.0
.L436:
	vmovsd	%xmm2, %xmm2, %xmm0
	vzeroupper
	call	_Z13assert_approxdd.part.0
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
	jle	.L458
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
	jmp	.L453
	.p2align 4,,10
	.p2align 3
.L460:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L447:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC37(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L448
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L454
.L449:
	movq	%rdx, %rax
.L453:
	cmpq	$311, %rax
	ja	.L459
.L452:
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
	jns	.L460
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L459:
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
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L448:
	vmovsd	.LC40(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L449
.L454:
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
.L458:
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
.L462:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	leaq	(%rax,%rcx), %rdx
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
	cmpq	$312, %rcx
	jne	.L462
	leaq	_ZL3gen(%rip), %r12
	movl	$2504, %edx
	movq	%r12, %rdi
	movq	$312, -64(%rbp)
	call	memcpy@PLT
	cmpl	$3, %r13d
	je	.L463
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
.L461:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L558
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
.L463:
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
	ja	.L465
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
	jle	.L466
	testq	%r14, %r14
	jle	.L466
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
.L467:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -2672(%rbp)
	vmovsd	%xmm7, -2680(%rbp)
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L560:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L469:
	vaddsd	-2648(%rbp), %xmm0, %xmm0
	vmulsd	-2656(%rbp), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L470
	vmovsd	-2672(%rbp), %xmm6
	vmovsd	.LC39(%rip), %xmm7
	vfmadd132sd	-2680(%rbp), %xmm6, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm7, %xmm0
.L556:
	movq	-2704(%rbp), %r8
	movq	-2696(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L471
	movq	%r14, %rax
.L475:
	cmpq	$311, %rax
	ja	.L559
.L473:
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
	jns	.L560
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L469
	.p2align 4,,10
	.p2align 3
.L471:
	incq	-2712(%rbp)
	movq	-2712(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L467
	movq	-2720(%rbp), %rbx
	movq	-2728(%rbp), %r13
.L466:
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
	jne	.L561
.L476:
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
	jle	.L477
	cmpq	$0, -2688(%rbp)
	jle	.L477
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
.L478:
	movq	-2744(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -2672(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -2680(%rbp)
	jmp	.L491
	.p2align 4,,10
	.p2align 3
.L565:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L480:
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
	ja	.L562
.L485:
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
	js	.L486
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L487:
	vaddsd	-2648(%rbp), %xmm1, %xmm1
	vmulsd	-2656(%rbp), %xmm1, %xmm1
	vcomisd	.LC18(%rip), %xmm1
	jnb	.L488
	vmovsd	-2672(%rbp), %xmm4
	movq	-2704(%rbp), %r9
	vfmadd132sd	-2680(%rbp), %xmm4, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L557:
	vmovsd	.LC39(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-2664(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L563
.L491:
	cmpq	$311, %r11
	ja	.L564
.L484:
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
	jns	.L565
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L480
	.p2align 4,,10
	.p2align 3
.L563:
	incq	-2720(%rbp)
	movq	-2720(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L478
	movq	-2728(%rbp), %rbx
.L477:
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
	jne	.L566
.L492:
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
	jle	.L493
	cmpq	$0, -2688(%rbp)
	jle	.L493
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
.L494:
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
.L507:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L567
.L500:
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
	js	.L495
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L496:
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
	jmp	.L505
	.p2align 4,,10
	.p2align 3
.L569:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L503:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L568
.L505:
	vmovsd	(%r14,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L569
	vcomisd	%xmm0, %xmm4
	jbe	.L503
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L505
.L568:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L506
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r10
.L506:
	incq	%r13
	cmpq	%r13, -2688(%rbp)
	jne	.L507
	incq	-2728(%rbp)
	movq	%r14, %r13
	movq	%r10, %r14
	movq	-2728(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L494
.L493:
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
	jne	.L570
.L508:
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
	jle	.L509
	cmpq	$0, -2688(%rbp)
	jle	.L509
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
.L510:
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
.L528:
	cmpq	$311, %rdi
	ja	.L571
.L516:
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
	js	.L511
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L512:
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
	ja	.L572
.L517:
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
	js	.L518
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L519:
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
	jmp	.L526
	.p2align 4,,10
	.p2align 3
.L574:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L524:
	addq	$8, %rax
	cmpq	%rax, %r13
	je	.L573
.L526:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L574
	vcomisd	%xmm0, %xmm4
	jbe	.L524
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r13
	jne	.L526
.L573:
	vmovsd	%xmm0, -2624(%rbp)
	testb	%cl, %cl
	je	.L527
	movq	%rdx, -2616(%rbp)
	movq	%rdx, %r15
.L527:
	incq	%rbx
	cmpq	%rbx, -2688(%rbp)
	jne	.L528
	incq	-2752(%rbp)
	movq	%r13, %rbx
	movq	%r15, %r13
	movq	-2752(%rbp), %rax
	cmpq	%rax, -2736(%rbp)
	jne	.L510
	movq	-2672(%rbp), %r15
	movq	-2768(%rbp), %r13
.L509:
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
	jne	.L575
.L529:
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
	jmp	.L461
	.p2align 4,,10
	.p2align 3
.L495:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L511:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L512
	.p2align 4,,10
	.p2align 3
.L518:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L519
	.p2align 4,,10
	.p2align 3
.L486:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L487
	.p2align 4,,10
	.p2align 3
.L559:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L473
	.p2align 4,,10
	.p2align 3
.L572:
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
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L562:
	movq	%r12, %rdi
	vmovsd	%xmm0, -2712(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-2712(%rbp), %xmm0
	jmp	.L485
	.p2align 4,,10
	.p2align 3
.L567:
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
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L571:
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
	jmp	.L516
	.p2align 4,,10
	.p2align 3
.L564:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L484
	.p2align 4,,10
	.p2align 3
.L470:
	vmovsd	.LC40(%rip), %xmm0
	vmovsd	-2672(%rbp), %xmm3
	vmovsd	.LC39(%rip), %xmm4
	vfmadd132sd	-2680(%rbp), %xmm3, %xmm0
	vfmadd132sd	-2664(%rbp), %xmm4, %xmm0
	jmp	.L556
	.p2align 4,,10
	.p2align 3
.L488:
	vmovsd	-2680(%rbp), %xmm1
	vmovsd	-2672(%rbp), %xmm7
	movq	-2704(%rbp), %r9
	vfmadd132sd	.LC40(%rip), %xmm7, %xmm1
	movq	-2696(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L557
.L575:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L529
.L570:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L508
.L566:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L492
.L561:
	vmovsd	%xmm1, -2648(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-2648(%rbp), %xmm1
	vsubsd	-2600(%rbp), %xmm0, %xmm0
	vfmadd231sd	-2568(%rbp), %xmm0, %xmm1
	jmp	.L476
.L558:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8829:
.L465:
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
.LCOLDE61:
	.section	.text.startup
.LHOTE61:
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
.L577:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L577
	vmovapd	.LC62(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	vmovapd	.LC11(%rip), %ymm0
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
	.align 32
.LC11:
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
.LC12:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.set	.LC13,.LC9
	.set	.LC14,.LC10
	.set	.LC18,.LC7+16
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
	.set	.LC62,.LC7
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
