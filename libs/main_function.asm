
_radeon_github_10_95:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 22
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,32 :: 		sub procedure radeon_github_10_95()
;libs/main_function.mbas,38 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,39 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;libs/main_function.mbas,40 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _Shamsi_show_lcd+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,41 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__radeon_github_10_951:
	DEC        R16
	BRNE       L__radeon_github_10_951
	DEC        R17
	BRNE       L__radeon_github_10_951
	DEC        R18
	BRNE       L__radeon_github_10_951
	NOP
;libs/main_function.mbas,42 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _miladi_call+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,43 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__radeon_github_10_953:
	DEC        R16
	BRNE       L__radeon_github_10_953
	DEC        R17
	BRNE       L__radeon_github_10_953
	DEC        R18
	BRNE       L__radeon_github_10_953
	NOP
;libs/main_function.mbas,72 :: 		for Pwm_chanel_main=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__radeon_github_10_956:
;libs/main_function.mbas,73 :: 		on_test=0
	LDI        R27, 0
	STS        _on_test+0, R27
;libs/main_function.mbas,74 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
L__radeon_github_10_9511:
;libs/main_function.mbas,75 :: 		for on_off2 =1 to 1
	LDI        R27, 1
	STS        _on_off2+0, R27
L__radeon_github_10_9516:
;libs/main_function.mbas,80 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= hours ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= minutes)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _hours+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L__radeon_github_10_95312
	LDI        R20, 255
L__radeon_github_10_95312:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+20
	LDD        R22, Y+21
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L__radeon_github_10_95313
	LDI        R18, 255
L__radeon_github_10_95313:
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__radeon_github_10_95314
	LDI        R27, 255
L__radeon_github_10_95314:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__radeon_github_10_95315
	JMP        L__radeon_github_10_9521
L__radeon_github_10_95315:
;libs/main_function.mbas,84 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= hours ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= minutes)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _hours+0
	CP         R18, R19
	LDI        R22, 0
	BRLO       L__radeon_github_10_95316
	LDI        R22, 255
L__radeon_github_10_95316:
	LDI        R20, #lo_addr(_on_a_0+0)
	LDI        R21, hi_addr(_on_a_0+0)
	LDD        R18, Y+20
	LDD        R19, Y+21
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _minutes+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L__radeon_github_10_95317
	LDI        R27, 255
L__radeon_github_10_95317:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__radeon_github_10_95318
	JMP        L__radeon_github_10_9524
L__radeon_github_10_95318:
;libs/main_function.mbas,86 :: 		on_test=1
	LDI        R27, 1
	STS        _on_test+0, R27
;libs/main_function.mbas,87 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,88 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,89 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,90 :: 		Lcd_Out(1,1,"CHANEL IS ACTIVE:")
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 76
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,91 :: 		Lcd_Out(2,1,"main CH:") Lcd_Out(2,8,txt) delay_ms(50)
	MOVW       R30, R28
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 3
	LDI        R17, 8
	LDI        R16, 120
L__radeon_github_10_9526:
	DEC        R16
	BRNE       L__radeon_github_10_9526
	DEC        R17
	BRNE       L__radeon_github_10_9526
	DEC        R18
	BRNE       L__radeon_github_10_9526
L__radeon_github_10_9524:
;libs/main_function.mbas,103 :: 		end if
	JMP        L__radeon_github_10_9522
;libs/main_function.mbas,104 :: 		else
L__radeon_github_10_9521:
;libs/main_function.mbas,105 :: 		if (on_test=0) then
	LDS        R16, _on_test+0
	CPI        R16, 0
	BREQ       L__radeon_github_10_95319
	JMP        L__radeon_github_10_9529
L__radeon_github_10_95319:
;libs/main_function.mbas,107 :: 		Lcd_Chr(2, 6, (hours div 10)   + 48)
	LDS        R16, _hours+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;libs/main_function.mbas,108 :: 		Lcd_Chr(2, 7, (hours mod 10)   + 48)  Delay_mS(1000)
	LDS        R16, _hours+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__radeon_github_10_9531:
	DEC        R16
	BRNE       L__radeon_github_10_9531
	DEC        R17
	BRNE       L__radeon_github_10_9531
	DEC        R18
	BRNE       L__radeon_github_10_9531
L__radeon_github_10_9529:
;libs/main_function.mbas,118 :: 		end if
L__radeon_github_10_9522:
;libs/main_function.mbas,121 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__radeon_github_10_95320
	JMP        L__radeon_github_10_9519
L__radeon_github_10_95320:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__radeon_github_10_9516
L__radeon_github_10_9519:
;libs/main_function.mbas,122 :: 		next chanel
	LDS        R16, _chanel+0
	CPI        R16, 4
	BRNE       L__radeon_github_10_95321
	JMP        L__radeon_github_10_9514
L__radeon_github_10_95321:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__radeon_github_10_9511
L__radeon_github_10_9514:
;libs/main_function.mbas,124 :: 		chanel=Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	STS        _chanel+0, R16
;libs/main_function.mbas,125 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _Pwm_chanel_main+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,126 :: 		Lcd_Out(1,1,"CHANEL IS ACTIVE:")
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 76
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,127 :: 		Lcd_Out(2,1,"CH:") Lcd_Out(2,4,txt) delay_ms(50)
	LDI        R27, 67
	STD        Y+0, R27
	LDI        R27, 72
	STD        Y+1, R27
	LDI        R27, 58
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 3
	LDI        R17, 8
	LDI        R16, 120
L__radeon_github_10_9533:
	DEC        R16
	BRNE       L__radeon_github_10_9533
	DEC        R17
	BRNE       L__radeon_github_10_9533
	DEC        R18
	BRNE       L__radeon_github_10_9533
;libs/main_function.mbas,128 :: 		if   (on_test=1) then
	LDS        R16, _on_test+0
	CPI        R16, 1
	BREQ       L__radeon_github_10_95322
	JMP        L__radeon_github_10_9536
L__radeon_github_10_95322:
;libs/main_function.mbas,129 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,130 :: 		Lcd_Out(1,1,"on pwm mode")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,131 :: 		bytetostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _chanel+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,133 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,135 :: 		LCD_Out(1,13, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,137 :: 		bytetostr(Pwm_chanel_main,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,138 :: 		LCD_Out(2,3, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,139 :: 		bytetostr(on_off,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _on_off+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,140 :: 		LCD_Out(2,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,141 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__radeon_github_10_9538:
	DEC        R16
	BRNE       L__radeon_github_10_9538
	DEC        R17
	BRNE       L__radeon_github_10_9538
	DEC        R18
	BRNE       L__radeon_github_10_9538
	NOP
	JMP        L__radeon_github_10_9537
;libs/main_function.mbas,143 :: 		else
L__radeon_github_10_9536:
;libs/main_function.mbas,144 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,147 :: 		bytetostr(on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][0],txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/main_function.mbas,148 :: 		LCD_Out(1,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,149 :: 		bytetostr(Pwm_chanel_main,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,150 :: 		LCD_Out(2,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,151 :: 		Lcd_Out(1,1,"offfff")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,152 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__radeon_github_10_9540:
	DEC        R16
	BRNE       L__radeon_github_10_9540
	DEC        R17
	BRNE       L__radeon_github_10_9540
	DEC        R18
	BRNE       L__radeon_github_10_9540
	NOP
;libs/main_function.mbas,153 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,154 :: 		end if
L__radeon_github_10_9537:
;libs/main_function.mbas,155 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 7
	BRNE       L__radeon_github_10_95323
	JMP        L__radeon_github_10_959
L__radeon_github_10_95323:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__radeon_github_10_956
L__radeon_github_10_959:
;libs/main_function.mbas,161 :: 		end sub                                                ' endless loop
L_end_radeon_github_10_95:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 21
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _radeon_github_10_95

_Easy_vacuum_95_10_4:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,163 :: 		sub procedure Easy_vacuum_95_10_4(dim program_number as byte)
;libs/main_function.mbas,169 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,170 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;libs/main_function.mbas,171 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _Shamsi_show_lcd+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,172 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_443:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_443
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_443
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_443
	NOP
;libs/main_function.mbas,173 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _miladi_call+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,174 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_445:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_445
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_445
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_445
	NOP
;libs/main_function.mbas,178 :: 		for Pwm_chanel_main=1 to 1  ' equal to heater
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__Easy_vacuum_95_10_448:
;libs/main_function.mbas,179 :: 		on_test=0
	LDI        R27, 0
	STS        _on_test+0, R27
;libs/main_function.mbas,181 :: 		for chanel =1 to 1   ' equal to Programs number  changed from days number
	LDI        R27, 1
	STS        _chanel+0, R27
L__Easy_vacuum_95_10_453:
;libs/main_function.mbas,183 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_458:
;libs/main_function.mbas,186 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L__Easy_vacuum_95_10_4325
	LDI        R20, 255
L__Easy_vacuum_95_10_4325:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+25
	LDD        R22, Y+26
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L__Easy_vacuum_95_10_4326
	LDI        R18, 255
L__Easy_vacuum_95_10_4326:
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__Easy_vacuum_95_10_4327
	LDI        R27, 255
L__Easy_vacuum_95_10_4327:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__Easy_vacuum_95_10_4328
	JMP        L__Easy_vacuum_95_10_463
L__Easy_vacuum_95_10_4328:
;libs/main_function.mbas,189 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= minutes ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= seconds)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R18, R19
	LDI        R22, 0
	BRLO       L__Easy_vacuum_95_10_4329
	LDI        R22, 255
L__Easy_vacuum_95_10_4329:
	LDI        R20, #lo_addr(_on_a_0+0)
	LDI        R21, hi_addr(_on_a_0+0)
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L__Easy_vacuum_95_10_4330
	LDI        R27, 255
L__Easy_vacuum_95_10_4330:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4331
	JMP        L__Easy_vacuum_95_10_466
L__Easy_vacuum_95_10_4331:
;libs/main_function.mbas,192 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,193 :: 		inttostr(chanel_active,txt)
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,194 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,195 :: 		Lcd_Out(1,1,"Program S ACTIVE:")
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,196 :: 		Lcd_Out(2,1,"main CH:") Lcd_Out(2,8,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_468:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_468
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_468
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_468
	NOP
;libs/main_function.mbas,198 :: 		Lcd_Out(1,1,"on pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,199 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,200 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
L__Easy_vacuum_95_10_466:
;libs/main_function.mbas,202 :: 		end if
	JMP        L__Easy_vacuum_95_10_464
;libs/main_function.mbas,203 :: 		else
L__Easy_vacuum_95_10_463:
;libs/main_function.mbas,204 :: 		if (on_test=0) then
	LDS        R16, _on_test+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4332
	JMP        L__Easy_vacuum_95_10_471
L__Easy_vacuum_95_10_4332:
;libs/main_function.mbas,206 :: 		Lcd_Chr(2, 6, (hours div 10)   + 48)
	LDS        R16, _hours+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	PUSH       R2
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;libs/main_function.mbas,207 :: 		Lcd_Chr(2, 7, (hours mod 10)   + 48)  Delay_mS(1000)
	LDS        R16, _hours+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R2
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__Easy_vacuum_95_10_473:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_473
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_473
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_473
L__Easy_vacuum_95_10_471:
;libs/main_function.mbas,210 :: 		end if
L__Easy_vacuum_95_10_464:
;libs/main_function.mbas,213 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4333
	JMP        L__Easy_vacuum_95_10_461
L__Easy_vacuum_95_10_4333:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_458
L__Easy_vacuum_95_10_461:
;libs/main_function.mbas,214 :: 		next chanel
	LDS        R16, _chanel+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4334
	JMP        L__Easy_vacuum_95_10_456
L__Easy_vacuum_95_10_4334:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__Easy_vacuum_95_10_453
L__Easy_vacuum_95_10_456:
;libs/main_function.mbas,217 :: 		inttostr(chanel,txt)
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
	POP        R2
;libs/main_function.mbas,219 :: 		if   (on_test=1) then
	LDS        R16, _on_test+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4335
	JMP        L__Easy_vacuum_95_10_476
L__Easy_vacuum_95_10_4335:
;libs/main_function.mbas,220 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,221 :: 		Lcd_Out(1,1,"test CHANEL IS ACTIVE:")
	MOVW       R30, R28
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 76
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,222 :: 		Lcd_Out(2,1,"CH:") Lcd_Out(2,4,txt) delay_ms(100)
	LDI        R27, 67
	STD        Y+0, R27
	LDI        R27, 72
	STD        Y+1, R27
	LDI        R27, 58
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_478:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_478
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_478
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_478
;libs/main_function.mbas,223 :: 		Lcd_Out(1,1,"on pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,224 :: 		bytetostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _chanel+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,226 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][3],255,Pwm_chanel_main)   ''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,228 :: 		LCD_Out(1,13, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,230 :: 		bytetostr(Pwm_chanel_main,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,231 :: 		LCD_Out(2,3, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,232 :: 		bytetostr(on_off,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _on_off+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,233 :: 		LCD_Out(2,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;libs/main_function.mbas,234 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_480:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_480
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_480
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_480
	NOP
	JMP        L__Easy_vacuum_95_10_477
;libs/main_function.mbas,236 :: 		else
L__Easy_vacuum_95_10_476:
;libs/main_function.mbas,237 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,239 :: 		Lcd_Out(2,1,"CH:") Lcd_Out(2,4,txt) delay_ms(100)
	LDI        R27, 67
	STD        Y+0, R27
	LDI        R27, 72
	STD        Y+1, R27
	LDI        R27, 58
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_482:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_482
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_482
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_482
;libs/main_function.mbas,240 :: 		bytetostr(on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][0],txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/main_function.mbas,241 :: 		LCD_Out(1,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,242 :: 		bytetostr(Pwm_chanel_main,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,243 :: 		LCD_Out(2,7, "          ")
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,244 :: 		LCD_Out(2,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,245 :: 		Lcd_Out(1,1,"offfff")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,246 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_484:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_484
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_484
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_484
	NOP
;libs/main_function.mbas,247 :: 		PWM_MAKE (10,255,Pwm_chanel_main)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 10
	MOV        R2, R27
	CALL       _PWM_MAKE+0
	POP        R2
;libs/main_function.mbas,248 :: 		end if
L__Easy_vacuum_95_10_477:
;libs/main_function.mbas,249 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4336
	JMP        L__Easy_vacuum_95_10_451
L__Easy_vacuum_95_10_4336:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__Easy_vacuum_95_10_448
L__Easy_vacuum_95_10_451:
;libs/main_function.mbas,251 :: 		Lcd_Out(1,1,"heater ended")
	MOVW       R30, R28
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;libs/main_function.mbas,252 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_486:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_486
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_486
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_486
;libs/main_function.mbas,253 :: 		for Pwm_chanel_main=2 to 2  ' equal to motor
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
L__Easy_vacuum_95_10_489:
;libs/main_function.mbas,254 :: 		on_test=0
	LDI        R27, 0
	STS        _on_test+0, R27
;libs/main_function.mbas,256 :: 		for chanel =1 to 1   ' equal to Programs number  changed from days number
	LDI        R27, 1
	STS        _chanel+0, R27
L__Easy_vacuum_95_10_494:
;libs/main_function.mbas,258 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_499:
;libs/main_function.mbas,261 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L__Easy_vacuum_95_10_4337
	LDI        R20, 255
L__Easy_vacuum_95_10_4337:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+25
	LDD        R22, Y+26
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L__Easy_vacuum_95_10_4338
	LDI        R18, 255
L__Easy_vacuum_95_10_4338:
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__Easy_vacuum_95_10_4339
	LDI        R27, 255
L__Easy_vacuum_95_10_4339:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__Easy_vacuum_95_10_4340
	JMP        L__Easy_vacuum_95_10_4104
L__Easy_vacuum_95_10_4340:
;libs/main_function.mbas,264 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= minutes ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= seconds)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R18, R19
	LDI        R22, 0
	BRLO       L__Easy_vacuum_95_10_4341
	LDI        R22, 255
L__Easy_vacuum_95_10_4341:
	LDI        R20, #lo_addr(_on_a_0+0)
	LDI        R21, hi_addr(_on_a_0+0)
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L__Easy_vacuum_95_10_4342
	LDI        R27, 255
L__Easy_vacuum_95_10_4342:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4343
	JMP        L__Easy_vacuum_95_10_4107
L__Easy_vacuum_95_10_4343:
;libs/main_function.mbas,266 :: 		on_test=1
	LDI        R27, 1
	STS        _on_test+0, R27
;libs/main_function.mbas,267 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,268 :: 		inttostr(chanel_active,txt)
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,269 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,270 :: 		Lcd_Out(1,1,"Program S ACTIVE:")
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,271 :: 		Lcd_Out(2,1,"main CH:") Lcd_Out(2,8,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4109:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4109
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4109
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4109
	NOP
;libs/main_function.mbas,273 :: 		Lcd_Out(1,1,"on pwm  motor mode")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,274 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,275 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
L__Easy_vacuum_95_10_4107:
;libs/main_function.mbas,277 :: 		end if
	JMP        L__Easy_vacuum_95_10_4105
;libs/main_function.mbas,278 :: 		else
L__Easy_vacuum_95_10_4104:
;libs/main_function.mbas,279 :: 		if (on_test=0) then
	LDS        R16, _on_test+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4344
	JMP        L__Easy_vacuum_95_10_4112
L__Easy_vacuum_95_10_4344:
;libs/main_function.mbas,281 :: 		Lcd_Chr(2, 6, (hours div 10)   + 48)
	LDS        R16, _hours+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	PUSH       R2
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;libs/main_function.mbas,282 :: 		Lcd_Chr(2, 7, (hours mod 10)   + 48)  Delay_mS(300)
	LDS        R16, _hours+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R2
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4114:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4114
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4114
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4114
	NOP
	NOP
L__Easy_vacuum_95_10_4112:
;libs/main_function.mbas,284 :: 		end if
L__Easy_vacuum_95_10_4105:
;libs/main_function.mbas,287 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4345
	JMP        L__Easy_vacuum_95_10_4102
L__Easy_vacuum_95_10_4345:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_499
L__Easy_vacuum_95_10_4102:
;libs/main_function.mbas,288 :: 		next chanel
	LDS        R16, _chanel+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4346
	JMP        L__Easy_vacuum_95_10_497
L__Easy_vacuum_95_10_4346:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__Easy_vacuum_95_10_494
L__Easy_vacuum_95_10_497:
;libs/main_function.mbas,291 :: 		inttostr(chanel,txt)
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,292 :: 		Lcd_Out(1,1,"test CHANEL IS ACTIVE:")
	MOVW       R30, R28
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 76
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,293 :: 		Lcd_Out(2,1,"CH:") Lcd_Out(2,4,txt) delay_ms(200)
	LDI        R27, 67
	STD        Y+0, R27
	LDI        R27, 72
	STD        Y+1, R27
	LDI        R27, 58
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4116:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4116
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4116
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4116
	NOP
;libs/main_function.mbas,294 :: 		if   (on_test=1) then
	LDS        R16, _on_test+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4347
	JMP        L__Easy_vacuum_95_10_4119
L__Easy_vacuum_95_10_4347:
;libs/main_function.mbas,295 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,296 :: 		Lcd_Out(1,1,"on pwm motor mode") delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4121:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4121
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4121
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4121
	NOP
;libs/main_function.mbas,297 :: 		bytetostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _chanel+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,299 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,301 :: 		LCD_Out(1,13, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,303 :: 		bytetostr(Pwm_chanel_main,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,304 :: 		LCD_Out(2,3, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,305 :: 		bytetostr(on_off,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _on_off+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,306 :: 		LCD_Out(2,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;libs/main_function.mbas,307 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_4123:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4123
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4123
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4123
	NOP
	JMP        L__Easy_vacuum_95_10_4120
;libs/main_function.mbas,308 :: 		else
L__Easy_vacuum_95_10_4119:
;libs/main_function.mbas,309 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,310 :: 		bytetostr(on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][0],txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+23, R16
	STD        Y+24, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+23
	LDD        R19, Y+24
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/main_function.mbas,311 :: 		LCD_Out(1,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,312 :: 		bytetostr(Pwm_chanel_main,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,313 :: 		LCD_Out(2,11, txt)LCD_Out(2,7, "          ")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,314 :: 		Lcd_Out(1,1,"offfff")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,315 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_4125:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4125
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4125
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4125
	NOP
;libs/main_function.mbas,316 :: 		PWM_MAKE (50,255,Pwm_chanel_main)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 50
	MOV        R2, R27
	CALL       _PWM_MAKE+0
	POP        R2
;libs/main_function.mbas,317 :: 		end if
L__Easy_vacuum_95_10_4120:
;libs/main_function.mbas,318 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 2
	BRNE       L__Easy_vacuum_95_10_4348
	JMP        L__Easy_vacuum_95_10_492
L__Easy_vacuum_95_10_4348:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__Easy_vacuum_95_10_489
L__Easy_vacuum_95_10_492:
;libs/main_function.mbas,322 :: 		end sub                                                ' endless loop
L_end_Easy_vacuum_95_10_4:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Easy_vacuum_95_10_4

libs/main_function_Easy_vacuum_95_10_4_simple_main:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 24
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,324 :: 		sub procedure Easy_vacuum_95_10_4_simple_main(dim program_number as byte,dim Heater_0_Motor_1 as byte)
;libs/main_function.mbas,325 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R2
	POP        R3
;libs/main_function.mbas,327 :: 		week=1
	LDI        R27, 1
	STS        _week+0, R27
;libs/main_function.mbas,328 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,329 :: 		Pwm_chanel_main=Heater_0_Motor_1 ''heater
	STS        _Pwm_chanel_main+0, R3
;libs/main_function.mbas,330 :: 		if  (Pwm_chanel_main=0) then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_main350
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main129
L_libs/main_function_Easy_vacuum_95_10_4_simple_main350:
;libs/main_function.mbas,331 :: 		txt="Heater"
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/main_function.mbas,332 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main130
;libs/main_function.mbas,333 :: 		else if  (Pwm_chanel_main=1) then
L_libs/main_function_Easy_vacuum_95_10_4_simple_main129:
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 1
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_main351
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main132
L_libs/main_function_Easy_vacuum_95_10_4_simple_main351:
;libs/main_function.mbas,334 :: 		txt="Heater"
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/main_function.mbas,335 :: 		Mo_start_min= minutes   Mo_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _Mo_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _Mo_start_sec+0, R16
L_libs/main_function_Easy_vacuum_95_10_4_simple_main132:
;libs/main_function.mbas,337 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_main130:
;libs/main_function.mbas,344 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,345 :: 		while( while_state_import)
L_libs/main_function_Easy_vacuum_95_10_4_simple_main135:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main136
;libs/main_function.mbas,346 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_main140:
;libs/main_function.mbas,348 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_main352
	LDI        R20, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_main352:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+22
	LDD        R22, Y+23
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_main353
	LDI        R18, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_main353:
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_main354
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_main354:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main355
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main145
L_libs/main_function_Easy_vacuum_95_10_4_simple_main355:
;libs/main_function.mbas,350 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= minutes ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= seconds)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R18, R19
	LDI        R22, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_main356
	LDI        R22, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_main356:
	LDI        R20, #lo_addr(_on_a_0+0)
	LDI        R21, hi_addr(_on_a_0+0)
	LDD        R18, Y+22
	LDD        R19, Y+23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_main357
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_main357:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main358
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main148
L_libs/main_function_Easy_vacuum_95_10_4_simple_main358:
;libs/main_function.mbas,351 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,352 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,353 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,354 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel_active+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,355 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_main150:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main150
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main150
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main150
	NOP
;libs/main_function.mbas,356 :: 		Lcd_Out(1,1,"On pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,357 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,358 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main149
;libs/main_function.mbas,361 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_main148:
;libs/main_function.mbas,362 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,363 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,364 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_main152:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main152
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main152
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main152
	NOP
;libs/main_function.mbas,365 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,366 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,367 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
;libs/main_function.mbas,368 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,369 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_main149:
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main146
;libs/main_function.mbas,370 :: 		else '' if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
L_libs/main_function_Easy_vacuum_95_10_4_simple_main145:
;libs/main_function.mbas,371 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,372 :: 		Lcd_Out(1,1,"on setting is ==0")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
;libs/main_function.mbas,373 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_main146:
;libs/main_function.mbas,374 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_main359
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main143
L_libs/main_function_Easy_vacuum_95_10_4_simple_main359:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main140
L_libs/main_function_Easy_vacuum_95_10_4_simple_main143:
;libs/main_function.mbas,375 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_main135
L_libs/main_function_Easy_vacuum_95_10_4_simple_main136:
;libs/main_function.mbas,377 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_main:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	ADIW       R28, 23
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Easy_vacuum_95_10_4_simple_main

_Easy_vacuum_95_10_4_simple:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 28
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,379 :: 		sub procedure Easy_vacuum_95_10_4_simple(dim program_number as byte)
;libs/main_function.mbas,380 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	PUSH       R2
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,381 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;libs/main_function.mbas,382 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _Shamsi_show_lcd+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,383 :: 		Delay_mS(300)
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple155:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple155
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple155
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple155
	NOP
	NOP
;libs/main_function.mbas,384 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _miladi_call+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R2
;libs/main_function.mbas,385 :: 		Delay_mS(300)
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple157:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple157
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple157
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple157
	NOP
	NOP
;libs/main_function.mbas,386 :: 		while_state_import=1  oldstate_3=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,387 :: 		while  (while_state_import )
L__Easy_vacuum_95_10_4_simple160:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple161
;libs/main_function.mbas,388 :: 		if (Button(PORTD, 0, 0.5, 0)) then    ' Detect logical one up key
	PUSH       R2
	CLR        R6
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PORTD+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PORTD+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple361
	JMP        L__Easy_vacuum_95_10_4_simple165
L__Easy_vacuum_95_10_4_simple361:
;libs/main_function.mbas,389 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Easy_vacuum_95_10_4_simple165:
;libs/main_function.mbas,391 :: 		if (oldstate_3 and Button(PIND, 0,0.5, 1)) then
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple362
	JMP        L__Easy_vacuum_95_10_4_simple168
L__Easy_vacuum_95_10_4_simple362:
;libs/main_function.mbas,392 :: 		LCD_Out(2,9, "Heater running")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,393 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,394 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple170:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple170
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple170
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple170
;libs/main_function.mbas,395 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_Start_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_Start_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_Start_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_Start_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,396 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+27, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+26, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+25, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+24, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+22, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+20, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+27
	LDD        R21, Y+26
	LDD        R20, Y+25
	LDD        R19, Y+24
	LDD        R18, Y+22
	LDD        R17, Y+20
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
	POP        R2
;libs/main_function.mbas,399 :: 		week=1
	LDI        R27, 1
	STS        _week+0, R27
;libs/main_function.mbas,400 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,401 :: 		Pwm_chanel_main=1 ''heater
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,403 :: 		txt="Heater"
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/main_function.mbas,404 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
;libs/main_function.mbas,409 :: 		end if
L__Easy_vacuum_95_10_4_simple174:
;libs/main_function.mbas,417 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,418 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple179:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple180
;libs/main_function.mbas,419 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_4_simple184:
;libs/main_function.mbas,421 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L__Easy_vacuum_95_10_4_simple363
	LDI        R20, 255
L__Easy_vacuum_95_10_4_simple363:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+22
	LDD        R22, Y+23
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L__Easy_vacuum_95_10_4_simple364
	LDI        R18, 255
L__Easy_vacuum_95_10_4_simple364:
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__Easy_vacuum_95_10_4_simple365
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple365:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__Easy_vacuum_95_10_4_simple366
	JMP        L__Easy_vacuum_95_10_4_simple189
L__Easy_vacuum_95_10_4_simple366:
;libs/main_function.mbas,423 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= minutes ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= seconds)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R18, R19
	LDI        R22, 0
	BRLO       L__Easy_vacuum_95_10_4_simple367
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple367:
	LDI        R20, #lo_addr(_on_a_0+0)
	LDI        R21, hi_addr(_on_a_0+0)
	LDD        R18, Y+22
	LDD        R19, Y+23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L__Easy_vacuum_95_10_4_simple368
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple368:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple369
	JMP        L__Easy_vacuum_95_10_4_simple192
L__Easy_vacuum_95_10_4_simple369:
;libs/main_function.mbas,424 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,425 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,426 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,427 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel_active+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,428 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple194:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple194
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple194
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple194
	NOP
;libs/main_function.mbas,429 :: 		Lcd_Out(1,1,"On pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,430 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,431 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	JMP        L__Easy_vacuum_95_10_4_simple193
;libs/main_function.mbas,434 :: 		else
L__Easy_vacuum_95_10_4_simple192:
;libs/main_function.mbas,435 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,436 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,437 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple196:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple196
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple196
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple196
	NOP
;libs/main_function.mbas,438 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,439 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,440 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
;libs/main_function.mbas,441 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,442 :: 		end if
L__Easy_vacuum_95_10_4_simple193:
	JMP        L__Easy_vacuum_95_10_4_simple190
;libs/main_function.mbas,443 :: 		else '' if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
L__Easy_vacuum_95_10_4_simple189:
;libs/main_function.mbas,444 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,445 :: 		Lcd_Out(1,1,"on setting is ==0")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;libs/main_function.mbas,446 :: 		end if
L__Easy_vacuum_95_10_4_simple190:
;libs/main_function.mbas,447 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4_simple370
	JMP        L__Easy_vacuum_95_10_4_simple187
L__Easy_vacuum_95_10_4_simple370:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple184
L__Easy_vacuum_95_10_4_simple187:
;libs/main_function.mbas,448 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple179
L__Easy_vacuum_95_10_4_simple180:
;libs/main_function.mbas,449 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple168:
;libs/main_function.mbas,451 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple160
L__Easy_vacuum_95_10_4_simple161:
;libs/main_function.mbas,456 :: 		Pwm_chanel_main=2 ''Motor
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,457 :: 		while_state_import=1  oldstate_3=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,458 :: 		while  (while_state_import )
L__Easy_vacuum_95_10_4_simple199:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple200
;libs/main_function.mbas,459 :: 		if (Button(PORTD, 1, 0.5, 0)) then    ' Detect logical one up key
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PORTD+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PORTD+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple371
	JMP        L__Easy_vacuum_95_10_4_simple204
L__Easy_vacuum_95_10_4_simple371:
;libs/main_function.mbas,460 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Easy_vacuum_95_10_4_simple204:
;libs/main_function.mbas,462 :: 		if (oldstate_3 and Button(PIND, 1,0.5, 1)) then
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple372
	JMP        L__Easy_vacuum_95_10_4_simple207
L__Easy_vacuum_95_10_4_simple372:
;libs/main_function.mbas,463 :: 		LCD_Out(2,9, "Heater running")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,464 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,465 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple209:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple209
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple209
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple209
;libs/main_function.mbas,466 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_Start_seconds_next+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_Start_seconds_next+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_Start_minutes_next+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_Start_minutes_next+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,467 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+27, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+26, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+25, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+24, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+22, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+20, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+27
	LDD        R21, Y+26
	LDD        R20, Y+25
	LDD        R19, Y+24
	LDD        R18, Y+22
	LDD        R17, Y+20
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
	POP        R2
;libs/main_function.mbas,470 :: 		week=1
	LDI        R27, 1
	STS        _week+0, R27
;libs/main_function.mbas,471 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,473 :: 		if  (Pwm_chanel_main=1) then
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4_simple373
	JMP        L__Easy_vacuum_95_10_4_simple212
L__Easy_vacuum_95_10_4_simple373:
;libs/main_function.mbas,474 :: 		txt="Heater"
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/main_function.mbas,475 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple213
;libs/main_function.mbas,476 :: 		else if  (Pwm_chanel_main=2)  then
L__Easy_vacuum_95_10_4_simple212:
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple374
	JMP        L__Easy_vacuum_95_10_4_simple215
L__Easy_vacuum_95_10_4_simple374:
;libs/main_function.mbas,477 :: 		txt="Motor"
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/main_function.mbas,478 :: 		Mo_start_min= minutes   Mo_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _Mo_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _Mo_start_sec+0, R16
L__Easy_vacuum_95_10_4_simple215:
;libs/main_function.mbas,480 :: 		end if
L__Easy_vacuum_95_10_4_simple213:
;libs/main_function.mbas,488 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,489 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple218:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple219
;libs/main_function.mbas,490 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_4_simple223:
;libs/main_function.mbas,492 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L__Easy_vacuum_95_10_4_simple375
	LDI        R20, 255
L__Easy_vacuum_95_10_4_simple375:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+22
	LDD        R22, Y+23
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L__Easy_vacuum_95_10_4_simple376
	LDI        R18, 255
L__Easy_vacuum_95_10_4_simple376:
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__Easy_vacuum_95_10_4_simple377
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple377:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__Easy_vacuum_95_10_4_simple378
	JMP        L__Easy_vacuum_95_10_4_simple228
L__Easy_vacuum_95_10_4_simple378:
;libs/main_function.mbas,494 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= minutes ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= seconds)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R18, R19
	LDI        R22, 0
	BRLO       L__Easy_vacuum_95_10_4_simple379
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple379:
	LDI        R20, #lo_addr(_on_a_0+0)
	LDI        R21, hi_addr(_on_a_0+0)
	LDD        R18, Y+22
	LDD        R19, Y+23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L__Easy_vacuum_95_10_4_simple380
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple380:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple381
	JMP        L__Easy_vacuum_95_10_4_simple231
L__Easy_vacuum_95_10_4_simple381:
;libs/main_function.mbas,495 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,496 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,497 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,498 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel_active+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,499 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple233:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple233
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple233
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple233
	NOP
;libs/main_function.mbas,500 :: 		Lcd_Out(1,1,"On pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,501 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,502 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	JMP        L__Easy_vacuum_95_10_4_simple232
;libs/main_function.mbas,505 :: 		else
L__Easy_vacuum_95_10_4_simple231:
;libs/main_function.mbas,506 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,507 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,508 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple235:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple235
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple235
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple235
	NOP
;libs/main_function.mbas,509 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,510 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,511 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
;libs/main_function.mbas,512 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,513 :: 		end if
L__Easy_vacuum_95_10_4_simple232:
	JMP        L__Easy_vacuum_95_10_4_simple229
;libs/main_function.mbas,514 :: 		else '' if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
L__Easy_vacuum_95_10_4_simple228:
;libs/main_function.mbas,515 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,516 :: 		Lcd_Out(1,1,"on setting is ==0")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;libs/main_function.mbas,517 :: 		end if
L__Easy_vacuum_95_10_4_simple229:
;libs/main_function.mbas,518 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4_simple382
	JMP        L__Easy_vacuum_95_10_4_simple226
L__Easy_vacuum_95_10_4_simple382:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple223
L__Easy_vacuum_95_10_4_simple226:
;libs/main_function.mbas,519 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple218
L__Easy_vacuum_95_10_4_simple219:
;libs/main_function.mbas,520 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple207:
;libs/main_function.mbas,522 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple199
L__Easy_vacuum_95_10_4_simple200:
;libs/main_function.mbas,524 :: 		Read_Time(@Start_hours, @End_minutes_next, @End_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
	PUSH       R2
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_End_seconds_next+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_End_seconds_next+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_End_minutes_next+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_End_minutes_next+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,525 :: 		Write_Time(Dec2Bcd(Start_hours),Dec2Bcd(Start_minutes+End_minutes_next),Dec2Bcd(Start_seconds+End_seconds_next),
	LDS        R2, _Start_hours+0
	CALL       _Dec2Bcd+0
	STD        Y+27, R16
	LDS        R17, _Start_minutes+0
	LDS        R16, _End_minutes_next+0
	ADD        R16, R17
	MOV        R2, R16
	CALL       _Dec2Bcd+0
	STD        Y+26, R16
	LDS        R17, _Start_seconds+0
	LDS        R16, _End_seconds_next+0
	ADD        R16, R17
	MOV        R2, R16
	CALL       _Dec2Bcd+0
	STD        Y+25, R16
;libs/main_function.mbas,526 :: 		Dec2Bcd(Start_day),Dec2Bcd(Start_week),Dec2Bcd(Start_month),Dec2Bcd(Start_year))
	LDS        R2, _Start_day+0
	CALL       _Dec2Bcd+0
	STD        Y+24, R16
	LDS        R2, _Start_week+0
	CALL       _Dec2Bcd+0
	STD        Y+22, R16
	LDS        R2, _Start_month+0
	CALL       _Dec2Bcd+0
	STD        Y+20, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+27
	LDD        R21, Y+26
	LDD        R20, Y+25
	LDD        R19, Y+24
	LDD        R18, Y+22
	LDD        R17, Y+20
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
;libs/main_function.mbas,528 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,529 :: 		inttostr(End_seconds_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_seconds_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,530 :: 		Lcd_Out(1,1,"Sec ended is :") Lcd_Out(1,10,txt)
	MOVW       R30, R28
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,531 :: 		inttostr(End_minutes_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_minutes_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,532 :: 		Lcd_Out(2,1,"Min ended is :") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple237:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple237
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple237
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple237
	NOP
;libs/main_function.mbas,533 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	ADIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Easy_vacuum_95_10_4_simple

libs/main_function_Easy_vacuum_95_10_4_simple_1:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 24
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,535 :: 		sub procedure Easy_vacuum_95_10_4_simple_1(dim program_number as byte,dim Heater_0_Motor_1 as byte)
;libs/main_function.mbas,536 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,538 :: 		chanel=1
	LDI        R27, 1
	STS        _chanel+0, R27
;libs/main_function.mbas,540 :: 		Pwm_chanel_main=1 ''heater port INT0
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,549 :: 		txt="Heater"
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/main_function.mbas,550 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,551 :: 		while( while_state_import)
L_libs/main_function_Easy_vacuum_95_10_4_simple_1241:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1242
;libs/main_function.mbas,552 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_1246:
;libs/main_function.mbas,554 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_1384
	LDI        R20, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1384:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+22
	LDD        R22, Y+23
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_1385
	LDI        R18, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1385:
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_1386
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1386:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1387
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1251
L_libs/main_function_Easy_vacuum_95_10_4_simple_1387:
;libs/main_function.mbas,556 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= minutes ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= seconds)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R18, R19
	LDI        R22, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_1388
	LDI        R22, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1388:
	LDI        R20, #lo_addr(_on_a_0+0)
	LDI        R21, hi_addr(_on_a_0+0)
	LDD        R18, Y+22
	LDD        R19, Y+23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_1389
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1389:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1390
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1254
L_libs/main_function_Easy_vacuum_95_10_4_simple_1390:
;libs/main_function.mbas,557 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,558 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,559 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,560 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel_active+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,561 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_1256:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1256
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1256
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1256
	NOP
;libs/main_function.mbas,562 :: 		Lcd_Out(1,1,"On pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,563 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,564 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
L_libs/main_function_Easy_vacuum_95_10_4_simple_1254:
;libs/main_function.mbas,566 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1252
;libs/main_function.mbas,567 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_1251:
;libs/main_function.mbas,568 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,569 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,570 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,571 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_1258:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1258
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1258
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1258
	NOP
;libs/main_function.mbas,572 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,573 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,574 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
;libs/main_function.mbas,575 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_1252:
;libs/main_function.mbas,576 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1391
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1249
L_libs/main_function_Easy_vacuum_95_10_4_simple_1391:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1246
L_libs/main_function_Easy_vacuum_95_10_4_simple_1249:
;libs/main_function.mbas,577 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1241
L_libs/main_function_Easy_vacuum_95_10_4_simple_1242:
;libs/main_function.mbas,579 :: 		while_state_import=1 Pwm_chanel_main=2 txt="Motor"
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/main_function.mbas,580 :: 		while( while_state_import)
L_libs/main_function_Easy_vacuum_95_10_4_simple_1261:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1262
;libs/main_function.mbas,581 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_1266:
;libs/main_function.mbas,583 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_1392
	LDI        R20, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1392:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+22
	LDD        R22, Y+23
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_1393
	LDI        R18, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1393:
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_1394
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1394:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1395
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1271
L_libs/main_function_Easy_vacuum_95_10_4_simple_1395:
;libs/main_function.mbas,585 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= minutes ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= seconds)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R18, R19
	LDI        R22, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_1396
	LDI        R22, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1396:
	LDI        R20, #lo_addr(_on_a_0+0)
	LDI        R21, hi_addr(_on_a_0+0)
	LDD        R18, Y+22
	LDD        R19, Y+23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_1397
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_1397:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1398
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1274
L_libs/main_function_Easy_vacuum_95_10_4_simple_1398:
;libs/main_function.mbas,586 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,587 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,588 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,589 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel_active+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,590 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_1276:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1276
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1276
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1276
	NOP
;libs/main_function.mbas,591 :: 		Lcd_Out(1,1,"On pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,592 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,593 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+20, R16
	STD        Y+21, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+20
	LDD        R19, Y+21
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
L_libs/main_function_Easy_vacuum_95_10_4_simple_1274:
;libs/main_function.mbas,595 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1272
;libs/main_function.mbas,596 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_1271:
;libs/main_function.mbas,597 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,598 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,599 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,600 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_1278:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1278
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1278
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1278
	NOP
;libs/main_function.mbas,601 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,602 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,603 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
;libs/main_function.mbas,604 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_1272:
;libs/main_function.mbas,605 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_1399
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1269
L_libs/main_function_Easy_vacuum_95_10_4_simple_1399:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1266
L_libs/main_function_Easy_vacuum_95_10_4_simple_1269:
;libs/main_function.mbas,606 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_1261
L_libs/main_function_Easy_vacuum_95_10_4_simple_1262:
;libs/main_function.mbas,607 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_1:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 23
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Easy_vacuum_95_10_4_simple_1

libs/main_function_Easy_vacuum_95_10_4_key_actions:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 21
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,609 :: 		sub procedure Easy_vacuum_95_10_4_key_actions(dim prog_number as byte)',dim heater_switch as byte,dim Motor_switch as byte)
;libs/main_function.mbas,610 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	PUSH       R2
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,611 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;libs/main_function.mbas,612 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _Shamsi_show_lcd+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,613 :: 		Delay_mS(300)
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_libs/main_function_Easy_vacuum_95_10_4_key_actions281:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions281
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions281
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions281
	NOP
	NOP
;libs/main_function.mbas,614 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _miladi_call+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R2
;libs/main_function.mbas,615 :: 		Delay_mS(300)
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_libs/main_function_Easy_vacuum_95_10_4_key_actions283:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions283
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions283
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions283
	NOP
	NOP
;libs/main_function.mbas,616 :: 		while_state_import=1  oldstate_3=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,617 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_key_actions286:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_key_actions287
;libs/main_function.mbas,618 :: 		if (Button(PORTD, 0, 0.5, 0)) then    ' Detect logical one up key
	PUSH       R2
	CLR        R6
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PORTD+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PORTD+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions401
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_key_actions291
L_libs/main_function_Easy_vacuum_95_10_4_key_actions401:
;libs/main_function.mbas,619 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_key_actions291:
;libs/main_function.mbas,621 :: 		if (oldstate_3 and Button(PIND, 0,0.5, 1)) then
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions402
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_key_actions294
L_libs/main_function_Easy_vacuum_95_10_4_key_actions402:
;libs/main_function.mbas,622 :: 		LCD_Out(2,9, "Heater running")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,623 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,624 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_libs/main_function_Easy_vacuum_95_10_4_key_actions296:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions296
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions296
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions296
;libs/main_function.mbas,625 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_Start_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_Start_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_Start_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_Start_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,626 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+20, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+19, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+18, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+17, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+16, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+15, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+20
	LDD        R21, Y+19
	LDD        R20, Y+18
	LDD        R19, Y+17
	LDD        R18, Y+16
	LDD        R17, Y+15
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
	POP        R2
;libs/main_function.mbas,629 :: 		Easy_vacuum_95_10_4_simple(prog_number)
	PUSH       R2
	CALL       _Easy_vacuum_95_10_4_simple+0
	POP        R2
;libs/main_function.mbas,630 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_key_actions294:
;libs/main_function.mbas,632 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_key_actions286
L_libs/main_function_Easy_vacuum_95_10_4_key_actions287:
;libs/main_function.mbas,634 :: 		while_state_import=1  oldstate_3=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,635 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_key_actions299:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_key_actions300
;libs/main_function.mbas,636 :: 		if (Button(PORTD,1, 0.5, 0)) then    ' Detect logical one up key
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PORTD+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PORTD+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions403
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_key_actions304
L_libs/main_function_Easy_vacuum_95_10_4_key_actions403:
;libs/main_function.mbas,637 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_key_actions304:
;libs/main_function.mbas,639 :: 		if (oldstate_3 and Button(PIND,1,0.5, 1)) then
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions404
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_key_actions307
L_libs/main_function_Easy_vacuum_95_10_4_key_actions404:
;libs/main_function.mbas,640 :: 		LCD_Out(2,9, "Motor running")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,641 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;libs/main_function.mbas,642 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_libs/main_function_Easy_vacuum_95_10_4_key_actions309:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions309
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions309
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_key_actions309
;libs/main_function.mbas,643 :: 		Easy_vacuum_95_10_4_simple(prog_number)
	PUSH       R2
	CALL       _Easy_vacuum_95_10_4_simple+0
	POP        R2
;libs/main_function.mbas,644 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_key_actions307:
;libs/main_function.mbas,646 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_key_actions299
L_libs/main_function_Easy_vacuum_95_10_4_key_actions300:
;libs/main_function.mbas,647 :: 		Write_Time(Dec2Bcd(Start_hours),Dec2Bcd(Start_minutes),Dec2Bcd(Start_seconds),
	PUSH       R2
	LDS        R2, _Start_hours+0
	CALL       _Dec2Bcd+0
	STD        Y+20, R16
	LDS        R2, _Start_minutes+0
	CALL       _Dec2Bcd+0
	STD        Y+19, R16
	LDS        R2, _Start_seconds+0
	CALL       _Dec2Bcd+0
	STD        Y+18, R16
;libs/main_function.mbas,648 :: 		Dec2Bcd(Start_day),Dec2Bcd(Start_week),Dec2Bcd(Start_month),Dec2Bcd(Start_year))
	LDS        R2, _Start_day+0
	CALL       _Dec2Bcd+0
	STD        Y+17, R16
	LDS        R2, _Start_week+0
	CALL       _Dec2Bcd+0
	STD        Y+16, R16
	LDS        R2, _Start_month+0
	CALL       _Dec2Bcd+0
	STD        Y+15, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+20
	LDD        R21, Y+19
	LDD        R20, Y+18
	LDD        R19, Y+17
	LDD        R18, Y+16
	LDD        R17, Y+15
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
	POP        R2
;libs/main_function.mbas,650 :: 		end sub
L_end_Easy_vacuum_95_10_4_key_actions:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	ADIW       R28, 20
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Easy_vacuum_95_10_4_key_actions

_libs/main_function_?main:

;libs/main_function.mbas,651 :: 		end.
L_end_libs/main_function_?main:
	RET
; end of _libs/main_function_?main
