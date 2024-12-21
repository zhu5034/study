
 .section .data
data_items:
 .quad 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0

 .section .text
 .globl _start
_start:
 mov $0, %rdi
 mov data_items(, %rdi, 8), %rax
 mov %rax, $rbx

loop:
 cmp $0, %rax
 je end
 inc %rdi
 mov data_items(, %rdi, 8), %rax
 cmp %rbx, %rax
 jle loop
 mov %rax, %rbx
 jmp loop

end:
 mov $60, %rax
 mov %rbx, %rdi
 syscall
