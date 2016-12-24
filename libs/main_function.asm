
_radeon_github_10_95:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 22
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,27 :: 		sub procedure radeon_github_10_95()
;libs/main_function.mbas,33 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,34 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;libs/main_function.mbas,35 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;libs/main_function.mbas,36 :: 		Delay_mS(500)
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
;libs/main_function.mbas,37 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;libs/main_function.mbas,38 :: 		Delay_mS(500)
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
;libs/main_function.mbas,67 :: 		for Pwm_chanel_main=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__radeon_github_10_956:
;libs/main_function.mbas,68 :: 		on_test=0
	LDI        R27, 0
	STS        _on_test+0, R27
;libs/main_function.mbas,69 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
L__radeon_github_10_9511:
;libs/main_function.mbas,70 :: 		for on_off2 =1 to 1
	LDI        R27, 1
	STS        _on_off2+0, R27
L__radeon_github_10_9516:
;libs/main_function.mbas,75 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= hours ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= minutes)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
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
	BRLO       L__radeon_github_10_9585
	LDI        R20, 255
L__radeon_github_10_9585:
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
	BRLO       L__radeon_github_10_9586
	LDI        R18, 255
L__radeon_github_10_9586:
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
	BREQ       L__radeon_github_10_9587
	LDI        R27, 255
L__radeon_github_10_9587:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__radeon_github_10_9588
	JMP        L__radeon_github_10_9521
L__radeon_github_10_9588:
;libs/main_function.mbas,79 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= hours ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= minutes)  then
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
	BRLO       L__radeon_github_10_9589
	LDI        R22, 255
L__radeon_github_10_9589:
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
	BRLO       L__radeon_github_10_9590
	LDI        R27, 255
L__radeon_github_10_9590:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__radeon_github_10_9591
	JMP        L__radeon_github_10_9524
L__radeon_github_10_9591:
;libs/main_function.mbas,81 :: 		on_test=1
	LDI        R27, 1
	STS        _on_test+0, R27
;libs/main_function.mbas,82 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,83 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,84 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,85 :: 		Lcd_Out(1,1,"CHANEL IS ACTIVE:")
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
;libs/main_function.mbas,86 :: 		Lcd_Out(2,1,"main CH:") Lcd_Out(2,8,txt) delay_ms(50)
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
;libs/main_function.mbas,98 :: 		end if
	JMP        L__radeon_github_10_9522
;libs/main_function.mbas,99 :: 		else
L__radeon_github_10_9521:
;libs/main_function.mbas,100 :: 		if (on_test=0) then
	LDS        R16, _on_test+0
	CPI        R16, 0
	BREQ       L__radeon_github_10_9592
	JMP        L__radeon_github_10_9529
L__radeon_github_10_9592:
;libs/main_function.mbas,102 :: 		Lcd_Chr(2, 6, (hours div 10)   + 48)
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
;libs/main_function.mbas,103 :: 		Lcd_Chr(2, 7, (hours mod 10)   + 48)  Delay_mS(1000)
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
;libs/main_function.mbas,113 :: 		end if
L__radeon_github_10_9522:
;libs/main_function.mbas,116 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__radeon_github_10_9593
	JMP        L__radeon_github_10_9519
L__radeon_github_10_9593:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__radeon_github_10_9516
L__radeon_github_10_9519:
;libs/main_function.mbas,117 :: 		next chanel
	LDS        R16, _chanel+0
	CPI        R16, 4
	BRNE       L__radeon_github_10_9594
	JMP        L__radeon_github_10_9514
L__radeon_github_10_9594:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__radeon_github_10_9511
L__radeon_github_10_9514:
;libs/main_function.mbas,119 :: 		chanel=Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	STS        _chanel+0, R16
;libs/main_function.mbas,120 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _Pwm_chanel_main+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,121 :: 		Lcd_Out(1,1,"CHANEL IS ACTIVE:")
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
;libs/main_function.mbas,122 :: 		Lcd_Out(2,1,"CH:") Lcd_Out(2,4,txt) delay_ms(50)
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
;libs/main_function.mbas,123 :: 		if   (on_test=1) then
	LDS        R16, _on_test+0
	CPI        R16, 1
	BREQ       L__radeon_github_10_9595
	JMP        L__radeon_github_10_9536
L__radeon_github_10_9595:
;libs/main_function.mbas,124 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,125 :: 		Lcd_Out(1,1,"on pwm mode")
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
;libs/main_function.mbas,126 :: 		bytetostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _chanel+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,128 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,130 :: 		LCD_Out(1,13, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,132 :: 		bytetostr(Pwm_chanel_main,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,133 :: 		LCD_Out(2,3, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,134 :: 		bytetostr(on_off,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _on_off+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,135 :: 		LCD_Out(2,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,136 :: 		Delay_mS(500)
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
;libs/main_function.mbas,138 :: 		else
L__radeon_github_10_9536:
;libs/main_function.mbas,139 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,142 :: 		bytetostr(on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][0],txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
;libs/main_function.mbas,143 :: 		LCD_Out(1,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,144 :: 		bytetostr(Pwm_chanel_main,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,145 :: 		LCD_Out(2,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,146 :: 		Lcd_Out(1,1,"offfff")
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
;libs/main_function.mbas,147 :: 		Delay_mS(500)
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
;libs/main_function.mbas,148 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,149 :: 		end if
L__radeon_github_10_9537:
;libs/main_function.mbas,150 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 7
	BRNE       L__radeon_github_10_9596
	JMP        L__radeon_github_10_959
L__radeon_github_10_9596:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__radeon_github_10_956
L__radeon_github_10_959:
;libs/main_function.mbas,156 :: 		end sub                                                ' endless loop
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

;libs/main_function.mbas,158 :: 		sub procedure Easy_vacuum_95_10_4(dim program_number as byte)
;libs/main_function.mbas,164 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,165 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;libs/main_function.mbas,166 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;libs/main_function.mbas,167 :: 		Delay_mS(500)
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
;libs/main_function.mbas,168 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;libs/main_function.mbas,169 :: 		Delay_mS(500)
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
;libs/main_function.mbas,198 :: 		for Pwm_chanel_main=1 to 4  ' equal to motor or heater
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__Easy_vacuum_95_10_448:
;libs/main_function.mbas,199 :: 		on_test=0
	LDI        R27, 0
	STS        _on_test+0, R27
;libs/main_function.mbas,201 :: 		for chanel =1 to 1   ' equal to Programs number  changed from days number
	LDI        R27, 1
	STS        _chanel+0, R27
L__Easy_vacuum_95_10_453:
;libs/main_function.mbas,203 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_458:
;libs/main_function.mbas,208 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= minutes ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= seconds)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
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
	BRLO       L__Easy_vacuum_95_10_498
	LDI        R20, 255
L__Easy_vacuum_95_10_498:
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
	BRLO       L__Easy_vacuum_95_10_499
	LDI        R18, 255
L__Easy_vacuum_95_10_499:
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
	BREQ       L__Easy_vacuum_95_10_4100
	LDI        R27, 255
L__Easy_vacuum_95_10_4100:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__Easy_vacuum_95_10_4101
	JMP        L__Easy_vacuum_95_10_463
L__Easy_vacuum_95_10_4101:
;libs/main_function.mbas,212 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= minutes ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= seconds)  then
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
	BRLO       L__Easy_vacuum_95_10_4102
	LDI        R22, 255
L__Easy_vacuum_95_10_4102:
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
	BRLO       L__Easy_vacuum_95_10_4103
	LDI        R27, 255
L__Easy_vacuum_95_10_4103:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4104
	JMP        L__Easy_vacuum_95_10_466
L__Easy_vacuum_95_10_4104:
;libs/main_function.mbas,214 :: 		on_test=1
	LDI        R27, 1
	STS        _on_test+0, R27
;libs/main_function.mbas,215 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;libs/main_function.mbas,216 :: 		inttostr(chanel_active,txt)
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,217 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,218 :: 		Lcd_Out(1,1,"Program S ACTIVE:")
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
;libs/main_function.mbas,219 :: 		Lcd_Out(2,1,"main CH:") Lcd_Out(2,8,txt) delay_ms(50)
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
L__Easy_vacuum_95_10_468:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_468
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_468
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_468
;libs/main_function.mbas,221 :: 		Lcd_Out(1,1,"on pwm mode")
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
;libs/main_function.mbas,222 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,223 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,pwm_chanel)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
	LDS        R5, _Pwm_chanel+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
L__Easy_vacuum_95_10_466:
;libs/main_function.mbas,231 :: 		end if
	JMP        L__Easy_vacuum_95_10_464
;libs/main_function.mbas,232 :: 		else
L__Easy_vacuum_95_10_463:
;libs/main_function.mbas,233 :: 		if (on_test=0) then
	LDS        R16, _on_test+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4105
	JMP        L__Easy_vacuum_95_10_471
L__Easy_vacuum_95_10_4105:
;libs/main_function.mbas,235 :: 		Lcd_Chr(2, 6, (hours div 10)   + 48)
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
;libs/main_function.mbas,236 :: 		Lcd_Chr(2, 7, (hours mod 10)   + 48)  Delay_mS(1000)
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
;libs/main_function.mbas,246 :: 		end if
L__Easy_vacuum_95_10_464:
;libs/main_function.mbas,249 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4106
	JMP        L__Easy_vacuum_95_10_461
L__Easy_vacuum_95_10_4106:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_458
L__Easy_vacuum_95_10_461:
;libs/main_function.mbas,250 :: 		next chanel
	LDS        R16, _chanel+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4107
	JMP        L__Easy_vacuum_95_10_456
L__Easy_vacuum_95_10_4107:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__Easy_vacuum_95_10_453
L__Easy_vacuum_95_10_456:
;libs/main_function.mbas,253 :: 		inttostr(chanel,txt)
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,254 :: 		Lcd_Out(1,1,"test CHANEL IS ACTIVE:")
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
;libs/main_function.mbas,255 :: 		Lcd_Out(2,1,"CH:") Lcd_Out(2,4,txt) delay_ms(1000)
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
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__Easy_vacuum_95_10_475:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_475
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_475
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_475
;libs/main_function.mbas,256 :: 		if   (on_test=1) then
	LDS        R16, _on_test+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4108
	JMP        L__Easy_vacuum_95_10_478
L__Easy_vacuum_95_10_4108:
;libs/main_function.mbas,257 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,258 :: 		Lcd_Out(1,1,"on pwm mode")
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
;libs/main_function.mbas,259 :: 		bytetostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _chanel+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,261 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,263 :: 		LCD_Out(1,13, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,265 :: 		bytetostr(Pwm_chanel_main,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,266 :: 		LCD_Out(2,3, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,267 :: 		bytetostr(on_off,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _on_off+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,268 :: 		LCD_Out(2,1, txt)
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
;libs/main_function.mbas,269 :: 		Delay_mS(500)
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
	JMP        L__Easy_vacuum_95_10_479
;libs/main_function.mbas,271 :: 		else
L__Easy_vacuum_95_10_478:
;libs/main_function.mbas,272 :: 		Lcd_0()
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,275 :: 		bytetostr(on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][0],txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
;libs/main_function.mbas,276 :: 		LCD_Out(1,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,277 :: 		bytetostr(Pwm_chanel_main,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;libs/main_function.mbas,278 :: 		LCD_Out(2,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,279 :: 		Lcd_Out(1,1,"offfff")
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
;libs/main_function.mbas,280 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_482:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_482
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_482
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_482
	NOP
;libs/main_function.mbas,281 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
;libs/main_function.mbas,282 :: 		end if
L__Easy_vacuum_95_10_479:
;libs/main_function.mbas,283 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 4
	BRNE       L__Easy_vacuum_95_10_4109
	JMP        L__Easy_vacuum_95_10_451
L__Easy_vacuum_95_10_4109:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__Easy_vacuum_95_10_448
L__Easy_vacuum_95_10_451:
;libs/main_function.mbas,289 :: 		end sub                                                ' endless loop
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

_libs/main_function_?main:

;libs/main_function.mbas,292 :: 		end.
L_end_libs/main_function_?main:
	RET
; end of _libs/main_function_?main
