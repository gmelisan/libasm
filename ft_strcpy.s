;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: gmelisan <gmelisan@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/07/20 11:46:32 by gmelisan          #+#    #+#              ;
;    Updated: 2021/07/20 15:23:31 by gmelisan         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global  _ft_strcpy
	
    section .text
_ft_strcpy:
    mov     rax, rdi
	xor		rdx, rdx			 ; i = 0
loop:
	mov		cl, BYTE [rsi + rdx] ; cl = src[i]
	mov		BYTE [rax + rdx], cl ; dst[i] = src[i]
	inc		rdx					 ; ++i
	cmp		cl, 0				 ; if src[i] != 0, continue
	jne		loop
exit:
    ret


;; void	*strcpy(char *dst, const char *src)
;; {
;; 	   size_t i;
;;
;; 	   i = 0;
;;     while (src[i]) {
;;         dst[i] = src[i];
;;         ++i;
;;     }
;;	   dst[i] = 0
;;     return dst;
;; }
