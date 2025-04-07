section .note.GNU-stack
%macro FIND_REPLACE_X 1
lea rdi,[rel %1]
xor r8,r8
%%find_X:
cmp [rdi+r8],byte 88
je %%replace
inc r8
jmp %%find_X
%%replace:
mov byte [rdi+r8], r15b
%endmacro
%macro WRITE_FD 2
mov rax,1
mov rdi,%1
mov rdx,%2
syscall
%endmacro
%macro LOAD_CHAR 1
mov [rel tmp_c],byte %1
lea rsi, [rel tmp_c]
jmp .print
%endmacro
%macro EXEC 2
xor rax,rax
mov rax,57
syscall
test rax,rax
jz %%child
mov rdi,1
mov rsi,rax
xor rdx,rdx
mov r10,4
xor rax,rax
mov rax,247
syscall
jmp %%next_process
%%child:
lea rdi,[rel %1]
lea rsi,[rel %2]
xor rdx,rdx
mov rax,59
syscall
%%next_process:
%endmacro
section .data
num dw 5
negative db "-1",0
exec db "Sully_X.s",0
prog db "Sully_X",0
obj db "Objsully_X.o",0
ex_prog db "./Sully_X",0
nasm db "/usr/bin/nasm",0
nasm_opt db "-f",0
nasm_fmt db "elf64",0
gcc db "/usr/bin/gcc",0
ld db "-B/usr/bin",0
gcc_opt db "-o",0
cmd1 dq nasm,nasm_opt,nasm_fmt,gcc_opt,obj,exec,0
cmd2 dq gcc,ld,gcc_opt,prog,obj,0
cmd3 dq ex_prog,0
s db "section .note.GNU-stack*%macro FIND_REPLACE_X 1*lea rdi,[rel %1]*xor r8,r8*%%find_X:*cmp [rdi+r8],byte 88*je %%replace*inc r8*jmp %%find_X*%%replace:*mov byte [rdi+r8], r15b*%endmacro*%macro WRITE_FD 2*mov rax,1*mov rdi,%1*mov rdx,%2*syscall*%endmacro*%macro LOAD_CHAR 1*mov [rel tmp_c],byte %1*lea rsi, [rel tmp_c]*jmp .print*%endmacro*%macro EXEC 2*xor rax,rax*mov rax,57*syscall*test rax,rax*jz %%child*mov rdi,1*mov rsi,rax*xor rdx,rdx*mov r10,4*xor rax,rax*mov rax,247*syscall*jmp %%next_process*%%child:*lea rdi,[rel %1]*lea rsi,[rel %2]*xor rdx,rdx*mov rax,59*syscall*%%next_process:*%endmacro*section .data*num dw @*negative db #-1#,0*exec db #Sully_X.s#,0*prog db #Sully_X#,0*obj db #Objsully_X.o#,0*ex_prog db #./Sully_X#,0*nasm db #/usr/bin/nasm#,0*nasm_opt db #-f#,0*nasm_fmt db #elf64#,0*gcc db #/usr/bin/gcc#,0*ld db #-B/usr/bin#,0*gcc_opt db #-o#,0*cmd1 dq nasm,nasm_opt,nasm_fmt,gcc_opt,obj,exec,0*cmd2 dq gcc,ld,gcc_opt,prog,obj,0*cmd3 dq ex_prog,0*s db #^#,0*tmp_c db 0*section .text*global main*main:*cmp word [rel num],0*jl .end*mov r15w,word [rel num]*add r15b,&0&*FIND_REPLACE_X exec*mov rax,85*mov rsi,00400*syscall*mov r14,rax*FIND_REPLACE_X prog*FIND_REPLACE_X obj*FIND_REPLACE_X ex_prog*lea r12,[rel s]*.loop:*mov al,byte [r12]*cmp al,0*je .exec_step*cmp al,byte 42*je .newline*cmp al,byte 35*je .dquote*cmp al,byte 38*je .squote*cmp al,byte 64*je .nbr*cmp al,byte 94*je .string*lea rsi,[r12]*jmp .print*.newline:*LOAD_CHAR 10*.dquote:*LOAD_CHAR 34*.squote:*LOAD_CHAR 39*.nbr:*mov r15w,word [rel num]*dec r15w*cmp r15w,0*jl .neg*add r15b,&0&*mov [rel tmp_c],r15b*lea rsi,[rel tmp_c]*jmp .print*.neg:*lea rsi,[rel negative]*WRITE_FD r14, 2*jmp .increment*.string:*lea rsi,[rel s]*WRITE_FD r14,1887*jmp .increment*.print:*WRITE_FD r14,1*.increment:*add r12,1*jmp .loop*.exec_step:*EXEC nasm,cmd1*EXEC gcc,cmd2*EXEC ex_prog,cmd3*.end:*mov rax,60*mov rdi,0*syscall*",0
tmp_c db 0
section .text
global main
main:
cmp word [rel num],0
jl .end
mov r15w,word [rel num]
add r15b,'0'
FIND_REPLACE_X exec
mov rax,85
mov rsi,00400
syscall
mov r14,rax
FIND_REPLACE_X prog
FIND_REPLACE_X obj
FIND_REPLACE_X ex_prog
lea r12,[rel s]
.loop:
mov al,byte [r12]
cmp al,0
je .exec_step
cmp al,byte 42
je .newline
cmp al,byte 35
je .dquote
cmp al,byte 38
je .squote
cmp al,byte 64
je .nbr
cmp al,byte 94
je .string
lea rsi,[r12]
jmp .print
.newline:
LOAD_CHAR 10
.dquote:
LOAD_CHAR 34
.squote:
LOAD_CHAR 39
.nbr:
mov r15w,word [rel num]
dec r15w
cmp r15w,0
jl .neg
add r15b,'0'
mov [rel tmp_c],r15b
lea rsi,[rel tmp_c]
jmp .print
.neg:
lea rsi,[rel negative]
WRITE_FD r14, 2
jmp .increment
.string:
lea rsi,[rel s]
WRITE_FD r14,1887
jmp .increment
.print:
WRITE_FD r14,1
.increment:
add r12,1
jmp .loop
.exec_step:
EXEC nasm,cmd1
EXEC gcc,cmd2
EXEC ex_prog,cmd3
.end:
mov rax,60
mov rdi,0
syscall
