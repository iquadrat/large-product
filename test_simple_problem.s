	.file	"test_simple_problem.cpp"
	.text
	.align 2
	.p2align 4
	.type	_ZN9stopwatch4stopEv.part.0, @function
_ZN9stopwatch4stopEv.part.0:
.LFB9226:
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
.LFE9226:
	.size	_ZN9stopwatch4stopEv.part.0, .-_ZN9stopwatch4stopEv.part.0
	.p2align 4
	.globl	_Z18horizontal_productDv4_d
	.type	_Z18horizontal_productDv4_d, @function
_Z18horizontal_productDv4_d:
.LFB8807:
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
.LFE8807:
	.size	_Z18horizontal_productDv4_d, .-_Z18horizontal_productDv4_d
	.p2align 4
	.globl	_Z18mul_if_index_not_kDv4_dS_S_ll
	.type	_Z18mul_if_index_not_kDv4_dS_S_ll, @function
_Z18mul_if_index_not_kDv4_dS_S_ll:
.LFB8808:
	.cfi_startproc
	endbr64
	vsubpd	%ymm2, %ymm1, %ymm1
	vmovq	%rdi, %xmm4
	vpbroadcastq	%xmm4, %ymm2
	vmulpd	%ymm0, %ymm1, %ymm1
	vpaddq	.LC0(%rip), %ymm2, %ymm2
	vmovq	%rsi, %xmm5
	vpbroadcastq	%xmm5, %ymm3
	vpcmpeqq	%ymm3, %ymm2, %ymm2
	vblendvpd	%ymm2, %ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE8808:
	.size	_Z18mul_if_index_not_kDv4_dS_S_ll, .-_Z18mul_if_index_not_kDv4_dS_S_ll
	.p2align 4
	.globl	_Z15mul_if_not_zeroDv4_dS_S_
	.type	_Z15mul_if_not_zeroDv4_dS_S_, @function
_Z15mul_if_not_zeroDv4_dS_S_:
.LFB8809:
	.cfi_startproc
	endbr64
	vcmppd	$0, %ymm1, %ymm0, %ymm3
	vsubpd	%ymm2, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vblendvpd	%ymm3, %ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE8809:
	.size	_Z15mul_if_not_zeroDv4_dS_S_, .-_Z15mul_if_not_zeroDv4_dS_S_
	.p2align 4
	.globl	_Z13prod_realreallldPKdRdRl
	.type	_Z13prod_realreallldPKdRdRl, @function
_Z13prod_realreallldPKdRdRl:
.LFB8810:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vmovsd	%xmm0, %xmm0, %xmm3
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	movq	%rsi, -8(%rsp)
	movq	%rcx, %rsi
	vmovapd	.LC2(%rip), %ymm1
	movq	(%r8), %r9
	vmovlpd	(%rcx), %xmm1, %xmm0
	vinsertf128	$0x0, %xmm0, %ymm1, %ymm1
	testq	%rdi, %rdi
	jle	.L10
	vmovapd	.LC1(%rip), %ymm2
	vpbroadcastq	-8(%rsp), %ymm4
	vmovdqa	.LC0(%rip), %ymm7
	vbroadcastsd	%xmm3, %ymm3
	xorl	%eax, %eax
	vmovapd	%ymm2, %ymm5
	vmovapd	%ymm2, %ymm6
	.p2align 4,,10
	.p2align 3
.L9:
	vsubpd	(%rdx,%rax,8), %ymm3, %ymm8
	vmovq	%rax, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmulpd	%ymm1, %ymm8, %ymm8
	vpaddq	%ymm7, %ymm0, %ymm0
	vpcmpeqq	%ymm4, %ymm0, %ymm0
	leaq	4(%rax), %rcx
	vblendvpd	%ymm0, %ymm1, %ymm8, %ymm1
	vsubpd	32(%rdx,%rax,8), %ymm3, %ymm8
	vmovq	%rcx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmulpd	%ymm6, %ymm8, %ymm8
	vpaddq	%ymm7, %ymm0, %ymm0
	vpcmpeqq	%ymm4, %ymm0, %ymm0
	leaq	8(%rax), %rcx
	vblendvpd	%ymm0, %ymm6, %ymm8, %ymm6
	vsubpd	64(%rdx,%rax,8), %ymm3, %ymm8
	vmovq	%rcx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmulpd	%ymm5, %ymm8, %ymm8
	vpaddq	%ymm7, %ymm0, %ymm0
	vpcmpeqq	%ymm4, %ymm0, %ymm0
	leaq	12(%rax), %rcx
	vblendvpd	%ymm0, %ymm5, %ymm8, %ymm5
	vsubpd	96(%rdx,%rax,8), %ymm3, %ymm8
	vmovq	%rcx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmulpd	%ymm2, %ymm8, %ymm8
	vpaddq	%ymm7, %ymm0, %ymm0
	vpcmpeqq	%ymm4, %ymm0, %ymm0
	addq	$16, %rax
	vblendvpd	%ymm0, %ymm2, %ymm8, %ymm2
	cmpq	%rax, %rdi
	jg	.L9
.L8:
	vmovapd	%xmm1, %xmm0
	vextractf128	$0x1, %ymm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm5, %xmm3
	vextractf128	$0x1, %ymm5, %xmm5
	vmulpd	%xmm5, %xmm3, %xmm5
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm6, %xmm0
	vextractf128	$0x1, %ymm6, %xmm6
	vmulpd	%xmm6, %xmm0, %xmm6
	vunpckhpd	%xmm5, %xmm5, %xmm5
	vmulsd	%xmm5, %xmm3, %xmm4
	vmovapd	%xmm2, %xmm3
	vextractf128	$0x1, %ymm2, %xmm2
	vunpckhpd	%xmm6, %xmm6, %xmm6
	vmulsd	%xmm6, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm3, %xmm3
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi)
	movq	%r9, (%r8)
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	vmovapd	.LC1(%rip), %ymm2
	vmovapd	%ymm2, %ymm5
	vmovapd	%ymm2, %ymm6
	jmp	.L8
	.cfi_endproc
.LFE8810:
	.size	_Z13prod_realreallldPKdRdRl, .-_Z13prod_realreallldPKdRdRl
	.p2align 4
	.globl	_Z16prod_realcomplexldPKdS0_RdRl
	.type	_Z16prod_realcomplexldPKdS0_RdRl, @function
_Z16prod_realcomplexldPKdS0_RdRl:
.LFB8811:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rdx, %rdi
	testq	%rax, %rax
	jle	.L24
	leaq	0(,%rax,8), %rdx
	vmovsd	(%rcx), %xmm1
	vmovsd	.LC3(%rip), %xmm4
	vmovsd	.LC4(%rip), %xmm5
	xorl	%eax, %eax
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L25:
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	incq	(%r8)
.L17:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L24
.L19:
	vmovsd	(%rdi,%rax), %xmm3
	vsubsd	(%rsi,%rax), %xmm0, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd132sd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	ja	.L25
	vcomisd	%xmm1, %xmm5
	ja	.L18
	addq	$8, %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rdx, %rax
	jne	.L19
.L24:
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx)
	decq	(%r8)
	jmp	.L17
	.cfi_endproc
.LFE8811:
	.size	_Z16prod_realcomplexldPKdS0_RdRl, .-_Z16prod_realcomplexldPKdS0_RdRl
	.p2align 4
	.globl	_Z16prod_complexreallddPKdRdRl
	.type	_Z16prod_complexreallddPKdRdRl, @function
_Z16prod_complexreallddPKdRdRl:
.LFB8812:
	.cfi_startproc
	endbr64
	vmulsd	%xmm1, %xmm1, %xmm1
	testq	%rdi, %rdi
	jle	.L37
	vmovsd	(%rdx), %xmm2
	vmovsd	.LC3(%rip), %xmm4
	vmovsd	.LC4(%rip), %xmm5
	leaq	(%rsi,%rdi,8), %rax
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L38:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	incq	(%rcx)
.L30:
	addq	$8, %rsi
	cmpq	%rax, %rsi
	je	.L37
.L32:
	vsubsd	(%rsi), %xmm0, %xmm3
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm4, %xmm2
	ja	.L38
	vcomisd	%xmm2, %xmm5
	ja	.L31
	addq	$8, %rsi
	vmovsd	%xmm2, (%rdx)
	cmpq	%rax, %rsi
	jne	.L32
.L37:
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	vmulsd	%xmm4, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	decq	(%rcx)
	jmp	.L30
	.cfi_endproc
.LFE8812:
	.size	_Z16prod_complexreallddPKdRdRl, .-_Z16prod_complexreallddPKdRdRl
	.p2align 4
	.globl	_Z19prod_complexcomplexllddPKdS0_RdRl
	.type	_Z19prod_complexcomplexllddPKdS0_RdRl, @function
_Z19prod_complexcomplexllddPKdS0_RdRl:
.LFB8813:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	movq	%rdx, %rsi
	testq	%rax, %rax
	jle	.L48
	vmovsd	(%r8), %xmm2
	vmovsd	.LC3(%rip), %xmm5
	vmovsd	.LC4(%rip), %xmm6
	leaq	0(,%rax,8), %r10
	xorl	%edx, %edx
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L61:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L45:
	addq	$8, %rdx
	cmpq	%r10, %rdx
	je	.L48
.L47:
	vsubsd	(%rcx,%rdx), %xmm1, %xmm4
	vsubsd	(%rsi,%rdx), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L61
	vcomisd	%xmm2, %xmm6
	ja	.L46
	addq	$8, %rdx
	vmovsd	%xmm2, (%r8)
	cmpq	%r10, %rdx
	jne	.L47
.L48:
	incl	%eax
	cltq
	cmpq	%rax, %rdi
	jle	.L62
	vmovsd	(%r8), %xmm2
	vmovsd	.LC3(%rip), %xmm5
	vmovsd	.LC4(%rip), %xmm6
	salq	$3, %rax
	salq	$3, %rdi
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L64:
	vmulsd	%xmm6, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	incq	(%r9)
.L51:
	addq	$8, %rax
	cmpq	%rdi, %rax
	je	.L63
.L53:
	vsubsd	(%rcx,%rax), %xmm1, %xmm4
	vsubsd	(%rsi,%rax), %xmm0, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vcomisd	%xmm5, %xmm2
	ja	.L64
	vcomisd	%xmm2, %xmm6
	ja	.L52
	addq	$8, %rax
	vmovsd	%xmm2, (%r8)
	cmpq	%rdi, %rax
	jne	.L53
.L63:
	ret
	.p2align 4,,10
	.p2align 3
.L46:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L52:
	vmulsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, (%r8)
	decq	(%r9)
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L62:
	ret
	.cfi_endproc
.LFE8813:
	.size	_Z19prod_complexcomplexllddPKdS0_RdRl, .-_Z19prod_complexcomplexllddPKdS0_RdRl
	.section	.text._ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv:
.LFB9218:
	.cfi_startproc
	endbr64
	vmovdqa	.LC5(%rip), %ymm2
	vmovdqa	.LC6(%rip), %ymm3
	vmovdqa	.LC7(%rip), %ymm4
	vmovdqa	.LC8(%rip), %ymm5
	movq	%rdi, %rax
	leaq	1248(%rdi), %rcx
	movq	%rdi, %rdx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L66:
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
	jne	.L66
	leaq	2464(%rax), %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L67:
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
	jne	.L67
	vmovdqa	.LC9(%rip), %xmm0
	vmovdqa	.LC10(%rip), %xmm1
	vpand	2464(%rax), %xmm0, %xmm0
	vpand	2472(%rax), %xmm1, %xmm1
	movq	2488(%rax), %rsi
	vpor	%xmm1, %xmm0, %xmm0
	movq	2480(%rax), %rdx
	vpsrlq	$1, %xmm0, %xmm1
	movq	%rsi, %rcx
	vpand	.LC11(%rip), %xmm0, %xmm0
	andl	$2147483647, %ecx
	vpxor	1216(%rax), %xmm1, %xmm1
	andq	$-2147483648, %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	orq	%rcx, %rdx
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	movq	%rdx, %rcx
	vpxor	.LC12(%rip), %xmm1, %xmm2
	shrq	%rcx
	vpblendvb	%xmm0, %xmm1, %xmm2, %xmm0
	xorq	1232(%rax), %rcx
	andl	$1, %edx
	vmovdqu	%xmm0, 2464(%rax)
	je	.L71
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L71:
	movq	(%rax), %rdx
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rsi, %rdx
	movq	%rcx, 2480(%rax)
	movq	%rdx, %rcx
	shrq	%rcx
	xorq	1240(%rax), %rcx
	andl	$1, %edx
	je	.L70
	movabsq	$-5403634167711393303, %rdx
	xorq	%rdx, %rcx
.L70:
	movq	%rcx, 2488(%rax)
	movq	$0, 2496(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE9218:
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
	jle	.L88
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
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L90:
	vcvtsi2sdq	%rax, %xmm5, %xmm0
.L77:
	vxorpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LC14(%rip), %xmm0, %xmm0
	vcomisd	.LC15(%rip), %xmm0
	jnb	.L78
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rbx
	je	.L84
.L79:
	movq	%rdx, %rax
.L83:
	cmpq	$311, %rax
	ja	.L89
.L82:
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
	jns	.L90
	movq	%rax, %rsi
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	vcvtsi2sdq	%rsi, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L89:
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
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L78:
	vmovsd	.LC16(%rip), %xmm0
	vfmadd132sd	%xmm3, %xmm4, %xmm0
	vfmadd132sd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L79
.L84:
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
.L88:
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
.LC17:
	.string	"M N\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC18:
	.string	"M number of runs, N number of particles\n"
	.section	.rodata.str1.1
.LC19:
	.string	"example: "
.LC20:
	.string	" 10 10000\n"
.LC24:
	.string	"prod_realreal: orod="
.LC25:
	.string	" exponent="
.LC26:
	.string	" timing="
.LC27:
	.string	" seconds\n"
.LC28:
	.string	"prod_complexcomplex: orod="
.LC29:
	.string	"prod_realcomplex: orod="
.LC30:
	.string	"prod_complexreal: orod="
	.section	.text.unlikely,"ax",@progbits
.LCOLDB31:
	.section	.text.startup,"ax",@progbits
.LHOTB31:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8814:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	movq	%fs:40, %rax
	movq	%rax, 200(%rsp)
	xorl	%eax, %eax
	cmpl	$3, %edi
	je	.L92
	leaq	_ZSt4cout(%rip), %rbp
	movq	(%rsi), %rsi
	movq	%rbp, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC17(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC18(%rip), %rsi
	movq	%rbp, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$9, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rbp, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rbx), %rsi
	movq	%rbp, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC20(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %eax
.L91:
	movq	200(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L186
	addq	$216, %rsp
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
.L92:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movslq	%eax, %r12
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r12, 88(%rsp)
	call	strtol@PLT
	movslq	%eax, %rbp
	movabsq	$1152921504606846975, %rax
	movq	%rbp, 48(%rsp)
	cmpq	%rax, %rbp
	ja	.L94
	leaq	0(,%rbp,8), %rbx
	movq	%rbx, %rdi
	call	_Znam@PLT
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	_Znam@PLT
	movq	%rax, %r14
	movq	.LC15(%rip), %rax
	movq	%r15, %rsi
	vmovq	%rax, %xmm1
	movq	.LC21(%rip), %rax
	movq	%rbp, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC15(%rip), %rax
	movq	%r14, %rsi
	vmovq	%rax, %xmm1
	movq	.LC21(%rip), %rax
	movq	%rbp, %rdi
	vmovq	%rax, %xmm0
	call	_Z21init_random_positionslddPd
	movq	.LC15(%rip), %rax
	movq	$0, 136(%rsp)
	movq	%rax, 128(%rsp)
	call	clock@PLT
	movq	%rax, 144(%rsp)
	movq	.LC22(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 160(%rsp)
	movq	%rax, 184(%rsp)
	movb	$1, 176(%rsp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	%xmm0, 152(%rsp)
	testq	%r12, %r12
	jle	.L95
	testq	%rbp, %rbp
	jle	.L95
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovsd	%xmm4, 8(%rsp)
	vmovsd	.LC14(%rip), %xmm4
	leaq	_ZL5distu(%rip), %rdi
	vmovsd	%xmm4, 16(%rsp)
	movq	$0, 56(%rsp)
	vmovsd	.LC23(%rip), %xmm4
	movq	%rdi, 96(%rsp)
	movq	%rbx, 64(%rsp)
	leaq	136(%rsp), %rax
	movq	48(%rsp), %rbx
	movq	%r14, 72(%rsp)
	leaq	_ZL3gen(%rip), %rbp
	vmovsd	%xmm4, 24(%rsp)
	leaq	128(%rsp), %r12
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L96:
	movq	96(%rsp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm4
	xorl	%r13d, %r13d
	vsubsd	%xmm4, %xmm0, %xmm7
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	%xmm4, 32(%rsp)
	vmovsd	%xmm7, 40(%rsp)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L188:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
.L98:
	vaddsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vcomisd	.LC15(%rip), %xmm0
	jnb	.L99
	vmovsd	32(%rsp), %xmm6
	vmovsd	.LC21(%rip), %xmm7
	vfmadd132sd	40(%rsp), %xmm6, %xmm0
	vfmadd132sd	24(%rsp), %xmm7, %xmm0
.L184:
	movq	%r13, %rsi
	movq	%r14, %r8
	movq	%r12, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rdi
	incq	%r13
	call	_Z13prod_realreallldPKdRdRl
	cmpq	%r13, %rbx
	je	.L100
	movq	%r10, %rax
.L104:
	cmpq	$311, %rax
	ja	.L187
.L102:
	leaq	1(%rax), %r10
	movq	0(%rbp,%rax,8), %rax
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
	movq	%r10, 2496+_ZL3gen(%rip)
	xorq	%rdx, %rax
	jns	.L188
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L100:
	incq	56(%rsp)
	movq	56(%rsp), %rax
	cmpq	%rax, 88(%rsp)
	jne	.L96
	movq	64(%rsp), %rbx
	movq	72(%rsp), %r14
.L95:
	leaq	144(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 112(%rsp)
	call	_ZN9stopwatch4stopEv.part.0
	movl	$20, %edx
	leaq	.LC24(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	128(%rsp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	136(%rsp), %rsi
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, 176(%rsp)
	vmovsd	168(%rsp), %xmm1
	jne	.L189
.L105:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC27(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC15(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 160(%rsp)
	movq	%rax, 128(%rsp)
	movq	$0, 136(%rsp)
	movb	$1, 176(%rsp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	cmpq	$0, 88(%rsp)
	vmovsd	%xmm0, 152(%rsp)
	jle	.L106
	cmpq	$0, 48(%rsp)
	jle	.L106
	leaq	136(%rsp), %rax
	movq	%rax, 56(%rsp)
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC14(%rip), %xmm4
	vmovsd	.LC23(%rip), %xmm6
	movq	$0, 72(%rsp)
	movq	%rax, 96(%rsp)
	movq	%rbx, 80(%rsp)
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	48(%rsp), %rbx
	leaq	_ZL3gen(%rip), %rbp
	vmovsd	%xmm3, 8(%rsp)
	vmovsd	%xmm4, 16(%rsp)
	vmovsd	%xmm6, 24(%rsp)
	leaq	128(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L107:
	movq	96(%rsp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm0
	vmovsd	(%rax), %xmm6
	movq	2496+_ZL3gen(%rip), %r11
	vsubsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm6, 32(%rsp)
	xorl	%r13d, %r13d
	vmovsd	%xmm3, 40(%rsp)
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L193:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
.L109:
	vaddsd	8(%rsp), %xmm0, %xmm0
	vmovsd	.LC15(%rip), %xmm7
	vmovsd	.LC16(%rip), %xmm6
	vmulsd	16(%rsp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vmovsd	32(%rsp), %xmm6
	vfmadd132sd	40(%rsp), %xmm6, %xmm0
	vmovsd	.LC21(%rip), %xmm6
	vfmadd132sd	24(%rsp), %xmm6, %xmm0
	cmpq	$311, %rdx
	ja	.L190
.L114:
	movq	0(%rbp,%rdx,8), %rax
	leaq	1(%rdx), %r11
	movq	%rax, %rdx
	movabsq	$6148914691236517205, %rsi
	shrq	$29, %rdx
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$17, %rdx
	movabsq	$8202884508482404352, %rdi
	andq	%rdi, %rdx
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
	js	.L115
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm1
.L116:
	vaddsd	8(%rsp), %xmm1, %xmm1
	vmulsd	16(%rsp), %xmm1, %xmm1
	vcomisd	.LC15(%rip), %xmm1
	jnb	.L117
	vmovsd	32(%rsp), %xmm4
	movq	56(%rsp), %r9
	vfmadd132sd	40(%rsp), %xmm4, %xmm1
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	%r15, %rdx
.L185:
	vmovsd	.LC21(%rip), %xmm6
	movq	%r13, %rsi
	vfmadd132sd	24(%rsp), %xmm6, %xmm1
	movq	%rbx, %rdi
	incq	%r13
	call	_Z19prod_complexcomplexllddPKdS0_RdRl
	cmpq	%r13, %rbx
	je	.L191
.L120:
	cmpq	$311, %r11
	ja	.L192
.L113:
	movq	0(%rbp,%r11,8), %rax
	movabsq	$6148914691236517205, %rdi
	movq	%rax, %rcx
	shrq	$29, %rcx
	andq	%rdi, %rcx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$17, %rcx
	movabsq	$8202884508482404352, %rsi
	andq	%rsi, %rcx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$37, %rcx
	movabsq	$-2270628950310912, %rdi
	andq	%rdi, %rcx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	leaq	1(%r11), %rdx
	shrq	$43, %rcx
	movq	%rdx, 2496+_ZL3gen(%rip)
	xorq	%rcx, %rax
	jns	.L193
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L191:
	incq	72(%rsp)
	movq	72(%rsp), %rax
	cmpq	%rax, 88(%rsp)
	jne	.L107
	movq	80(%rsp), %rbx
.L106:
	movq	112(%rsp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$26, %edx
	leaq	.LC28(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	128(%rsp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	136(%rsp), %rsi
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, 176(%rsp)
	vmovsd	168(%rsp), %xmm1
	jne	.L194
.L121:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC27(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC15(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 160(%rsp)
	movq	%rax, 128(%rsp)
	movq	$0, 136(%rsp)
	movb	$1, 176(%rsp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	cmpq	$0, 88(%rsp)
	vmovsd	%xmm0, 152(%rsp)
	jle	.L122
	cmpq	$0, 48(%rsp)
	jle	.L122
	movq	.LC15(%rip), %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC14(%rip), %xmm6
	vmovsd	.LC23(%rip), %xmm7
	movq	$0, 80(%rsp)
	movq	%rax, 96(%rsp)
	leaq	_ZL3gen(%rip), %rbp
	xorl	%r13d, %r13d
	vmovsd	%xmm4, 8(%rsp)
	vmovsd	.LC3(%rip), %xmm3
	vmovsd	.LC4(%rip), %xmm4
	movq	%rbp, %r12
	vmovsd	%xmm6, 16(%rsp)
	vmovsd	%xmm7, 24(%rsp)
	movabsq	$6148914691236517205, %rsi
	movabsq	$8202884508482404352, %r9
	movabsq	$-2270628950310912, %r8
	movq	%r13, %rbp
	.p2align 4,,10
	.p2align 3
.L123:
	movq	96(%rsp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm6
	vmovsd	(%rax), %xmm7
	xorl	%r13d, %r13d
	vsubsd	%xmm7, %xmm6, %xmm6
	movq	%r12, %rax
	movq	2496+_ZL3gen(%rip), %rdi
	movq	%rbp, %r12
	movq	%r13, %rbp
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L136:
	movq	%rdi, %rax
	cmpq	$311, %rdi
	ja	.L195
.L129:
	leaq	1(%rax), %rdi
	movq	0(%r13,%rax,8), %rax
	movq	%rdi, 2496+_ZL3gen(%rip)
	movq	%rax, %rdx
	shrq	$29, %rdx
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$17, %rdx
	andq	%r9, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$37, %rdx
	andq	%r8, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$43, %rdx
	xorq	%rdx, %rax
	js	.L124
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm5
.L125:
	vaddsd	8(%rsp), %xmm5, %xmm5
	vmovsd	.LC15(%rip), %xmm2
	vmovsd	.LC16(%rip), %xmm1
	vmulsd	16(%rsp), %xmm5, %xmm5
	movq	%r12, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vcmplesd	%xmm5, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC21(%rip), %xmm1
	vfmadd132sd	24(%rsp), %xmm1, %xmm5
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L197:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L132:
	addq	$8, %rax
	cmpq	%rax, %rbx
	je	.L196
.L134:
	vmovsd	(%r14,%rax), %xmm2
	vsubsd	(%r15,%rax), %xmm5, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L197
	vcomisd	%xmm0, %xmm4
	jbe	.L132
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbx
	jne	.L134
.L196:
	vmovsd	%xmm0, 128(%rsp)
	testb	%cl, %cl
	je	.L135
	movq	%rdx, 136(%rsp)
	movq	%rdx, %r12
.L135:
	incq	%rbp
	cmpq	%rbp, 48(%rsp)
	jne	.L136
	incq	80(%rsp)
	movq	%r12, %rbp
	movq	%r13, %r12
	movq	80(%rsp), %rax
	cmpq	%rax, 88(%rsp)
	jne	.L123
.L122:
	movq	112(%rsp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC29(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	128(%rsp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	136(%rsp), %rsi
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, 176(%rsp)
	vmovsd	168(%rsp), %xmm1
	jne	.L198
.L137:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC27(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	.LC15(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 160(%rsp)
	movq	%rax, 128(%rsp)
	movq	$0, 136(%rsp)
	movb	$1, 176(%rsp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	cmpq	$0, 88(%rsp)
	vmovsd	%xmm0, 152(%rsp)
	jle	.L138
	cmpq	$0, 48(%rsp)
	jle	.L138
	movq	.LC15(%rip), %rax
	vmovsd	.LC23(%rip), %xmm3
	vmovq	%rax, %xmm0
	leaq	_ZL5distu(%rip), %rax
	vmovsd	.LC14(%rip), %xmm7
	movq	$0, 104(%rsp)
	movq	%rax, 96(%rsp)
	movq	%r14, 120(%rsp)
	addq	%r15, %rbx
	leaq	_ZL3gen(%rip), %rbp
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	%xmm3, 24(%rsp)
	vmovsd	.LC4(%rip), %xmm4
	vmovsd	.LC3(%rip), %xmm3
	xorl	%r13d, %r13d
	vmovsd	%xmm6, 8(%rsp)
	vmovsd	%xmm7, 16(%rsp)
	movabsq	$6148914691236517205, %rsi
	movabsq	$8202884508482404352, %r8
	movabsq	$-2270628950310912, %r12
	xchgq	%rbx, %rbp
	.p2align 4,,10
	.p2align 3
.L139:
	movq	96(%rsp), %rax
	vmovsd	8+_ZL5distu(%rip), %xmm6
	vmovsd	(%rax), %xmm7
	xorl	%r14d, %r14d
	vsubsd	%xmm7, %xmm6, %xmm6
	movq	%rbx, %rax
	movq	2496+_ZL3gen(%rip), %r9
	movq	%r14, %rbx
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L157:
	cmpq	$311, %r9
	ja	.L199
.L145:
	movq	(%r14,%r9,8), %rdx
	leaq	1(%r9), %rax
	movq	%rdx, %rcx
	shrq	$29, %rcx
	andq	%rsi, %rcx
	xorq	%rcx, %rdx
	movq	%rdx, %rcx
	salq	$17, %rcx
	andq	%r8, %rcx
	xorq	%rcx, %rdx
	movq	%rdx, %rcx
	salq	$37, %rcx
	andq	%r12, %rcx
	xorq	%rcx, %rdx
	movq	%rdx, %rcx
	shrq	$43, %rcx
	movq	%rax, 2496+_ZL3gen(%rip)
	xorq	%rcx, %rdx
	js	.L140
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
.L141:
	vaddsd	8(%rsp), %xmm5, %xmm5
	vmovsd	.LC15(%rip), %xmm2
	vmulsd	16(%rsp), %xmm5, %xmm5
	vcmplesd	%xmm5, %xmm2, %xmm1
	vmovsd	.LC16(%rip), %xmm2
	vblendvpd	%xmm1, %xmm2, %xmm5, %xmm5
	vfmadd132sd	%xmm6, %xmm7, %xmm5
	vmovsd	.LC21(%rip), %xmm1
	vfmadd132sd	24(%rsp), %xmm1, %xmm5
	cmpq	$311, %rax
	ja	.L200
.L146:
	leaq	1(%rax), %r9
	movq	(%r14,%rax,8), %rax
	movq	%r9, 2496+_ZL3gen(%rip)
	movq	%rax, %rdx
	shrq	$29, %rdx
	andq	%rsi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$17, %rdx
	andq	%r8, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$37, %rdx
	andq	%r12, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$43, %rdx
	xorq	%rdx, %rax
	js	.L147
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
.L148:
	vaddsd	8(%rsp), %xmm2, %xmm2
	vmovsd	.LC15(%rip), %xmm1
	vmovsd	.LC21(%rip), %xmm9
	vmulsd	16(%rsp), %xmm2, %xmm2
	movq	%r15, %rax
	movq	%r13, %rdx
	xorl	%ecx, %ecx
	vcmplesd	%xmm2, %xmm1, %xmm8
	vmovsd	.LC16(%rip), %xmm1
	vblendvpd	%xmm8, %xmm1, %xmm2, %xmm2
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vfmadd132sd	24(%rsp), %xmm9, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L202:
	vmulsd	%xmm4, %xmm0, %xmm0
	incq	%rdx
	movl	$1, %ecx
.L153:
	addq	$8, %rax
	cmpq	%rax, %rbp
	je	.L201
.L155:
	vsubsd	(%rax), %xmm5, %xmm1
	vfmadd132sd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm3, %xmm0
	ja	.L202
	vcomisd	%xmm0, %xmm4
	jbe	.L153
	addq	$8, %rax
	vmulsd	%xmm3, %xmm0, %xmm0
	decq	%rdx
	movl	$1, %ecx
	cmpq	%rax, %rbp
	jne	.L155
.L201:
	vmovsd	%xmm0, 128(%rsp)
	testb	%cl, %cl
	je	.L156
	movq	%rdx, 136(%rsp)
	movq	%rdx, %r13
.L156:
	incq	%rbx
	cmpq	%rbx, 48(%rsp)
	jne	.L157
	incq	104(%rsp)
	movq	%r14, %rbx
	movq	104(%rsp), %rax
	cmpq	%rax, 88(%rsp)
	jne	.L139
	movq	120(%rsp), %r14
.L138:
	movq	112(%rsp), %rdi
	call	_ZN9stopwatch4stopEv.part.0
	movl	$23, %edx
	leaq	.LC30(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	128(%rsp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$10, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	136(%rsp), %rsi
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	movl	$8, %edx
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpb	$0, 176(%rsp)
	vmovsd	168(%rsp), %xmm1
	jne	.L203
.L158:
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC27(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZdaPv@PLT
	movq	%r14, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L124:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L140:
	movq	%rdx, %rcx
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rcx, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm5, %xmm5
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L147:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L115:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L187:
	movq	%rbp, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L200:
	movq	%r14, %rdi
	vmovsd	%xmm0, 80(%rsp)
	vmovsd	%xmm6, 72(%rsp)
	vmovsd	%xmm4, 64(%rsp)
	vmovsd	%xmm3, 56(%rsp)
	vmovsd	%xmm7, 40(%rsp)
	vmovsd	%xmm5, 32(%rsp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	80(%rsp), %xmm0
	vmovsd	72(%rsp), %xmm6
	vmovsd	64(%rsp), %xmm4
	vmovsd	56(%rsp), %xmm3
	vmovsd	40(%rsp), %xmm7
	vmovsd	32(%rsp), %xmm5
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %rsi
	jmp	.L146
	.p2align 4,,10
	.p2align 3
.L190:
	movq	%rbp, %rdi
	vmovsd	%xmm0, 64(%rsp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rdx
	vmovsd	64(%rsp), %xmm0
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L195:
	movq	%r13, %rdi
	vmovsd	%xmm0, 72(%rsp)
	vmovsd	%xmm4, 64(%rsp)
	vmovsd	%xmm3, 56(%rsp)
	vmovsd	%xmm6, 40(%rsp)
	vmovsd	%xmm7, 32(%rsp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %rax
	vmovsd	72(%rsp), %xmm0
	vmovsd	64(%rsp), %xmm4
	vmovsd	56(%rsp), %xmm3
	vmovsd	40(%rsp), %xmm6
	vmovsd	32(%rsp), %xmm7
	movabsq	$-2270628950310912, %r8
	movabsq	$8202884508482404352, %r9
	movabsq	$6148914691236517205, %rsi
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L199:
	movq	%r14, %rdi
	vmovsd	%xmm0, 72(%rsp)
	vmovsd	%xmm6, 64(%rsp)
	vmovsd	%xmm4, 56(%rsp)
	vmovsd	%xmm3, 40(%rsp)
	vmovsd	%xmm7, 32(%rsp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r9
	vmovsd	72(%rsp), %xmm0
	vmovsd	64(%rsp), %xmm6
	vmovsd	56(%rsp), %xmm4
	vmovsd	40(%rsp), %xmm3
	vmovsd	32(%rsp), %xmm7
	movabsq	$8202884508482404352, %r8
	movabsq	$6148914691236517205, %rsi
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L192:
	movq	%rbp, %rdi
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2496+_ZL3gen(%rip), %r11
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L99:
	vmovsd	.LC16(%rip), %xmm0
	vmovsd	32(%rsp), %xmm3
	vmovsd	.LC21(%rip), %xmm4
	vfmadd132sd	40(%rsp), %xmm3, %xmm0
	vfmadd132sd	24(%rsp), %xmm4, %xmm0
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L117:
	vmovsd	40(%rsp), %xmm1
	vmovsd	32(%rsp), %xmm7
	movq	56(%rsp), %r9
	vfmadd132sd	.LC16(%rip), %xmm7, %xmm1
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	%r15, %rdx
	jmp	.L185
.L203:
	vmovsd	%xmm1, 8(%rsp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	8(%rsp), %xmm1
	vsubsd	152(%rsp), %xmm0, %xmm0
	vfmadd231sd	184(%rsp), %xmm0, %xmm1
	jmp	.L158
.L198:
	vmovsd	%xmm1, 8(%rsp)
	call	clock@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	8(%rsp), %xmm1
	vsubsd	152(%rsp), %xmm0, %xmm0
	vfmadd231sd	184(%rsp), %xmm0, %xmm1
	jmp	.L137
.L194:
	vmovsd	%xmm1, 8(%rsp)
	call	clock@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	8(%rsp), %xmm1
	vsubsd	152(%rsp), %xmm0, %xmm0
	vfmadd231sd	184(%rsp), %xmm0, %xmm1
	jmp	.L121
.L189:
	vmovsd	%xmm1, 8(%rsp)
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vmovsd	8(%rsp), %xmm1
	vsubsd	152(%rsp), %xmm0, %xmm0
	vfmadd231sd	184(%rsp), %xmm0, %xmm1
	jmp	.L105
.L186:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8814:
.L94:
	.cfi_def_cfa_offset 272
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	call	__cxa_throw_bad_array_new_length@PLT
	.cfi_endproc
.LFE8814:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE31:
	.section	.text.startup
.LHOTE31:
	.p2align 4
	.type	_GLOBAL__sub_I__Z21init_random_positionslddPd, @function
_GLOBAL__sub_I__Z21init_random_positionslddPd:
.LFB9224:
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
.L205:
	movq	%rcx, %rax
	shrq	$62, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$312, %rdx
	jne	.L205
	vmovapd	.LC32(%rip), %xmm0
	movq	$312, 2496+_ZL3gen(%rip)
	vmovapd	%xmm0, _ZL5distu(%rip)
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9224:
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
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.align 32
.LC1:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC2:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1608515584
	.align 8
.LC4:
	.long	0
	.long	536870912
	.section	.rodata.cst32
	.align 32
.LC5:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC6:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC7:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC8:
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.set	.LC9,.LC5
	.set	.LC10,.LC6
	.set	.LC11,.LC7
	.set	.LC12,.LC8
	.section	.rodata.cst8
	.align 8
.LC14:
	.long	0
	.long	1005584384
	.set	.LC15,.LC1
	.align 8
.LC16:
	.long	-1
	.long	1072693247
	.align 8
.LC21:
	.long	0
	.long	-1074790400
	.align 8
.LC22:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC23:
	.long	0
	.long	1073741824
	.set	.LC32,.LC2
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
