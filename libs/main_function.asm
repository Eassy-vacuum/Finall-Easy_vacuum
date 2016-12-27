
_Key_Port_Init_mainfunc:

;libs/main_function.mbas,76 :: 		sub procedure Key_Port_Init_mainfunc()
;libs/main_function.mbas,87 :: 		DDB4_bit = 0 DDB2_bit = 0  DDB0_bit = 0  DDB1_bit = 0              ' Set PORTE pin 7 as input pin for the Heater switches
	IN         R27, DDB4_bit+0
	CBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
	IN         R27, DDB2_bit+0
	CBR        R27, BitMask(DDB2_bit+0)
	OUT        DDB2_bit+0, R27
	IN         R27, DDB0_bit+0
	CBR        R27, BitMask(DDB0_bit+0)
	OUT        DDB0_bit+0, R27
	IN         R27, DDB1_bit+0
	CBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
;libs/main_function.mbas,88 :: 		DDD2_bit = 0 DDD3_bit = 0   DDD5_bit = 0
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
	IN         R27, DDD5_bit+0
	CBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
;libs/main_function.mbas,90 :: 		DDD6_bit = 1
	IN         R27, DDD6_bit+0
	SBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;libs/main_function.mbas,92 :: 		end sub                                               ' endless loop
L_end_Key_Port_Init_mainfunc:
	RET
; end of _Key_Port_Init_mainfunc

_Easy_vacuum_95_10_4_simple_heater:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,94 :: 		dim Heater_motor_index as byte
;libs/main_function.mbas,96 :: 		Heater_motor_index=0 Pwm_chanel_main=1  ''as Heater
	PUSH       R5
	PUSH       R6
	LDI        R27, 0
	STD        Y+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,97 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
;libs/main_function.mbas,98 :: 		while  (while_state_import )
L__Easy_vacuum_95_10_4_simple_heater3:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_heater4
;libs/main_function.mbas,99 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_heater194
	JMP        L__Easy_vacuum_95_10_4_simple_heater8
L__Easy_vacuum_95_10_4_simple_heater194:
;libs/main_function.mbas,100 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_heater195
	JMP        L__Easy_vacuum_95_10_4_simple_heater11
L__Easy_vacuum_95_10_4_simple_heater195:
;libs/main_function.mbas,101 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Easy_vacuum_95_10_4_simple_heater11:
;libs/main_function.mbas,103 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_heater196
	JMP        L__Easy_vacuum_95_10_4_simple_heater14
L__Easy_vacuum_95_10_4_simple_heater196:
;libs/main_function.mbas,104 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_heater14:
;libs/main_function.mbas,105 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_heater9
;libs/main_function.mbas,106 :: 		else
L__Easy_vacuum_95_10_4_simple_heater8:
;libs/main_function.mbas,107 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,108 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
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
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_heater16:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_heater16
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_heater16
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_heater16
	NOP
;libs/main_function.mbas,109 :: 		end if
L__Easy_vacuum_95_10_4_simple_heater9:
;libs/main_function.mbas,110 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_heater3
L__Easy_vacuum_95_10_4_simple_heater4:
;libs/main_function.mbas,111 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,113 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,117 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,118 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,119 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,120 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
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
L__Easy_vacuum_95_10_4_simple_heater18:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_heater18
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_heater18
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_heater18
	NOP
;libs/main_function.mbas,121 :: 		Lcd_Out(1,1,"On pwm heater mode")
	MOVW       R30, R28
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,123 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, 0.5, 0)) then    ' Detect logical one up key
	CLR        R6
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_heater197
	JMP        L__Easy_vacuum_95_10_4_simple_heater21
L__Easy_vacuum_95_10_4_simple_heater197:
;libs/main_function.mbas,124 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Easy_vacuum_95_10_4_simple_heater21:
;libs/main_function.mbas,126 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,0.5, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_heater198
	JMP        L__Easy_vacuum_95_10_4_simple_heater24
L__Easy_vacuum_95_10_4_simple_heater198:
;libs/main_function.mbas,127 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,128 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_heater24:
;libs/main_function.mbas,130 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+28, R16
	STD        Y+29, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+28
	LDD        R19, Y+29
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	CPI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_heater199
	JMP        L__Easy_vacuum_95_10_4_simple_heater27
L__Easy_vacuum_95_10_4_simple_heater199:
;libs/main_function.mbas,131 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,132 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,133 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,134 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
	MOVW       R30, R28
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
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
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_heater29:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_heater29
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_heater29
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_heater29
	NOP
	NOP
;libs/main_function.mbas,135 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,136 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+28, R16
	STD        Y+29, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+28
	LDD        R19, Y+29
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
;libs/main_function.mbas,139 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_heater27:
;libs/main_function.mbas,141 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
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
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_heater31:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_heater31
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_heater31
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_heater31
	NOP
;libs/main_function.mbas,142 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_heater:
	POP        R6
	POP        R5
	ADIW       R28, 29
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Easy_vacuum_95_10_4_simple_heater

libs/main_function_Easy_vacuum_95_10_4_simple_Motor:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,147 :: 		dim Time_on as integer
;libs/main_function.mbas,148 :: 		Heater_motor_index=1 Pwm_chanel_main=2  ''as Motor
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 1
	STD        Y+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,149 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
;libs/main_function.mbas,150 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor35:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor36
;libs/main_function.mbas,151 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor201
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor40
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor201:
;libs/main_function.mbas,152 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, 0.5, 0)) then    ' Detect logical one up key
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor202
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor43
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor202:
;libs/main_function.mbas,153 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor43:
;libs/main_function.mbas,155 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,0.5, 1)) then
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor203
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor46
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor203:
;libs/main_function.mbas,156 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor46:
;libs/main_function.mbas,158 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor41
;libs/main_function.mbas,159 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor40:
;libs/main_function.mbas,160 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,161 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
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
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor48:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor48
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor48
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor48
	NOP
;libs/main_function.mbas,162 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor41:
;libs/main_function.mbas,163 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor35
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor36:
;libs/main_function.mbas,164 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,166 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,168 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,169 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,170 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,171 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor50:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor50
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor50
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor50
	NOP
;libs/main_function.mbas,172 :: 		Lcd_Out(1,1,"On pwm Mtor mode")
	MOVW       R30, R28
	ADIW       R30, 1
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
	LDI        R27, 77
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
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
;libs/main_function.mbas,174 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+28, R16
	STD        Y+29, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+28
	LDD        R19, Y+29
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	CPI        R16, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor204
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor53
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor204:
;libs/main_function.mbas,175 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,176 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,177 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,178 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
	MOVW       R30, R28
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
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
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor55:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor55
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor55
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor55
	NOP
	NOP
;libs/main_function.mbas,179 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	ADIW       R30, 1
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
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,180 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+28, R16
	STD        Y+29, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+28
	LDD        R19, Y+29
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
;libs/main_function.mbas,182 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor53:
;libs/main_function.mbas,184 :: 		Lcd_0()Lcd_Out(1,1,"End") Lcd_Out(2,1,"...") delay_ms(200) '' DDD7_bit =0
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	LDI        R27, 69
	STD        Y+1, R27
	LDI        R27, 110
	STD        Y+2, R27
	LDI        R27, 100
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, 46
	STD        Y+1, R27
	LDI        R27, 46
	STD        Y+2, R27
	LDI        R27, 46
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor57:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor57
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor57
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor57
	NOP
;libs/main_function.mbas,185 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_Motor:
	POP        R6
	POP        R5
	POP        R4
	ADIW       R28, 29
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Easy_vacuum_95_10_4_simple_Motor

libs/main_function_Heater_relay_on:

;libs/main_function.mbas,186 :: 		sub procedure Heater_relay_on()
;libs/main_function.mbas,187 :: 		if (while_state_import_main=0) then
	LDS        R27, _while_state_import_main+0
	SBRC       R27, BitPos(_while_state_import_main+0)
	JMP        L_libs/main_function_Heater_relay_on61
;libs/main_function.mbas,188 :: 		Heater_relay_Pin =1
	IN         R27, PIND6_bit+0
	SBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,189 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L_libs/main_function_Heater_relay_on61:
;libs/main_function.mbas,192 :: 		end sub
L_end_Heater_relay_on:
	RET
; end of libs/main_function_Heater_relay_on

_Easy_vacuum_95_10_4_simple_crupted:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 46
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,195 :: 		txt_byte_min,txt_byte_sec as string[3]
;libs/main_function.mbas,196 :: 		Heater_motor_index=1 ''as heater
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 1
	STD        Y+0, R27
;libs/main_function.mbas,206 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
;libs/main_function.mbas,207 :: 		while  (while_state_import )
L__Easy_vacuum_95_10_4_simple_crupted65:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_crupted66
;libs/main_function.mbas,208 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_crupted207
	JMP        L__Easy_vacuum_95_10_4_simple_crupted70
L__Easy_vacuum_95_10_4_simple_crupted207:
;libs/main_function.mbas,209 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 1)) then    ' Detect logical one up key
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted208
	JMP        L__Easy_vacuum_95_10_4_simple_crupted73
L__Easy_vacuum_95_10_4_simple_crupted208:
;libs/main_function.mbas,210 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Easy_vacuum_95_10_4_simple_crupted73:
;libs/main_function.mbas,212 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 0)) then
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted209
	JMP        L__Easy_vacuum_95_10_4_simple_crupted76
L__Easy_vacuum_95_10_4_simple_crupted209:
;libs/main_function.mbas,213 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_crupted76:
;libs/main_function.mbas,214 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_crupted71
;libs/main_function.mbas,215 :: 		else
L__Easy_vacuum_95_10_4_simple_crupted70:
;libs/main_function.mbas,216 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,217 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
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
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_crupted78:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted78
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted78
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted78
	NOP
;libs/main_function.mbas,218 :: 		end if
L__Easy_vacuum_95_10_4_simple_crupted71:
;libs/main_function.mbas,220 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,221 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;libs/main_function.mbas,222 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;libs/main_function.mbas,223 :: 		Delay_mS(300)
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_crupted80:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted80
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted80
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted80
	NOP
	NOP
;libs/main_function.mbas,224 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
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
	POP        R3
;libs/main_function.mbas,225 :: 		Delay_mS(300)
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_crupted82:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted82
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted82
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted82
	NOP
	NOP
;libs/main_function.mbas,227 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_crupted65
L__Easy_vacuum_95_10_4_simple_crupted66:
;libs/main_function.mbas,231 :: 		if (Interupt_en=1) then
	LDI        R27, 1
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_crupted210
	JMP        L__Easy_vacuum_95_10_4_simple_crupted85
L__Easy_vacuum_95_10_4_simple_crupted210:
;libs/main_function.mbas,232 :: 		LCD_Out(2,9, "Heater running")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,233 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,234 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple_crupted87:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted87
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted87
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted87
;libs/main_function.mbas,235 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,236 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+45, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+44, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+43, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+42, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+40, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+38, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+45
	LDD        R21, Y+44
	LDD        R20, Y+43
	LDD        R19, Y+42
	LDD        R18, Y+40
	LDD        R17, Y+38
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
;libs/main_function.mbas,239 :: 		hours=0x1  minutes=0x0   seconds=0x00 day= 0x2 week=2   month=0x11  year=0x16
	LDI        R27, 1
	STS        _hours+0, R27
	LDI        R27, 0
	STS        _minutes+0, R27
	LDI        R27, 0
	STS        _seconds+0, R27
	LDI        R27, 2
	STS        _day+0, R27
	LDI        R27, 2
	STS        _week+0, R27
	LDI        R27, 17
	STS        _month+0, R27
	LDI        R27, 22
	STS        _year+0, R27
;libs/main_function.mbas,240 :: 		Write_Time(hours, minutes, seconds, 0x13, 0x02,   0x11,year)
	LDI        R27, 22
	MOV        R8, R27
	LDI        R27, 17
	MOV        R7, R27
	LDI        R27, 2
	MOV        R6, R27
	LDI        R27, 19
	MOV        R5, R27
	CLR        R4
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Write_Time+0
;libs/main_function.mbas,241 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,244 :: 		Pwm_chanel_main=1 Pwm_chanel=Pwm_chanel_main ''heater
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
;libs/main_function.mbas,246 :: 		txt="Heater"
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
;libs/main_function.mbas,247 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
;libs/main_function.mbas,252 :: 		end if
L__Easy_vacuum_95_10_4_simple_crupted91:
;libs/main_function.mbas,253 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2], txt_byte_min)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R18, Z
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	PUSH       R3
	PUSH       R2
	MOV        R3, R16
	MOV        R4, R17
	MOV        R2, R18
	CALL       _ByteToStr+0
;libs/main_function.mbas,254 :: 		StrToInt(txt_byte_min)
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _StrToInt+0
;libs/main_function.mbas,255 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,txt_byte_min) delay_ms(2000) '' DDD7_bit =0
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
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
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L__Easy_vacuum_95_10_4_simple_crupted95:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted95
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted95
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted95
	NOP
	NOP
	NOP
	NOP
;libs/main_function.mbas,261 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,262 :: 		inttostr(( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]),txt)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDI        R17, 0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;libs/main_function.mbas,263 :: 		inttostr(Bcd2Dec(minutes),txt)
	LDS        R2, _minutes+0
	CALL       _Bcd2Dec+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,264 :: 		Lcd_Out(2,1,txt) Lcd_Out(1,1,"min in a is :") delay_ms(1000)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 97
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__Easy_vacuum_95_10_4_simple_crupted97:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted97
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted97
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted97
;libs/main_function.mbas,265 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,266 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+45, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+44, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+43, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+42, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+40, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+38, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+45
	LDD        R21, Y+44
	LDD        R20, Y+43
	LDD        R19, Y+42
	LDD        R18, Y+40
	LDD        R17, Y+38
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
;libs/main_function.mbas,269 :: 		hours=0x1  minutes=0x00   seconds=0x00 day= 0x2 week=2   month=0x11  year=0x16
	LDI        R27, 1
	STS        _hours+0, R27
	LDI        R27, 0
	STS        _minutes+0, R27
	LDI        R27, 0
	STS        _seconds+0, R27
	LDI        R27, 2
	STS        _day+0, R27
	LDI        R27, 2
	STS        _week+0, R27
	LDI        R27, 17
	STS        _month+0, R27
	LDI        R27, 22
	STS        _year+0, R27
;libs/main_function.mbas,270 :: 		Write_Time(hours, minutes, seconds, 0x13, 0x02,   0x11,year)
	LDI        R27, 22
	MOV        R8, R27
	LDI        R27, 17
	MOV        R7, R27
	LDI        R27, 2
	MOV        R6, R27
	LDI        R27, 19
	MOV        R5, R27
	CLR        R4
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Write_Time+0
;libs/main_function.mbas,271 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,275 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,279 :: 		if  (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds)  and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+40, R16
	STD        Y+41, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
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
	CP         R19, R18
	LDI        R20, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_crupted211
	LDI        R20, 255
L__Easy_vacuum_95_10_4_simple_crupted211:
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R21, Y+40
	LDD        R22, Y+41
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_crupted212
	LDI        R18, 255
L__Easy_vacuum_95_10_4_simple_crupted212:
	AND        R20, R18
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_crupted213
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_crupted213:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted214
	JMP        L__Easy_vacuum_95_10_4_simple_crupted103
L__Easy_vacuum_95_10_4_simple_crupted214:
;libs/main_function.mbas,284 :: 		inttostr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],txt)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDI        R17, 0
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;libs/main_function.mbas,285 :: 		inttostr(minutes,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _minutes+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,286 :: 		Lcd_Out(2,1,txt) Lcd_Out(1,1,"1 chcked:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,288 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple_crupted105:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted105
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted105
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted105
;libs/main_function.mbas,289 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, 0.5, 1)) then    ' Detect logical one up key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted215
	JMP        L__Easy_vacuum_95_10_4_simple_crupted108
L__Easy_vacuum_95_10_4_simple_crupted215:
;libs/main_function.mbas,290 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_crupted108:
;libs/main_function.mbas,292 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,0.5, 0)) then
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted216
	JMP        L__Easy_vacuum_95_10_4_simple_crupted111
L__Easy_vacuum_95_10_4_simple_crupted216:
;libs/main_function.mbas,293 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,295 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_crupted111:
;libs/main_function.mbas,296 :: 		end if
L__Easy_vacuum_95_10_4_simple_crupted103:
;libs/main_function.mbas,301 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+45, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+44, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+43, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+42, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+40, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+38, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+45
	LDD        R21, Y+44
	LDD        R20, Y+43
	LDD        R19, Y+42
	LDD        R18, Y+40
	LDD        R17, Y+38
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
;libs/main_function.mbas,304 :: 		hours=0x1  minutes=0x00   seconds=0x00 day= 0x2 week=2   month=0x11  year=0x16
	LDI        R27, 1
	STS        _hours+0, R27
	LDI        R27, 0
	STS        _minutes+0, R27
	LDI        R27, 0
	STS        _seconds+0, R27
	LDI        R27, 2
	STS        _day+0, R27
	LDI        R27, 2
	STS        _week+0, R27
	LDI        R27, 17
	STS        _month+0, R27
	LDI        R27, 22
	STS        _year+0, R27
;libs/main_function.mbas,305 :: 		Write_Time(hours, minutes, seconds, 0x13, 0x02,   0x11,year)
	LDI        R27, 22
	MOV        R8, R27
	LDI        R27, 17
	MOV        R7, R27
	LDI        R27, 2
	MOV        R6, R27
	LDI        R27, 19
	MOV        R5, R27
	CLR        R4
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Write_Time+0
;libs/main_function.mbas,306 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,307 :: 		oldstate_3 =0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,310 :: 		Heater_relay_Pin =0  oldstate_3 = 0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,311 :: 		while_state_import=1    while_state_import_main=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,312 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_crupted114:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_crupted115
;libs/main_function.mbas,315 :: 		if  (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+40, R16
	STD        Y+41, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
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
	CP         R19, R18
	LDI        R22, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_crupted217
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_crupted217:
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+40
	LDD        R19, Y+41
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R17, R16
	LDI        R16, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_crupted218
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_crupted218:
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted219
	JMP        L__Easy_vacuum_95_10_4_simple_crupted122
L__Easy_vacuum_95_10_4_simple_crupted219:
;libs/main_function.mbas,317 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	PUSH       R3
	PUSH       R2
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
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,318 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,319 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
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
L__Easy_vacuum_95_10_4_simple_crupted124:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted124
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted124
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted124
	NOP
;libs/main_function.mbas,320 :: 		Lcd_Out(1,1,"On pwm heater mode")
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,322 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
;libs/main_function.mbas,323 :: 		Heater_relay_on()
	CALL       libs/main_function_Heater_relay_on+0
;libs/main_function.mbas,328 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, 0.5, 1)) then    ' Detect logical one up key
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted220
	JMP        L__Easy_vacuum_95_10_4_simple_crupted127
L__Easy_vacuum_95_10_4_simple_crupted220:
;libs/main_function.mbas,329 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,330 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R3
	PUSH       R2
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
L__Easy_vacuum_95_10_4_simple_crupted127:
;libs/main_function.mbas,332 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,0.5, 0)) then
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted221
	JMP        L__Easy_vacuum_95_10_4_simple_crupted130
L__Easy_vacuum_95_10_4_simple_crupted221:
;libs/main_function.mbas,333 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,334 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R3
	PUSH       R2
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
;libs/main_function.mbas,335 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_crupted130:
;libs/main_function.mbas,338 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
	JMP        L__Easy_vacuum_95_10_4_simple_crupted123
;libs/main_function.mbas,339 :: 		else
L__Easy_vacuum_95_10_4_simple_crupted122:
;libs/main_function.mbas,342 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,343 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,344 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,345 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
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
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_crupted132:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted132
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted132
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted132
	NOP
	NOP
;libs/main_function.mbas,346 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,347 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,348 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
;libs/main_function.mbas,349 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,350 :: 		end if
L__Easy_vacuum_95_10_4_simple_crupted123:
;libs/main_function.mbas,353 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_crupted114
L__Easy_vacuum_95_10_4_simple_crupted115:
;libs/main_function.mbas,403 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_crupted85:
;libs/main_function.mbas,410 :: 		Heater_motor_index=2 ''as Motor
	LDI        R27, 2
	STD        Y+0, R27
;libs/main_function.mbas,411 :: 		Pwm_chanel_main=2 ''Motor
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,412 :: 		while_state_import=1 Pwm_chanel=Pwm_chanel_main ''while_state_import_main2=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel+0, R27
;libs/main_function.mbas,414 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,415 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
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
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_crupted134:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted134
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted134
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted134
	NOP
;libs/main_function.mbas,416 :: 		if (oldstate_3=1) then
	LDS        R27, _oldstate_3+0
	SBRS       R27, BitPos(_oldstate_3+0)
	JMP        L__Easy_vacuum_95_10_4_simple_crupted137
;libs/main_function.mbas,417 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L__Easy_vacuum_95_10_4_simple_crupted137:
;libs/main_function.mbas,419 :: 		while  (while_state_import_main )
L__Easy_vacuum_95_10_4_simple_crupted140:
	LDS        R27, _while_state_import_main+0
	SBRS       R27, BitPos(_while_state_import_main+0)
	JMP        L__Easy_vacuum_95_10_4_simple_crupted141
;libs/main_function.mbas,421 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, 0.5, 1)) then    ' Detect logical one up key
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted222
	JMP        L__Easy_vacuum_95_10_4_simple_crupted145
L__Easy_vacuum_95_10_4_simple_crupted222:
;libs/main_function.mbas,422 :: 		oldstate_3 = 1  while_state_import_main=0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L__Easy_vacuum_95_10_4_simple_crupted145:
;libs/main_function.mbas,424 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,0.5, 0)) then
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted223
	JMP        L__Easy_vacuum_95_10_4_simple_crupted148
L__Easy_vacuum_95_10_4_simple_crupted223:
;libs/main_function.mbas,425 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L__Easy_vacuum_95_10_4_simple_crupted148:
;libs/main_function.mbas,427 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
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
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 251
	SBCI       R17, 255
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 5
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_crupted150:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted150
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted150
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted150
	NOP
;libs/main_function.mbas,428 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_crupted140
L__Easy_vacuum_95_10_4_simple_crupted141:
;libs/main_function.mbas,429 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,436 :: 		Heater_relay_on()
	CALL       libs/main_function_Heater_relay_on+0
;libs/main_function.mbas,439 :: 		LCD_Out(2,9, "motor running")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,440 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,441 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple_crupted155:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted155
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted155
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted155
;libs/main_function.mbas,442 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,443 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+45, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+44, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+43, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+42, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+40, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+38, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+45
	LDD        R21, Y+44
	LDD        R20, Y+43
	LDD        R19, Y+42
	LDD        R18, Y+40
	LDD        R17, Y+38
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
	POP        R2
	POP        R3
;libs/main_function.mbas,446 :: 		week=1
	LDI        R27, 1
	STS        _week+0, R27
;libs/main_function.mbas,447 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,449 :: 		if  (Pwm_chanel_main=1) then
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4_simple_crupted224
	JMP        L__Easy_vacuum_95_10_4_simple_crupted158
L__Easy_vacuum_95_10_4_simple_crupted224:
;libs/main_function.mbas,450 :: 		txt="Heater"
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
;libs/main_function.mbas,451 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_crupted159
;libs/main_function.mbas,452 :: 		else if  (Pwm_chanel_main=2)  then
L__Easy_vacuum_95_10_4_simple_crupted158:
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple_crupted225
	JMP        L__Easy_vacuum_95_10_4_simple_crupted161
L__Easy_vacuum_95_10_4_simple_crupted225:
;libs/main_function.mbas,453 :: 		txt="Motor"
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
;libs/main_function.mbas,454 :: 		Mo_start_min= minutes   Mo_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _Mo_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _Mo_start_sec+0, R16
L__Easy_vacuum_95_10_4_simple_crupted161:
;libs/main_function.mbas,456 :: 		end if
L__Easy_vacuum_95_10_4_simple_crupted159:
;libs/main_function.mbas,463 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+45, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+44, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+43, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+42, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+40, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+38, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+45
	LDD        R21, Y+44
	LDD        R20, Y+43
	LDD        R19, Y+42
	LDD        R18, Y+40
	LDD        R17, Y+38
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
;libs/main_function.mbas,466 :: 		hours=0x1  minutes=0x0   seconds=0x00 day= 0x2 week=2   month=0x11  year=0x16
	LDI        R27, 1
	STS        _hours+0, R27
	LDI        R27, 0
	STS        _minutes+0, R27
	LDI        R27, 0
	STS        _seconds+0, R27
	LDI        R27, 2
	STS        _day+0, R27
	LDI        R27, 2
	STS        _week+0, R27
	LDI        R27, 17
	STS        _month+0, R27
	LDI        R27, 22
	STS        _year+0, R27
;libs/main_function.mbas,467 :: 		Write_Time(hours, minutes, seconds, 0x13, 0x02,   0x11,year)
	LDI        R27, 22
	MOV        R8, R27
	LDI        R27, 17
	MOV        R7, R27
	LDI        R27, 2
	MOV        R6, R27
	LDI        R27, 19
	MOV        R5, R27
	CLR        R4
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Write_Time+0
;libs/main_function.mbas,468 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,469 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,470 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_4_simple_crupted164:
;libs/main_function.mbas,473 :: 		while_state_import=1 j=10
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 10
	STS        _j+0, R27
;libs/main_function.mbas,474 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_crupted172:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_crupted173
;libs/main_function.mbas,476 :: 		if  (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds)  and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+40, R16
	STD        Y+41, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
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
	CP         R19, R18
	LDI        R20, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_crupted226
	LDI        R20, 255
L__Easy_vacuum_95_10_4_simple_crupted226:
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R21, Y+40
	LDD        R22, Y+41
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_crupted227
	LDI        R18, 255
L__Easy_vacuum_95_10_4_simple_crupted227:
	AND        R20, R18
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_crupted228
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_crupted228:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted229
	JMP        L__Easy_vacuum_95_10_4_simple_crupted177
L__Easy_vacuum_95_10_4_simple_crupted229:
;libs/main_function.mbas,479 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,480 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,481 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel_active+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,482 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
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
L__Easy_vacuum_95_10_4_simple_crupted179:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted179
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted179
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted179
	NOP
;libs/main_function.mbas,483 :: 		Lcd_Out(1,1,"On pwm Motor mode")
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,484 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
	POP        R2
	POP        R3
;libs/main_function.mbas,485 :: 		for k=1 to j  step 1
	LDI        R27, 1
	STS        _k+0, R27
	LDI        R27, 0
	STS        _k+1, R27
L__Easy_vacuum_95_10_4_simple_crupted181:
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDS        R16, _j+0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__Easy_vacuum_95_10_4_simple_crupted230
	JMP        L__Easy_vacuum_95_10_4_simple_crupted185
L__Easy_vacuum_95_10_4_simple_crupted230:
;libs/main_function.mbas,486 :: 		PWM_MAKE (k*10,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R20, _k+0
	LDS        R21, _k+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	PUSH       R3
	PUSH       R2
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
;libs/main_function.mbas,487 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_4_simple_crupted186:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted186
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted186
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted186
	NOP
;libs/main_function.mbas,488 :: 		next k
	LDS        R17, _k+0
	LDS        R18, _k+1
	LDS        R16, _j+0
	CP         R17, R16
	LDI        R27, 0
	CPC        R18, R27
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted231
	JMP        L__Easy_vacuum_95_10_4_simple_crupted185
L__Easy_vacuum_95_10_4_simple_crupted231:
	LDS        R16, _k+0
	LDS        R17, _k+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _k+0, R16
	STS        _k+1, R17
	JMP        L__Easy_vacuum_95_10_4_simple_crupted181
L__Easy_vacuum_95_10_4_simple_crupted185:
;libs/main_function.mbas,489 :: 		j=0
	LDI        R27, 0
	STS        _j+0, R27
;libs/main_function.mbas,490 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	PUSH       R3
	PUSH       R2
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,491 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
	JMP        L__Easy_vacuum_95_10_4_simple_crupted178
;libs/main_function.mbas,493 :: 		else
L__Easy_vacuum_95_10_4_simple_crupted177:
;libs/main_function.mbas,494 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,495 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,496 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
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
L__Easy_vacuum_95_10_4_simple_crupted188:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted188
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted188
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted188
	NOP
;libs/main_function.mbas,497 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,498 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,499 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
;libs/main_function.mbas,500 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,501 :: 		end if
L__Easy_vacuum_95_10_4_simple_crupted178:
;libs/main_function.mbas,502 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_crupted172
L__Easy_vacuum_95_10_4_simple_crupted173:
;libs/main_function.mbas,507 :: 		end if
L__Easy_vacuum_95_10_4_simple_crupted170:
;libs/main_function.mbas,508 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted232
	JMP        L__Easy_vacuum_95_10_4_simple_crupted167
L__Easy_vacuum_95_10_4_simple_crupted232:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_crupted164
L__Easy_vacuum_95_10_4_simple_crupted167:
;libs/main_function.mbas,512 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,514 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,518 :: 		Read_Time(@Start_hours, @End_minutes_next, @End_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,519 :: 		Write_Time(Dec2Bcd(Start_hours),Dec2Bcd(Start_minutes+End_minutes_next),Dec2Bcd(Start_seconds+End_seconds_next),
	LDS        R2, _Start_hours+0
	CALL       _Dec2Bcd+0
	STD        Y+45, R16
	LDS        R17, _Start_minutes+0
	LDS        R16, _End_minutes_next+0
	ADD        R16, R17
	MOV        R2, R16
	CALL       _Dec2Bcd+0
	STD        Y+44, R16
	LDS        R17, _Start_seconds+0
	LDS        R16, _End_seconds_next+0
	ADD        R16, R17
	MOV        R2, R16
	CALL       _Dec2Bcd+0
	STD        Y+43, R16
;libs/main_function.mbas,520 :: 		Dec2Bcd(Start_day),Dec2Bcd(Start_week),Dec2Bcd(Start_month),Dec2Bcd(Start_year))
	LDS        R2, _Start_day+0
	CALL       _Dec2Bcd+0
	STD        Y+42, R16
	LDS        R2, _Start_week+0
	CALL       _Dec2Bcd+0
	STD        Y+40, R16
	LDS        R2, _Start_month+0
	CALL       _Dec2Bcd+0
	STD        Y+38, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+45
	LDD        R21, Y+44
	LDD        R20, Y+43
	LDD        R19, Y+42
	LDD        R18, Y+40
	LDD        R17, Y+38
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
;libs/main_function.mbas,522 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,523 :: 		inttostr(End_seconds_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_seconds_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,524 :: 		Lcd_Out(1,1,"Sec ended is :") Lcd_Out(1,10,txt)
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
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
;libs/main_function.mbas,525 :: 		inttostr(End_minutes_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_minutes_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,526 :: 		Lcd_Out(2,1,"Min ended is :") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 5
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
	SUBI       R16, 251
	SBCI       R17, 255
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
	POP        R3
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_crupted190:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted190
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted190
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_crupted190
	NOP
;libs/main_function.mbas,527 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_crupted:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	ADIW       R28, 45
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Easy_vacuum_95_10_4_simple_crupted

_libs/main_function_?main:

;libs/main_function.mbas,529 :: 		end.
L_end_libs/main_function_?main:
	RET
; end of _libs/main_function_?main
