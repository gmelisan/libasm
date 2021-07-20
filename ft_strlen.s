;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: gmelisan <gmelisan@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/07/20 11:44:20 by gmelisan          #+#    #+#              ;
;    Updated: 2021/07/20 12:52:12 by gmelisan         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

    global  _ft_strlen

    section .text
_ft_strlen:
    xor     rax, rax			; i
    cmp     BYTE [rdi], 0
    je      exit
loop:
    inc		rax					; ++i
    cmp     BYTE [rdi + rax], 0	; exit if rdi[i] == 0
    jne     loop
exit:
    ret
