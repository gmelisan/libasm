;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: gmelisan <gmelisan@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/07/20 15:49:12 by gmelisan          #+#    #+#              ;
;    Updated: 2021/07/20 15:49:22 by gmelisan         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_read

	section .text
_ft_read:
	;; https://stackoverflow.com/questions/48845697/macos-64-bit-system-call-table
	mov		rax, 0x2000003
	syscall
	ret
