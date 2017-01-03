
libs/interrupts_Atmega32_delay_ms_my:

;libs/interrupts_Atmega32.mbas,67 :: 		dim t_fl as integer
;libs/interrupts_Atmega32.mbas,68 :: 		if ttt>=100 then
	PUSH       R4
	PUSH       R5
	LDI        R16, 100
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRGE       L_libs/interrupts_Atmega32_delay_ms_my45
	JMP        L_libs/interrupts_Atmega32_delay_ms_my2
L_libs/interrupts_Atmega32_delay_ms_my45:
;libs/interrupts_Atmega32.mbas,69 :: 		t_fl=integer (ceil((ttt)/100))
	PUSH       R3
	PUSH       R2
	LDI        R20, 100
	LDI        R21, 0
	MOVW       R16, R2
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
	POP        R2
	POP        R3
	CALL       _float_fpint+0
; t_fl start address is: 18 (R18)
	MOVW       R18, R16
;libs/interrupts_Atmega32.mbas,70 :: 		for ttt=1 to t_fl
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
; t_fl end address is: 18 (R18)
L_libs/interrupts_Atmega32_delay_ms_my4:
; t_fl start address is: 18 (R18)
	CP         R18, R2
	CPC        R19, R3
	BRGE       L_libs/interrupts_Atmega32_delay_ms_my46
	JMP        L_libs/interrupts_Atmega32_delay_ms_my8
L_libs/interrupts_Atmega32_delay_ms_my46:
;libs/interrupts_Atmega32.mbas,71 :: 		delay_ms(100)
	PUSH       R19
	PUSH       R18
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_libs/interrupts_Atmega32_delay_ms_my9:
	DEC        R16
	BRNE       L_libs/interrupts_Atmega32_delay_ms_my9
	DEC        R17
	BRNE       L_libs/interrupts_Atmega32_delay_ms_my9
	DEC        R18
	BRNE       L_libs/interrupts_Atmega32_delay_ms_my9
	POP        R18
	POP        R19
;libs/interrupts_Atmega32.mbas,72 :: 		next ttt
	CP         R2, R18
	CPC        R3, R19
	BRNE       L_libs/interrupts_Atmega32_delay_ms_my47
	JMP        L_libs/interrupts_Atmega32_delay_ms_my8
L_libs/interrupts_Atmega32_delay_ms_my47:
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
; t_fl end address is: 18 (R18)
	JMP        L_libs/interrupts_Atmega32_delay_ms_my4
L_libs/interrupts_Atmega32_delay_ms_my8:
	JMP        L_libs/interrupts_Atmega32_delay_ms_my3
;libs/interrupts_Atmega32.mbas,73 :: 		else
L_libs/interrupts_Atmega32_delay_ms_my2:
;libs/interrupts_Atmega32.mbas,74 :: 		t_fl=integer (ceil((ttt)/10))
	PUSH       R3
	PUSH       R2
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R2
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
	POP        R2
	POP        R3
	CALL       _float_fpint+0
; t_fl start address is: 18 (R18)
	MOVW       R18, R16
;libs/interrupts_Atmega32.mbas,75 :: 		for ttt=1 to t_fl
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
; t_fl end address is: 18 (R18)
L_libs/interrupts_Atmega32_delay_ms_my11:
; t_fl start address is: 18 (R18)
	CP         R18, R2
	CPC        R19, R3
	BRGE       L_libs/interrupts_Atmega32_delay_ms_my48
	JMP        L_libs/interrupts_Atmega32_delay_ms_my15
L_libs/interrupts_Atmega32_delay_ms_my48:
;libs/interrupts_Atmega32.mbas,76 :: 		delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L_libs/interrupts_Atmega32_delay_ms_my16:
	DEC        R16
	BRNE       L_libs/interrupts_Atmega32_delay_ms_my16
	DEC        R17
	BRNE       L_libs/interrupts_Atmega32_delay_ms_my16
;libs/interrupts_Atmega32.mbas,77 :: 		next ttt
	CP         R2, R18
	CPC        R3, R19
	BRNE       L_libs/interrupts_Atmega32_delay_ms_my49
	JMP        L_libs/interrupts_Atmega32_delay_ms_my15
L_libs/interrupts_Atmega32_delay_ms_my49:
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
; t_fl end address is: 18 (R18)
	JMP        L_libs/interrupts_Atmega32_delay_ms_my11
L_libs/interrupts_Atmega32_delay_ms_my15:
;libs/interrupts_Atmega32.mbas,78 :: 		end if
L_libs/interrupts_Atmega32_delay_ms_my3:
;libs/interrupts_Atmega32.mbas,82 :: 		end sub
L_end_delay_ms_my:
	POP        R5
	POP        R4
	RET
; end of libs/interrupts_Atmega32_delay_ms_my

_interrupt_ini:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 10
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/interrupts_Atmega32.mbas,83 :: 		sub procedure interrupt_ini ()
;libs/interrupts_Atmega32.mbas,84 :: 		if Interupt_first_time=0 then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R16, _Interupt_first_time+0
	CPI        R16, 0
	BREQ       L__interrupt_ini51
	JMP        L__interrupt_ini20
L__interrupt_ini51:
;libs/interrupts_Atmega32.mbas,103 :: 		Interupt_first_time=0 Interupt_first_time2=0
	LDI        R27, 0
	STS        _Interupt_first_time+0, R27
	LDI        R27, 0
	STS        _Interupt_first_time2+0, R27
;libs/interrupts_Atmega32.mbas,110 :: 		ISC00_bit = 1
	IN         R27, ISC00_bit+0
	SBR        R27, BitMask(ISC00_bit+0)
	OUT        ISC00_bit+0, R27
;libs/interrupts_Atmega32.mbas,111 :: 		INTF2_bit = 0
	IN         R27, INTF2_bit+0
	CBR        R27, BitMask(INTF2_bit+0)
	OUT        INTF2_bit+0, R27
;libs/interrupts_Atmega32.mbas,112 :: 		SREG_I_bit = 0
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega32.mbas,113 :: 		Delay_ms(100)                                  ''  // Enable Interrupts
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__interrupt_ini22:
	DEC        R16
	BRNE       L__interrupt_ini22
	DEC        R17
	BRNE       L__interrupt_ini22
	DEC        R18
	BRNE       L__interrupt_ini22
;libs/interrupts_Atmega32.mbas,117 :: 		INT2_bit =1
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;libs/interrupts_Atmega32.mbas,118 :: 		INT1_bit =1
	IN         R27, INT1_bit+0
	SBR        R27, BitMask(INT1_bit+0)
	OUT        INT1_bit+0, R27
;libs/interrupts_Atmega32.mbas,119 :: 		INT0_bit =1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;libs/interrupts_Atmega32.mbas,120 :: 		SREG_I_bit =1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega32.mbas,121 :: 		Interupt_first_time=1 Interupt_first_time2=1
	LDI        R27, 1
	STS        _Interupt_first_time+0, R27
	LDI        R27, 1
	STS        _Interupt_first_time2+0, R27
;libs/interrupts_Atmega32.mbas,124 :: 		Lcd_0()Lcd_Out(1,1,"Int") Lcd_Out(2,1,"For First") delay_ms(200)
	CALL       _Lcd_0+0
	LDI        R27, 73
	STD        Y+0, R27
	LDI        R27, 110
	STD        Y+1, R27
	LDI        R27, 116
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 70
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 70
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 116
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__interrupt_ini24:
	DEC        R16
	BRNE       L__interrupt_ini24
	DEC        R17
	BRNE       L__interrupt_ini24
	DEC        R18
	BRNE       L__interrupt_ini24
	NOP
L__interrupt_ini20:
;libs/interrupts_Atmega32.mbas,126 :: 		end sub
L_end_interrupt_ini:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 9
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _interrupt_ini

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
	SBIW       R28, 22
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/interrupts_Atmega32.mbas,127 :: 		sub procedure interrupt_ISR () org INT_Keypad_importing_menu            ''// Interrupt rutine
;libs/interrupts_Atmega32.mbas,130 :: 		if (Interupt_first_time=0) or (Interupt_first_time=2) then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R16, _Interupt_first_time+0
	CPI        R16, 0
	LDI        R17, 0
	BRNE       L__interrupt_ISR53
	LDI        R17, 255
L__interrupt_ISR53:
	CPI        R16, 2
	LDI        R27, 0
	BRNE       L__interrupt_ISR54
	LDI        R27, 255
L__interrupt_ISR54:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__interrupt_ISR55
	JMP        L__interrupt_ISR28
L__interrupt_ISR55:
;libs/interrupts_Atmega32.mbas,131 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/interrupts_Atmega32.mbas,132 :: 		if Interupt_first_time=2 then
	LDS        R16, _Interupt_first_time+0
	CPI        R16, 2
	BREQ       L__interrupt_ISR56
	JMP        L__interrupt_ISR31
L__interrupt_ISR56:
;libs/interrupts_Atmega32.mbas,133 :: 		Lcd_Out(1,1,"or Interupt_Ht=2")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 50
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
	JMP        L__interrupt_ISR32
;libs/interrupts_Atmega32.mbas,134 :: 		else
L__interrupt_ISR31:
;libs/interrupts_Atmega32.mbas,135 :: 		Lcd_Out(1,1,"Interupt_first_time=0")
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
;libs/interrupts_Atmega32.mbas,136 :: 		end if
L__interrupt_ISR32:
;libs/interrupts_Atmega32.mbas,137 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__interrupt_ISR33:
	DEC        R16
	BRNE       L__interrupt_ISR33
	DEC        R17
	BRNE       L__interrupt_ISR33
	DEC        R18
	BRNE       L__interrupt_ISR33
;libs/interrupts_Atmega32.mbas,138 :: 		Interupt_first_time=1
	LDI        R27, 1
	STS        _Interupt_first_time+0, R27
	JMP        L__interrupt_ISR29
;libs/interrupts_Atmega32.mbas,139 :: 		else
L__interrupt_ISR28:
;libs/interrupts_Atmega32.mbas,141 :: 		Interupt_first_time=1
	LDI        R27, 1
	STS        _Interupt_first_time+0, R27
;libs/interrupts_Atmega32.mbas,144 :: 		INT_Keypad_importing_menu_bit_enable = 0
	IN         R27, INT2_bit+0
	CBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;libs/interrupts_Atmega32.mbas,157 :: 		Keypad_start()
	CALL       _Keypad_start+0
;libs/interrupts_Atmega32.mbas,177 :: 		INT_Keypad_importing_menu_bit_enable = 1
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;libs/interrupts_Atmega32.mbas,178 :: 		Interupt_first_time=Interupt_first_time+1
	LDS        R16, _Interupt_first_time+0
	SUBI       R16, 255
	STS        _Interupt_first_time+0, R16
;libs/interrupts_Atmega32.mbas,188 :: 		end if
L__interrupt_ISR29:
;libs/interrupts_Atmega32.mbas,189 :: 		end sub
L_end_interrupt_ISR:
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

;libs/interrupts_Atmega32.mbas,191 :: 		sub procedure interrupt_ISR_6 () org INT_heater_SW            ''// Interrupt rutine
;libs/interrupts_Atmega32.mbas,194 :: 		if (Interupt_first_time=0) or (Interupt_first_time=2) then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R16, _Interupt_first_time+0
	CPI        R16, 0
	LDI        R17, 0
	BRNE       L__interrupt_ISR_658
	LDI        R17, 255
L__interrupt_ISR_658:
	CPI        R16, 2
	LDI        R27, 0
	BRNE       L__interrupt_ISR_659
	LDI        R27, 255
L__interrupt_ISR_659:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__interrupt_ISR_660
	JMP        L__interrupt_ISR_637
L__interrupt_ISR_660:
;libs/interrupts_Atmega32.mbas,195 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/interrupts_Atmega32.mbas,196 :: 		if Interupt_first_time=2 then
	LDS        R16, _Interupt_first_time+0
	CPI        R16, 2
	BREQ       L__interrupt_ISR_661
	JMP        L__interrupt_ISR_640
L__interrupt_ISR_661:
;libs/interrupts_Atmega32.mbas,197 :: 		Lcd_Out(1,1,"or Interupt_Ht=2")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 50
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
	JMP        L__interrupt_ISR_641
;libs/interrupts_Atmega32.mbas,198 :: 		else
L__interrupt_ISR_640:
;libs/interrupts_Atmega32.mbas,199 :: 		Lcd_Out(1,1,"Interupt_first_time=0")
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
;libs/interrupts_Atmega32.mbas,200 :: 		end if
L__interrupt_ISR_641:
;libs/interrupts_Atmega32.mbas,201 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__interrupt_ISR_642:
	DEC        R16
	BRNE       L__interrupt_ISR_642
	DEC        R17
	BRNE       L__interrupt_ISR_642
	DEC        R18
	BRNE       L__interrupt_ISR_642
;libs/interrupts_Atmega32.mbas,202 :: 		Interupt_first_time=1
	LDI        R27, 1
	STS        _Interupt_first_time+0, R27
	JMP        L__interrupt_ISR_638
;libs/interrupts_Atmega32.mbas,203 :: 		else
L__interrupt_ISR_637:
;libs/interrupts_Atmega32.mbas,209 :: 		INT_heater_SW_Bit_Enable = 0
	IN         R27, INT1_bit+0
	CBR        R27, BitMask(INT1_bit+0)
	OUT        INT1_bit+0, R27
;libs/interrupts_Atmega32.mbas,219 :: 		chanel=1
	LDI        R27, 1
	STS        _chanel+0, R27
;libs/interrupts_Atmega32.mbas,222 :: 		Easy_vacuum_95_10_4_simple_working(1,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Easy_vacuum_95_10_4_simple_working+0
;libs/interrupts_Atmega32.mbas,223 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/interrupts_Atmega32.mbas,228 :: 		INT_heater_SW_Bit_Enable = 1  ''simulating pressed  INT6 button by 1 in this bit
	IN         R27, INT1_bit+0
	SBR        R27, BitMask(INT1_bit+0)
	OUT        INT1_bit+0, R27
;libs/interrupts_Atmega32.mbas,231 :: 		end if
L__interrupt_ISR_638:
;libs/interrupts_Atmega32.mbas,233 :: 		end sub
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

_libs/interrupts_Atmega32_?main:

;libs/interrupts_Atmega32.mbas,262 :: 		end.
L_end_libs/interrupts_Atmega32_?main:
	RET
; end of _libs/interrupts_Atmega32_?main
