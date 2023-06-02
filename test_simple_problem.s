	.file	"test_simple_problem.cpp"
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
	.p2align 4
	.globl	_Z3absDv4_d
	.type	_Z3absDv4_d, @function
_Z3absDv4_d:
.LFB8807:
	.cfi_startproc
	endbr64
	vmovapd	%ymm0, %ymm1
	vmovapd	.LC0(%rip), %ymm0
	vandnpd	%ymm1, %ymm0, %ymm0
	ret
	.cfi_endproc
.LFE8807:
	.size	_Z3absDv4_d, .-_Z3absDv4_d
	.p2align 4
	.globl	_Z18horizontal_productDv4_d
	.type	_Z18horizontal_productDv4_d, @function
_Z18horizontal_productDv4_d:
.LFB8809:
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
.LFE8809:
	.size	_Z18horizontal_productDv4_d, .-_Z18horizontal_productDv4_d
	.p2align 4
	.globl	_Z18mul_if_index_not_kDv4_dS_S_ll
	.type	_Z18mul_if_index_not_kDv4_dS_S_ll, @function
_Z18mul_if_index_not_kDv4_dS_S_ll:
.LFB8810:
	.cfi_startproc
	endbr64
	vsubpd	%ymm2, %ymm1, %ymm1
	vmovq	%rdi, %xmm4
	vpbroadcastq	%xmm4, %ymm2
	vmulpd	%ymm0, %ymm1, %ymm1
	vpaddq	.LC1(%rip), %ymm2, %ymm2
	vmovq	%rsi, %xmm5
	vpbroadcastq	%xmm5, %ymm3
	vpcmpeqq	%ymm3, %ymm2, %ymm2
	vblendvpd	%ymm2, %ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE8810:
	.size	_Z18mul_if_index_not_kDv4_dS_S_ll, .-_Z18mul_if_index_not_kDv4_dS_S_ll
	.p2align 4
	.globl	_Z15mul_if_not_zeroDv4_dS_S_
	.type	_Z15mul_if_not_zeroDv4_dS_S_, @function
_Z15mul_if_not_zeroDv4_dS_S_:
.LFB8811:
	.cfi_startproc
	endbr64
	vcmppd	$0, %ymm1, %ymm0, %ymm3
	vsubpd	%ymm2, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vblendvpd	%ymm3, %ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE8811:
	.size	_Z15mul_if_not_zeroDv4_dS_S_, .-_Z15mul_if_not_zeroDv4_dS_S_
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
	andq	$-32, %rsp
	movq	%rsi, -8(%rsp)
	vmovapd	.LC3(%rip), %ymm1
	movq	(%r8), %r9
	vmovlpd	(%rcx), %xmm1, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm1, %ymm1
	testq	%rdi, %rdi
	jle	.L43
	vmovapd	.LC2(%rip), %ymm4
	vpbroadcastq	-8(%rsp), %ymm5
	vmovdqa	.LC1(%rip), %ymm7
	vmovapd	.LC0(%rip), %ymm9
	vmovapd	.LC4(%rip), %ymm8
	vmovapd	.LC5(%rip), %ymm10
	movq	%rdx, %rsi
	vmovapd	%ymm4, %ymm3
	vmovapd	%ymm4, %ymm2
	xorl	%eax, %eax
	vxorpd	%xmm6, %xmm6, %xmm6
	.p2align 4,,10
	.p2align 3
.L14:
	vsubpd	(%rsi,%rax,8), %ymm6, %ymm11
	vmovq	%rax, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmulpd	%ymm1, %ymm11, %ymm11
	vpaddq	%ymm7, %ymm0, %ymm0
	vpcmpeqq	%ymm5, %ymm0, %ymm0
	leaq	4(%rax), %rdx
	vblendvpd	%ymm0, %ymm1, %ymm11, %ymm1
	vsubpd	32(%rsi,%rax,8), %ymm6, %ymm11
	vmovq	%rdx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmulpd	%ymm2, %ymm11, %ymm11
	vpaddq	%ymm7, %ymm0, %ymm0
	vpcmpeqq	%ymm5, %ymm0, %ymm0
	leaq	8(%rax), %rdx
	vblendvpd	%ymm0, %ymm2, %ymm11, %ymm2
	vsubpd	64(%rsi,%rax,8), %ymm6, %ymm11
	vmovq	%rdx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmulpd	%ymm3, %ymm11, %ymm11
	vpaddq	%ymm7, %ymm0, %ymm0
	vpcmpeqq	%ymm5, %ymm0, %ymm0
	leaq	12(%rax), %rdx
	vblendvpd	%ymm0, %ymm3, %ymm11, %ymm3
	vsubpd	96(%rsi,%rax,8), %ymm6, %ymm11
	vmovq	%rdx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmulpd	%ymm4, %ymm11, %ymm11
	vpaddq	%ymm7, %ymm0, %ymm0
	vpcmpeqq	%ymm5, %ymm0, %ymm0
	vblendvpd	%ymm0, %ymm4, %ymm11, %ymm4
	testb	$112, %al
	jne	.L10
	vandnpd	%ymm1, %ymm9, %ymm0
	vcmppd	$13, %ymm8, %ymm0, %ymm12
	vcmppd	$2, %ymm10, %ymm0, %ymm11
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm11, %r10d
	orl	%r10d, %edx
	je	.L11
	vmulpd	%ymm8, %ymm0, %ymm1
	vblendvpd	%ymm11, %ymm1, %ymm0, %ymm1
.L11:
	vandnpd	%ymm2, %ymm9, %ymm0
	vcmppd	$13, %ymm8, %ymm0, %ymm12
	vcmppd	$2, %ymm10, %ymm0, %ymm11
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm11, %r10d
	orl	%r10d, %edx
	je	.L12
	vmulpd	%ymm8, %ymm0, %ymm2
	vblendvpd	%ymm11, %ymm2, %ymm0, %ymm2
.L12:
	vandnpd	%ymm3, %ymm9, %ymm0
	vcmppd	$13, %ymm8, %ymm0, %ymm12
	vcmppd	$2, %ymm10, %ymm0, %ymm11
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm11, %r10d
	orl	%r10d, %edx
	je	.L13
	vmulpd	%ymm8, %ymm0, %ymm3
	vblendvpd	%ymm11, %ymm3, %ymm0, %ymm3
.L13:
	vandnpd	%ymm4, %ymm9, %ymm0
	vcmppd	$13, %ymm8, %ymm0, %ymm12
	vcmppd	$2, %ymm10, %ymm0, %ymm11
	vmovmskpd	%ymm12, %edx
	vmovmskpd	%ymm11, %r10d
	orl	%r10d, %edx
	je	.L10
	vmulpd	%ymm8, %ymm0, %ymm4
	vblendvpd	%ymm11, %ymm4, %ymm0, %ymm4
.L10:
	addq	$16, %rax
	cmpq	%rax, %rdi
	jg	.L14
	vmulpd	%ymm4, %ymm3, %ymm3
	vmulpd	%ymm2, %ymm1, %ymm2
	vmulpd	%ymm2, %ymm3, %ymm1
.L9:
	vandnpd	%ymm1, %ymm9, %ymm9
	vcmppd	$13, %ymm8, %ymm9, %ymm0
	vcmppd	$2, %ymm10, %ymm9, %ymm10
	vmovmskpd	%ymm0, %eax
	vmovmskpd	%ymm10, %edx
	orl	%edx, %eax
	je	.L15
	vmulpd	%ymm8, %ymm9, %ymm8
	vblendvpd	%ymm10, %ymm8, %ymm9, %ymm1
.L15:
	vmovapd	%xmm1, %xmm0
	vextractf128	$0x1, %ymm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LC6(%rip), %xmm1
	vcomisd	%xmm1, %xmm0
	vmovsd	%xmm0, (%rcx)
	movq	%r9, (%r8)
	jbe	.L40
	vmulsd	.LC7(%rip), %xmm0, %xmm0
	incq	%r9
	vmovsd	%xmm0, (%rcx)
	movq	%r9, (%r8)
.L41:
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
	vmovsd	.LC7(%rip), %xmm2
	vcomisd	%xmm0, %xmm2
	jbe	.L41
	vmulsd	%xmm1, %xmm0, %xmm0
	decq	%r9
	vmovsd	%xmm0, (%rcx)
	movq	%r9, (%r8)
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_restore_state
	vmovapd	.LC0(%rip), %ymm9
	vmovapd	.LC4(%rip), %ymm8
	vmovapd	.LC5(%rip), %ymm10
	jmp	.L9
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
	jle	.L55
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC6(%rip), %xmm4
	vmovsd	.LC7(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L56:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L48:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L55
.L50:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L56
	vcomisd	%xmm1, %xmm5
	ja	.L49
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L50
.L55:
	ret
	.p2align 4,,10
	.p2align 3
.L49:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L48
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
	jle	.L68
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC6(%rip), %xmm4
	vmovsd	.LC7(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L69:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L61:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L68
.L63:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L69
	vcomisd	%xmm2, %xmm5
	ja	.L62
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L63
.L68:
	ret
	.p2align 4,,10
	.p2align 3
.L62:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L61
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
	jle	.L79
	vmovsd	(%r8), %xmm2
	vmovsd	.LC6(%rip), %xmm5
	vmovsd	.LC7(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L92:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L76:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L79
.L78:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L92
	vcomisd	%xmm2, %xmm6
	ja	.L77
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L78
.L79:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L93
	vmovsd	(%r8), %xmm2
	vmovsd	.LC6(%rip), %xmm5
	vmovsd	.LC7(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L95:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L82:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L94
.L84:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L95
	vcomisd	%xmm2, %xmm6
	ja	.L83
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L84
.L94:
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L83:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L93:
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
	vmovdqa	.LC8(%rip), %ymm4
	vmovdqa	.LC9(%rip), %ymm5
	vmovdqa	.LC10(%rip), %ymm2
	vmovdqa	.LC11(%rip), %ymm3
	movq	%rdi, %rax
	leaq	1248(%rdi), %rcx
	movq	%rdi, %rdx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L97:
	vpand	8(%rdx), %ymm5, %ymm1
	vpand	(%rdx), %ymm4, %ymm0
	addq	$32, %rdx
	vpor	%ymm1, %ymm0, %ymm0
	vpsrlq	$1, %ymm0, %ymm1
	vpand	%ymm2, %ymm0, %ymm0
	vpxor	1216(%rdx), %ymm1, %ymm1
	vpcmpeqq	%ymm7, %ymm0, %ymm0
	vpxor	%ymm3, %ymm1, %ymm6
	vpblendvb	%ymm0, %ymm1, %ymm6, %ymm0
	vmovdqu	%ymm0, -32(%rdx)
	cmpq	%rcx, %rdx
	jne	.L97
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L98:
	vpand	8(%rdx), %ymm5, %ymm1
	vpand	(%rdx), %ymm4, %ymm0
	addq	$32, %rdx
	vpor	%ymm1, %ymm0, %ymm0
	vpsrlq	$1, %ymm0, %ymm1
	vpand	%ymm2, %ymm0, %ymm0
	vpxor	-1280(%rdx), %ymm1, %ymm1
	vpcmpeqq	%ymm7, %ymm0, %ymm0
	vpxor	%ymm3, %ymm1, %ymm6
	vpblendvb	%ymm0, %ymm1, %ymm6, %ymm0
	vmovdqu	%ymm0, -32(%rdx)
	cmpq	%rdx, %rcx
	jne	.L98
	vmovdqa	.LC12(%rip), %xmm0
	vmovdqa	.LC13(%rip), %xmm1
	vpand	2464(%rax), %xmm0, %xmm0
	vpand	2472(%rax), %xmm1, %xmm1
	movq	2488(%rax), %rsi
	vpor	%xmm1, %xmm0, %xmm0
	movq	2480(%rax), %rdx
	vpsrlq	$1, %xmm0, %xmm1
	movq	%rsi, %rcx
	vpand	.LC14(%rip), %xmm0, %xmm0
	andl	$2147483647, %ecx
	vpxor	1216(%rax), %xmm1, %xmm1
	andq	$-2147483648, %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	orq	%rcx, %rdx
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	movq	%rdx, %rcx
	vpxor	.LC15(%rip), %xmm1, %xmm2
	shrq	%rcx
	vpblendvb	%xmm0, %xmm1, %xmm2, %xmm0
	xorq	1232(%rax), %rcx
	andl	$1, %edx
	vmovdqu	%xmm0, 2464(%rax)
	je	.L102
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L102:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L101
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L101:
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
	jle	.L119
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
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L121:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L108:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC17(%rip), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L109
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L115
.L110:
	movq	%rdx, %rax
.L114:
	cmpq	$311, %rax
	ja	.L120
.L113:
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
	jns	.L121
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L120:
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
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L109:
	vmovsd	.LC19(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L110
.L115:
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
.L119:
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC20:
	.string	"M N\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC21:
	.string	"M number of runs, N number of particles\n"
	.section	.rodata.str1.1
.LC22:
	.string	"example: "
.LC23:
	.string	" 10 10000\n"
.LC24:
	.string	" product: "
.LC29:
	.string	"prod_realreal: orod="
.LC30:
	.string	" exponent="
.LC31:
	.string	" timing="
.LC32:
	.string	" seconds\n"
.LC33:
	.string	"prod_complexcomplex: orod="
.LC34:
	.string	"prod_realcomplex: orod="
.LC35:
	.string	"prod_complexreal: orod="
	.section	.text.unlikely,"ax",@progbits
.LCOLDB41:
	.section	.text.startup,"ax",@progbits
.LHOTB41:
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
	je	.L123
	leaq	_ZSt4cout(%rip), %r12
	movq	(%rsi), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC20(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC21(%rip), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$9, %edx
	leaq	.LC22(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC23(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %eax
.L122:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L220
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
.L123:
	.cfi_restore_state
	movl	$10, %edx
	leaq	.LC24(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovapd	.LC25(%rip), %ymm0
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
	je	.L221
	cmpb	$0, 56(%r12)
	je	.L126
	movzbl	67(%r12), %eax
.L127:
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
	ja	.L128
	leaq	0(,%r14,8), %rbx
	movq	%rbx, %rdi
	call	_Znam@PLT
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	_Znam@PLT
	movq	%rax, %r13
	movq	.LC18(%rip), %rax
	movq	%r15, %rsi
	vmovq	%rax, %xmm1
	movq	.LC26(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC18(%rip), %rax
	movq	%r13, %rsi
	vmovq	%rax, %xmm1
	movq	.LC26(%rip), %rax
	movq	%r14, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC18(%rip), %rax
	movq	$0, -120(%rbp)
	movq	%rax, -128(%rbp)
	call	clock@PLT
	movq	%rax, -112(%rbp)
	movq	.LC27(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)
	movq	%rax, -72(%rbp)
	movb	$1, -80(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	testq	%r12, %r12
	jle	.L129
	testq	%r14, %r14
	jle	.L129
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	-128(%rbp), %rax
	vmovsd	%xmm4, -136(%rbp)
	vmovsd	.LC17(%rip), %xmm4
	movq	%rax, -184(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	%xmm4, -144(%rbp)
	movq	$0, -192(%rbp)
	vmovsd	.LC28(%rip), %xmm4
	movq	%rax, -232(%rbp)
	movq	%r13, -208(%rbp)
	movq	%rbx, -200(%rbp)
	movq	-176(%rbp), %rbx
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm4, -152(%rbp)
	leaq	-120(%rbp), %r14
	.p2align 4,,10
	.p2align 3
.L130:
	movq	-232(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, -160(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L223:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L132:
	vaddsd	-136(%rbp), %xmm0, %xmm0
	vmulsd	-144(%rbp), %xmm0, %xmm0
	vcomisd	.LC18(%rip), %xmm0
	jnb	.L133
	vmovsd	-160(%rbp), %xmm6
	vmovsd	.LC26(%rip), %xmm7
	vfmadd132sd	-168(%rbp), %xmm6, %xmm0
	vfmadd132sd	-152(%rbp), %xmm7, %xmm0
.L218:
	movq	-184(%rbp), %rcx
	movq	%r13, %rsi
	movq	%r14, %r8
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L134
	movq	%r11, %rax
.L138:
	cmpq	$311, %rax
	ja	.L222
.L136:
	leaq	1(%rax), %r11
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
	movq	%r11, 2496+_ZL3gen(%rip)
	xorq	%rdx, %rax
	jns	.L223
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L134:
	incq	-192(%rbp)
	movq	-192(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L130
	movq	-200(%rbp), %rbx
	movq	-208(%rbp), %r13
.L129:
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -248(%rbp)
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC29(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC30(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC31(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L224
.L139:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC32(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC18(%rip), %rax
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
	jle	.L140
	cmpq	$0, -176(%rbp)
	jle	.L140
	leaq	-120(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, -184(%rbp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC17(%rip), %xmm4
	vmovsd	.LC28(%rip), %xmm6
	movq	$0, -208(%rbp)
	movq	%rax, -232(%rbp)
	movq	%rbx, -216(%rbp)
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	-176(%rbp), %rbx
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm3, -136(%rbp)
	vmovsd	%xmm4, -144(%rbp)
	vmovsd	%xmm6, -152(%rbp)
	.p2align 4,,10
	.p2align 3
.L141:
	movq	-232(%rbp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, -160(%rbp)
	xorl	%r14d, %r14d
	vmovsd	%xmm3, -168(%rbp)
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L228:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L143:
	vaddsd	-136(%rbp), %xmm0, %xmm0
	vmovsd	.LC18(%rip), %xmm7
	vmovsd	.LC19(%rip), %xmm6
	vmulsd	-144(%rbp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	-160(%rbp), %xmm6
	vfmadd132sd	-168(%rbp), %xmm6, %xmm0
	vmovsd	.LC26(%rip), %xmm6
	vfmadd132sd	-152(%rbp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L225
.L148:
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
	js	.L149
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L150:
	vaddsd	-136(%rbp), %xmm1, %xmm1
	vmulsd	-144(%rbp), %xmm1, %xmm1
	vcomisd	.LC18(%rip), %xmm1
	jnb	.L151
	vmovsd	-160(%rbp), %xmm4
	movq	-192(%rbp), %r9
	vfmadd132sd	-168(%rbp), %xmm4, %xmm1
	movq	-184(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
.L219:
	vmovsd	.LC26(%rip), %xmm6
	movq	%r14, %rsi
	vfmadd132sd	-152(%rbp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r14
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r14, %rbx
	je	.L226
.L154:
	cmpq	$311, %r11
	ja	.L227
.L147:
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
	jns	.L228
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L149:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L225:
	movq	%r12, %rdi
	vmovsd	%xmm0, -200(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	-200(%rbp), %xmm0
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L227:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L226:
	incq	-208(%rbp)
	movq	-208(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L141
	movq	-216(%rbp), %rbx
.L140:
	movq	-248(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC33(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC30(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC31(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L229
.L155:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC32(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC18(%rip), %rax
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
	jle	.L156
	cmpq	$0, -176(%rbp)
	jle	.L156
	movq	.LC18(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC17(%rip), %xmm6
	vmovsd	.LC28(%rip), %xmm7
	movq	$0, -216(%rbp)
	movq	%rax, -232(%rbp)
	xorl	%r10d, %r10d
	leaq	_ZL3gen(%rip), %r12
	vmovsd	%xmm4, -136(%rbp)
	movl	$134201207, %esi
	vmovsd	.LC6(%rip), %xmm3
	vmovsd	.LC7(%rip), %xmm4
	vmovsd	%xmm6, -144(%rbp)
	vmovsd	%xmm7, -152(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	salq	$37, %rsi
	movq	%r10, %r14
	movq	%r12, %r11
	.p2align 4,,10
	.p2align 3
.L157:
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
.L170:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L230
.L163:
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
	js	.L158
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L159:
	vaddsd	-136(%rbp), %xmm5, %xmm5
	vmovsd	.LC18(%rip), %xmm2
	vmovsd	.LC19(%rip), %xmm1
	vmulsd	-144(%rbp), %xmm5, %xmm5
	movq	%r12, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC26(%rip), %xmm1
	vfmadd132sd	-152(%rbp), %xmm1, %xmm5
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L232:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L166:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L231
.L168:
	vmovsd	0(%r13,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L232
	vcomisd	%xmm0, %xmm4
	jbe	.L166
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L168
.L231:
	vmovsd	%xmm0, -128(%rbp)
	testb	%cl, %cl
	je	.L169
	movq	%rdx, -120(%rbp)
	movq	%rdx, %r12
.L169:
	incq	%r14
	cmpq	%r14, -176(%rbp)
	jne	.L170
	incq	-216(%rbp)
	movq	%r12, %r14
	movq	-216(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L157
.L156:
	movq	-248(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC34(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC30(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC31(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L233
.L171:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC32(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC18(%rip), %rax
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
	jle	.L172
	cmpq	$0, -176(%rbp)
	jle	.L172
	movq	.LC18(%rip), %rax
	vmovsd	.LC28(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC17(%rip), %xmm7
	movq	$0, -240(%rbp)
	movq	%rax, -232(%rbp)
	movq	%r15, -160(%rbp)
	addq	%r15, %rbx
	xorl	%esi, %esi
	leaq	_ZL3gen(%rip), %r12
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	%xmm3, -152(%rbp)
	vmovsd	.LC7(%rip), %xmm4
	vmovsd	.LC6(%rip), %xmm3
	movq	%r13, -256(%rbp)
	vmovsd	%xmm6, -136(%rbp)
	vmovsd	%xmm7, -144(%rbp)
	movabsq	$6148914691236517205, %r9
	movabsq	$8202884508482404352, %r8
	movabsq	$-2270628950310912, %r14
	movq	%rsi, %r13
	xchgq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L173:
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
.L191:
	cmpq	$311, %rdi
	ja	.L234
.L179:
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
	js	.L174
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L175:
	vaddsd	-136(%rbp), %xmm5, %xmm5
	vmovsd	.LC18(%rip), %xmm2
	vmulsd	-144(%rbp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC19(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC26(%rip), %xmm1
	vfmadd132sd	-152(%rbp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L235
.L180:
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
	js	.L181
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L182:
	vaddsd	-136(%rbp), %xmm2, %xmm2
	vmovsd	.LC18(%rip), %xmm1
	vmovsd	.LC26(%rip), %xmm9
	vmulsd	-144(%rbp), %xmm2, %xmm2
	movq	-160(%rbp), %rax
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC19(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	-152(%rbp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L237:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L187:
	addq	$8, %rax
	cmpq	%rax, %r12
	je	.L236
.L189:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L237
	vcomisd	%xmm0, %xmm4
	jbe	.L187
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %r12
	jne	.L189
.L236:
	vmovsd	%xmm0, -128(%rbp)
	testb	%cl, %cl
	je	.L190
	movq	%rdx, -120(%rbp)
	movq	%rdx, %rbx
.L190:
	incq	%r13
	cmpq	%r13, -176(%rbp)
	jne	.L191
	incq	-240(%rbp)
	movq	%rbx, %r13
	movq	%r15, %rbx
	movq	-240(%rbp), %rax
	cmpq	%rax, -224(%rbp)
	jne	.L173
	movq	-160(%rbp), %r15
	movq	-256(%rbp), %r13
.L172:
	movq	-248(%rbp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC35(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-128(%rbp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC30(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-120(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC31(%rip), %rsi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, -80(%rbp)
	vmovsd	-88(%rbp), %xmm1
	jne	.L238
.L192:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC32(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZdaPv@PLT
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L181:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L174:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L175
	.p2align 4,,10
	.p2align 3
.L158:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L235:
	movq	%r15, %rdi
	vmovsd	%xmm0, -216(%rbp)
	vmovsd	%xmm6, -208(%rbp)
	vmovsd	%xmm4, -200(%rbp)
	vmovsd	%xmm3, -192(%rbp)
	vmovsd	%xmm7, -184(%rbp)
	vmovsd	%xmm5, -168(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	-216(%rbp), %xmm0
	vmovsd	-208(%rbp), %xmm6
	vmovsd	-200(%rbp), %xmm4
	vmovsd	-192(%rbp), %xmm3
	vmovsd	-184(%rbp), %xmm7
	vmovsd	-168(%rbp), %xmm5
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L234:
	movq	%r15, %rdi
	vmovsd	%xmm0, -208(%rbp)
	vmovsd	%xmm6, -200(%rbp)
	vmovsd	%xmm4, -192(%rbp)
	vmovsd	%xmm3, -184(%rbp)
	vmovsd	%xmm7, -168(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdi
	vmovsd	-208(%rbp), %xmm0
	vmovsd	-200(%rbp), %xmm6
	vmovsd	-192(%rbp), %xmm4
	vmovsd	-184(%rbp), %xmm3
	vmovsd	-168(%rbp), %xmm7
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %r9
	jmp	.L179
	.p2align 4,,10
	.p2align 3
.L230:
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
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L151:
	vmovsd	-168(%rbp), %xmm1
	vmovsd	-160(%rbp), %xmm7
	movq	-192(%rbp), %r9
	vfmadd132sd	.LC19(%rip), %xmm7, %xmm1
	movq	-184(%rbp), %r8
	movq	%r13, %rcx
	movq	%r15, %rdx
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L133:
	vmovsd	.LC19(%rip), %xmm0
	vmovsd	-160(%rbp), %xmm3
	vmovsd	.LC26(%rip), %xmm4
	vfmadd132sd	-168(%rbp), %xmm3, %xmm0
	vfmadd132sd	-152(%rbp), %xmm4, %xmm0
	jmp	.L218
.L126:
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	movl	$10, %esi
	movq	%r12, %rdi
	call	*48(%rax)
	jmp	.L127
.L224:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L139
.L238:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L192
.L233:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L171
.L229:
	vmovsd	%xmm1, -136(%rbp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	-136(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm0, %xmm0
	vfmadd231sd	-72(%rbp), %xmm0, %xmm1
	jmp	.L155
.L221:
	call	_ZSt16__throw_bad_castv@PLT
.L220:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8816:
.L128:
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
.LCOLDE41:
	.section	.text.startup
.LHOTE41:
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
.L240:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L240
	vmovapd	.LC42(%rip), %xmm0
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
.LC0:
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.long	0
	.long	-2147483648
	.align 32
.LC1:
	.quad	0
	.quad	1
	.quad	2
	.quad	3
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
.LC3:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC4:
	.long	0
	.long	1340080128
	.long	0
	.long	1340080128
	.long	0
	.long	1340080128
	.long	0
	.long	1340080128
	.align 32
.LC5:
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.long	0
	.long	805306368
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1608515584
	.align 8
.LC7:
	.long	0
	.long	536870912
	.section	.rodata.cst32
	.align 32
.LC8:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC9:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC10:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC11:
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.set	.LC12,.LC8
	.set	.LC13,.LC9
	.set	.LC14,.LC10
	.set	.LC15,.LC11
	.section	.rodata.cst8
	.align 8
.LC17:
	.long	0
	.long	1005584384
	.set	.LC18,.LC2
	.align 8
.LC19:
	.long	-1
	.long	1072693247
	.section	.rodata.cst32
	.align 32
.LC25:
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
.LC26:
	.long	0
	.long	-1074790400
	.align 8
.LC27:
	.long	-1598689907
	.long	1051772663
	.set	.LC28,.LC25+16
	.set	.LC42,.LC3
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
