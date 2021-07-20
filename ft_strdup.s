;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: gmelisan <gmelisan@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/07/20 15:57:59 by gmelisan          #+#    #+#              ;
;    Updated: 2021/07/20 17:11:46 by gmelisan         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy
	
	global	_ft_strdup

	section	.text
_ft_strdup:
	call	_ft_strlen			; result in rax
	push	rdi					; save s1 on stack
	mov		rdi, rax			; for malloc() - first arg
	inc		rdi					; len + 1
	call	_malloc
	cmp		rax, 0
	je		exit
	mov		rdi, rax			; copy
	pop		rsi					; s1
	call	_ft_strcpy
	
exit:
	ret

 
;; char	*ft_strdup(const char *s1)
;; {
;; 	char	*copy;
;; 	size_t	len;
;; 
;; 	len = ft_strlen(s1);
;; 	copy = (char *)malloc(len + 1);
;; 	if (!copy)
;; 		return (NULL);
;; 	ft_strcpy(copy, s1);
;; 	return (copy);
;; }




	
