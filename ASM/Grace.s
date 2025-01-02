; We are not in Blade Runner
section .note.GNU-stack
%macro WRITE_FD 2
mov rax,1
mov rdi,%1
mov rdx,%2
syscall
%endmacro
%macro LOAD_CHAR 1
mov [rel tmp_c],byte %1
lea rsi,[rel tmp_c]
jmp .print
%endmacro
%macro FT 0
global start
start:
mov rax,85
lea rdi,[rel f_name]
mov rsi,00400
syscall
mov r8,rax
lea r12,[rel s]
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
LOAD_CHAR 10
.quote:
LOAD_CHAR 34
.string:
lea rsi,[rel s]
WRITE_FD r8,741
jmp .increment
.print:
WRITE_FD r8,1
.increment:
add r12,1
jmp .loop
.end:
mov rax,60
mov rdi,0
syscall
%endmacro
section .data
tmp_c db 0
f_name db "Grace_kid.s",0
s db "; We are not in Blade Runner*section .note.GNU-stack*%macro WRITE_FD 2*mov rax,1*mov rdi,%1*mov rdx,%2*syscall*%endmacro*%macro LOAD_CHAR 1*mov [rel tmp_c],byte %1*lea rsi,[rel tmp_c]*jmp .print*%endmacro*%macro FT 0*global start*start:*mov rax,85*lea rdi,[rel f_name]*mov rsi,00400*syscall*mov r8,rax*lea r12,[rel s]*.loop:*mov al,byte [r12]*cmp al,0*je .end*cmp al,byte 42*je .newline*cmp al,byte 35*je .quote*cmp al,byte 94*je .string*lea rsi,[r12]*jmp .print*.newline:*LOAD_CHAR 10*.quote:*LOAD_CHAR 34*.string:*lea rsi,[rel s]*WRITE_FD r8,741*jmp .increment*.print:*WRITE_FD r8,1*.increment:*add r12,1*jmp .loop*.end:*mov rax,60*mov rdi,0*syscall*%endmacro*section .data*tmp_c db 0*f_name db #Grace_kid.s#,0*s db #^#,0*section .text*FT*",0
section .text
FT
