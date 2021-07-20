;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: gmelisan <gmelisan@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/07/20 15:22:28 by gmelisan          #+#    #+#              ;
;    Updated: 2021/07/20 15:38:01 by gmelisan         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_write

	section .text
_ft_write:
	;; https://stackoverflow.com/questions/48845697/macos-64-bit-system-call-table
	mov		rax, 0x2000004
	syscall
	ret
