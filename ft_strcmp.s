;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: gmelisan <gmelisan@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/07/20 13:23:30 by gmelisan          #+#    #+#              ;
;    Updated: 2021/07/20 15:46:39 by gmelisan         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_strcmp

	section	.text
_ft_strcmp:
	xor     rax, rax			; result
	xor		rcx, rcx			; rcx = i

loop:
	movzx	rdx, BYTE [rdi + rcx] ; dx = s1[i]
	cmp		rdx, 0				 ; while (s1[i])
	je		s1_at_the_end
	movzx	rbx, BYTE [rsi + rcx] ; bx = s2[i]
	cmp		dl, bl				 ; if (dx != bx) return c1 - c2
	jne		exit
	inc		rcx					; ++i
	jmp		loop
	
exit:
	sub		rdx, rbx
	mov		rax, rdx
	ret
	
s1_at_the_end:
	movzx	rbx, BYTE [rsi + rcx]
	cmp		dl, bl
	jne		exit
	ret

;; int 	ft_strcmp(const char *s1, const char *s2)
;; {
;;     size_t i = 0;
;;     unsigned char c1, c2;
;;     while (s1[i]) {
;;         c1 = s1[i];
;;         c2 = s2[i];
;;         if (c1 != c2)
;;             return c1 - c2;
;;         ++i;
;;     }
;;     c1 = s1[i];
;;     c2 = s2[i];
;;     if (c1 != c2)
;;         return c1 - c2;
;;     return 0;
;; }
