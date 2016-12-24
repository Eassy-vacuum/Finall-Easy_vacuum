
_interrupt_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,75 :: 		sub procedure interrupt_ISR () org IVT_ADDR_INT2            ''// Interrupt rutine
;MyProject.mbas,78 :: 		if Interupt_first_time=0 then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDS        R16, _Interupt_first_time+0
	CPI        R16, 0
	BREQ       L__interrupt_ISR71
	JMP        L__interrupt_ISR2
L__interrupt_ISR71:
;MyProject.mbas,79 :: 		Interupt_first_time=1
	LDI        R27, 1
	STS        _Interupt_first_time+0, R27
;MyProject.mbas,81 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,82 :: 		Lcd_Out(1,1,"Interupt_first_time=0")
	MOVW       R30, R28
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
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
;MyProject.mbas,83 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__interrupt_ISR4:
	DEC        R16
	BRNE       L__interrupt_ISR4
	DEC        R17
	BRNE       L__interrupt_ISR4
	DEC        R18
	BRNE       L__interrupt_ISR4
	JMP        L__interrupt_ISR3
;MyProject.mbas,84 :: 		else
L__interrupt_ISR2:
;MyProject.mbas,85 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,87 :: 		WDT_on()
	CALL       _WDT_on+0
;MyProject.mbas,89 :: 		INT2_bit = 0
	IN         R27, INT2_bit+0
	CBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;MyProject.mbas,91 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;MyProject.mbas,92 :: 		Keypad_set__date_time_import_On_hour_teben(week,hours,minutes,23,0)
	CLR        R6
	LDI        R27, 23
	MOV        R5, R27
	LDS        R4, _minutes+0
	LDS        R3, _hours+0
	LDS        R2, _week+0
	CALL       _Keypad_set__date_time_import_On_hour_teben+0
;MyProject.mbas,93 :: 		Keypad_set__date_time_import_On_minut_teben(week,on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][1],minutes,59,0)
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
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+22
	LDD        R19, Y+23
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
	ADIW       R30, 1
	LD         R16, Z
	CLR        R6
	LDI        R27, 59
	MOV        R5, R27
	LDS        R4, _minutes+0
	MOV        R3, R16
	LDS        R2, _week+0
	CALL       _Keypad_set__date_time_import_On_minut_teben+0
;MyProject.mbas,94 :: 		Keypad_set__date_time_import_Yes_No_teben( week,chanel,1, 2,1 )
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 2
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	LDS        R3, _chanel+0
	LDS        R2, _week+0
	CALL       _Keypad_set__date_time_import_Yes_No_teben+0
;MyProject.mbas,95 :: 		Keypad_set__date_time_import_PWM_Red_teben(1,1,on_a_0[week_new-1][chanel-1][Pwm_chanel-1][on_off2-1][3],100,0,on_a_0[week_new-1][0][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][1][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][2][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][3][Pwm_chanel-1][on_off2-1][3],0,0,0,0,0)''on_a_0[week_new-1][4][Pwm_chanel-1][on_off2-1][3],0,0,0,0) ''on_a_0[week_new-1][5][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][6][Pwm_chanel-1][on_off2-1][3],0,0) ''on_a_0[week_new-1][7][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][8][Pwm_chanel-1][on_off2-1][3]) ''(dim mode_1,Pwm_chanel,var_in as byte, dim p_max as  byte, dim p_min as  byte )
	LDS        R16, _week_new+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+24, R16
	STD        Y+25, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+22
	LDD        R19, Y+23
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	LSL        R2
	ROL        R3
	LSL        R2
	ROL        R3
	LSL        R2
	ROL        R3
	MOVW       R18, R2
	ADD        R18, R20
	ADC        R19, R21
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	MOV        R24, R16
	LDI        R25, 0
	LSL        R24
	ROL        R25
	LSL        R24
	ROL        R25
	MOVW       R16, R24
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R23, Z
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	LDD        R21, Y+24
	LDD        R22, Y+25
	ADD        R16, R21
	ADC        R17, R22
	ADD        R16, R2
	ADC        R17, R3
	ADD        R16, R24
	ADC        R17, R25
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R20, Z
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	ADD        R16, R21
	ADC        R17, R22
	SUBI       R16, 200
	SBCI       R17, 255
	ADD        R16, R2
	ADC        R17, R3
	ADD        R16, R24
	ADC        R17, R25
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R19, Z
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	ADD        R16, R21
	ADC        R17, R22
	SUBI       R16, 144
	SBCI       R17, 255
	ADD        R16, R2
	ADC        R17, R3
	ADD        R16, R24
	ADC        R17, R25
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R18, Z
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	ADD        R16, R21
	ADC        R17, R22
	SUBI       R16, 88
	SBCI       R17, 255
	ADD        R16, R2
	ADC        R17, R3
	ADD        R16, R24
	ADC        R17, R25
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	MOV        R9, R18
	MOV        R8, R19
	MOV        R7, R20
	CLR        R6
	LDI        R27, 100
	MOV        R5, R27
	MOV        R4, R23
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	PUSH       R27
	LDI        R27, 0
	PUSH       R27
	LDI        R27, 0
	PUSH       R27
	LDI        R27, 0
	PUSH       R27
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _Keypad_set__date_time_import_PWM_Red_teben+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,96 :: 		Keypad_set__date_time_import_save_exit_teben (week,1,1,0)
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _week+0
	CALL       _Keypad_set__date_time_import_save_exit_teben+0
;MyProject.mbas,97 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;MyProject.mbas,101 :: 		Keypad_3()
	CALL       _Keypad_3+0
;MyProject.mbas,102 :: 		txt1 = "<int is selected"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,103 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,104 :: 		if (Button(PIND, 2, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__interrupt_ISR72
	JMP        L__interrupt_ISR7
L__interrupt_ISR72:
;MyProject.mbas,105 :: 		oldstate = 1
	LDS        R27, _oldstate+0
	SBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,106 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,109 :: 		Delay_mS(400)                      ' Update flag
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__interrupt_ISR9:
	DEC        R16
	BRNE       L__interrupt_ISR9
	DEC        R17
	BRNE       L__interrupt_ISR9
	DEC        R18
	BRNE       L__interrupt_ISR9
L__interrupt_ISR7:
;MyProject.mbas,111 :: 		if (oldstate and Button(PIND, 2, 0.1, 0)) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate+0)
	INC        R17
	AND        R16, R17
	BRNE       L__interrupt_ISR73
	JMP        L__interrupt_ISR12
L__interrupt_ISR73:
;MyProject.mbas,112 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,113 :: 		txt1 = "<good>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,114 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,115 :: 		Delay_mS(400)
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__interrupt_ISR14:
	DEC        R16
	BRNE       L__interrupt_ISR14
	DEC        R17
	BRNE       L__interrupt_ISR14
	DEC        R18
	BRNE       L__interrupt_ISR14
L__interrupt_ISR12:
;MyProject.mbas,119 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;MyProject.mbas,120 :: 		INT2_bit = 1
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;MyProject.mbas,122 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,130 :: 		end if
L__interrupt_ISR3:
;MyProject.mbas,131 :: 		end sub
L_end_interrupt_ISR:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 25
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _interrupt_ISR

_interrupt_ISR_0:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 5
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,133 :: 		sub procedure interrupt_ISR_0 () org IVT_ADDR_INT0            ''// Interrupt rutine
;MyProject.mbas,136 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,137 :: 		LCD_Out(2,1, "INT0")
	MOVW       R30, R28
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 48
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
;MyProject.mbas,138 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__interrupt_ISR_017:
	DEC        R16
	BRNE       L__interrupt_ISR_017
	DEC        R17
	BRNE       L__interrupt_ISR_017
	DEC        R18
	BRNE       L__interrupt_ISR_017
;MyProject.mbas,139 :: 		WDT_on()
	CALL       _WDT_on+0
;MyProject.mbas,140 :: 		INTF0_bit=0                                                  '  // Clear interrupt flag
	IN         R27, INTF0_bit+0
	CBR        R27, BitMask(INTF0_bit+0)
	OUT        INTF0_bit+0, R27
;MyProject.mbas,141 :: 		INT0_bit = 0
	IN         R27, INT0_bit+0
	CBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,142 :: 		Keypad_3()
	CALL       _Keypad_3+0
;MyProject.mbas,145 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;MyProject.mbas,146 :: 		INT0_bit = 1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,148 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,156 :: 		end sub
L_end_interrupt_ISR_0:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _interrupt_ISR_0

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 22
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,160 :: 		main:
;MyProject.mbas,161 :: 		DDB0_bit = 1                                       ' set Button pin as input
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	IN         R27, DDB0_bit+0
	SBR        R27, BitMask(DDB0_bit+0)
	OUT        DDB0_bit+0, R27
;MyProject.mbas,162 :: 		DDA2_bit = 1                                        ' set Button pin as input
	IN         R27, DDA2_bit+0
	SBR        R27, BitMask(DDA2_bit+0)
	OUT        DDA2_bit+0, R27
;MyProject.mbas,165 :: 		DDA5_bit = 1                                        ' set Button pin as input
	IN         R27, DDA5_bit+0
	SBR        R27, BitMask(DDA5_bit+0)
	OUT        DDA5_bit+0, R27
;MyProject.mbas,166 :: 		DDA4_bit = 1                                        ' set Button pin as input
	IN         R27, DDA4_bit+0
	SBR        R27, BitMask(DDA4_bit+0)
	OUT        DDA4_bit+0, R27
;MyProject.mbas,167 :: 		DDA3_bit = 1                                        ' set Button pin as input
	IN         R27, DDA3_bit+0
	SBR        R27, BitMask(DDA3_bit+0)
	OUT        DDA3_bit+0, R27
;MyProject.mbas,168 :: 		DDC2_bit =1   DDC3_bit =1
	IN         R27, DDC2_bit+0
	SBR        R27, BitMask(DDC2_bit+0)
	OUT        DDC2_bit+0, R27
	IN         R27, DDC3_bit+0
	SBR        R27, BitMask(DDC3_bit+0)
	OUT        DDC3_bit+0, R27
;MyProject.mbas,169 :: 		DDC4_bit =1   DDC5_bit =1  ' configure PORTD as output
	IN         R27, DDC4_bit+0
	SBR        R27, BitMask(DDC4_bit+0)
	OUT        DDC4_bit+0, R27
	IN         R27, DDC5_bit+0
	SBR        R27, BitMask(DDC5_bit+0)
	OUT        DDC5_bit+0, R27
;MyProject.mbas,170 :: 		DDC6_bit =1
	IN         R27, DDC6_bit+0
	SBR        R27, BitMask(DDC6_bit+0)
	OUT        DDC6_bit+0, R27
;MyProject.mbas,171 :: 		DDC7_bit =1
	IN         R27, DDC7_bit+0
	SBR        R27, BitMask(DDC7_bit+0)
	OUT        DDC7_bit+0, R27
;MyProject.mbas,173 :: 		DDD2_bit =0 DDD3_bit =1   DDD4_bit =0  ' configure PORTD as output
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	SBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
	IN         R27, DDD4_bit+0
	CBR        R27, BitMask(DDD4_bit+0)
	OUT        DDD4_bit+0, R27
;MyProject.mbas,174 :: 		DDD5_bit =0 DDD6_bit =0     DDD7_bit =1
	IN         R27, DDD5_bit+0
	CBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
	IN         R27, DDD6_bit+0
	CBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
	IN         R27, DDD7_bit+0
	SBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;MyProject.mbas,175 :: 		DDB1_bit =1      DDB3_bit =1
	IN         R27, DDB1_bit+0
	SBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;MyProject.mbas,176 :: 		DDA0_bit =1 DDA1_bit =1      DDA2_bit =1  DDA3_bit =1
	IN         R27, DDA0_bit+0
	SBR        R27, BitMask(DDA0_bit+0)
	OUT        DDA0_bit+0, R27
	IN         R27, DDA1_bit+0
	SBR        R27, BitMask(DDA1_bit+0)
	OUT        DDA1_bit+0, R27
	IN         R27, DDA2_bit+0
	SBR        R27, BitMask(DDA2_bit+0)
	OUT        DDA2_bit+0, R27
	IN         R27, DDA3_bit+0
	SBR        R27, BitMask(DDA3_bit+0)
	OUT        DDA3_bit+0, R27
;MyProject.mbas,181 :: 		DDB4_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB4_bit+0
	SBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
;MyProject.mbas,182 :: 		DDB5_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB5_bit+0
	SBR        R27, BitMask(DDB5_bit+0)
	OUT        DDB5_bit+0, R27
;MyProject.mbas,183 :: 		DDB6_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB6_bit+0
	SBR        R27, BitMask(DDB6_bit+0)
	OUT        DDB6_bit+0, R27
;MyProject.mbas,184 :: 		DDB7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB7_bit+0
	SBR        R27, BitMask(DDB7_bit+0)
	OUT        DDB7_bit+0, R27
;MyProject.mbas,192 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,193 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,194 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,195 :: 		LCD_Out(2,1,"TEST")
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 84
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
;MyProject.mbas,196 :: 		hours=0x0  minutes=0x0   seconds=0x00 day= 0x2 week=2   month=0x11  year=0x15
	LDI        R27, 0
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
	LDI        R27, 21
	STS        _year+0, R27
;MyProject.mbas,199 :: 		Write_Time(hours, minutes, seconds, 0x13, 0x02,   0x11,year)'
	LDI        R27, 21
	MOV        R8, R27
	LDI        R27, 17
	MOV        R7, R27
	LDI        R27, 2
	MOV        R6, R27
	LDI        R27, 19
	MOV        R5, R27
	CLR        R4
	CLR        R3
	CLR        R2
	CALL       _Write_Time+0
;MyProject.mbas,205 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,206 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,208 :: 		chanel=1  Pwm_chanel=1  on_off2=1   week_new=week    chanel_active=1
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
	LDS        R16, _week+0
	STS        _week_new+0, R16
	LDI        R27, 1
	STS        _chanel_active+0, R27
;MyProject.mbas,267 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,268 :: 		LCD_Load()
	CALL       _LCD_Load+0
;MyProject.mbas,269 :: 		CustomChar(1,1)
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _CustomChar+0
;MyProject.mbas,270 :: 		LCD_Chr(1,5,3)
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,271 :: 		LCD_Chr(2,2,0)    ' Display custom char 0 (heart)
	CLR        R4
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,272 :: 		LCD_Chr(2,4,4)    ' Display custom char B
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,273 :: 		Delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__main20:
	DEC        R16
	BRNE       L__main20
	DEC        R17
	BRNE       L__main20
	DEC        R18
	BRNE       L__main20
	NOP
	NOP
;MyProject.mbas,275 :: 		on_off_initial (1,1,0,0,18)    '' off mode on_off initial (dim on_off22,en,hr,mint,prc as integer)
	LDI        R27, 18
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _on_off_initial+0
;MyProject.mbas,276 :: 		on_off_initial (2,1,0,0,18)    '''on mode
	LDI        R27, 18
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _on_off_initial+0
;MyProject.mbas,277 :: 		int_eeprom_ini()   ''internal AVR EEPROM Writing
	CALL       _int_eeprom_ini+0
;MyProject.mbas,285 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,286 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;MyProject.mbas,287 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;MyProject.mbas,290 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;MyProject.mbas,304 :: 		Interupt_first_time=0
	LDI        R27, 0
	STS        _Interupt_first_time+0, R27
;MyProject.mbas,305 :: 		ISC20_Bit = 1                                    '' // Set interrupts to be detected on rising edge
	LDS        R27, ISC20_bit+0
	SBR        R27, BitMask(ISC20_bit+0)
	STS        ISC20_bit+0, R27
;MyProject.mbas,306 :: 		ISC00_bit = 1
	LDS        R27, ISC00_bit+0
	SBR        R27, BitMask(ISC00_bit+0)
	STS        ISC00_bit+0, R27
;MyProject.mbas,307 :: 		INTF2_bit = 0
	IN         R27, INTF2_bit+0
	CBR        R27, BitMask(INTF2_bit+0)
	OUT        INTF2_bit+0, R27
;MyProject.mbas,308 :: 		SREG_I_bit = 0
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,309 :: 		Delay_ms(100)                                  ''  // Enable Interrupts
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__main22:
	DEC        R16
	BRNE       L__main22
	DEC        R17
	BRNE       L__main22
	DEC        R18
	BRNE       L__main22
;MyProject.mbas,310 :: 		SREG_I_bit = 1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,312 :: 		INT2_bit =1
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;MyProject.mbas,318 :: 		PWM_Initialize ()
	CALL       _PWM_Initialize+0
;MyProject.mbas,320 :: 		while TRUE
L__main25:
;MyProject.mbas,326 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,327 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;MyProject.mbas,328 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;MyProject.mbas,329 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main29:
	DEC        R16
	BRNE       L__main29
	DEC        R17
	BRNE       L__main29
	DEC        R18
	BRNE       L__main29
	NOP
;MyProject.mbas,330 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;MyProject.mbas,331 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main31:
	DEC        R16
	BRNE       L__main31
	DEC        R17
	BRNE       L__main31
	DEC        R18
	BRNE       L__main31
	NOP
;MyProject.mbas,360 :: 		for Pwm_chanel_main=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__main34:
;MyProject.mbas,361 :: 		on_test=0
	LDI        R27, 0
	STS        _on_test+0, R27
;MyProject.mbas,362 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
L__main39:
;MyProject.mbas,363 :: 		for on_off2 =1 to 1
	LDI        R27, 1
	STS        _on_off2+0, R27
L__main44:
;MyProject.mbas,368 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][1]>= hours ) and    (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2][2]>= minutes)  and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) then  '''OFF mode
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
	BRLO       L__main76
	LDI        R20, 255
L__main76:
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
	BRLO       L__main77
	LDI        R18, 255
L__main77:
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
	BREQ       L__main78
	LDI        R27, 255
L__main78:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__main79
	JMP        L__main49
L__main79:
;MyProject.mbas,372 :: 		if  (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][1]<= hours ) and     (on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][2]<= minutes)  then
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
	BRLO       L__main80
	LDI        R22, 255
L__main80:
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
	BRLO       L__main81
	LDI        R27, 255
L__main81:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__main82
	JMP        L__main52
L__main82:
;MyProject.mbas,374 :: 		on_test=1
	LDI        R27, 1
	STS        _on_test+0, R27
;MyProject.mbas,375 :: 		chanel_active=chanel
	LDS        R16, _chanel+0
	STS        _chanel_active+0, R16
;MyProject.mbas,376 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,377 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,378 :: 		Lcd_Out(1,1,"CHANEL IS ACTIVE:")
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
;MyProject.mbas,379 :: 		Lcd_Out(2,1,"main CH:") Lcd_Out(2,8,txt) delay_ms(50)
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
L__main54:
	DEC        R16
	BRNE       L__main54
	DEC        R17
	BRNE       L__main54
	DEC        R18
	BRNE       L__main54
L__main52:
;MyProject.mbas,391 :: 		end if
	JMP        L__main50
;MyProject.mbas,392 :: 		else
L__main49:
;MyProject.mbas,393 :: 		if (on_test=0) then
	LDS        R16, _on_test+0
	CPI        R16, 0
	BREQ       L__main83
	JMP        L__main57
L__main83:
;MyProject.mbas,395 :: 		Lcd_Chr(2, 6, (hours div 10)   + 48)
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
;MyProject.mbas,396 :: 		Lcd_Chr(2, 7, (hours mod 10)   + 48)  Delay_mS(1000)
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
L__main59:
	DEC        R16
	BRNE       L__main59
	DEC        R17
	BRNE       L__main59
	DEC        R18
	BRNE       L__main59
L__main57:
;MyProject.mbas,406 :: 		end if
L__main50:
;MyProject.mbas,409 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__main84
	JMP        L__main47
L__main84:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__main44
L__main47:
;MyProject.mbas,410 :: 		next chanel
	LDS        R16, _chanel+0
	CPI        R16, 4
	BRNE       L__main85
	JMP        L__main42
L__main85:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__main39
L__main42:
;MyProject.mbas,412 :: 		chanel=Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	STS        _chanel+0, R16
;MyProject.mbas,413 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _Pwm_chanel_main+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,414 :: 		Lcd_Out(1,1,"CHANEL IS ACTIVE:")
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
;MyProject.mbas,415 :: 		Lcd_Out(2,1,"CH:") Lcd_Out(2,4,txt) delay_ms(50)
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
L__main61:
	DEC        R16
	BRNE       L__main61
	DEC        R17
	BRNE       L__main61
	DEC        R18
	BRNE       L__main61
;MyProject.mbas,416 :: 		if   (on_test=1) then
	LDS        R16, _on_test+0
	CPI        R16, 1
	BREQ       L__main86
	JMP        L__main64
L__main86:
;MyProject.mbas,417 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,418 :: 		Lcd_Out(1,1,"on pwm mode")
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
;MyProject.mbas,419 :: 		bytetostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _chanel+0
	CALL       _ByteToStr+0
;MyProject.mbas,421 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;MyProject.mbas,423 :: 		LCD_Out(1,13, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,425 :: 		bytetostr(Pwm_chanel_main,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;MyProject.mbas,426 :: 		LCD_Out(2,3, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,427 :: 		bytetostr(on_off,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _on_off+0
	CALL       _ByteToStr+0
;MyProject.mbas,428 :: 		LCD_Out(2,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,429 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main66:
	DEC        R16
	BRNE       L__main66
	DEC        R17
	BRNE       L__main66
	DEC        R18
	BRNE       L__main66
	NOP
	JMP        L__main65
;MyProject.mbas,431 :: 		else
L__main64:
;MyProject.mbas,432 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,435 :: 		bytetostr(on_a_0 [week-1][chanel-1][Pwm_chanel_main-1][on_off2-1][0],txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
;MyProject.mbas,436 :: 		LCD_Out(1,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,437 :: 		bytetostr(Pwm_chanel_main,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _Pwm_chanel_main+0
	CALL       _ByteToStr+0
;MyProject.mbas,438 :: 		LCD_Out(2,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,439 :: 		Lcd_Out(1,1,"offfff")
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
;MyProject.mbas,440 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main68:
	DEC        R16
	BRNE       L__main68
	DEC        R17
	BRNE       L__main68
	DEC        R18
	BRNE       L__main68
	NOP
;MyProject.mbas,441 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	LDS        R5, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;MyProject.mbas,442 :: 		end if
L__main65:
;MyProject.mbas,443 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 7
	BRNE       L__main87
	JMP        L__main37
L__main87:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__main34
L__main37:
;MyProject.mbas,449 :: 		wend                                                ' endless loop
	JMP        L__main25
L_end_main:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
