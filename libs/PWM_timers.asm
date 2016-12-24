
_pwm_set_1B:

;libs/PWM_timers.mbas,38 :: 		Sub procedure pwm_set_1B(dim pulse_width as  char )
;libs/PWM_timers.mbas,40 :: 		OCR1BL = pulse_width ''  //Load Pulse width
	OUT        OCR1BL+0, R2
;libs/PWM_timers.mbas,41 :: 		OCR1AL = pulse_width ''  //Load Pulse width
	OUT        OCR1AL+0, R2
;libs/PWM_timers.mbas,42 :: 		OCR0 = pulse_width
	OUT        OCR0+0, R2
;libs/PWM_timers.mbas,43 :: 		OCR2 = pulse_width
	OUT        OCR2+0, R2
;libs/PWM_timers.mbas,48 :: 		TCCR0 = (1<<FOC2)or (1<<COM21)or(1<<COM20) or(1<<WGM20) or (1<<CS00)
	LDI        R27, 241
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,49 :: 		TCCR1A  = (1<<FOC2)or(1<<COM21)or(1<<COM20)or (1<<WGM20)or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR1A+0, R27
;libs/PWM_timers.mbas,50 :: 		TCCR2 = (1<<FOC2)or(1<<COM21)or(1<<COM20)or(1<<WGM20) or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,52 :: 		TCCR1B = 1<<CS10
	LDI        R27, 1
	OUT        TCCR1B+0, R27
;libs/PWM_timers.mbas,53 :: 		end sub
L_end_pwm_set_1B:
	RET
; end of _pwm_set_1B

libs/PWM_timers_Timer2_Compare:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;libs/PWM_timers.mbas,55 :: 		Sub procedure Timer2_Compare iv IVT_ADDR_TIMER2_COMP 'L?st aus alle (8Mhz/1024/125) 16ms
;libs/PWM_timers.mbas,56 :: 		inc(_ss)
	LDS        R16, __ss+0
	LDS        R17, __ss+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __ss+0, R16
	STS        __ss+1, R17
;libs/PWM_timers.mbas,57 :: 		End sub
L_end_Timer2_Compare:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of libs/PWM_timers_Timer2_Compare

libs/PWM_timers_Timer0_overflow:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;libs/PWM_timers.mbas,59 :: 		sub procedure Timer0_overflow iv IVT_ADDR_TIMER0_OVF
;libs/PWM_timers.mbas,60 :: 		inc(_zz)
	LDS        R16, __zz+0
	LDS        R17, __zz+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __zz+0, R16
	STS        __zz+1, R17
;libs/PWM_timers.mbas,61 :: 		TIFR.TOV0=0
	IN         R27, TIFR+0
	CBR        R27, 1
	OUT        TIFR+0, R27
;libs/PWM_timers.mbas,63 :: 		end sub
L_end_Timer0_overflow:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of libs/PWM_timers_Timer0_overflow

libs/PWM_timers_SetRegister:

;libs/PWM_timers.mbas,65 :: 		sub procedure SetRegister()
;libs/PWM_timers.mbas,75 :: 		TCCR2.WGM21=1 'CTC Mode Aktivierung Timer2
	IN         R27, TCCR2+0
	SBR        R27, 8
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,76 :: 		TCCR2.COM20=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 16
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,77 :: 		TCCR2.COM21=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 32
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,79 :: 		TCCR0.CS02=1 'Ext Flanke Interrupt (T0)
	IN         R27, TCCR0+0
	SBR        R27, 4
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,80 :: 		TCCR0.CS01=1
	IN         R27, TCCR0+0
	SBR        R27, 2
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,81 :: 		TCCR0.CS00=1
	IN         R27, TCCR0+0
	SBR        R27, 1
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,83 :: 		TCCR2.CS22=1 'Set Prescaler Timer2 1024 setzen
	IN         R27, TCCR2+0
	SBR        R27, 4
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,84 :: 		TCCR2.CS21=1
	IN         R27, TCCR2+0
	SBR        R27, 2
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,85 :: 		TCCR2.CS20=1
	IN         R27, TCCR2+0
	SBR        R27, 1
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,87 :: 		OCR2=124 'Set Output Compare register Timer2 to 124 (for Loop 0-124 => 125)
	LDI        R27, 124
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,88 :: 		TIMSK.OCIE2=1 ' Enable comp match flag interrupt Timer 2
	IN         R27, TIMSK+0
	SBR        R27, 128
	OUT        TIMSK+0, R27
;libs/PWM_timers.mbas,89 :: 		TIMSK.TOIE0=1 ' Enable OV flag interrupt Timer 0
	IN         R27, TIMSK+0
	SBR        R27, 1
	OUT        TIMSK+0, R27
;libs/PWM_timers.mbas,90 :: 		SREG.SREG_I=1
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;libs/PWM_timers.mbas,91 :: 		End Sub
L_end_SetRegister:
	RET
; end of libs/PWM_timers_SetRegister

_SetPWM0:

;libs/PWM_timers.mbas,94 :: 		sub procedure SetPWM0(dim duty as integer)
;libs/PWM_timers.mbas,97 :: 		OCR0=duty
	OUT        OCR0+0, R2
;libs/PWM_timers.mbas,98 :: 		end sub
L_end_SetPWM0:
	RET
; end of _SetPWM0

libs/PWM_timers_PWM_MAKE_as_max:

;libs/PWM_timers.mbas,102 :: 		jjyear as float
;libs/PWM_timers.mbas,104 :: 		jjyear=ceil((jj*max_duty)/100)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	MOV        R16, R2
	LDI        R17, 0
	MOV        R18, R17
	MOV        R19, R17
	MOV        R20, R3
	MOV        R21, R4
	LDI        R22, 0
	SBRC       R4, 7
	LDI        R22, 255
	MOV        R23, R22
	CALL       _HWMul_32x32+0
	CALL       _float_slong2fp+0
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 200
	LDI        R23, 66
	CALL       _float_fpdiv1+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
;libs/PWM_timers.mbas,105 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;libs/PWM_timers.mbas,110 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/PWM_timers.mbas,112 :: 		strToInt1()
	CALL       _strToInt1+0
;libs/PWM_timers.mbas,114 :: 		IntToStr(ii, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _output+0
	LDS        R3, _output+1
	CALL       _IntToStr+0
;libs/PWM_timers.mbas,115 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/PWM_timers.mbas,116 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/PWM_timers.mbas,117 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_libs/PWM_timers_PWM_MAKE_as_max6:
	DEC        R16
	BRNE       L_libs/PWM_timers_PWM_MAKE_as_max6
	DEC        R17
	BRNE       L_libs/PWM_timers_PWM_MAKE_as_max6
	DEC        R18
	BRNE       L_libs/PWM_timers_PWM_MAKE_as_max6
;libs/PWM_timers.mbas,118 :: 		end sub
L_end_PWM_MAKE_as_max:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of libs/PWM_timers_PWM_MAKE_as_max

_PWM_MAKE:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 6
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,122 :: 		jjyear as float
;libs/PWM_timers.mbas,124 :: 		jjyear=ceil((jj*max_duty)/100)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R6
	PUSH       R7
	MOV        R16, R2
	LDI        R17, 0
	MOV        R18, R17
	MOV        R19, R17
	MOV        R20, R3
	MOV        R21, R4
	LDI        R22, 0
	SBRC       R4, 7
	LDI        R22, 255
	MOV        R23, R22
	CALL       _HWMul_32x32+0
	CALL       _float_slong2fp+0
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 200
	LDI        R23, 66
	CALL       _float_fpdiv1+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
	STD        Y+2, R16
	STD        Y+3, R17
	STD        Y+4, R18
	STD        Y+5, R19
;libs/PWM_timers.mbas,125 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;libs/PWM_timers.mbas,130 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/PWM_timers.mbas,134 :: 		ii = integer (jjyear)
	LDD        R16, Y+2
	LDD        R17, Y+3
	LDD        R18, Y+4
	LDD        R19, Y+5
	CALL       _float_fpint+0
	STD        Y+0, R16
	STD        Y+1, R17
;libs/PWM_timers.mbas,135 :: 		IntToStr(ii, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;libs/PWM_timers.mbas,136 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/PWM_timers.mbas,137 :: 		Lcd_Out(2,6,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;libs/PWM_timers.mbas,138 :: 		IntToStr(jj, txt)
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/PWM_timers.mbas,139 :: 		Lcd_Out(2,1,txt)
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
	POP        R3
	POP        R4
	POP        R5
;libs/PWM_timers.mbas,143 :: 		case 1
	LDI        R27, 1
	CP         R5, R27
	BREQ       L__PWM_MAKE73
	JMP        L__PWM_MAKE12
L__PWM_MAKE73:
;libs/PWM_timers.mbas,146 :: 		PWM16bit_Change_Duty(ii, _TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE12:
;libs/PWM_timers.mbas,147 :: 		case 2
	LDI        R27, 2
	CP         R5, R27
	BREQ       L__PWM_MAKE74
	JMP        L__PWM_MAKE15
L__PWM_MAKE74:
;libs/PWM_timers.mbas,150 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE15:
;libs/PWM_timers.mbas,151 :: 		case 3
	LDI        R27, 3
	CP         R5, R27
	BREQ       L__PWM_MAKE75
	JMP        L__PWM_MAKE18
L__PWM_MAKE75:
;libs/PWM_timers.mbas,155 :: 		PWM16bit_Change_Duty(ii,2 )
	LDI        R27, 2
	MOV        R4, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE18:
;libs/PWM_timers.mbas,156 :: 		case 4
	LDI        R27, 4
	CP         R5, R27
	BREQ       L__PWM_MAKE76
	JMP        L__PWM_MAKE21
L__PWM_MAKE76:
;libs/PWM_timers.mbas,159 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE77
	JMP        L__PWM_MAKE23
L__PWM_MAKE77:
;libs/PWM_timers.mbas,160 :: 		SetPWM0(max_duty-ii)
	LDD        R0, Y+0
	LDD        R1, Y+1
	MOV        R16, R3
	MOV        R17, R4
	SUB        R16, R0
	SBC        R17, R1
	MOVW       R2, R16
	CALL       _SetPWM0+0
	JMP        L__PWM_MAKE24
;libs/PWM_timers.mbas,161 :: 		else
L__PWM_MAKE23:
;libs/PWM_timers.mbas,162 :: 		SetPWM0(max_duty-ii)
	LDD        R0, Y+0
	LDD        R1, Y+1
	MOV        R16, R3
	MOV        R17, R4
	SUB        R16, R0
	SBC        R17, R1
	MOVW       R2, R16
	CALL       _SetPWM0+0
;libs/PWM_timers.mbas,164 :: 		end if
L__PWM_MAKE24:
	JMP        L__PWM_MAKE9
L__PWM_MAKE21:
;libs/PWM_timers.mbas,167 :: 		case 5
	LDI        R27, 5
	CP         R5, R27
	BREQ       L__PWM_MAKE78
	JMP        L__PWM_MAKE27
L__PWM_MAKE78:
	JMP        L__PWM_MAKE9
L__PWM_MAKE27:
;libs/PWM_timers.mbas,171 :: 		case 6
	LDI        R27, 6
	CP         R5, R27
	BREQ       L__PWM_MAKE79
	JMP        L__PWM_MAKE30
L__PWM_MAKE79:
	JMP        L__PWM_MAKE9
L__PWM_MAKE30:
;libs/PWM_timers.mbas,175 :: 		case 7
	LDI        R27, 7
	CP         R5, R27
	BREQ       L__PWM_MAKE80
	JMP        L__PWM_MAKE33
L__PWM_MAKE80:
	JMP        L__PWM_MAKE9
L__PWM_MAKE33:
L__PWM_MAKE9:
;libs/PWM_timers.mbas,180 :: 		end sub
L_end_PWM_MAKE:
	POP        R7
	POP        R6
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 5
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PWM_MAKE

_PWM_Initialize:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,185 :: 		k as integer
;libs/PWM_timers.mbas,186 :: 		J=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, 0
	STD        Y+0, R27
;libs/PWM_timers.mbas,190 :: 		DDB4_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB4_bit+0
	SBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
;libs/PWM_timers.mbas,191 :: 		DDB5_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB5_bit+0
	SBR        R27, BitMask(DDB5_bit+0)
	OUT        DDB5_bit+0, R27
;libs/PWM_timers.mbas,192 :: 		DDB6_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB6_bit+0
	SBR        R27, BitMask(DDB6_bit+0)
	OUT        DDB6_bit+0, R27
;libs/PWM_timers.mbas,193 :: 		DDB7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB7_bit+0
	SBR        R27, BitMask(DDB7_bit+0)
	OUT        DDB7_bit+0, R27
;libs/PWM_timers.mbas,208 :: 		TCCR0=(1<<WGM00) or (1<<COM01) or (1<<COM00) or (1<<WGM01) or (1<<CS02) or (0<<CS01) or (1<<CS00)
	LDI        R27, 125
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,209 :: 		TCNT0=0x00
	LDI        R27, 0
	OUT        TCNT0+0, R27
;libs/PWM_timers.mbas,212 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, j , _TIMER1)
	LDI        R27, 1
	MOV        R7, R27
	CLR        R5
	CLR        R6
	LDI        R27, 168
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 11
	MOV        R2, R27
	CALL       _PWM16bit_Init+0
;libs/PWM_timers.mbas,213 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, j , 2)
	LDI        R27, 2
	MOV        R7, R27
	LDD        R5, Y+0
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 168
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 11
	MOV        R2, R27
	CALL       _PWM16bit_Init+0
;libs/PWM_timers.mbas,216 :: 		PWM1_Set_Duty(j)
	LDD        R2, Y+0
	CALL       _PWM1_Set_Duty+0
;libs/PWM_timers.mbas,217 :: 		PWM2_Set_Duty(j)
	LDD        R2, Y+0
	CALL       _PWM2_Set_Duty+0
;libs/PWM_timers.mbas,219 :: 		ocr0=0 ocr2=0
	LDI        R27, 0
	OUT        OCR0+0, R27
	LDI        R27, 0
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,221 :: 		for k=0 to 10
	LDI        R27, 0
	STD        Y+1, R27
	STD        Y+2, R27
L__PWM_Initialize36:
;libs/PWM_timers.mbas,222 :: 		PWM_MAKE (k*10,255,1)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+1
	LDD        R21, Y+2
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,223 :: 		delay_ms(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__PWM_Initialize40:
	DEC        R16
	BRNE       L__PWM_Initialize40
	DEC        R17
	BRNE       L__PWM_Initialize40
	DEC        R18
	BRNE       L__PWM_Initialize40
	NOP
;libs/PWM_timers.mbas,224 :: 		next k
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L__PWM_Initialize82
	CPI        R16, 10
L__PWM_Initialize82:
	BRNE       L__PWM_Initialize83
	JMP        L__PWM_Initialize39
L__PWM_Initialize83:
	LDD        R16, Y+1
	LDD        R17, Y+2
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+1, R16
	STD        Y+2, R17
	JMP        L__PWM_Initialize36
L__PWM_Initialize39:
;libs/PWM_timers.mbas,242 :: 		end sub
L_end_PWM_Initialize:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PWM_Initialize

_on_off_initial:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,245 :: 		dim Pwm_chanel_ini,chanel_ini,week_ini as byte
;libs/PWM_timers.mbas,246 :: 		Lcd_0() lcd_out(1,1,"Initialsiing on_a_0")
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 3
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 253
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/PWM_timers.mbas,247 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__on_off_initial43:
	DEC        R16
	BRNE       L__on_off_initial43
	DEC        R17
	BRNE       L__on_off_initial43
	DEC        R18
	BRNE       L__on_off_initial43
	NOP
;libs/PWM_timers.mbas,248 :: 		for week_ini =1 to 7
	LDI        R27, 1
	STD        Y+2, R27
L__on_off_initial46:
;libs/PWM_timers.mbas,249 :: 		for Pwm_chanel_ini=1 to 7
	LDI        R27, 1
	STD        Y+0, R27
L__on_off_initial51:
;libs/PWM_timers.mbas,250 :: 		for chanel_ini =1 to 1
	LDI        R27, 1
	STD        Y+1, R27
L__on_off_initial56:
;libs/PWM_timers.mbas,251 :: 		on_a_0 [week_ini-1][chanel_ini-1][Pwm_chanel_ini-1][on_off22-1][0] =en
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	ST         Z, R3
;libs/PWM_timers.mbas,252 :: 		on_a_0 [week_ini-1][chanel_ini-1][Pwm_chanel_ini-1][on_off22-1][1]=hr
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	MOV        R16, R2
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
	ST         Z, R4
;libs/PWM_timers.mbas,253 :: 		on_a_0 [week_ini-1][chanel_ini-1][Pwm_chanel_ini-1][on_off22-1][2] =mint
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	MOV        R16, R2
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
	ST         Z, R5
;libs/PWM_timers.mbas,254 :: 		on_a_0 [week_ini-1][chanel_ini-1][Pwm_chanel_ini-1][on_off22-1][3]=prc
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	MOV        R16, R2
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
	ST         Z, R6
;libs/PWM_timers.mbas,257 :: 		next chanel_ini
	LDD        R16, Y+1
	CPI        R16, 1
	BRNE       L__on_off_initial85
	JMP        L__on_off_initial59
L__on_off_initial85:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__on_off_initial56
L__on_off_initial59:
;libs/PWM_timers.mbas,258 :: 		for chanel_ini =2 to 4
	LDI        R27, 2
	STD        Y+1, R27
L__on_off_initial61:
;libs/PWM_timers.mbas,259 :: 		on_a_0 [week_ini-1][chanel_ini-1][Pwm_chanel_ini-1][on_off22-1][0] =0
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 0
	ST         Z, R27
;libs/PWM_timers.mbas,260 :: 		on_a_0 [week_ini-1][chanel_ini-1][Pwm_chanel_ini-1][on_off22-1][1]=hr
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	MOV        R16, R2
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
	ST         Z, R4
;libs/PWM_timers.mbas,261 :: 		on_a_0 [week_ini-1][chanel_ini-1][Pwm_chanel_ini-1][on_off22-1][2] =mint
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	MOV        R16, R2
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
	ST         Z, R5
;libs/PWM_timers.mbas,262 :: 		on_a_0 [week_ini-1][chanel_ini-1][Pwm_chanel_ini-1][on_off22-1][3]=0
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	MOV        R16, R2
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
	LDI        R27, 0
	ST         Z, R27
;libs/PWM_timers.mbas,265 :: 		next chanel_ini
	LDD        R16, Y+1
	CPI        R16, 4
	BRNE       L__on_off_initial86
	JMP        L__on_off_initial64
L__on_off_initial86:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__on_off_initial61
L__on_off_initial64:
;libs/PWM_timers.mbas,266 :: 		next Pwm_chanel_ini
	LDD        R16, Y+0
	CPI        R16, 7
	BRNE       L__on_off_initial87
	JMP        L__on_off_initial54
L__on_off_initial87:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__on_off_initial51
L__on_off_initial54:
;libs/PWM_timers.mbas,267 :: 		next week_ini
	LDD        R16, Y+2
	CPI        R16, 7
	BRNE       L__on_off_initial88
	JMP        L__on_off_initial49
L__on_off_initial88:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L__on_off_initial46
L__on_off_initial49:
;libs/PWM_timers.mbas,269 :: 		end sub
L_end_on_off_initial:
	ADIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _on_off_initial

_WDT_on:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,270 :: 		sub procedure  WDT_on()
;libs/PWM_timers.mbas,302 :: 		WDTCR =(1<<WDP2) or (1<<WDP1)  or (1<<WDP0)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 7
	OUT        WDTCR+0, R27
;libs/PWM_timers.mbas,308 :: 		Lcd_Cmd(_LCD_CLEAR)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;libs/PWM_timers.mbas,309 :: 		Lcd_Out(2,2,"Reset.")
	MOVW       R30, R28
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/PWM_timers.mbas,315 :: 		end sub
L_end_WDT_on:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 6
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _WDT_on

_libs/PWM_timers_?main:

;libs/PWM_timers.mbas,318 :: 		end.
L_end_libs/PWM_timers_?main:
	RET
; end of _libs/PWM_timers_?main
