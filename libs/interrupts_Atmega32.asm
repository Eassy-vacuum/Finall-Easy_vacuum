
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

;libs/interrupts_Atmega32.mbas,66 :: 		sub procedure interrupt_ISR () org INT_Keypad_importing_menu            ''// Interrupt rutine
;libs/interrupts_Atmega32.mbas,69 :: 		if Interupt_first_time=0 then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDS        R16, _Interupt_first_time+0
	CPI        R16, 0
	BREQ       L__interrupt_ISR18
	JMP        L__interrupt_ISR2
L__interrupt_ISR18:
;libs/interrupts_Atmega32.mbas,70 :: 		Interupt_first_time=1
	LDI        R27, 1
	STS        _Interupt_first_time+0, R27
;libs/interrupts_Atmega32.mbas,72 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/interrupts_Atmega32.mbas,73 :: 		Lcd_Out(1,1,"Interupt_first_time=0")
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
;libs/interrupts_Atmega32.mbas,74 :: 		Delay_mS(1000)
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
;libs/interrupts_Atmega32.mbas,75 :: 		else
L__interrupt_ISR2:
;libs/interrupts_Atmega32.mbas,76 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega32.mbas,78 :: 		WDT_on()
	CALL       _WDT_on+0
;libs/interrupts_Atmega32.mbas,80 :: 		INT_Keypad_importing_menu_bit_enable = 0
	IN         R27, INT0_bit+0
	CBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;libs/interrupts_Atmega32.mbas,82 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/interrupts_Atmega32.mbas,88 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/interrupts_Atmega32.mbas,93 :: 		txt1 = "<int is selected"
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
;libs/interrupts_Atmega32.mbas,94 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/interrupts_Atmega32.mbas,95 :: 		if (Button(INT_Keypad_importing_menu_Port_my, INT_Keypad_importing_menu_bit_my, 0.1, 1)<> 0) then    ' Detect logical one setting key
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
	BRNE       L__interrupt_ISR19
	JMP        L__interrupt_ISR7
L__interrupt_ISR19:
;libs/interrupts_Atmega32.mbas,96 :: 		oldstate = 1
	LDS        R27, _oldstate+0
	SBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;libs/interrupts_Atmega32.mbas,97 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/interrupts_Atmega32.mbas,100 :: 		Delay_mS(400)                      ' Update flag
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
;libs/interrupts_Atmega32.mbas,102 :: 		if (oldstate and Button(INT_Keypad_importing_menu_Port_my, INT_Keypad_importing_menu_bit_my, 0.1, 0)) then    ' Detect one-to-zero transition
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
	BRNE       L__interrupt_ISR20
	JMP        L__interrupt_ISR12
L__interrupt_ISR20:
;libs/interrupts_Atmega32.mbas,103 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;libs/interrupts_Atmega32.mbas,104 :: 		txt1 = "<good>"
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
;libs/interrupts_Atmega32.mbas,105 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/interrupts_Atmega32.mbas,106 :: 		Delay_mS(400)
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
;libs/interrupts_Atmega32.mbas,110 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;libs/interrupts_Atmega32.mbas,111 :: 		INT_Keypad_importing_menu_bit_enable = 1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;libs/interrupts_Atmega32.mbas,113 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega32.mbas,121 :: 		end if
L__interrupt_ISR3:
;libs/interrupts_Atmega32.mbas,122 :: 		end sub
L_end_interrupt_ISR:
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

;libs/interrupts_Atmega32.mbas,124 :: 		sub procedure interrupt_ISR_6 () org INT_heater_SW            ''// Interrupt rutine
;libs/interrupts_Atmega32.mbas,127 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega32.mbas,129 :: 		WDT_on()
	CALL       _WDT_on+0
;libs/interrupts_Atmega32.mbas,131 :: 		INT_heater_SW_Bit_Enable = 0
	IN         R27, INT2_bit+0
	CBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;libs/interrupts_Atmega32.mbas,141 :: 		chanel=1
	LDI        R27, 1
	STS        _chanel+0, R27
;libs/interrupts_Atmega32.mbas,144 :: 		Easy_vacuum_95_10_4_simple_crupted(1,1)
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Easy_vacuum_95_10_4_simple_crupted+0
;libs/interrupts_Atmega32.mbas,145 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/interrupts_Atmega32.mbas,149 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;libs/interrupts_Atmega32.mbas,150 :: 		INT_heater_SW_Bit_Enable = 1  ''simulating pressed  INT6 button by 1 in this bit
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;libs/interrupts_Atmega32.mbas,152 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/interrupts_Atmega32.mbas,155 :: 		end sub
L_end_interrupt_ISR_6:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _interrupt_ISR_6

_libs/interrupts_Atmega32_?main:

;libs/interrupts_Atmega32.mbas,184 :: 		end.
L_end_libs/interrupts_Atmega32_?main:
	RET
; end of _libs/interrupts_Atmega32_?main
