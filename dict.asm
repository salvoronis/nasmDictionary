global find_word
extern string_equals
extern print_string
extern string_length

section .text

; rdi - a null terminated key string
; rsi - a pointer to the last word
; return value addres in rdi
find_word:
	.loop:
		test rsi, rsi
		jz .not_found
		push rsi
		push rdi
		add rsi, 8
		call string_equals
		pop rdi
		pop rsi
		test rax, rax
		jnz .found
		mov rsi, [rsi]
	jmp .loop

	.found:
		mov rdi, rsi
		add rdi, 8
		push rdi
		call string_length
		pop rdi
		add rdi, rax
		inc rdi
		;call print_string
		ret
	.not_found:
		mov rdi, 0
		ret