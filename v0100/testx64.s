# NYI: GenInitFinalize

# glb abort : () void
# glb puts : (
# prm     <something> : * char
#     ) void
# glb test0 : () void
		.text
		.code64
		.global		test0
		.type		test0, %function
test0:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		subq		$16, %rsp				# TODO: Stack cookie
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     a : (@-8) : int
# RPN'ized expression: "a 12 -u = "
# Expanded expression: "(@-8) -12 =(-4) "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movq		$0xfffffffffffffff4, %rdi				# TOKEN: <NumInt>, VALUE: -12, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     c : (@-16) : char
# RPN'ized expression: "c 1 = "
# Expanded expression: "(@-16) 1 =(-1) "
# GenExpr
		leaq		-16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdi
		movq		$0x1, %rdi				# TOKEN: <NumInt>, VALUE: 1, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     p : (@-24) : * void
# RPN'ized expression: "p 0 = "
# Expanded expression: "(@-24) 0 =(8) "
# GenExpr
		leaq		-24(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rdi
		xorq		%rdi, %rdi				# TOKEN: <NumInt>, VALUE: 0, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     b : (@-32) : char
# RPN'ized expression: "b 2 = "
# Expanded expression: "(@-32) 2 =(-1) "
# GenExpr
		leaq		-32(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdi
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     cp : (@-40) : * char
# RPN'ized expression: "cp c &u = "
# Expanded expression: "(@-40) (@-16) =(8) "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40, next active register: %rdi
		leaq		-16(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# RPN'ized expression: "cp *u 42 = "
# Expanded expression: "(@-40) *(8) 42 =(-1) "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40, next active register: %rdi
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8, next active register: %rdi
		movq		$0x2a, %rdi				# TOKEN: <NumInt>, VALUE: 42, next active register: %rsi
		movb		%dil, (%rax)				# TOKEN: =, VALUE: -1, next active register: %rdi
.L1:
		addq		$16, %rsp				# TODO: Stack cookie
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# glb test1 : () char
		.text
		.code64
		.global		test1
		.type		test1, %function
test1:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		subq		$16, %rsp				# TODO: Stack cookie
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     a : (@-8) : int
# RPN'ized expression: "a 12 -u = "
# Expanded expression: "(@-8) -12 =(-4) "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movq		$0xfffffffffffffff4, %rdi				# TOKEN: <NumInt>, VALUE: -12, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     c : (@-16) : char
# RPN'ized expression: "c 12 = "
# Expanded expression: "(@-16) 12 =(-1) "
# GenExpr
		leaq		-16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdi
		movq		$0xc, %rdi				# TOKEN: <NumInt>, VALUE: 12, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "a c + 0 == "
# Expanded expression: "(@-8) *(-4) (@-16) *(-1) + 0 == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		leaq		-16(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		xorq		%rdi, %rdi				# TOKEN: <NumInt>, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L5					# TOKEN: <IfNot>, VALUE: 5, next active register: %rax
# {
# return
# RPN'ized expression: "1 "
# Expanded expression: "1 "
# Expression value: 1
# GenExpr
		movq		$0x1, %rax				# TOKEN: <NumInt>, VALUE: 1, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L3
# }
		jmp			.L6
.L5:
# else
# {
# return
# RPN'ized expression: "3 "
# Expanded expression: "3 "
# Expression value: 3
# GenExpr
		movq		$0x3, %rax				# TOKEN: <NumInt>, VALUE: 3, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L3
# }
.L6:
.L3:
		addq		$16, %rsp				# TODO: Stack cookie
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# glb test2 : () char
		.text
		.code64
		.global		test2
		.type		test2, %function
test2:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		subq		$16, %rsp				# TODO: Stack cookie
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     a : (@-8) : int
# RPN'ized expression: "a 12 -u = "
# Expanded expression: "(@-8) -12 =(-4) "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movq		$0xfffffffffffffff4, %rdi				# TOKEN: <NumInt>, VALUE: -12, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     c : (@-16) : char
# RPN'ized expression: "c 12 = "
# Expanded expression: "(@-16) 12 =(-1) "
# GenExpr
		leaq		-16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdi
		movq		$0xc, %rdi				# TOKEN: <NumInt>, VALUE: 12, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     b : (@-24) : char
# RPN'ized expression: "b 31 -u = "
# Expanded expression: "(@-24) -31 =(-1) "
# GenExpr
		leaq		-24(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rdi
		movq		$0xffffffffffffffe1, %rdi				# TOKEN: <NumInt>, VALUE: -31, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     d : (@-32) : int
# RPN'ized expression: "d 33 = "
# Expanded expression: "(@-32) 33 =(-4) "
# GenExpr
		leaq		-32(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdi
		movq		$0x21, %rdi				# TOKEN: <NumInt>, VALUE: 33, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "a b + c + d + 2 == "
# Expanded expression: "(@-8) *(-4) (@-24) *(-1) + (@-16) *(-1) + (@-32) *(-4) + 2 == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-16(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-32(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L9					# TOKEN: <IfNot>, VALUE: 9, next active register: %rax
# {
# return
# RPN'ized expression: "2 "
# Expanded expression: "2 "
# Expression value: 2
# GenExpr
		movq		$0x2, %rax				# TOKEN: <NumInt>, VALUE: 2, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L7
# }
		jmp			.L10
.L9:
# else
# {
# return
# RPN'ized expression: "5 "
# Expanded expression: "5 "
# Expression value: 5
# GenExpr
		movq		$0x5, %rax				# TOKEN: <NumInt>, VALUE: 5, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L7
# }
.L10:
.L7:
		addq		$16, %rsp				# TODO: Stack cookie
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# glb test3_a : int
		.data
		.align		8
		.global		test3_a
		.type		test3_a, %object
test3_a:
# =
# RPN'ized expression: "12 -u "
# Expanded expression: "-12 "
# Expression value: -12
		.int		-12

# glb test3_c : char
		.data
		.global		test3_c
		.type		test3_c, %object
test3_c:
# =
# RPN'ized expression: "12 "
# Expanded expression: "12 "
# Expression value: 12
		.byte		12

# glb test3_b : char
		.data
		.global		test3_b
		.type		test3_b, %object
test3_b:
# =
# RPN'ized expression: "31 -u "
# Expanded expression: "-31 "
# Expression value: -31
		.byte		-31

# glb test3_d : int
		.data
		.align		8
		.global		test3_d
		.type		test3_d, %object
test3_d:
# =
# RPN'ized expression: "33 "
# Expanded expression: "33 "
# Expression value: 33
		.int		33

# glb test3 : () char
		.text
		.code64
		.global		test3
		.type		test3, %function
test3:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		subq		$16, %rsp				# TODO: Stack cookie
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# if
# RPN'ized expression: "test3_a test3_b + test3_c + test3_d + 2 == "
# Expanded expression: "test3_a *(-4) test3_b *(-1) + test3_c *(-1) + test3_d *(-4) + 2 == "
# GenExpr
		leaq		test3_a(%rip), %rax				# TOKEN: <Ident>, VALUE: 170, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		leaq		test3_b(%rip), %rdi				# TOKEN: <Ident>, VALUE: 188, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		test3_c(%rip), %rdi				# TOKEN: <Ident>, VALUE: 179, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		test3_d(%rip), %rdi				# TOKEN: <Ident>, VALUE: 197, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L13					# TOKEN: <IfNot>, VALUE: 13, next active register: %rax
# {
# return
# RPN'ized expression: "4 "
# Expanded expression: "4 "
# Expression value: 4
# GenExpr
		movq		$0x4, %rax				# TOKEN: <NumInt>, VALUE: 4, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L11
# }
		jmp			.L14
.L13:
# else
# {
# return
# RPN'ized expression: "7 "
# Expanded expression: "7 "
# Expression value: 7
# GenExpr
		movq		$0x7, %rax				# TOKEN: <NumInt>, VALUE: 7, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L11
# }
.L14:
.L11:
		addq		$16, %rsp				# TODO: Stack cookie
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# glb test4_a : int
		.bss
		.align		8
		.global		test4_a
		.type		test4_a, %object
test4_a:
		.skip		4

# glb test4_c : char
		.bss
		.global		test4_c
		.type		test4_c, %object
test4_c:
		.skip		1

# glb test4_b : char
		.bss
		.global		test4_b
		.type		test4_b, %object
test4_b:
		.skip		1

# glb test4_d : int
		.bss
		.align		8
		.global		test4_d
		.type		test4_d, %object
test4_d:
		.skip		4

# glb test4 : () char
		.text
		.code64
		.global		test4
		.type		test4, %function
test4:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		subq		$16, %rsp				# TODO: Stack cookie
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# RPN'ized expression: "test4_a 12 -u = "
# Expanded expression: "test4_a -12 =(-4) "
# GenExpr
		leaq		test4_a(%rip), %rax				# TOKEN: <Ident>, VALUE: 213, next active register: %rdi
		movq		$0xfffffffffffffff4, %rdi				# TOKEN: <NumInt>, VALUE: -12, next active register: %rsi
		movl		%edi, (%rax)				# TOKEN: =, VALUE: -4, next active register: %rdi
# RPN'ized expression: "test4_c 12 = "
# Expanded expression: "test4_c 12 =(-1) "
# GenExpr
		leaq		test4_c(%rip), %rax				# TOKEN: <Ident>, VALUE: 222, next active register: %rdi
		movq		$0xc, %rdi				# TOKEN: <NumInt>, VALUE: 12, next active register: %rsi
		movb		%dil, (%rax)				# TOKEN: =, VALUE: -1, next active register: %rdi
# RPN'ized expression: "test4_b 31 -u = "
# Expanded expression: "test4_b -31 =(-1) "
# GenExpr
		leaq		test4_b(%rip), %rax				# TOKEN: <Ident>, VALUE: 231, next active register: %rdi
		movq		$0xffffffffffffffe1, %rdi				# TOKEN: <NumInt>, VALUE: -31, next active register: %rsi
		movb		%dil, (%rax)				# TOKEN: =, VALUE: -1, next active register: %rdi
# RPN'ized expression: "test4_d 33 = "
# Expanded expression: "test4_d 33 =(-4) "
# GenExpr
		leaq		test4_d(%rip), %rax				# TOKEN: <Ident>, VALUE: 240, next active register: %rdi
		movq		$0x21, %rdi				# TOKEN: <NumInt>, VALUE: 33, next active register: %rsi
		movl		%edi, (%rax)				# TOKEN: =, VALUE: -4, next active register: %rdi
# if
# RPN'ized expression: "test4_a test4_b + test4_c + test4_d + 2 == "
# Expanded expression: "test4_a *(-4) test4_b *(-1) + test4_c *(-1) + test4_d *(-4) + 2 == "
# GenExpr
		leaq		test4_a(%rip), %rax				# TOKEN: <Ident>, VALUE: 213, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		leaq		test4_b(%rip), %rdi				# TOKEN: <Ident>, VALUE: 231, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		test4_c(%rip), %rdi				# TOKEN: <Ident>, VALUE: 222, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		test4_d(%rip), %rdi				# TOKEN: <Ident>, VALUE: 240, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L17					# TOKEN: <IfNot>, VALUE: 17, next active register: %rax
# {
# return
# RPN'ized expression: "6 "
# Expanded expression: "6 "
# Expression value: 6
# GenExpr
		movq		$0x6, %rax				# TOKEN: <NumInt>, VALUE: 6, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L15
# }
		jmp			.L18
.L17:
# else
# {
# return
# RPN'ized expression: "9 "
# Expanded expression: "9 "
# Expression value: 9
# GenExpr
		movq		$0x9, %rax				# TOKEN: <NumInt>, VALUE: 9, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L15
# }
.L18:
.L15:
		addq		$16, %rsp				# TODO: Stack cookie
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# glb test5 : (
# prm     a : int
# prm     b : int
# prm     c : int
#     ) int
		.text
		.code64
		.global		test5
		.type		test5, %function
test5:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		subq		$0x18, %rsp				# Space for homing the parameters on the stack
		movq		%rdi, 0x0(%rsp)			# Home parameter 0
		movq		%rsi, 0x8(%rsp)			# Home parameter 1
		movq		%rdx, 0x10(%rsp)			# Home parameter 2
		subq		$16, %rsp				# TODO: Stack cookie
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     a : (@16) : int
# loc     b : (@24) : int
# loc     c : (@32) : int
# return
# RPN'ized expression: "a b + c + "
# Expanded expression: "(@16) *(-4) (@24) *(-4) + (@32) *(-4) + "
# GenExpr
		leaq		16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: 16, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		leaq		24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: 24, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		32(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: 32, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
.L19:
		addq		$0x18, %rsp				# Free the space used by the homed parameters and locals
		addq		$16, %rsp				# TODO: Stack cookie
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# glb test6 : (
# prm     a : int
#     ) int
		.text
		.code64
		.global		test6
		.type		test6, %function
test6:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		subq		$0x8, %rsp				# Space for homing the parameters on the stack
		movq		%rdi, 0x0(%rsp)			# Home parameter 0
		subq		$16, %rsp				# TODO: Stack cookie
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     a : (@16) : int
# if
# RPN'ized expression: "a 0 > "
# Expanded expression: "(@16) *(-4) 0 > "
# GenExpr
		leaq		16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: 16, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		xorq		%rdi, %rdi				# TOKEN: <NumInt>, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: >, VALUE: 0, next active register: %rdi
		jle			.L23					# TOKEN: <IfNot>, VALUE: 23, next active register: %rax
# {
# return
# RPN'ized expression: "a ( a 1 - test6 ) + "
# Expanded expression: "(@16) *(-4)  (@16) *(-4) 1 -  test6 ()8 + "
# GenExpr
		leaq		16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: 16, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: 16, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0x1, %rdi				# TOKEN: <NumInt>, VALUE: 1, next active register: %rsi
		subq		%rdi, %rax				# TOKEN: -, VALUE: 0, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		test6				# TOKEN: <Ident>, VALUE: 272, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use
				# TOKEN: ), VALUE: 8, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
		jmp			.L21
# }
.L23:
# return
# RPN'ized expression: "0 "
# Expanded expression: "0 "
# Expression value: 0
# GenExpr
		xorq		%rax, %rax				# TOKEN: <NumInt>, VALUE: 0, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
.L21:
		addq		$0x8, %rsp				# Free the space used by the homed parameters and locals
		addq		$16, %rsp				# TODO: Stack cookie
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# glb main : (
# prm     argc : int
# prm     argv : * * char
#     ) void
		.text
		.code64
		.global		main
		.type		main, %function
main:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		subq		$0x10, %rsp				# Space for homing the parameters on the stack
		movq		%rdi, 0x0(%rsp)			# Home parameter 0
		movq		%rsi, 0x8(%rsp)			# Home parameter 1
		subq		$16, %rsp				# TODO: Stack cookie
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     argc : (@16) : int
# loc     argv : (@24) : * * char
# loc     a : (@-8) : int
# RPN'ized expression: "a 50 = "
# Expanded expression: "(@-8) 50 =(-4) "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     c1 : (@-16) : char
# RPN'ized expression: "c1 21 = "
# Expanded expression: "(@-16) 21 =(-1) "
# GenExpr
		leaq		-16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdi
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     b : (@-24) : int
# RPN'ized expression: "b 70 = "
# Expanded expression: "(@-24) 70 =(-4) "
# GenExpr
		leaq		-24(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rdi
		movq		$0x46, %rdi				# TOKEN: <NumInt>, VALUE: 70, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     c2 : (@-32) : char
# RPN'ized expression: "c2 31 = "
# Expanded expression: "(@-32) 31 =(-1) "
# GenExpr
		leaq		-32(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdi
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# if
# loc     <something> : char
# RPN'ized expression: "<something29> sizeof 1 != "
# Expanded expression: "0 "
# Expression value: 0
		jmp			.L27
# {

		.section	.rodata, "a", @progbits
.L30:
		.ascii		"Wrong size for char"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L30 puts ) "
# Expanded expression: " L30  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L30(%rip), %rax				# TOKEN: <Ident>, VALUE: 324, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
# }
.L27:
# if
# loc     <something> : short
# RPN'ized expression: "<something33> sizeof 2 != "
# Expanded expression: "0 "
# Expression value: 0
		jmp			.L31
# {

		.section	.rodata, "a", @progbits
.L34:
		.ascii		"Wrong size for short"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L34 puts ) "
# Expanded expression: " L34  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L34(%rip), %rax				# TOKEN: <Ident>, VALUE: 339, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
# }
.L31:
# if
# loc     <something> : int
# RPN'ized expression: "<something37> sizeof 4 != "
# Expanded expression: "0 "
# Expression value: 0
		jmp			.L35
# {

		.section	.rodata, "a", @progbits
.L38:
		.ascii		"Wrong size for int"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L38 puts ) "
# Expanded expression: " L38  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L38(%rip), %rax				# TOKEN: <Ident>, VALUE: 354, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
# }
.L35:
# if
# loc     <something> : long # RPN'ized expression: "<something41> sizeof 8 != "
# Expanded expression: "0 "
# Expression value: 0
		jmp			.L39
# {

		.section	.rodata, "a", @progbits
.L42:
		.ascii		"Wrong size for long"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L42 puts ) "
# Expanded expression: " L42  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L42(%rip), %rax				# TOKEN: <Ident>, VALUE: 369, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
# }
.L39:

		.section	.rodata, "a", @progbits
.L43:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L43 puts ) "
# Expanded expression: " L43  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L43(%rip), %rax				# TOKEN: <Ident>, VALUE: 369, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(-4) 21 + (@-24) *(-4) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50, next active register: %rsi
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L44					# TOKEN: <IfNot>, VALUE: 44, next active register: %rax

		.section	.rodata, "a", @progbits
.L46:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L46 puts ) "
# Expanded expression: " L46  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L46(%rip), %rax				# TOKEN: <Ident>, VALUE: 373, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L45
.L44:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L45:

		.section	.rodata, "a", @progbits
.L47:
		.ascii		"Running test 0"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L47 puts ) "
# Expanded expression: " L47  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L47(%rip), %rax				# TOKEN: <Ident>, VALUE: 377, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# RPN'ized expression: "( test0 ) "
# Expanded expression: " test0 ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test0				# TOKEN: <Ident>, VALUE: 149, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi

		.section	.rodata, "a", @progbits
.L48:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L48 puts ) "
# Expanded expression: " L48  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L48(%rip), %rax				# TOKEN: <Ident>, VALUE: 381, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(-4) 21 + (@-24) *(-4) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50, next active register: %rsi
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L49					# TOKEN: <IfNot>, VALUE: 49, next active register: %rax

		.section	.rodata, "a", @progbits
.L51:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L51 puts ) "
# Expanded expression: " L51  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L51(%rip), %rax				# TOKEN: <Ident>, VALUE: 385, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L50
.L49:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L50:
# if
# RPN'ized expression: "( test1 ) 1 == "
# Expanded expression: " test1 ()0 1 == "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
		movq		$0x1, %rdi				# TOKEN: <NumInt>, VALUE: 1, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L52					# TOKEN: <IfNot>, VALUE: 52, next active register: %rax

		.section	.rodata, "a", @progbits
.L54:
		.ascii		"test 1 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L54 puts ) "
# Expanded expression: " L54  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L54(%rip), %rax				# TOKEN: <Ident>, VALUE: 389, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L53
.L52:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L53:
# if
# RPN'ized expression: "1 ( test1 ) == "
# Expanded expression: "1  test1 ()0 == "
# GenExpr
		movq		$0x1, %rax				# TOKEN: <NumInt>, VALUE: 1, next active register: %rdi
		subq		$256, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L55					# TOKEN: <IfNot>, VALUE: 55, next active register: %rax

		.section	.rodata, "a", @progbits
.L57:
		.ascii		"test 1' passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L57 puts ) "
# Expanded expression: " L57  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L57(%rip), %rax				# TOKEN: <Ident>, VALUE: 393, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L56
.L55:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L56:
# if
# RPN'ized expression: "( test1 ) ( test1 ) + ( test1 ) + 3 == "
# Expanded expression: " test1 ()0  test1 ()0 +  test1 ()0 + 3 == "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
		subq		$256, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		subq		$256, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x3, %rdi				# TOKEN: <NumInt>, VALUE: 3, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L58					# TOKEN: <IfNot>, VALUE: 58, next active register: %rax

		.section	.rodata, "a", @progbits
.L60:
		.ascii		"test 1'' passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L60 puts ) "
# Expanded expression: " L60  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L60(%rip), %rax				# TOKEN: <Ident>, VALUE: 397, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L59
.L58:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L59:
# if
# RPN'ized expression: "( test1 ) ( test1 ) + ( test1 ) ( test1 ) + == "
# Expanded expression: " test1 ()0  test1 ()0 +  test1 ()0  test1 ()0 + == "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
		subq		$256, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		subq		$256, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rsi
		subq		$256, %rsp # Protect locals
		pushq		%rax # Save register in use
		pushq		%rdi # Save register in use
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test1				# TOKEN: <Ident>, VALUE: 156, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rsi # Save result

		popq		%rdi # Restore register in use

		popq		%rax # Restore register in use

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L61					# TOKEN: <IfNot>, VALUE: 61, next active register: %rax

		.section	.rodata, "a", @progbits
.L63:
		.ascii		"test 1''' passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L63 puts ) "
# Expanded expression: " L63  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L63(%rip), %rax				# TOKEN: <Ident>, VALUE: 401, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L62
.L61:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L62:

		.section	.rodata, "a", @progbits
.L64:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L64 puts ) "
# Expanded expression: " L64  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L64(%rip), %rax				# TOKEN: <Ident>, VALUE: 405, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(-4) 21 + (@-24) *(-4) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50, next active register: %rsi
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L65					# TOKEN: <IfNot>, VALUE: 65, next active register: %rax

		.section	.rodata, "a", @progbits
.L67:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L67 puts ) "
# Expanded expression: " L67  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L67(%rip), %rax				# TOKEN: <Ident>, VALUE: 409, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L66
.L65:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L66:
# if
# RPN'ized expression: "( test2 ) 2 == "
# Expanded expression: " test2 ()0 2 == "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test2				# TOKEN: <Ident>, VALUE: 163, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L68					# TOKEN: <IfNot>, VALUE: 68, next active register: %rax

		.section	.rodata, "a", @progbits
.L70:
		.ascii		"test 2 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L70 puts ) "
# Expanded expression: " L70  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L70(%rip), %rax				# TOKEN: <Ident>, VALUE: 413, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L69
.L68:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L69:

		.section	.rodata, "a", @progbits
.L71:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L71 puts ) "
# Expanded expression: " L71  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L71(%rip), %rax				# TOKEN: <Ident>, VALUE: 417, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(-4) 21 + (@-24) *(-4) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50, next active register: %rsi
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L72					# TOKEN: <IfNot>, VALUE: 72, next active register: %rax

		.section	.rodata, "a", @progbits
.L74:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L74 puts ) "
# Expanded expression: " L74  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L74(%rip), %rax				# TOKEN: <Ident>, VALUE: 421, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L73
.L72:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L73:
# if
# RPN'ized expression: "( test3 ) 4 == "
# Expanded expression: " test3 ()0 4 == "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test3				# TOKEN: <Ident>, VALUE: 206, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
		movq		$0x4, %rdi				# TOKEN: <NumInt>, VALUE: 4, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L75					# TOKEN: <IfNot>, VALUE: 75, next active register: %rax

		.section	.rodata, "a", @progbits
.L77:
		.ascii		"test 3 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L77 puts ) "
# Expanded expression: " L77  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L77(%rip), %rax				# TOKEN: <Ident>, VALUE: 425, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L76
.L75:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L76:

		.section	.rodata, "a", @progbits
.L78:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L78 puts ) "
# Expanded expression: " L78  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L78(%rip), %rax				# TOKEN: <Ident>, VALUE: 429, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(-4) 21 + (@-24) *(-4) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50, next active register: %rsi
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L79					# TOKEN: <IfNot>, VALUE: 79, next active register: %rax

		.section	.rodata, "a", @progbits
.L81:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L81 puts ) "
# Expanded expression: " L81  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L81(%rip), %rax				# TOKEN: <Ident>, VALUE: 433, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L80
.L79:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L80:
# if
# RPN'ized expression: "( test4 ) 6 == "
# Expanded expression: " test4 ()0 6 == "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		test4				# TOKEN: <Ident>, VALUE: 249, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
		movq		$0x6, %rdi				# TOKEN: <NumInt>, VALUE: 6, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L82					# TOKEN: <IfNot>, VALUE: 82, next active register: %rax

		.section	.rodata, "a", @progbits
.L84:
		.ascii		"test 4 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L84 puts ) "
# Expanded expression: " L84  puts ()8 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L84(%rip), %rax				# TOKEN: <Ident>, VALUE: 437, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L83
.L82:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$256, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$256, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L83:
# loc     x : (@-40) : int
# RPN'ized expression: "x 150 -u = "
# Expanded expression: "(@-40) -150 =(-4) "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40, next active register: %rdi
		movq		$0xffffffffffffff6a, %rdi				# TOKEN: <NumInt>, VALUE: -150, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     y1 : (@-48) : char
# RPN'ized expression: "y1 121 = "
# Expanded expression: "(@-48) 121 =(-1) "
# GenExpr
		leaq		-48(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -48, next active register: %rdi
		movq		$0x79, %rdi				# TOKEN: <NumInt>, VALUE: 121, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     z : (@-56) : int
# RPN'ized expression: "z 170 -u = "
# Expanded expression: "(@-56) -170 =(-4) "
# GenExpr
		leaq		-56(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -56, next active register: %rdi
		movq		$0xffffffffffffff56, %rdi				# TOKEN: <NumInt>, VALUE: -170, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     w2 : (@-64) : char
# RPN'ized expression: "w2 110 = "
# Expanded expression: "(@-64) 110 =(-1) "
# GenExpr
		leaq		-64(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -64, next active register: %rdi
		movq		$0x6e, %rdi				# TOKEN: <NumInt>, VALUE: 110, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi
# loc     w3 : (@-72) : char
# RPN'ized expression: "w3 100 -u = "
# Expanded expression: "(@-72) -100 =(-1) "
# GenExpr
		leaq		-72(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -72, next active register: %rdi
		movq		$0xffffffffffffff9c, %rdi				# TOKEN: <NumInt>, VALUE: -100, next active register: %rsi
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8, next active register: %rdi

		.section	.rodata, "a", @progbits
.L85:
		.ascii		"checking sum of the newly declared locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L85 puts ) "
# Expanded expression: " L85  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L85(%rip), %rax				# TOKEN: <Ident>, VALUE: 459, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "x 121 + z + 110 + w3 + 150 -u y1 + 170 - w2 + 100 - == "
# Expanded expression: "(@-40) *(-4) 121 + (@-56) *(-4) + 110 + (@-72) *(-1) + -150 (@-48) *(-1) + 170 - (@-64) *(-1) + 100 - == "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0x79, %rdi				# TOKEN: <NumInt>, VALUE: 121, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-56(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -56, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x6e, %rdi				# TOKEN: <NumInt>, VALUE: 110, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-72(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -72, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0xffffffffffffff6a, %rdi				# TOKEN: <NumInt>, VALUE: -150, next active register: %rsi
		leaq		-48(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -48, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		movq		$0xaa, %rsi				# TOKEN: <NumInt>, VALUE: 170, next active register: %rdx
		subq		%rsi, %rdi				# TOKEN: -, VALUE: 0, next active register: %rsi
		leaq		-64(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -64, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		movq		$0x64, %rsi				# TOKEN: <NumInt>, VALUE: 100, next active register: %rdx
		subq		%rsi, %rdi				# TOKEN: -, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L86					# TOKEN: <IfNot>, VALUE: 86, next active register: %rax

		.section	.rodata, "a", @progbits
.L88:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L88 puts ) "
# Expanded expression: " L88  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L88(%rip), %rax				# TOKEN: <Ident>, VALUE: 463, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L87
.L86:
# else
# {
# if
# RPN'ized expression: "x 150 -u != "
# Expanded expression: "(@-40) *(-4) -150 != "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0xffffffffffffff6a, %rdi				# TOKEN: <NumInt>, VALUE: -150, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0, next active register: %rdi
		je			.L89					# TOKEN: <IfNot>, VALUE: 89, next active register: %rax

		.section	.rodata, "a", @progbits
.L91:
		.ascii		"x changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L91 puts ) "
# Expanded expression: " L91  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L91(%rip), %rax				# TOKEN: <Ident>, VALUE: 467, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
.L89:
# if
# RPN'ized expression: "y1 121 != "
# Expanded expression: "(@-48) *(-1) 121 != "
# GenExpr
		leaq		-48(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -48, next active register: %rdi
		movb		(%rax), %al
		movsxb		%al, %rax				# TOKEN: *u, VALUE: -1, next active register: %rdi
		movq		$0x79, %rdi				# TOKEN: <NumInt>, VALUE: 121, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0, next active register: %rdi
		je			.L92					# TOKEN: <IfNot>, VALUE: 92, next active register: %rax

		.section	.rodata, "a", @progbits
.L94:
		.ascii		"y1 changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L94 puts ) "
# Expanded expression: " L94  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L94(%rip), %rax				# TOKEN: <Ident>, VALUE: 471, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
.L92:
# if
# RPN'ized expression: "z 170 -u != "
# Expanded expression: "(@-56) *(-4) -170 != "
# GenExpr
		leaq		-56(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -56, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0xffffffffffffff56, %rdi				# TOKEN: <NumInt>, VALUE: -170, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0, next active register: %rdi
		je			.L95					# TOKEN: <IfNot>, VALUE: 95, next active register: %rax

		.section	.rodata, "a", @progbits
.L97:
		.ascii		"z changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L97 puts ) "
# Expanded expression: " L97  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L97(%rip), %rax				# TOKEN: <Ident>, VALUE: 475, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
.L95:
# if
# RPN'ized expression: "w2 0 != "
# Expanded expression: "(@-64) *(-1) 0 != "
# GenExpr
		leaq		-64(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -64, next active register: %rdi
		movb		(%rax), %al
		movsxb		%al, %rax				# TOKEN: *u, VALUE: -1, next active register: %rdi
		xorq		%rdi, %rdi				# TOKEN: <NumInt>, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0, next active register: %rdi
		je			.L98					# TOKEN: <IfNot>, VALUE: 98, next active register: %rax

		.section	.rodata, "a", @progbits
.L100:
		.ascii		"w2 changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L100 puts ) "
# Expanded expression: " L100  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L100(%rip), %rax				# TOKEN: <Ident>, VALUE: 479, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
.L98:
# if
# RPN'ized expression: "w3 100 -u != "
# Expanded expression: "(@-72) *(-1) -100 != "
# GenExpr
		leaq		-72(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -72, next active register: %rdi
		movb		(%rax), %al
		movsxb		%al, %rax				# TOKEN: *u, VALUE: -1, next active register: %rdi
		movq		$0xffffffffffffff9c, %rdi				# TOKEN: <NumInt>, VALUE: -100, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0, next active register: %rdi
		je			.L101					# TOKEN: <IfNot>, VALUE: 101, next active register: %rax

		.section	.rodata, "a", @progbits
.L103:
		.ascii		"w3 changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L103 puts ) "
# Expanded expression: " L103  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L103(%rip), %rax				# TOKEN: <Ident>, VALUE: 484, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
.L101:
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
# }
.L87:

		.section	.rodata, "a", @progbits
.L104:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L104 puts ) "
# Expanded expression: " L104  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L104(%rip), %rax				# TOKEN: <Ident>, VALUE: 467, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(-4) 21 + (@-24) *(-4) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8, next active register: %rdi
		movl		(%rax), %eax
		movsxl		%eax, %rax				# TOKEN: *u, VALUE: -4, next active register: %rdi
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24, next active register: %rsi
		movl		(%rdi), %edi
		movsxl		%edi, %rdi				# TOKEN: *u, VALUE: -4, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50, next active register: %rsi
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32, next active register: %rdx
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L105					# TOKEN: <IfNot>, VALUE: 105, next active register: %rax

		.section	.rodata, "a", @progbits
.L107:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L107 puts ) "
# Expanded expression: " L107  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L107(%rip), %rax				# TOKEN: <Ident>, VALUE: 472, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L106
.L105:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L106:
# if
# RPN'ized expression: "( 5 -u , 1 , 3 test5 ) 1 + 0 == "
# Expanded expression: " -5  1  3  test5 ()24 1 + 0 == "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 24, next active register: %rax
		movq		$0xfffffffffffffffb, %rax				# TOKEN: <NumInt>, VALUE: -5, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		$0x1, %rax				# TOKEN: <NumInt>, VALUE: 1, next active register: %rdi
		movq		%rax, -16(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		$0x3, %rax				# TOKEN: <NumInt>, VALUE: 3, next active register: %rdi
		movq		%rax, -24(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		movq		-16(%rsp), %rsi
		movq		-24(%rsp), %rdx
		call		test5				# TOKEN: <Ident>, VALUE: 256, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 24, next active register: %rdi
		movq		$0x1, %rdi				# TOKEN: <NumInt>, VALUE: 1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		xorq		%rdi, %rdi				# TOKEN: <NumInt>, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L108					# TOKEN: <IfNot>, VALUE: 108, next active register: %rax

		.section	.rodata, "a", @progbits
.L110:
		.ascii		"test 5 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L110 puts ) "
# Expanded expression: " L110  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L110(%rip), %rax				# TOKEN: <Ident>, VALUE: 477, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L109
.L108:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L109:
# if
# RPN'ized expression: "1 y1 + ( 5 -u , 1 , 3 test5 ) + y1 == "
# Expanded expression: "1 (@-48) *(-1) +  -5  1  3  test5 ()24 + (@-48) *(-1) == "
# GenExpr
		movq		$0x1, %rax				# TOKEN: <NumInt>, VALUE: 1, next active register: %rdi
		leaq		-48(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -48, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		subq		$576, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 24, next active register: %rax
		movq		$0xfffffffffffffffb, %rax				# TOKEN: <NumInt>, VALUE: -5, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		$0x1, %rax				# TOKEN: <NumInt>, VALUE: 1, next active register: %rdi
		movq		%rax, -16(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		$0x3, %rax				# TOKEN: <NumInt>, VALUE: 3, next active register: %rdi
		movq		%rax, -24(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		movq		-16(%rsp), %rsi
		movq		-24(%rsp), %rdx
		call		test5				# TOKEN: <Ident>, VALUE: 256, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$576, %rsp				# TOKEN: ), VALUE: 24, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-48(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -48, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L111					# TOKEN: <IfNot>, VALUE: 111, next active register: %rax

		.section	.rodata, "a", @progbits
.L113:
		.ascii		"test 5' passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L113 puts ) "
# Expanded expression: " L113  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L113(%rip), %rax				# TOKEN: <Ident>, VALUE: 482, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L112
.L111:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L112:
# if
# RPN'ized expression: "y1 ( 5 -u , 1 , 3 test5 ) + y1 ( 5 -u , 1 , 3 test5 ) + == "
# Expanded expression: "(@-48) *(-1)  -5  1  3  test5 ()24 + (@-48) *(-1)  -5  1  3  test5 ()24 + == "
# GenExpr
		leaq		-48(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -48, next active register: %rdi
		movb		(%rax), %al
		movsxb		%al, %rax				# TOKEN: *u, VALUE: -1, next active register: %rdi
		subq		$576, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 24, next active register: %rax
		movq		$0xfffffffffffffffb, %rax				# TOKEN: <NumInt>, VALUE: -5, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		$0x1, %rax				# TOKEN: <NumInt>, VALUE: 1, next active register: %rdi
		movq		%rax, -16(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		$0x3, %rax				# TOKEN: <NumInt>, VALUE: 3, next active register: %rdi
		movq		%rax, -24(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		movq		-16(%rsp), %rsi
		movq		-24(%rsp), %rdx
		call		test5				# TOKEN: <Ident>, VALUE: 256, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$576, %rsp				# TOKEN: ), VALUE: 24, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		leaq		-48(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -48, next active register: %rsi
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1, next active register: %rsi
		subq		$576, %rsp # Protect locals
		pushq		%rax # Save register in use
		pushq		%rdi # Save register in use
				# TOKEN: (, VALUE: 24, next active register: %rax
		movq		$0xfffffffffffffffb, %rax				# TOKEN: <NumInt>, VALUE: -5, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		$0x1, %rax				# TOKEN: <NumInt>, VALUE: 1, next active register: %rdi
		movq		%rax, -16(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		$0x3, %rax				# TOKEN: <NumInt>, VALUE: 3, next active register: %rdi
		movq		%rax, -24(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		movq		-16(%rsp), %rsi
		movq		-24(%rsp), %rdx
		call		test5				# TOKEN: <Ident>, VALUE: 256, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rsi # Save result

		popq		%rdi # Restore register in use

		popq		%rax # Restore register in use

		addq		$576, %rsp				# TOKEN: ), VALUE: 24, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L114					# TOKEN: <IfNot>, VALUE: 114, next active register: %rax

		.section	.rodata, "a", @progbits
.L116:
		.ascii		"test 5'' passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L116 puts ) "
# Expanded expression: " L116  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L116(%rip), %rax				# TOKEN: <Ident>, VALUE: 487, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L115
.L114:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L115:
# if
# RPN'ized expression: "5050 ( 100 test6 ) + ( 100 test6 ) 5050 + == "
# Expanded expression: "5050  100  test6 ()8 +  100  test6 ()8 5050 + == "
# GenExpr
		movq		$0x13ba, %rax				# TOKEN: <NumInt>, VALUE: 5050, next active register: %rdi
		subq		$576, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 8, next active register: %rax
		movq		$0x64, %rax				# TOKEN: <NumInt>, VALUE: 100, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		test6				# TOKEN: <Ident>, VALUE: 272, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rsi
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0, next active register: %rdi
		subq		$576, %rsp # Protect locals
		pushq		%rax # Save register in use
				# TOKEN: (, VALUE: 8, next active register: %rax
		movq		$0x64, %rax				# TOKEN: <NumInt>, VALUE: 100, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		test6				# TOKEN: <Ident>, VALUE: 272, next active register: %rax
		/*** Returned ***/

		movq		%rax, %rdi # Save result

		popq		%rax # Restore register in use

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rsi
		movq		$0x13ba, %rsi				# TOKEN: <NumInt>, VALUE: 5050, next active register: %rdx
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0, next active register: %rsi
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0, next active register: %rdi
		jne			.L117					# TOKEN: <IfNot>, VALUE: 117, next active register: %rax

		.section	.rodata, "a", @progbits
.L119:
		.ascii		"test 6 (recursion) passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L119 puts ) "
# Expanded expression: " L119  puts ()8 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 8, next active register: %rax
		leaq		.L119(%rip), %rax				# TOKEN: <Ident>, VALUE: 492, next active register: %rdi
		movq		%rax, -8(%rsp)				# TOKEN: ,, VALUE: 0, next active register: %rax
		movq		-8(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 8, next active register: %rdi
		jmp			.L118
.L117:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
		subq		$576, %rsp # Protect locals
				# TOKEN: (, VALUE: 0, next active register: %rax
		call		abort				# TOKEN: <Ident>, VALUE: 123, next active register: %rax
		/*** Returned ***/

		addq		$576, %rsp				# TOKEN: ), VALUE: 0, next active register: %rdi
.L118:
# GenExpr
		xorq		%rax, %rax				# TOKEN: <NumInt>, VALUE: 0, next active register: %rdi
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0, next active register: %rdi
.L25:
		addq		$0x10, %rsp				# Free the space used by the homed parameters and locals
		addq		$16, %rsp				# TODO: Stack cookie
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# NYI: GenFin

# Syntax/declaration table/stack:
# Bytes used: 420/15360


# Macro table:
# Macro __SMALLER_C__ = `0x0100`
# Macro __SMALLER_C_SCHAR__ = ``
# Macro __SMALLER_C_UWCHAR__ = ``
# Macro __SMALLER_C_WCHAR16__ = ``
# Bytes used: 91/5120


# Identifier table:
# Ident 
# Ident __floatsisf
# Ident __floatunsisf
# Ident __fixsfsi
# Ident __fixunssfsi
# Ident __addsf3
# Ident __subsf3
# Ident __negsf2
# Ident __mulsf3
# Ident __divsf3
# Ident __lesf2
# Ident __gesf2
# Ident abort
# Ident puts
# Ident <something>
# Ident test0
# Ident test1
# Ident test2
# Ident test3_a
# Ident test3_c
# Ident test3_b
# Ident test3_d
# Ident test3
# Ident test4_a
# Ident test4_c
# Ident test4_b
# Ident test4_d
# Ident test4
# Ident test5
# Ident a
# Ident b
# Ident c
# Ident test6
# Ident main
# Ident argc
# Ident argv
# Bytes used: 297/5632

# Next label number: 120
# Compilation succeeded.
