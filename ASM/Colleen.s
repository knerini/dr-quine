; Is Rick Deckard a replicant ?
section .note.GNU-stack
section .data
s db "; Is Rick Deckard a replicant ?*section .note.GNU-stack*section .data*s db #^#,0*tmp_c db 0*section .text*global main*printer:*mov r12, rdi*.loop:*mov al,byte [r12]*cmp al,0*je .end*cmp al,byte 42*je .newline*cmp al,byte 35*je .quote*cmp al,byte 94*je .string*lea rsi,[r12]*jmp .print*.newline:*mov [rel tmp_c],byte 10*lea rsi,[rel tmp_c]*jmp .print*.quote:*mov [rel tmp_c],byte 34*lea rsi,[rel tmp_c]*jmp .print*.string:*mov rax,1*lea rsi,[rel s]*mov rdi,1*mov rdx,678*syscall*jmp .increment*.print:*mov rax,1*mov rdi,1*mov rdx,1*syscall*.increment:*add r12,1*jmp .loop*.end:*ret*main:*; Rachael is a Nexus-6 replicant*lea rdi,[rel s]*call printer*mov rax,60*mov rdi,0*syscall*",0
tmp_c db 0
section .text
global main
printer:
mov r12, rdi
.loop:
mov al,byte [r12]
cmp al,0
je .end
cmp al,byte 42
je .newline
cmp al,byte 35
je .quote
cmp al,byte 94
je .string
lea rsi,[r12]
jmp .print
.newline:
mov [rel tmp_c],byte 10
lea rsi,[rel tmp_c]
jmp .print
.quote:
mov [rel tmp_c],byte 34
lea rsi,[rel tmp_c]
jmp .print
.string:
mov rax,1
lea rsi,[rel s]
mov rdi,1
mov rdx,678
syscall
jmp .increment
.print:
mov rax,1
mov rdi,1
mov rdx,1
syscall
.increment:
add r12,1
jmp .loop
.end:
ret
main:
; Rachael is a Nexus-6 replicant
lea rdi,[rel s]
call printer
mov rax,60
mov rdi,0
syscall
