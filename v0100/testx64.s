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
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     a : (@-8) : int
# RPN'ized expression: "a 12 -u = "
# Expanded expression: "(@-8) -12 =(8) "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		$0xfffffffffffffff4, %rdi				# TOKEN: <NumInt>, VALUE: -12
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     c : (@-16) : char
# RPN'ized expression: "c 1 = "
# Expanded expression: "(@-16) 1 =(-1) "
# GenExpr
		leaq		-16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -16
		movq		$0x1, %rdi				# TOKEN: <NumInt>, VALUE: 1
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     p : (@-24) : * void
# RPN'ized expression: "p 0 = "
# Expanded expression: "(@-24) 0 =(8) "
# GenExpr
		leaq		-24(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -24
		xorq		%rdi, %rdi				# TOKEN: <NumInt>, VALUE: 0
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     b : (@-32) : char
# RPN'ized expression: "b 2 = "
# Expanded expression: "(@-32) 2 =(-1) "
# GenExpr
		leaq		-32(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -32
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     cp : (@-40) : * char
# RPN'ized expression: "cp c &u = "
# Expanded expression: "(@-40) (@-16) =(8) "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40
		leaq		-16(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -16
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# RPN'ized expression: "cp *u 42 = "
# Expanded expression: "(@-40) *(8) 42 =(-1) "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0x2a, %rdi				# TOKEN: <NumInt>, VALUE: 42
		movb		%dil, (%rax)				# TOKEN: =, VALUE: -1
.L1:
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
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     a : (@-8) : int
# RPN'ized expression: "a 12 -u = "
# Expanded expression: "(@-8) -12 =(8) "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		$0xfffffffffffffff4, %rdi				# TOKEN: <NumInt>, VALUE: -12
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     c : (@-16) : char
# RPN'ized expression: "c 12 = "
# Expanded expression: "(@-16) 12 =(-1) "
# GenExpr
		leaq		-16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -16
		movq		$0xc, %rdi				# TOKEN: <NumInt>, VALUE: 12
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# if
# RPN'ized expression: "a c + 0 == "
# Expanded expression: "(@-8) *(8) (@-16) *(-1) + 0 == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		leaq		-16(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -16
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		xorq		%rdi, %rdi				# TOKEN: <NumInt>, VALUE: 0
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L5					# TOKEN: <IfNot>, VALUE: 5
# {
# return
# RPN'ized expression: "1 "
# Expanded expression: "1 "
# Expression value: 1
# GenExpr
		movq		$0x1, %rax				# TOKEN: <NumInt>, VALUE: 1
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
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
		movq		$0x3, %rax				# TOKEN: <NumInt>, VALUE: 3
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
		jmp			.L3
# }
.L6:
.L3:
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
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     a : (@-8) : int
# RPN'ized expression: "a 12 -u = "
# Expanded expression: "(@-8) -12 =(8) "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		$0xfffffffffffffff4, %rdi				# TOKEN: <NumInt>, VALUE: -12
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     c : (@-16) : char
# RPN'ized expression: "c 12 = "
# Expanded expression: "(@-16) 12 =(-1) "
# GenExpr
		leaq		-16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -16
		movq		$0xc, %rdi				# TOKEN: <NumInt>, VALUE: 12
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     b : (@-24) : char
# RPN'ized expression: "b 31 -u = "
# Expanded expression: "(@-24) -31 =(-1) "
# GenExpr
		leaq		-24(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -24
		movq		$0xffffffffffffffe1, %rdi				# TOKEN: <NumInt>, VALUE: -31
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     d : (@-32) : int
# RPN'ized expression: "d 33 = "
# Expanded expression: "(@-32) 33 =(8) "
# GenExpr
		leaq		-32(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -32
		movq		$0x21, %rdi				# TOKEN: <NumInt>, VALUE: 33
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# if
# RPN'ized expression: "a b + c + d + 2 == "
# Expanded expression: "(@-8) *(8) (@-24) *(-1) + (@-16) *(-1) + (@-32) *(8) + 2 == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-16(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -16
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-32(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -32
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L9					# TOKEN: <IfNot>, VALUE: 9
# {
# return
# RPN'ized expression: "2 "
# Expanded expression: "2 "
# Expression value: 2
# GenExpr
		movq		$0x2, %rax				# TOKEN: <NumInt>, VALUE: 2
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
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
		movq		$0x5, %rax				# TOKEN: <NumInt>, VALUE: 5
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
		jmp			.L7
# }
.L10:
.L7:
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
		.quad		-12

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
		.quad		33

# glb test3 : () char
		.text
		.code64
		.global		test3
		.type		test3, %function
test3:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# if
# RPN'ized expression: "test3_a test3_b + test3_c + test3_d + 2 == "
# Expanded expression: "test3_a *(8) test3_b *(-1) + test3_c *(-1) + test3_d *(8) + 2 == "
# GenExpr
		leaq		test3_a(%rip), %rax				# TOKEN: <Ident>, VALUE: 170
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		leaq		test3_b(%rip), %rdi				# TOKEN: <Ident>, VALUE: 188
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		test3_c(%rip), %rdi				# TOKEN: <Ident>, VALUE: 179
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		test3_d(%rip), %rdi				# TOKEN: <Ident>, VALUE: 197
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L13					# TOKEN: <IfNot>, VALUE: 13
# {
# return
# RPN'ized expression: "4 "
# Expanded expression: "4 "
# Expression value: 4
# GenExpr
		movq		$0x4, %rax				# TOKEN: <NumInt>, VALUE: 4
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
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
		movq		$0x7, %rax				# TOKEN: <NumInt>, VALUE: 7
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
		jmp			.L11
# }
.L14:
.L11:
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
		.skip		8

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
		.skip		8

# glb test4 : () char
		.text
		.code64
		.global		test4
		.type		test4, %function
test4:
		.cfi_startproc
		pushq		%rsp					# Save rsp
		pushq		%rbp					# Save rbp
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# RPN'ized expression: "test4_a 12 -u = "
# Expanded expression: "test4_a -12 =(8) "
# GenExpr
		leaq		test4_a(%rip), %rax				# TOKEN: <Ident>, VALUE: 213
		movq		$0xfffffffffffffff4, %rdi				# TOKEN: <NumInt>, VALUE: -12
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# RPN'ized expression: "test4_c 12 = "
# Expanded expression: "test4_c 12 =(-1) "
# GenExpr
		leaq		test4_c(%rip), %rax				# TOKEN: <Ident>, VALUE: 222
		movq		$0xc, %rdi				# TOKEN: <NumInt>, VALUE: 12
		movb		%dil, (%rax)				# TOKEN: =, VALUE: -1
# RPN'ized expression: "test4_b 31 -u = "
# Expanded expression: "test4_b -31 =(-1) "
# GenExpr
		leaq		test4_b(%rip), %rax				# TOKEN: <Ident>, VALUE: 231
		movq		$0xffffffffffffffe1, %rdi				# TOKEN: <NumInt>, VALUE: -31
		movb		%dil, (%rax)				# TOKEN: =, VALUE: -1
# RPN'ized expression: "test4_d 33 = "
# Expanded expression: "test4_d 33 =(8) "
# GenExpr
		leaq		test4_d(%rip), %rax				# TOKEN: <Ident>, VALUE: 240
		movq		$0x21, %rdi				# TOKEN: <NumInt>, VALUE: 33
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# if
# RPN'ized expression: "test4_a test4_b + test4_c + test4_d + 2 == "
# Expanded expression: "test4_a *(8) test4_b *(-1) + test4_c *(-1) + test4_d *(8) + 2 == "
# GenExpr
		leaq		test4_a(%rip), %rax				# TOKEN: <Ident>, VALUE: 213
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		leaq		test4_b(%rip), %rdi				# TOKEN: <Ident>, VALUE: 231
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		test4_c(%rip), %rdi				# TOKEN: <Ident>, VALUE: 222
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		test4_d(%rip), %rdi				# TOKEN: <Ident>, VALUE: 240
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L17					# TOKEN: <IfNot>, VALUE: 17
# {
# return
# RPN'ized expression: "6 "
# Expanded expression: "6 "
# Expression value: 6
# GenExpr
		movq		$0x6, %rax				# TOKEN: <NumInt>, VALUE: 6
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
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
		movq		$0x9, %rax				# TOKEN: <NumInt>, VALUE: 9
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
		jmp			.L15
# }
.L18:
.L15:
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
		movq		%rsp, %rbp				# Set the base pointer after the last homed parameter
# loc     argc : (@16) : int
# loc     argv : (@24) : * * char
# loc     a : (@-8) : int
# RPN'ized expression: "a 50 = "
# Expanded expression: "(@-8) 50 =(8) "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     c1 : (@-16) : char
# RPN'ized expression: "c1 21 = "
# Expanded expression: "(@-16) 21 =(-1) "
# GenExpr
		leaq		-16(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -16
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     b : (@-24) : int
# RPN'ized expression: "b 70 = "
# Expanded expression: "(@-24) 70 =(8) "
# GenExpr
		leaq		-24(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -24
		movq		$0x46, %rdi				# TOKEN: <NumInt>, VALUE: 70
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     c2 : (@-32) : char
# RPN'ized expression: "c2 31 = "
# Expanded expression: "(@-32) 31 =(-1) "
# GenExpr
		leaq		-32(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -32
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8

		.section	.rodata, "a", @progbits
.L21:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L21 puts ) "
# Expanded expression: " L21  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L21(%rip), %rax				# TOKEN: <Ident>, VALUE: 292
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(8) 21 + (@-24) *(8) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L22					# TOKEN: <IfNot>, VALUE: 22

		.section	.rodata, "a", @progbits
.L24:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L24 puts ) "
# Expanded expression: " L24  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L24(%rip), %rax				# TOKEN: <Ident>, VALUE: 296
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L23
.L22:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L23:

		.section	.rodata, "a", @progbits
.L25:
		.ascii		"Running test 0"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L25 puts ) "
# Expanded expression: " L25  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L25(%rip), %rax				# TOKEN: <Ident>, VALUE: 300
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
# RPN'ized expression: "( test0 ) "
# Expanded expression: " test0 ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		test0
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 149
		/*** Returned ***/
				# TOKEN: ), VALUE: 0

		.section	.rodata, "a", @progbits
.L26:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L26 puts ) "
# Expanded expression: " L26  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L26(%rip), %rax				# TOKEN: <Ident>, VALUE: 304
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(8) 21 + (@-24) *(8) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L27					# TOKEN: <IfNot>, VALUE: 27

		.section	.rodata, "a", @progbits
.L29:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L29 puts ) "
# Expanded expression: " L29  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L29(%rip), %rax				# TOKEN: <Ident>, VALUE: 308
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L28
.L27:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L28:
# if
# RPN'ized expression: "( test1 ) 1 == "
# Expanded expression: " test1 ()0 1 == "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		test1
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 156
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
		movq		$0x1, %rdi				# TOKEN: <NumInt>, VALUE: 1
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L30					# TOKEN: <IfNot>, VALUE: 30

		.section	.rodata, "a", @progbits
.L32:
		.ascii		"test 1 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L32 puts ) "
# Expanded expression: " L32  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L32(%rip), %rax				# TOKEN: <Ident>, VALUE: 312
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L31
.L30:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L31:

		.section	.rodata, "a", @progbits
.L33:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L33 puts ) "
# Expanded expression: " L33  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L33(%rip), %rax				# TOKEN: <Ident>, VALUE: 316
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(8) 21 + (@-24) *(8) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L34					# TOKEN: <IfNot>, VALUE: 34

		.section	.rodata, "a", @progbits
.L36:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L36 puts ) "
# Expanded expression: " L36  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L36(%rip), %rax				# TOKEN: <Ident>, VALUE: 320
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L35
.L34:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L35:
# if
# RPN'ized expression: "( test2 ) 2 == "
# Expanded expression: " test2 ()0 2 == "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		test2
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 163
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L37					# TOKEN: <IfNot>, VALUE: 37

		.section	.rodata, "a", @progbits
.L39:
		.ascii		"test 2 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L39 puts ) "
# Expanded expression: " L39  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L39(%rip), %rax				# TOKEN: <Ident>, VALUE: 324
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L38
.L37:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L38:

		.section	.rodata, "a", @progbits
.L40:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L40 puts ) "
# Expanded expression: " L40  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L40(%rip), %rax				# TOKEN: <Ident>, VALUE: 328
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(8) 21 + (@-24) *(8) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L41					# TOKEN: <IfNot>, VALUE: 41

		.section	.rodata, "a", @progbits
.L43:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L43 puts ) "
# Expanded expression: " L43  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L43(%rip), %rax				# TOKEN: <Ident>, VALUE: 332
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L42
.L41:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L42:
# if
# RPN'ized expression: "( test3 ) 4 == "
# Expanded expression: " test3 ()0 4 == "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		test3
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 206
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
		movq		$0x4, %rdi				# TOKEN: <NumInt>, VALUE: 4
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L44					# TOKEN: <IfNot>, VALUE: 44

		.section	.rodata, "a", @progbits
.L46:
		.ascii		"test 3 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L46 puts ) "
# Expanded expression: " L46  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L46(%rip), %rax				# TOKEN: <Ident>, VALUE: 336
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L45
.L44:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L45:

		.section	.rodata, "a", @progbits
.L47:
		.ascii		"checking sum of the locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L47 puts ) "
# Expanded expression: " L47  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L47(%rip), %rax				# TOKEN: <Ident>, VALUE: 340
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
# if
# RPN'ized expression: "a 21 + b + 31 + 50 c1 + 70 + c2 + == "
# Expanded expression: "(@-8) *(8) 21 + (@-24) *(8) + 31 + 50 (@-16) *(-1) + 70 + (@-32) *(-1) + == "
# GenExpr
		leaq		-8(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -8
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0x15, %rdi				# TOKEN: <NumInt>, VALUE: 21
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-24(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -24
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x1f, %rdi				# TOKEN: <NumInt>, VALUE: 31
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x32, %rdi				# TOKEN: <NumInt>, VALUE: 50
		leaq		-16(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -16
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		movq		$0x46, %rsi				# TOKEN: <NumInt>, VALUE: 70
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		leaq		-32(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -32
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L48					# TOKEN: <IfNot>, VALUE: 48

		.section	.rodata, "a", @progbits
.L50:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L50 puts ) "
# Expanded expression: " L50  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L50(%rip), %rax				# TOKEN: <Ident>, VALUE: 344
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L49
.L48:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L49:
# if
# RPN'ized expression: "( test4 ) 6 == "
# Expanded expression: " test4 ()0 6 == "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		test4
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 249
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
		movq		$0x6, %rdi				# TOKEN: <NumInt>, VALUE: 6
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L51					# TOKEN: <IfNot>, VALUE: 51

		.section	.rodata, "a", @progbits
.L53:
		.ascii		"test 4 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L53 puts ) "
# Expanded expression: " L53  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L53(%rip), %rax				# TOKEN: <Ident>, VALUE: 348
		movq		%rax, -256(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-256(%rsp), %rdi
		subq		$256, %rsp # Protect locals
		call		puts
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L52
.L51:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$256, %rsp # Protect locals
		call		abort
		addq		$256, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
.L52:
# loc     x : (@-40) : int
# RPN'ized expression: "x 150 -u = "
# Expanded expression: "(@-40) -150 =(8) "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40
		movq		$0xffffffffffffff6a, %rdi				# TOKEN: <NumInt>, VALUE: -150
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     y1 : (@-48) : char
# RPN'ized expression: "y1 121 = "
# Expanded expression: "(@-48) 121 =(-1) "
# GenExpr
		leaq		-48(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -48
		movq		$0x79, %rdi				# TOKEN: <NumInt>, VALUE: 121
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     z : (@-56) : int
# RPN'ized expression: "z 170 -u = "
# Expanded expression: "(@-56) -170 =(8) "
# GenExpr
		leaq		-56(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -56
		movq		$0xffffffffffffff56, %rdi				# TOKEN: <NumInt>, VALUE: -170
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     w2 : (@-64) : char
# RPN'ized expression: "w2 110 = "
# Expanded expression: "(@-64) 110 =(-1) "
# GenExpr
		leaq		-64(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -64
		movq		$0x6e, %rdi				# TOKEN: <NumInt>, VALUE: 110
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8
# loc     w3 : (@-72) : char
# RPN'ized expression: "w3 100 -u = "
# Expanded expression: "(@-72) -100 =(-1) "
# GenExpr
		leaq		-72(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -72
		movq		$0xffffffffffffff9c, %rdi				# TOKEN: <NumInt>, VALUE: -100
		movq		%rdi, (%rax)				# TOKEN: =, VALUE: 8

		.section	.rodata, "a", @progbits
.L54:
		.ascii		"checking sum of the newly declared locals.."
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L54 puts ) "
# Expanded expression: " L54  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L54(%rip), %rax				# TOKEN: <Ident>, VALUE: 370
		movq		%rax, -576(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-576(%rsp), %rdi
		subq		$576, %rsp # Protect locals
		call		puts
		addq		$576, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
# if
# RPN'ized expression: "x 121 + z + 110 + w3 + 150 -u y1 + 170 - w2 + 100 - == "
# Expanded expression: "(@-40) *(8) 121 + (@-56) *(8) + 110 + (@-72) *(-1) + -150 (@-48) *(-1) + 170 - (@-64) *(-1) + 100 - == "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0x79, %rdi				# TOKEN: <NumInt>, VALUE: 121
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-56(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -56
		movq		(%rdi), %rdi				# TOKEN: *u, VALUE: 8
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0x6e, %rdi				# TOKEN: <NumInt>, VALUE: 110
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		leaq		-72(%rbp), %rdi				# TOKEN: <LocalOfs>, VALUE: -72
		movb		(%rdi), %dil
		movsxb		%dil, %rdi				# TOKEN: *u, VALUE: -1
		addq		%rdi, %rax				# TOKEN: +, VALUE: 0
		movq		$0xffffffffffffff6a, %rdi				# TOKEN: <NumInt>, VALUE: -150
		leaq		-48(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -48
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		movq		$0xaa, %rsi				# TOKEN: <NumInt>, VALUE: 170
		subq		%rsi, %rdi				# TOKEN: -, VALUE: 0
		leaq		-64(%rbp), %rsi				# TOKEN: <LocalOfs>, VALUE: -64
		movb		(%rsi), %sil
		movsxb		%sil, %rsi				# TOKEN: *u, VALUE: -1
		addq		%rsi, %rdi				# TOKEN: +, VALUE: 0
		movq		$0x64, %rsi				# TOKEN: <NumInt>, VALUE: 100
		subq		%rsi, %rdi				# TOKEN: -, VALUE: 0
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L55					# TOKEN: <IfNot>, VALUE: 55

		.section	.rodata, "a", @progbits
.L57:
		.ascii		"ok"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L57 puts ) "
# Expanded expression: " L57  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L57(%rip), %rax				# TOKEN: <Ident>, VALUE: 374
		movq		%rax, -576(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-576(%rsp), %rdi
		subq		$576, %rsp # Protect locals
		call		puts
		addq		$576, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
		jmp			.L56
.L55:
# else
# {
# if
# RPN'ized expression: "x 150 -u != "
# Expanded expression: "(@-40) *(8) -150 != "
# GenExpr
		leaq		-40(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -40
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0xffffffffffffff6a, %rdi				# TOKEN: <NumInt>, VALUE: -150
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0
		je			.L58					# TOKEN: <IfNot>, VALUE: 58

		.section	.rodata, "a", @progbits
.L60:
		.ascii		"x changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L60 puts ) "
# Expanded expression: " L60  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L60(%rip), %rax				# TOKEN: <Ident>, VALUE: 378
		movq		%rax, -576(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-576(%rsp), %rdi
		subq		$576, %rsp # Protect locals
		call		puts
		addq		$576, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
.L58:
# if
# RPN'ized expression: "y1 121 != "
# Expanded expression: "(@-48) *(-1) 121 != "
# GenExpr
		leaq		-48(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -48
		movb		(%rax), %al
		movsxb		%al, %rax				# TOKEN: *u, VALUE: -1
		movq		$0x79, %rdi				# TOKEN: <NumInt>, VALUE: 121
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0
		je			.L61					# TOKEN: <IfNot>, VALUE: 61

		.section	.rodata, "a", @progbits
.L63:
		.ascii		"y1 changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L63 puts ) "
# Expanded expression: " L63  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L63(%rip), %rax				# TOKEN: <Ident>, VALUE: 382
		movq		%rax, -576(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-576(%rsp), %rdi
		subq		$576, %rsp # Protect locals
		call		puts
		addq		$576, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
.L61:
# if
# RPN'ized expression: "z 170 -u != "
# Expanded expression: "(@-56) *(8) -170 != "
# GenExpr
		leaq		-56(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -56
		movq		(%rax), %rax				# TOKEN: *u, VALUE: 8
		movq		$0xffffffffffffff56, %rdi				# TOKEN: <NumInt>, VALUE: -170
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0
		je			.L64					# TOKEN: <IfNot>, VALUE: 64

		.section	.rodata, "a", @progbits
.L66:
		.ascii		"z changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L66 puts ) "
# Expanded expression: " L66  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L66(%rip), %rax				# TOKEN: <Ident>, VALUE: 386
		movq		%rax, -576(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-576(%rsp), %rdi
		subq		$576, %rsp # Protect locals
		call		puts
		addq		$576, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
.L64:
# if
# RPN'ized expression: "w2 0 != "
# Expanded expression: "(@-64) *(-1) 0 != "
# GenExpr
		leaq		-64(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -64
		movb		(%rax), %al
		movsxb		%al, %rax				# TOKEN: *u, VALUE: -1
		xorq		%rdi, %rdi				# TOKEN: <NumInt>, VALUE: 0
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0
		je			.L67					# TOKEN: <IfNot>, VALUE: 67

		.section	.rodata, "a", @progbits
.L69:
		.ascii		"w2 changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L69 puts ) "
# Expanded expression: " L69  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L69(%rip), %rax				# TOKEN: <Ident>, VALUE: 390
		movq		%rax, -576(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-576(%rsp), %rdi
		subq		$576, %rsp # Protect locals
		call		puts
		addq		$576, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
.L67:
# if
# RPN'ized expression: "w3 100 -u != "
# Expanded expression: "(@-72) *(-1) -100 != "
# GenExpr
		leaq		-72(%rbp), %rax				# TOKEN: <LocalOfs>, VALUE: -72
		movb		(%rax), %al
		movsxb		%al, %rax				# TOKEN: *u, VALUE: -1
		movq		$0xffffffffffffff9c, %rdi				# TOKEN: <NumInt>, VALUE: -100
		cmpq		%rdi, %rax				# TOKEN: !=, VALUE: 0
		je			.L70					# TOKEN: <IfNot>, VALUE: 70

		.section	.rodata, "a", @progbits
.L72:
		.ascii		"w3 changed!"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L72 puts ) "
# Expanded expression: " L72  puts ()8 "
# GenExpr
				# TOKEN: (, VALUE: 8
		leaq		.L72(%rip), %rax				# TOKEN: <Ident>, VALUE: 394
		movq		%rax, -576(%rsp)				# TOKEN: ,, VALUE: 0
		movq		-576(%rsp), %rdi
		subq		$576, %rsp # Protect locals
		call		puts
		addq		$576, %rsp				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
				# TOKEN: ), VALUE: 8
.L70:
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		subq		$576, %rsp # Protect locals
		call		abort
		addq		$576, %rsp				# TOKEN: <Ident>, VALUE: 123
		/*** Returned ***/
				# TOKEN: ), VALUE: 0
# }
.L56:
# GenExpr
		xorq		%rax, %rax				# TOKEN: <NumInt>, VALUE: 0
		/*** Result in rax ***/				# TOKEN: return, VALUE: 0
.L19:
		addq		$0x10, %rsp				# Free the space used by the homed parameters and locals
		popq		%rbp					# Restore rbp
		popq		%rsp					# Restore rsp
		ret									# Pop the return address from the stack, and return to the caller
		.cfi_endproc

# NYI: GenFin

# Syntax/declaration table/stack:
# Bytes used: 340/15360


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
# Ident main
# Ident argc
# Ident argv
# Bytes used: 274/5632

# Next label number: 73
# Compilation succeeded.
