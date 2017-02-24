
libs/PWM_timers_pwm_set_1B:

;libs/PWM_timers.mbas,41 :: 		Sub procedure pwm_set_1B(dim pulse_width as  char )
;libs/PWM_timers.mbas,43 :: 		OCR1BL = pulse_width ''  //Load Pulse width
	OUT        OCR1BL+0, R2
;libs/PWM_timers.mbas,44 :: 		OCR1AL = pulse_width ''  //Load Pulse width
	OUT        OCR1AL+0, R2
;libs/PWM_timers.mbas,45 :: 		OCR0 = pulse_width
	OUT        OCR0+0, R2
;libs/PWM_timers.mbas,46 :: 		OCR2 = pulse_width
	OUT        OCR2+0, R2
;libs/PWM_timers.mbas,51 :: 		TCCR0 = (1<<FOC2)or (1<<COM21)or(1<<COM20) or(1<<WGM20) or (1<<CS00)
	LDI        R27, 241
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,52 :: 		TCCR1A  = (1<<FOC2)or(1<<COM21)or(1<<COM20)or (1<<WGM20)or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR1A+0, R27
;libs/PWM_timers.mbas,53 :: 		TCCR2 = (1<<FOC2)or(1<<COM21)or(1<<COM20)or(1<<WGM20) or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,55 :: 		TCCR1B = 1<<CS10
	LDI        R27, 1
	OUT        TCCR1B+0, R27
;libs/PWM_timers.mbas,56 :: 		end sub
L_end_pwm_set_1B:
	RET
; end of libs/PWM_timers_pwm_set_1B

libs/PWM_timers_Timer2_Compare:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;libs/PWM_timers.mbas,58 :: 		Sub procedure Timer2_Compare iv IVT_ADDR_TIMER2_COMP 'L?st aus alle (8Mhz/1024/125) 16ms
;libs/PWM_timers.mbas,59 :: 		inc(_ss)
	LDS        R16, __ss+0
	LDS        R17, __ss+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __ss+0, R16
	STS        __ss+1, R17
;libs/PWM_timers.mbas,60 :: 		End sub
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

;libs/PWM_timers.mbas,62 :: 		sub procedure Timer0_overflow iv IVT_ADDR_TIMER0_OVF
;libs/PWM_timers.mbas,63 :: 		inc(_zz)
	LDS        R16, __zz+0
	LDS        R17, __zz+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __zz+0, R16
	STS        __zz+1, R17
;libs/PWM_timers.mbas,64 :: 		TIFR.TOV0=0
	IN         R27, TIFR+0
	CBR        R27, 1
	OUT        TIFR+0, R27
;libs/PWM_timers.mbas,66 :: 		end sub
L_end_Timer0_overflow:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of libs/PWM_timers_Timer0_overflow

libs/PWM_timers_SetRegister:

;libs/PWM_timers.mbas,68 :: 		sub procedure SetRegister()
;libs/PWM_timers.mbas,78 :: 		TCCR2.WGM21=1 'CTC Mode Aktivierung Timer2
	IN         R27, TCCR2+0
	SBR        R27, 8
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,79 :: 		TCCR2.COM20=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 16
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,80 :: 		TCCR2.COM21=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 32
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,82 :: 		TCCR0.CS02=1 'Ext Flanke Interrupt (T0)
	IN         R27, TCCR0+0
	SBR        R27, 4
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,83 :: 		TCCR0.CS01=1
	IN         R27, TCCR0+0
	SBR        R27, 2
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,84 :: 		TCCR0.CS00=1
	IN         R27, TCCR0+0
	SBR        R27, 1
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,86 :: 		TCCR2.CS22=1 'Set Prescaler Timer2 1024 setzen
	IN         R27, TCCR2+0
	SBR        R27, 4
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,87 :: 		TCCR2.CS21=1
	IN         R27, TCCR2+0
	SBR        R27, 2
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,88 :: 		TCCR2.CS20=1
	IN         R27, TCCR2+0
	SBR        R27, 1
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,90 :: 		OCR2=124 'Set Output Compare register Timer2 to 124 (for Loop 0-124 => 125)
	LDI        R27, 124
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,91 :: 		TIMSK.OCIE2=1 ' Enable comp match flag interrupt Timer 2
	IN         R27, TIMSK+0
	SBR        R27, 128
	OUT        TIMSK+0, R27
;libs/PWM_timers.mbas,92 :: 		TIMSK.TOIE0=1 ' Enable OV flag interrupt Timer 0
	IN         R27, TIMSK+0
	SBR        R27, 1
	OUT        TIMSK+0, R27
;libs/PWM_timers.mbas,93 :: 		SREG.SREG_I=1
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;libs/PWM_timers.mbas,94 :: 		End Sub
L_end_SetRegister:
	RET
; end of libs/PWM_timers_SetRegister

libs/PWM_timers_SetPWM0:

;libs/PWM_timers.mbas,98 :: 		dim txt_s as string[4]
;libs/PWM_timers.mbas,101 :: 		OCR0=duty
	OUT        OCR0+0, R2
;libs/PWM_timers.mbas,105 :: 		end sub
L_end_SetPWM0:
	RET
; end of libs/PWM_timers_SetPWM0

libs/PWM_timers_SetPWM1_A:

;libs/PWM_timers.mbas,106 :: 		sub procedure SetPWM1_A(dim duty as integer)
;libs/PWM_timers.mbas,110 :: 		OCR1AH=0x00
	LDI        R27, 0
	OUT        OCR1AH+0, R27
;libs/PWM_timers.mbas,111 :: 		OCR1AL=duty
	OUT        OCR1AL+0, R2
;libs/PWM_timers.mbas,113 :: 		end sub
L_end_SetPWM1_A:
	RET
; end of libs/PWM_timers_SetPWM1_A

libs/PWM_timers_SetPWM2:

;libs/PWM_timers.mbas,114 :: 		sub procedure SetPWM2(dim duty as integer)
;libs/PWM_timers.mbas,119 :: 		OCR2=duty
	OUT        OCR2+0, R2
;libs/PWM_timers.mbas,121 :: 		end sub
L_end_SetPWM2:
	RET
; end of libs/PWM_timers_SetPWM2

libs/PWM_timers_SetPWM1_B:

;libs/PWM_timers.mbas,122 :: 		sub procedure SetPWM1_B(dim duty as integer)
;libs/PWM_timers.mbas,126 :: 		OCR1BH=0x00
	LDI        R27, 0
	OUT        OCR1BH+0, R27
;libs/PWM_timers.mbas,127 :: 		OCR1BL=duty
	OUT        OCR1BL+0, R2
;libs/PWM_timers.mbas,128 :: 		end sub
L_end_SetPWM1_B:
	RET
; end of libs/PWM_timers_SetPWM1_B

_PWM_MAKE:

;libs/PWM_timers.mbas,151 :: 		jjyear as float
;libs/PWM_timers.mbas,153 :: 		jjyear=ceil((jj*max_duty)/100)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	MOV        R16, R2
	LDI        R17, 0
	MOV        R20, R3
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R20, 100
	LDI        R21, 0
	CALL       _Div_16x16_U+0
	MOVW       R16, R24
	LDI        R18, 0
	MOV        R19, R18
	CALL       _float_ulong2fp+0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
	POP        R2
	POP        R3
	POP        R4
; jjyear start address is: 20 (R20)
	MOVW       R20, R16
	MOVW       R22, R18
;libs/PWM_timers.mbas,154 :: 		FloatToStr(jjyear, st)
	PUSH       R23
	PUSH       R22
	PUSH       R21
	PUSH       R20
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
	POP        R2
	POP        R3
	POP        R4
	POP        R20
	POP        R21
	POP        R22
	POP        R23
;libs/PWM_timers.mbas,163 :: 		ii = integer (jjyear)
	MOVW       R16, R20
	MOVW       R18, R22
	CALL       _float_fpint+0
; jjyear end address is: 20 (R20)
; ii start address is: 18 (R18)
	MOVW       R18, R16
;libs/PWM_timers.mbas,164 :: 		IntToStr(ii, txt)
	PUSH       R19
	PUSH       R18
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
	POP        R2
	POP        R3
	POP        R4
	POP        R18
	POP        R19
;libs/PWM_timers.mbas,171 :: 		case 2
	LDI        R27, 2
	CP         R4, R27
	BREQ       L__PWM_MAKE123
	JMP        L__PWM_MAKE12
L__PWM_MAKE123:
;libs/PWM_timers.mbas,178 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	MOVW       R2, R18
	CALL       _PWM16bit_Change_Duty+0
;libs/PWM_timers.mbas,179 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE12:
;libs/PWM_timers.mbas,180 :: 		case 1
; ii start address is: 18 (R18)
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__PWM_MAKE124
	JMP        L__PWM_MAKE15
L__PWM_MAKE124:
;libs/PWM_timers.mbas,188 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	MOVW       R2, R18
	CALL       _PWM16bit_Change_Duty+0
;libs/PWM_timers.mbas,189 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE15:
;libs/PWM_timers.mbas,190 :: 		case 30  ''old
; ii start address is: 18 (R18)
	LDI        R27, 30
	CP         R4, R27
	BREQ       L__PWM_MAKE125
	JMP        L__PWM_MAKE18
L__PWM_MAKE125:
;libs/PWM_timers.mbas,193 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE126
	JMP        L__PWM_MAKE20
L__PWM_MAKE126:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,194 :: 		SetPWM0(max_duty)
	MOV        R2, R3
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/PWM_timers_SetPWM0+0
	JMP        L__PWM_MAKE21
;libs/PWM_timers.mbas,195 :: 		else
L__PWM_MAKE20:
;libs/PWM_timers.mbas,196 :: 		if jj=max_duty  then
; ii start address is: 18 (R18)
	CP         R2, R3
	BREQ       L__PWM_MAKE127
	JMP        L__PWM_MAKE23
L__PWM_MAKE127:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,197 :: 		SetPWM0(0x00)
	CLR        R2
	CLR        R3
	CALL       libs/PWM_timers_SetPWM0+0
	JMP        L__PWM_MAKE24
;libs/PWM_timers.mbas,198 :: 		else
L__PWM_MAKE23:
;libs/PWM_timers.mbas,199 :: 		SetPWM0(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM0+0
;libs/PWM_timers.mbas,200 :: 		end if
L__PWM_MAKE24:
;libs/PWM_timers.mbas,202 :: 		end if
L__PWM_MAKE21:
	JMP        L__PWM_MAKE9
L__PWM_MAKE18:
;libs/PWM_timers.mbas,203 :: 		case 33
; ii start address is: 18 (R18)
	LDI        R27, 33
	CP         R4, R27
	BREQ       L__PWM_MAKE128
	JMP        L__PWM_MAKE27
L__PWM_MAKE128:
;libs/PWM_timers.mbas,206 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE129
	JMP        L__PWM_MAKE29
L__PWM_MAKE129:
;libs/PWM_timers.mbas,207 :: 		SetPWM0(ii)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       libs/PWM_timers_SetPWM0+0
	JMP        L__PWM_MAKE30
;libs/PWM_timers.mbas,208 :: 		else
L__PWM_MAKE29:
;libs/PWM_timers.mbas,209 :: 		SetPWM0(ii)
; ii start address is: 18 (R18)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       libs/PWM_timers_SetPWM0+0
;libs/PWM_timers.mbas,211 :: 		end if
L__PWM_MAKE30:
	JMP        L__PWM_MAKE9
L__PWM_MAKE27:
;libs/PWM_timers.mbas,212 :: 		case 4
; ii start address is: 18 (R18)
	LDI        R27, 4
	CP         R4, R27
	BREQ       L__PWM_MAKE130
	JMP        L__PWM_MAKE33
L__PWM_MAKE130:
;libs/PWM_timers.mbas,221 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE131
	JMP        L__PWM_MAKE35
L__PWM_MAKE131:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,222 :: 		SetPWM2(0)
	CLR        R2
	CLR        R3
	CALL       libs/PWM_timers_SetPWM2+0
	JMP        L__PWM_MAKE36
;libs/PWM_timers.mbas,223 :: 		else
L__PWM_MAKE35:
;libs/PWM_timers.mbas,224 :: 		SetPWM2(ii)
; ii start address is: 18 (R18)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       libs/PWM_timers_SetPWM2+0
;libs/PWM_timers.mbas,226 :: 		end if
L__PWM_MAKE36:
	JMP        L__PWM_MAKE9
L__PWM_MAKE33:
;libs/PWM_timers.mbas,227 :: 		case 55
; ii start address is: 18 (R18)
	LDI        R27, 55
	CP         R4, R27
	BREQ       L__PWM_MAKE132
	JMP        L__PWM_MAKE39
L__PWM_MAKE132:
;libs/PWM_timers.mbas,232 :: 		PWM2_Set_Duty(ii)''Set current duty for PWM2
	MOV        R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE39:
;libs/PWM_timers.mbas,233 :: 		case 45
; ii start address is: 18 (R18)
	LDI        R27, 45
	CP         R4, R27
	BREQ       L__PWM_MAKE133
	JMP        L__PWM_MAKE42
L__PWM_MAKE133:
;libs/PWM_timers.mbas,237 :: 		PWM16bit_Change_Duty(ii,2 )
	LDI        R27, 2
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE42:
;libs/PWM_timers.mbas,239 :: 		case 50
; ii start address is: 18 (R18)
	LDI        R27, 50
	CP         R4, R27
	BREQ       L__PWM_MAKE134
	JMP        L__PWM_MAKE45
L__PWM_MAKE134:
;libs/PWM_timers.mbas,244 :: 		PWM2_Set_Duty(ii)''Set current duty for PWM2
	MOV        R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE45:
;libs/PWM_timers.mbas,245 :: 		case 25
; ii start address is: 18 (R18)
	LDI        R27, 25
	CP         R4, R27
	BREQ       L__PWM_MAKE135
	JMP        L__PWM_MAKE48
L__PWM_MAKE135:
;libs/PWM_timers.mbas,248 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE136
	JMP        L__PWM_MAKE50
L__PWM_MAKE136:
;libs/PWM_timers.mbas,249 :: 		SetPWM1_A(max_duty-ii)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_A+0
	JMP        L__PWM_MAKE51
;libs/PWM_timers.mbas,250 :: 		else
L__PWM_MAKE50:
;libs/PWM_timers.mbas,251 :: 		SetPWM1_A(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_A+0
;libs/PWM_timers.mbas,253 :: 		end if
L__PWM_MAKE51:
	JMP        L__PWM_MAKE9
L__PWM_MAKE48:
;libs/PWM_timers.mbas,254 :: 		case 35
; ii start address is: 18 (R18)
	LDI        R27, 35
	CP         R4, R27
	BREQ       L__PWM_MAKE137
	JMP        L__PWM_MAKE54
L__PWM_MAKE137:
;libs/PWM_timers.mbas,257 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE138
	JMP        L__PWM_MAKE56
L__PWM_MAKE138:
;libs/PWM_timers.mbas,258 :: 		SetPWM1_B(max_duty-ii)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_B+0
	JMP        L__PWM_MAKE57
;libs/PWM_timers.mbas,259 :: 		else
L__PWM_MAKE56:
;libs/PWM_timers.mbas,260 :: 		SetPWM1_B(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_B+0
;libs/PWM_timers.mbas,262 :: 		end if
L__PWM_MAKE57:
	JMP        L__PWM_MAKE9
L__PWM_MAKE54:
;libs/PWM_timers.mbas,264 :: 		case 5
	LDI        R27, 5
	CP         R4, R27
	BREQ       L__PWM_MAKE139
	JMP        L__PWM_MAKE60
L__PWM_MAKE139:
	JMP        L__PWM_MAKE9
L__PWM_MAKE60:
;libs/PWM_timers.mbas,268 :: 		case 6
	LDI        R27, 6
	CP         R4, R27
	BREQ       L__PWM_MAKE140
	JMP        L__PWM_MAKE63
L__PWM_MAKE140:
	JMP        L__PWM_MAKE9
L__PWM_MAKE63:
;libs/PWM_timers.mbas,272 :: 		case 7
	LDI        R27, 7
	CP         R4, R27
	BREQ       L__PWM_MAKE141
	JMP        L__PWM_MAKE66
L__PWM_MAKE141:
	JMP        L__PWM_MAKE9
L__PWM_MAKE66:
L__PWM_MAKE9:
;libs/PWM_timers.mbas,277 :: 		end sub
L_end_PWM_MAKE:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _PWM_MAKE

_PWM_Port_Initialize:

;libs/PWM_timers.mbas,280 :: 		sub procedure PWM_Port_Initialize ()
;libs/PWM_timers.mbas,291 :: 		DDB3_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;libs/PWM_timers.mbas,292 :: 		DDD7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD7_bit+0
	SBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;libs/PWM_timers.mbas,293 :: 		DDD4_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD4_bit+0
	SBR        R27, BitMask(DDD4_bit+0)
	OUT        DDD4_bit+0, R27
;libs/PWM_timers.mbas,294 :: 		DDD5_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD5_bit+0
	SBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
;libs/PWM_timers.mbas,297 :: 		end  sub
L_end_PWM_Port_Initialize:
	RET
; end of _PWM_Port_Initialize

_PWM_Initialize:

;libs/PWM_timers.mbas,301 :: 		dim j,k as byte
;libs/PWM_timers.mbas,365 :: 		ASSR=0x00
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, 0
	OUT        ASSR+0, R27
;libs/PWM_timers.mbas,370 :: 		TCCR0 = (1<<FOC2)or(1<<COM00)or(1<<COM01)or(1<<WGM00) or(0<<WGM01)or(1<<CS00) or(0<<CS01) or(1<<CS02) or (0<<WGM21)
	LDI        R27, 245
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,371 :: 		TCNT0=0x00
	LDI        R27, 0
	OUT        TCNT0+0, R27
;libs/PWM_timers.mbas,374 :: 		TCCR2 = (1<<FOC2)or(1<<COM01)or(0<<COM00)or(1<<WGM00) or(0<<WGM01)or(1<<CS00) or(0<<CS01) or(1<<CS02) or (0<<WGM21)
	LDI        R27, 229
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,375 :: 		TCNT2=0x00
	LDI        R27, 0
	OUT        TCNT2+0, R27
;libs/PWM_timers.mbas,376 :: 		ocr0=0xFF
	LDI        R27, 255
	OUT        OCR0+0, R27
;libs/PWM_timers.mbas,377 :: 		ocr2=0x00
	LDI        R27, 0
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,382 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, 0, _TIMER1)
	LDI        R27, 1
	MOV        R7, R27
	CLR        R5
	CLR        R6
	LDI        R27, 160
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 11
	MOV        R2, R27
	CALL       _PWM16bit_Init+0
;libs/PWM_timers.mbas,422 :: 		end sub
L_end_PWM_Initialize:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _PWM_Initialize

libs/PWM_timers_PWM_Initialize_old:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,426 :: 		k as byte
;libs/PWM_timers.mbas,427 :: 		J=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STD        Y+0, R27
;libs/PWM_timers.mbas,438 :: 		TCCR0=(1<<WGM00) or (1<<COM01) or (1<<COM00) or (1<<WGM01) or (1<<CS02) or (0<<CS01) or (1<<CS00)
	LDI        R27, 125
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,439 :: 		TCNT0=0x00
	LDI        R27, 0
	OUT        TCNT0+0, R27
;libs/PWM_timers.mbas,453 :: 		TCCR1A=0xA1
	LDI        R27, 161
	OUT        TCCR1A+0, R27
;libs/PWM_timers.mbas,454 :: 		TCCR1B=0x05
	LDI        R27, 5
	OUT        TCCR1B+0, R27
;libs/PWM_timers.mbas,455 :: 		TCNT1H=0x00
	LDI        R27, 0
	OUT        TCNT1H+0, R27
;libs/PWM_timers.mbas,456 :: 		TCNT1L=0x00
	LDI        R27, 0
	OUT        TCNT1L+0, R27
;libs/PWM_timers.mbas,457 :: 		ICR1H=0x00
	LDI        R27, 0
	OUT        ICR1H+0, R27
;libs/PWM_timers.mbas,458 :: 		ICR1L=0x00
	LDI        R27, 0
	OUT        ICR1L+0, R27
;libs/PWM_timers.mbas,459 :: 		OCR1AH=0x00
	LDI        R27, 0
	OUT        OCR1AH+0, R27
;libs/PWM_timers.mbas,460 :: 		OCR1AL=0x11
	LDI        R27, 17
	OUT        OCR1AL+0, R27
;libs/PWM_timers.mbas,461 :: 		OCR1BH=0x00
	LDI        R27, 0
	OUT        OCR1BH+0, R27
;libs/PWM_timers.mbas,462 :: 		OCR1BL=0x12
	LDI        R27, 18
	OUT        OCR1BL+0, R27
;libs/PWM_timers.mbas,475 :: 		ocr0=0 ocr2=0
	LDI        R27, 0
	OUT        OCR0+0, R27
	LDI        R27, 0
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,477 :: 		PWM1_Init(_PWM1_FAST_MODE, _PWM1_PRESCALER_8, _PWM1_NON_INVERTED, 127)''PWM1_Init(5000)'' Initialize PWM1
	LDI        R27, 127
	MOV        R5, R27
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM1_Init+0
;libs/PWM_timers.mbas,481 :: 		PWM1_Start()'' start PWM1
	CALL       _PWM1_Start+0
;libs/PWM_timers.mbas,484 :: 		PWM1_Set_Duty(j)''Set current duty for PWM1
	LDD        R2, Y+0
	CALL       _PWM1_Set_Duty+0
;libs/PWM_timers.mbas,486 :: 		ASSR=0x00
	LDI        R27, 0
	OUT        ASSR+0, R27
;libs/PWM_timers.mbas,487 :: 		TCCR2=0x27
	LDI        R27, 39
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,488 :: 		TCNT2=0x00
	LDI        R27, 0
	OUT        TCNT2+0, R27
;libs/PWM_timers.mbas,489 :: 		for k=10 to 0  step -1
	LDI        R27, 10
	STD        Y+1, R27
L_libs/PWM_timers_PWM_Initialize_old71:
;libs/PWM_timers.mbas,490 :: 		PWM_MAKE (k*10,255,1)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R17, Y+1
	LDI        R16, 10
	MUL        R17, R16
	MOV        R16, R0
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,491 :: 		PWM_MAKE (k*10,255,2)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R17, Y+1
	LDI        R16, 10
	MUL        R17, R16
	MOV        R16, R0
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,492 :: 		PWM_MAKE (k*10,255,3)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R17, Y+1
	LDI        R16, 10
	MUL        R17, R16
	MOV        R16, R0
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,493 :: 		PWM_MAKE (k*10,255,4)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R17, Y+1
	LDI        R16, 10
	MUL        R17, R16
	MOV        R16, R0
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,494 :: 		delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L_libs/PWM_timers_PWM_Initialize_old75:
	DEC        R16
	BRNE       L_libs/PWM_timers_PWM_Initialize_old75
	DEC        R17
	BRNE       L_libs/PWM_timers_PWM_Initialize_old75
;libs/PWM_timers.mbas,495 :: 		next k
	LDD        R16, Y+1
	CPI        R16, 0
	BRNE       L_libs/PWM_timers_PWM_Initialize_old145
	JMP        L_libs/PWM_timers_PWM_Initialize_old74
L_libs/PWM_timers_PWM_Initialize_old145:
	LDD        R16, Y+1
	SUBI       R16, 1
	STD        Y+1, R16
	JMP        L_libs/PWM_timers_PWM_Initialize_old71
L_libs/PWM_timers_PWM_Initialize_old74:
;libs/PWM_timers.mbas,496 :: 		PWM_MAKE (0,255,4)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,516 :: 		end sub
L_end_PWM_Initialize_old:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/PWM_timers_PWM_Initialize_old

_On_mSec_initial_heater:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,520 :: 		dim Pwm_chanel_ini,chanel_ini,Heater_Motor_Time_ini as byte
;libs/PWM_timers.mbas,521 :: 		Lcd_0() lcd_out(1,1,"Initialsiing Heater")
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
;libs/PWM_timers.mbas,522 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__On_mSec_initial_heater78:
	DEC        R16
	BRNE       L__On_mSec_initial_heater78
	DEC        R17
	BRNE       L__On_mSec_initial_heater78
	DEC        R18
	BRNE       L__On_mSec_initial_heater78
;libs/PWM_timers.mbas,523 :: 		for chanel_ini =1 to 7
	LDI        R27, 1
	STD        Y+1, R27
L__On_mSec_initial_heater81:
;libs/PWM_timers.mbas,524 :: 		for Heater_Motor_Time_ini=1 to 2 ''Heater
	LDI        R27, 1
	STD        Y+2, R27
L__On_mSec_initial_heater86:
;libs/PWM_timers.mbas,525 :: 		for Pwm_chanel_ini =1 to 3
	LDI        R27, 1
	STD        Y+0, R27
L__On_mSec_initial_heater91:
;libs/PWM_timers.mbas,526 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0] =en
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
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
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	ST         Z, R2
;libs/PWM_timers.mbas,527 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][1]=mint
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
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
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	ST         Z, R3
;libs/PWM_timers.mbas,528 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][2] =sec
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
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
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	ST         Z, R4
;libs/PWM_timers.mbas,529 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][3]=prc
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
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
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	ST         Z, R5
;libs/PWM_timers.mbas,532 :: 		next Pwm_chanel_ini
	LDD        R16, Y+0
	CPI        R16, 3
	BRNE       L__On_mSec_initial_heater147
	JMP        L__On_mSec_initial_heater94
L__On_mSec_initial_heater147:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__On_mSec_initial_heater91
L__On_mSec_initial_heater94:
;libs/PWM_timers.mbas,533 :: 		next Heater_Motor_Time_ini
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L__On_mSec_initial_heater148
	JMP        L__On_mSec_initial_heater89
L__On_mSec_initial_heater148:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L__On_mSec_initial_heater86
L__On_mSec_initial_heater89:
;libs/PWM_timers.mbas,534 :: 		next chanel_ini
	LDD        R16, Y+1
	CPI        R16, 7
	BRNE       L__On_mSec_initial_heater149
	JMP        L__On_mSec_initial_heater84
L__On_mSec_initial_heater149:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__On_mSec_initial_heater81
L__On_mSec_initial_heater84:
;libs/PWM_timers.mbas,535 :: 		end sub
L_end_On_mSec_initial_heater:
	ADIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _On_mSec_initial_heater

_On_mSec_initial_Motor:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,538 :: 		dim Pwm_chanel_ini,chanel_ini,Heater_Motor_Time_ini as byte
;libs/PWM_timers.mbas,539 :: 		Lcd_0() lcd_out(1,1,"Initialsiing Motor")
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
;libs/PWM_timers.mbas,540 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__On_mSec_initial_Motor96:
	DEC        R16
	BRNE       L__On_mSec_initial_Motor96
	DEC        R17
	BRNE       L__On_mSec_initial_Motor96
	DEC        R18
	BRNE       L__On_mSec_initial_Motor96
;libs/PWM_timers.mbas,541 :: 		for chanel_ini =1 to 7
	LDI        R27, 1
	STD        Y+1, R27
L__On_mSec_initial_Motor99:
;libs/PWM_timers.mbas,542 :: 		for Heater_Motor_Time_ini=2 to 2 ''Motor
	LDI        R27, 2
	STD        Y+2, R27
L__On_mSec_initial_Motor104:
;libs/PWM_timers.mbas,543 :: 		for Pwm_chanel_ini =2 to 3
	LDI        R27, 2
	STD        Y+0, R27
L__On_mSec_initial_Motor109:
;libs/PWM_timers.mbas,544 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0] =en
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+24, R16
	STD        Y+25, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+24
	LDD        R19, Y+25
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	ST         Z, R2
;libs/PWM_timers.mbas,545 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][1]=mint
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+24, R16
	STD        Y+25, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+24
	LDD        R19, Y+25
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	ST         Z, R3
;libs/PWM_timers.mbas,546 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][2] =sec
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+24, R16
	STD        Y+25, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+24
	LDD        R19, Y+25
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	ST         Z, R4
;libs/PWM_timers.mbas,547 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][3]=prc
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+24, R16
	STD        Y+25, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+24
	LDD        R19, Y+25
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
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
	ST         Z, R5
;libs/PWM_timers.mbas,550 :: 		next Pwm_chanel_ini
	LDD        R16, Y+0
	CPI        R16, 3
	BRNE       L__On_mSec_initial_Motor151
	JMP        L__On_mSec_initial_Motor112
L__On_mSec_initial_Motor151:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__On_mSec_initial_Motor109
L__On_mSec_initial_Motor112:
;libs/PWM_timers.mbas,551 :: 		next Heater_Motor_Time_ini
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L__On_mSec_initial_Motor152
	JMP        L__On_mSec_initial_Motor107
L__On_mSec_initial_Motor152:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L__On_mSec_initial_Motor104
L__On_mSec_initial_Motor107:
;libs/PWM_timers.mbas,552 :: 		next chanel_ini
	LDD        R16, Y+1
	CPI        R16, 7
	BRNE       L__On_mSec_initial_Motor153
	JMP        L__On_mSec_initial_Motor102
L__On_mSec_initial_Motor153:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__On_mSec_initial_Motor99
L__On_mSec_initial_Motor102:
;libs/PWM_timers.mbas,553 :: 		end sub
L_end_On_mSec_initial_Motor:
	ADIW       R28, 25
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _On_mSec_initial_Motor

libs/PWM_timers_WDT_on_old:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,554 :: 		sub procedure  WDT_on_old()
;libs/PWM_timers.mbas,586 :: 		WDTCR =(1<<WDP2) or (1<<WDP1)  or (1<<WDP0)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 7
	OUT        WDTCR+0, R27
;libs/PWM_timers.mbas,592 :: 		Lcd_Cmd(_LCD_CLEAR)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;libs/PWM_timers.mbas,593 :: 		Lcd_Out(2,2,"Reset.")
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
;libs/PWM_timers.mbas,599 :: 		end sub
L_end_WDT_on_old:
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
; end of libs/PWM_timers_WDT_on_old

_libs/PWM_timers_?main:

;libs/PWM_timers.mbas,605 :: 		end.
L_end_libs/PWM_timers_?main:
	RET
; end of _libs/PWM_timers_?main
