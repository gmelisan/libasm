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

;; https://stackoverflow.com/questions/48845697/macos-64-bit-system-call-table

	global	_ft_read
	extern ___error

	section .text
_ft_read:
    mov rax, 0x02000003
    syscall
    jc error
    ret
error:
    push rax        ; save error code
    call ___error   ; get pointer to errno
    pop rdx
    mov [rax], rdx  ; set errno
    mov rax, -1
    ret