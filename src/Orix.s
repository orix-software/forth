; ----------------------------------------------------------------------------
; Orix.s:
; ----------------------------------------------------------------------------
;				Compatibilité Orix: exec
; ----------------------------------------------------------------------------

.ifdef With::ORIX

	.ifndef Included::ORIX_INC
		Included::ORIX_INC = 1
		verbose 3, "Ajout compatibilité Orix (exec)"


		; ----------------------------------------------------------------------------
		; Compatibilité Orix: exec
		; ----------------------------------------------------------------------------
		BUFEDT = $0590

		.proc parse_routine
		        ldy #$ff

		@loop:
		        iny
		        lda BUFEDT,y
		        beq @maybe
		        cmp parse_cmd,y
		        beq @loop
		        cmp #' '
		        bne @not_found

		@maybe:
		        lda parse_cmd,y
		        bne @not_found
		        jmp ($fffc)

		@not_found:
		        rts
		.endproc

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
		        .word   parse_routine
		        .addr   $fffc
		        .addr   parse_cmd
				; $FFF7
		        .byte   1 ; Number of commands in this rom

	.endif

.endif

