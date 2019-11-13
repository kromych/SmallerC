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
# RPN'ized expression: "( test0 ) "
# Expanded expression: " test0 ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		test0				# TOKEN: <Ident>, VALUE: 149
				# TOKEN: ), VALUE: 0
# if
# RPN'ized expression: "( test1 ) 1 == "
# Expanded expression: " test1 ()0 1 == "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		test1				# TOKEN: <Ident>, VALUE: 156
				# TOKEN: ), VALUE: 0
		movq		$0x1, %rdi				# TOKEN: <NumInt>, VALUE: 1
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L21					# TOKEN: <IfNot>, VALUE: 21

		.section	.rodata, "a", @progbits
.L23:
		.ascii		"test 1 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L23 puts ) "
# Expanded expression: " L23  puts ()8 "
# GenExpr
		/*** 8 args ***/
		subq		$64, %rsp				# TOKEN: (, VALUE: 8
		leaq		.L23(%rip), %rax				# TOKEN: <Ident>, VALUE: 278
		movq		%rax, 0(%rsp)				# TOKEN: ,, VALUE: 0
		movq		0(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
		addq		$64, %rsp				# TOKEN: ), VALUE: 8
		jmp			.L22
.L21:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		abort				# TOKEN: <Ident>, VALUE: 123
				# TOKEN: ), VALUE: 0
.L22:
# if
# RPN'ized expression: "( test2 ) 2 == "
# Expanded expression: " test2 ()0 2 == "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		test2				# TOKEN: <Ident>, VALUE: 163
				# TOKEN: ), VALUE: 0
		movq		$0x2, %rdi				# TOKEN: <NumInt>, VALUE: 2
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L24					# TOKEN: <IfNot>, VALUE: 24

		.section	.rodata, "a", @progbits
.L26:
		.ascii		"test 2 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L26 puts ) "
# Expanded expression: " L26  puts ()8 "
# GenExpr
		/*** 8 args ***/
		subq		$64, %rsp				# TOKEN: (, VALUE: 8
		leaq		.L26(%rip), %rax				# TOKEN: <Ident>, VALUE: 282
		movq		%rax, 0(%rsp)				# TOKEN: ,, VALUE: 0
		movq		0(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
		addq		$64, %rsp				# TOKEN: ), VALUE: 8
		jmp			.L25
.L24:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		abort				# TOKEN: <Ident>, VALUE: 123
				# TOKEN: ), VALUE: 0
.L25:
# if
# RPN'ized expression: "( test3 ) 4 == "
# Expanded expression: " test3 ()0 4 == "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		test3				# TOKEN: <Ident>, VALUE: 206
				# TOKEN: ), VALUE: 0
		movq		$0x4, %rdi				# TOKEN: <NumInt>, VALUE: 4
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L27					# TOKEN: <IfNot>, VALUE: 27

		.section	.rodata, "a", @progbits
.L29:
		.ascii		"test 3 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L29 puts ) "
# Expanded expression: " L29  puts ()8 "
# GenExpr
		/*** 8 args ***/
		subq		$64, %rsp				# TOKEN: (, VALUE: 8
		leaq		.L29(%rip), %rax				# TOKEN: <Ident>, VALUE: 286
		movq		%rax, 0(%rsp)				# TOKEN: ,, VALUE: 0
		movq		0(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
		addq		$64, %rsp				# TOKEN: ), VALUE: 8
		jmp			.L28
.L27:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		abort				# TOKEN: <Ident>, VALUE: 123
				# TOKEN: ), VALUE: 0
.L28:
# if
# RPN'ized expression: "( test4 ) 6 == "
# Expanded expression: " test4 ()0 6 == "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		test4				# TOKEN: <Ident>, VALUE: 249
				# TOKEN: ), VALUE: 0
		movq		$0x6, %rdi				# TOKEN: <NumInt>, VALUE: 6
		cmpq		%rdi, %rax				# TOKEN: ==, VALUE: 0
		jne			.L30					# TOKEN: <IfNot>, VALUE: 30

		.section	.rodata, "a", @progbits
.L32:
		.ascii		"test 4 passed"
		.skip		1

		.text
		.code64
# RPN'ized expression: "( L32 puts ) "
# Expanded expression: " L32  puts ()8 "
# GenExpr
		/*** 8 args ***/
		subq		$64, %rsp				# TOKEN: (, VALUE: 8
		leaq		.L32(%rip), %rax				# TOKEN: <Ident>, VALUE: 290
		movq		%rax, 0(%rsp)				# TOKEN: ,, VALUE: 0
		movq		0(%rsp), %rdi
		call		puts				# TOKEN: <Ident>, VALUE: 130
		/*** Returned ***/
		addq		$64, %rsp				# TOKEN: ), VALUE: 8
		jmp			.L31
.L30:
# else
# RPN'ized expression: "( abort ) "
# Expanded expression: " abort ()0 "
# GenExpr
				# TOKEN: (, VALUE: 0
		call		abort				# TOKEN: <Ident>, VALUE: 123
				# TOKEN: ), VALUE: 0
.L31:
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

# Next label number: 33
# Compilation succeeded.
