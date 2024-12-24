# f(0) = 0
# f(1) = 1
# f(2) = 2
# f(n) = f(n-1) + f(n-2) + f(n-3)
# 0 1 2 3 6 11 20 37 68 125 230

 .section .data

 .section .text
 .globl _start
_start:
 mov $10, %rdi
 call fib

 mov %rax, %rdi
 mov $60, %rax
 syscall

 .type fib, @function
fib:
 push %rbp
 mov %rsp, %rbp

 cmp $0, %rdi
 mov $0, %rax
 je end
 cmp $1, %rdi
 mov $1, %rax
 je end
 cmp $2, %rdi
 mov $2, %rax
 je end

 push %rdi          # 入参入栈
 sub $1, %rdi
 call fib
 push %rax          # f(n-1)返回值入栈

 mov 8(%rsp), %rdi
 sub $2, %rdi
 call fib
 push %rax          # f(n-2)返回值入栈

 mov 16(%rsp), %rdi
 sub $3, %rdi
 call fib
 add (%rsp), %rax
 add 8(%rsp), %rax

end:
 mov %rbp, %rsp
 pop %rbp
 ret
