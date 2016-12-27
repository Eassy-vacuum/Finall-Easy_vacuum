
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

;libs/interrupts_Atmega128.mbas,65 :: 		sub procedure interrupt_ISR () org INT_Keypad_importing_menu            ''// Interrupt rutine
;libs/interrupts_Atmega128.mbas,68 :: 		if Interupt_first_time=0 then
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
	BREQ       L__interrupt_ISR23
	JMP        L__interrupt_ISR2
L__interrupt_ISR23:
;libs/interrupts_Atmega128.mbas,69 :: 		Interupt_first_time=1
	LDI        R27, 1
	STS        _Interupt_first_time+0, R27
;libs/interrupts_Atmega128.mbas,71 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/interrupts_Atmega128.mbas,72 :: 		Lcd_Out(1,1,"Interupt_first_time=0")
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
;libs/interrupts_Atmega128.mbas,73 :: 		Delay_mS(1000)
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
;libs/interrupts_Atmega128.mbas,74 :: 		else
L__interrupt_ISR2:
;libs/interrupts_Atmega128.mbas,75 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega128.mbas,77 :: 		WDT_on()
	CALL       _WDT_on+0
;libs/interrupts_Atmega128.mbas,79 :: 		INT_Keypad_importing_menu_bit_enable = 0
	IN         R27, INT2_bit+0
	CBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;libs/interrupts_Atmega128.mbas,81 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/interrupts_Atmega128.mbas,82 :: 		Keypad_set__date_time_import_On_hour_teben(week,hours,minutes,23,0)
	CLR        R6
	LDI        R27, 23
	MOV        R5, R27
	LDS        R4, _minutes+0
	LDS        R3, _hours+0
	LDS        R2, _week+0
	CALL       _Keypad_set__date_time_import_On_hour_teben+0
;libs/interrupts_Atmega128.mbas,83 :: 		Keypad_set__date_time_import_On_minut_teben(week,on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][1],minutes,59,0)
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
;libs/interrupts_Atmega128.mbas,84 :: 		Keypad_set__date_time_import_Yes_No_teben( week,chanel,1, 2,1 )
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 2
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	LDS        R3, _chanel+0
	LDS        R2, _week+0
	CALL       _Keypad_set__date_time_import_Yes_No_teben+0
;libs/interrupts_Atmega128.mbas,85 :: 		Keypad_set__date_time_import_PWM_Red_teben(1,1,on_a_0[week_new-1][chanel-1][Pwm_chanel-1][on_off2-1][3],100,0,on_a_0[week_new-1][0][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][1][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][2][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][3][Pwm_chanel-1][on_off2-1][3],0,0,0,0,0)''on_a_0[week_new-1][4][Pwm_chanel-1][on_off2-1][3],0,0,0,0) ''on_a_0[week_new-1][5][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][6][Pwm_chanel-1][on_off2-1][3],0,0) ''on_a_0[week_new-1][7][Pwm_chanel-1][on_off2-1][3],on_a_0[week_new-1][8][Pwm_chanel-1][on_off2-1][3]) ''(dim mode_1,Pwm_chanel,var_in as byte, dim p_max as  byte, dim p_min as  byte )
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
;libs/interrupts_Atmega128.mbas,86 :: 		Keypad_set__date_time_import_save_exit_teben (week,1,1,0)
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _week+0
	CALL       _Keypad_set__date_time_import_save_exit_teben+0
;libs/interrupts_Atmega128.mbas,87 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/interrupts_Atmega128.mbas,91 :: 		Keypad_3()
	CALL       _Keypad_3+0
;libs/interrupts_Atmega128.mbas,92 :: 		txt1 = "<int is selected"
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
;libs/interrupts_Atmega128.mbas,93 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/interrupts_Atmega128.mbas,94 :: 		if (Button(INT_Keypad_importing_menu_Port_my, INT_Keypad_importing_menu_bit_my, 0.1, 1)<> 0) then    ' Detect logical one setting key
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
	BRNE       L__interrupt_ISR24
	JMP        L__interrupt_ISR7
L__interrupt_ISR24:
;libs/interrupts_Atmega128.mbas,95 :: 		oldstate = 1
	LDS        R27, _oldstate+0
	SBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;libs/interrupts_Atmega128.mbas,96 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/interrupts_Atmega128.mbas,99 :: 		Delay_mS(400)                      ' Update flag
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
;libs/interrupts_Atmega128.mbas,101 :: 		if (oldstate and Button(INT_Keypad_importing_menu_Port_my, INT_Keypad_importing_menu_bit_my, 0.1, 0)) then    ' Detect one-to-zero transition
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
	BRNE       L__interrupt_ISR25
	JMP        L__interrupt_ISR12
L__interrupt_ISR25:
;libs/interrupts_Atmega128.mbas,102 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;libs/interrupts_Atmega128.mbas,103 :: 		txt1 = "<good>"
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
;libs/interrupts_Atmega128.mbas,104 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/interrupts_Atmega128.mbas,105 :: 		Delay_mS(400)
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
;libs/interrupts_Atmega128.mbas,109 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;libs/interrupts_Atmega128.mbas,110 :: 		INT_Keypad_importing_menu_bit_enable = 1
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;libs/interrupts_Atmega128.mbas,112 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega128.mbas,120 :: 		end if
L__interrupt_ISR3:
;libs/interrupts_Atmega128.mbas,121 :: 		end sub
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

_interrupt_ISR_6:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 22
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/interrupts_Atmega128.mbas,123 :: 		sub procedure interrupt_ISR_6 () org INT_heater_SW            ''// Interrupt rutine
;libs/interrupts_Atmega128.mbas,126 :: 		if Interupt_first_time2=0 then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R16, _Interupt_first_time2+0
	CPI        R16, 0
	BREQ       L__interrupt_ISR_627
	JMP        L__interrupt_ISR_618
L__interrupt_ISR_627:
;libs/interrupts_Atmega128.mbas,127 :: 		Interupt_first_time2=1
	LDI        R27, 1
	STS        _Interupt_first_time2+0, R27
;libs/interrupts_Atmega128.mbas,129 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/interrupts_Atmega128.mbas,130 :: 		Lcd_Out(1,1,"Interupt_first_time=0")
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
;libs/interrupts_Atmega128.mbas,131 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__interrupt_ISR_620:
	DEC        R16
	BRNE       L__interrupt_ISR_620
	DEC        R17
	BRNE       L__interrupt_ISR_620
	DEC        R18
	BRNE       L__interrupt_ISR_620
	JMP        L__interrupt_ISR_619
;libs/interrupts_Atmega128.mbas,132 :: 		else
L__interrupt_ISR_618:
;libs/interrupts_Atmega128.mbas,133 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega128.mbas,135 :: 		WDT_on()
	CALL       _WDT_on+0
;libs/interrupts_Atmega128.mbas,137 :: 		INT_heater_SW_Bit_Enable = 0
	IN         R27, INT6_bit+0
	CBR        R27, BitMask(INT6_bit+0)
	OUT        INT6_bit+0, R27
;libs/interrupts_Atmega128.mbas,148 :: 		Easy_vacuum_95_10_4_simple(chanel,1)
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple+0
;libs/interrupts_Atmega128.mbas,150 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/interrupts_Atmega128.mbas,154 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;libs/interrupts_Atmega128.mbas,155 :: 		INT_heater_SW_Bit_Enable = 1  ''simulating pressed  INT6 button by 1 in this bit
	IN         R27, INT6_bit+0
	SBR        R27, BitMask(INT6_bit+0)
	OUT        INT6_bit+0, R27
;libs/interrupts_Atmega128.mbas,157 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega128.mbas,158 :: 		end if
L__interrupt_ISR_619:
;libs/interrupts_Atmega128.mbas,160 :: 		end sub
L_end_interrupt_ISR_6:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 21
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
; end of _interrupt_ISR_6

_libs/interrupts_Atmega128_?main:

;libs/interrupts_Atmega128.mbas,189 :: 		end.
L_end_libs/interrupts_Atmega128_?main:
	RET
; end of _libs/interrupts_Atmega128_?main
