; ----------------------------------------------------------------------------
; Orix.s:
; ----------------------------------------------------------------------------
;				Compatibilité Orix: exec
; ----------------------------------------------------------------------------

.ifdef With::ORIX

	.ifndef Included::ORIX_INC
		Included::ORIX_INC = 1
		verbose 3, "Ajout compatibilité Orix (exec)"

		parse_cmd:
		        .asciiz "forth"

	.else
		; verbose 3, "Ajout vecteurs Orix (exec)"

		; ----------------------------------------------------------------------------
		;
		; ----------------------------------------------------------------------------
		.if * > $fff1
			.error .sprintf("Erreur fichier trop long %d", _err_)
		.endif
		.res $fff1-*, $00

		; ----------------------------------------------------------------------------
		;
		; ----------------------------------------------------------------------------
		        .word   $0000
		        .addr   $fffc
		        .addr   parse_cmd
				; $FFF7
		        .byte   1 ; Number of commands in this rom

	.endif

.endif

