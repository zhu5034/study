
 .section .data

 .section .text
 .globl _start
_start:
 mov $4, %rdi
 call factorial

 mov %rax, %rdi
 mov $60, %rax
 syscall

 .type factorial, @function
factorial:
 push %rbp
 mov %rsp, %rbp
 sub $8, %rsp
 mov %rdi, -8(%rbp)
 mov $1, %rax
 cmp $1, %rdi
 je end
 dec %rdi
 call factorial
 imul -8(%rbp), %rax

end:
 mov %rbp, %rsp
 pop %rbp
 ret
