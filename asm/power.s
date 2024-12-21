
 .section .data

 .section .text
 .globl _start
_start:
 # 计算2的3次方
 mov $2, %rdi
 mov $3, %rsi
 call power
 mov %rax, %rbx

 # 计算5的2次方
 mov $5, %rdi
 mov $2, %rsi
 call power

 add %rax, %rbx # 第1次答案加第2次答案

 mov $60, %rax
 mov %rbx, %rdi
 syscall

 .type power, @function
power:
 push %rbp
 mov %rsp, %rbp
 mov %rdi, %rax # 结果

loop:
 cmp $1, %rsi
 je end
 imul %rdi, %rax
 dec %rsi
 jmp loop

end:
 mov %rbp, %rsp
 pop %rbp
 ret
