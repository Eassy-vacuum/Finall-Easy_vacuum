
libs/PWM_timers_pwm_set_1B:

;libs/PWM_timers.mbas,46 :: 		Sub procedure pwm_set_1B(dim pulse_width as  char )
;libs/PWM_timers.mbas,48 :: 		OCR1BL = pulse_width ''  //Load Pulse width
	OUT        OCR1BL+0, R2
;libs/PWM_timers.mbas,49 :: 		OCR1AL = pulse_width ''  //Load Pulse width
	OUT        OCR1AL+0, R2
;libs/PWM_timers.mbas,50 :: 		OCR0 = pulse_width
	OUT        OCR0+0, R2
;libs/PWM_timers.mbas,51 :: 		OCR2 = pulse_width
	OUT        OCR2+0, R2
;libs/PWM_timers.mbas,56 :: 		TCCR0 = (1<<FOC2)or (1<<COM21)or(1<<COM20) or(1<<WGM20) or (1<<CS00)
	LDI        R27, 241
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,57 :: 		TCCR1A  = (1<<FOC2)or(1<<COM21)or(1<<COM20)or (1<<WGM20)or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR1A+0, R27
;libs/PWM_timers.mbas,58 :: 		TCCR2 = (1<<FOC2)or(1<<COM21)or(1<<COM20)or(1<<WGM20) or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,60 :: 		TCCR1B = 1<<CS10
	LDI        R27, 1
	OUT        TCCR1B+0, R27
;libs/PWM_timers.mbas,61 :: 		end sub
L_end_pwm_set_1B:
	RET
; end of libs/PWM_timers_pwm_set_1B

libs/PWM_timers_Timer2_Compare:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;libs/PWM_timers.mbas,63 :: 		Sub procedure Timer2_Compare iv IVT_ADDR_TIMER2_COMP 'L?st aus alle (8Mhz/1024/125) 16ms
;libs/PWM_timers.mbas,64 :: 		inc(_ss)
	LDS        R16, __ss+0
	LDS        R17, __ss+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __ss+0, R16
	STS        __ss+1, R17
;libs/PWM_timers.mbas,65 :: 		End sub
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

;libs/PWM_timers.mbas,67 :: 		sub procedure Timer0_overflow iv IVT_ADDR_TIMER0_OVF
;libs/PWM_timers.mbas,68 :: 		inc(_zz)
	LDS        R16, __zz+0
	LDS        R17, __zz+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __zz+0, R16
	STS        __zz+1, R17
;libs/PWM_timers.mbas,69 :: 		TIFR.TOV0=0
	IN         R27, TIFR+0
	CBR        R27, 1
	OUT        TIFR+0, R27
;libs/PWM_timers.mbas,71 :: 		end sub
L_end_Timer0_overflow:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of libs/PWM_timers_Timer0_overflow

libs/PWM_timers_SetRegister:

;libs/PWM_timers.mbas,73 :: 		sub procedure SetRegister()
;libs/PWM_timers.mbas,83 :: 		TCCR2.WGM21=1 'CTC Mode Aktivierung Timer2
	IN         R27, TCCR2+0
	SBR        R27, 8
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,84 :: 		TCCR2.COM20=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 16
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,85 :: 		TCCR2.COM21=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 32
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,87 :: 		TCCR0.CS02=1 'Ext Flanke Interrupt (T0)
	IN         R27, TCCR0+0
	SBR        R27, 4
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,88 :: 		TCCR0.CS01=1
	IN         R27, TCCR0+0
	SBR        R27, 2
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,89 :: 		TCCR0.CS00=1
	IN         R27, TCCR0+0
	SBR        R27, 1
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,91 :: 		TCCR2.CS22=1 'Set Prescaler Timer2 1024 setzen
	IN         R27, TCCR2+0
	SBR        R27, 4
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,92 :: 		TCCR2.CS21=1
	IN         R27, TCCR2+0
	SBR        R27, 2
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,93 :: 		TCCR2.CS20=1
	IN         R27, TCCR2+0
	SBR        R27, 1
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,95 :: 		OCR2=124 'Set Output Compare register Timer2 to 124 (for Loop 0-124 => 125)
	LDI        R27, 124
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,96 :: 		TIMSK.OCIE2=1 ' Enable comp match flag interrupt Timer 2
	IN         R27, TIMSK+0
	SBR        R27, 128
	OUT        TIMSK+0, R27
;libs/PWM_timers.mbas,97 :: 		TIMSK.TOIE0=1 ' Enable OV flag interrupt Timer 0
	IN         R27, TIMSK+0
	SBR        R27, 1
	OUT        TIMSK+0, R27
;libs/PWM_timers.mbas,98 :: 		SREG.SREG_I=1
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;libs/PWM_timers.mbas,99 :: 		End Sub
L_end_SetRegister:
	RET
; end of libs/PWM_timers_SetRegister

libs/PWM_timers_SetPWM0:

;libs/PWM_timers.mbas,103 :: 		dim txt_s as string[4]
;libs/PWM_timers.mbas,106 :: 		OCR0=duty
	OUT        OCR0+0, R2
;libs/PWM_timers.mbas,110 :: 		end sub
L_end_SetPWM0:
	RET
; end of libs/PWM_timers_SetPWM0

libs/PWM_timers_SetPWM1_A:

;libs/PWM_timers.mbas,111 :: 		sub procedure SetPWM1_A(dim duty as integer)
;libs/PWM_timers.mbas,115 :: 		OCR1AH=0x00
	LDI        R27, 0
	OUT        OCR1AH+0, R27
;libs/PWM_timers.mbas,116 :: 		OCR1AL=duty
	OUT        OCR1AL+0, R2
;libs/PWM_timers.mbas,118 :: 		end sub
L_end_SetPWM1_A:
	RET
; end of libs/PWM_timers_SetPWM1_A

libs/PWM_timers_SetPWM2:

;libs/PWM_timers.mbas,119 :: 		sub procedure SetPWM2(dim duty as integer)
;libs/PWM_timers.mbas,124 :: 		OCR2=duty
	OUT        OCR2+0, R2
;libs/PWM_timers.mbas,126 :: 		end sub
L_end_SetPWM2:
	RET
; end of libs/PWM_timers_SetPWM2

libs/PWM_timers_SetPWM1_B:

;libs/PWM_timers.mbas,127 :: 		sub procedure SetPWM1_B(dim duty as integer)
;libs/PWM_timers.mbas,131 :: 		OCR1BH=0x00
	LDI        R27, 0
	OUT        OCR1BH+0, R27
;libs/PWM_timers.mbas,132 :: 		OCR1BL=duty
	OUT        OCR1BL+0, R2
;libs/PWM_timers.mbas,133 :: 		end sub
L_end_SetPWM1_B:
	RET
; end of libs/PWM_timers_SetPWM1_B

_PWM_MAKE:

;libs/PWM_timers.mbas,156 :: 		jjyear as float
;libs/PWM_timers.mbas,158 :: 		jjyear=ceil((jj*max_duty)/100)
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
;libs/PWM_timers.mbas,159 :: 		FloatToStr(jjyear, st)
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
;libs/PWM_timers.mbas,168 :: 		ii = integer (jjyear)
	MOVW       R16, R20
	MOVW       R18, R22
	CALL       _float_fpint+0
; jjyear end address is: 20 (R20)
; ii start address is: 18 (R18)
	MOVW       R18, R16
;libs/PWM_timers.mbas,169 :: 		IntToStr(ii, txt)
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
;libs/PWM_timers.mbas,176 :: 		case 2
	LDI        R27, 2
	CP         R4, R27
	BREQ       L__PWM_MAKE114
	JMP        L__PWM_MAKE12
L__PWM_MAKE114:
;libs/PWM_timers.mbas,183 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE12:
;libs/PWM_timers.mbas,185 :: 		case 1
; ii start address is: 18 (R18)
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__PWM_MAKE115
	JMP        L__PWM_MAKE15
L__PWM_MAKE115:
;libs/PWM_timers.mbas,193 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE15:
;libs/PWM_timers.mbas,195 :: 		case 30  ''old
; ii start address is: 18 (R18)
	LDI        R27, 30
	CP         R4, R27
	BREQ       L__PWM_MAKE116
	JMP        L__PWM_MAKE18
L__PWM_MAKE116:
;libs/PWM_timers.mbas,198 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE117
	JMP        L__PWM_MAKE20
L__PWM_MAKE117:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,199 :: 		SetPWM0(max_duty)
	MOV        R2, R3
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/PWM_timers_SetPWM0+0
	JMP        L__PWM_MAKE21
;libs/PWM_timers.mbas,200 :: 		else
L__PWM_MAKE20:
;libs/PWM_timers.mbas,201 :: 		if jj=max_duty  then
; ii start address is: 18 (R18)
	CP         R2, R3
	BREQ       L__PWM_MAKE118
	JMP        L__PWM_MAKE23
L__PWM_MAKE118:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,202 :: 		SetPWM0(0x00)
	CLR        R2
	CLR        R3
	CALL       libs/PWM_timers_SetPWM0+0
	JMP        L__PWM_MAKE24
;libs/PWM_timers.mbas,203 :: 		else
L__PWM_MAKE23:
;libs/PWM_timers.mbas,204 :: 		SetPWM0(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM0+0
;libs/PWM_timers.mbas,205 :: 		end if
L__PWM_MAKE24:
;libs/PWM_timers.mbas,207 :: 		end if
L__PWM_MAKE21:
	JMP        L__PWM_MAKE9
L__PWM_MAKE18:
;libs/PWM_timers.mbas,208 :: 		case 33
; ii start address is: 18 (R18)
	LDI        R27, 33
	CP         R4, R27
	BREQ       L__PWM_MAKE119
	JMP        L__PWM_MAKE27
L__PWM_MAKE119:
;libs/PWM_timers.mbas,211 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE120
	JMP        L__PWM_MAKE29
L__PWM_MAKE120:
;libs/PWM_timers.mbas,212 :: 		SetPWM0(ii)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       libs/PWM_timers_SetPWM0+0
	JMP        L__PWM_MAKE30
;libs/PWM_timers.mbas,213 :: 		else
L__PWM_MAKE29:
;libs/PWM_timers.mbas,214 :: 		SetPWM0(ii)
; ii start address is: 18 (R18)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       libs/PWM_timers_SetPWM0+0
;libs/PWM_timers.mbas,216 :: 		end if
L__PWM_MAKE30:
	JMP        L__PWM_MAKE9
L__PWM_MAKE27:
;libs/PWM_timers.mbas,217 :: 		case 4
; ii start address is: 18 (R18)
	LDI        R27, 4
	CP         R4, R27
	BREQ       L__PWM_MAKE121
	JMP        L__PWM_MAKE33
L__PWM_MAKE121:
;libs/PWM_timers.mbas,226 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE122
	JMP        L__PWM_MAKE35
L__PWM_MAKE122:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,227 :: 		SetPWM2(0)
	CLR        R2
	CLR        R3
	CALL       libs/PWM_timers_SetPWM2+0
	JMP        L__PWM_MAKE36
;libs/PWM_timers.mbas,228 :: 		else
L__PWM_MAKE35:
;libs/PWM_timers.mbas,229 :: 		SetPWM2(ii)
; ii start address is: 18 (R18)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       libs/PWM_timers_SetPWM2+0
;libs/PWM_timers.mbas,231 :: 		end if
L__PWM_MAKE36:
	JMP        L__PWM_MAKE9
L__PWM_MAKE33:
;libs/PWM_timers.mbas,232 :: 		case 55
; ii start address is: 18 (R18)
	LDI        R27, 55
	CP         R4, R27
	BREQ       L__PWM_MAKE123
	JMP        L__PWM_MAKE39
L__PWM_MAKE123:
;libs/PWM_timers.mbas,237 :: 		PWM2_Set_Duty(ii)''Set current duty for PWM2
	MOV        R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE39:
;libs/PWM_timers.mbas,238 :: 		case 45
; ii start address is: 18 (R18)
	LDI        R27, 45
	CP         R4, R27
	BREQ       L__PWM_MAKE124
	JMP        L__PWM_MAKE42
L__PWM_MAKE124:
;libs/PWM_timers.mbas,242 :: 		PWM16bit_Change_Duty(ii,2 )
	LDI        R27, 2
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE42:
;libs/PWM_timers.mbas,244 :: 		case 50
; ii start address is: 18 (R18)
	LDI        R27, 50
	CP         R4, R27
	BREQ       L__PWM_MAKE125
	JMP        L__PWM_MAKE45
L__PWM_MAKE125:
;libs/PWM_timers.mbas,249 :: 		PWM2_Set_Duty(ii)''Set current duty for PWM2
	MOV        R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE45:
;libs/PWM_timers.mbas,250 :: 		case 25
; ii start address is: 18 (R18)
	LDI        R27, 25
	CP         R4, R27
	BREQ       L__PWM_MAKE126
	JMP        L__PWM_MAKE48
L__PWM_MAKE126:
;libs/PWM_timers.mbas,253 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE127
	JMP        L__PWM_MAKE50
L__PWM_MAKE127:
;libs/PWM_timers.mbas,254 :: 		SetPWM1_A(max_duty-ii)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_A+0
	JMP        L__PWM_MAKE51
;libs/PWM_timers.mbas,255 :: 		else
L__PWM_MAKE50:
;libs/PWM_timers.mbas,256 :: 		SetPWM1_A(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_A+0
;libs/PWM_timers.mbas,258 :: 		end if
L__PWM_MAKE51:
	JMP        L__PWM_MAKE9
L__PWM_MAKE48:
;libs/PWM_timers.mbas,259 :: 		case 35
; ii start address is: 18 (R18)
	LDI        R27, 35
	CP         R4, R27
	BREQ       L__PWM_MAKE128
	JMP        L__PWM_MAKE54
L__PWM_MAKE128:
;libs/PWM_timers.mbas,262 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE129
	JMP        L__PWM_MAKE56
L__PWM_MAKE129:
;libs/PWM_timers.mbas,263 :: 		SetPWM1_B(max_duty-ii)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_B+0
	JMP        L__PWM_MAKE57
;libs/PWM_timers.mbas,264 :: 		else
L__PWM_MAKE56:
;libs/PWM_timers.mbas,265 :: 		SetPWM1_B(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	LDI        R17, 0
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_B+0
;libs/PWM_timers.mbas,267 :: 		end if
L__PWM_MAKE57:
	JMP        L__PWM_MAKE9
L__PWM_MAKE54:
L__PWM_MAKE9:
;libs/PWM_timers.mbas,282 :: 		end sub
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

;libs/PWM_timers.mbas,285 :: 		sub procedure PWM_Port_Initialize ()
;libs/PWM_timers.mbas,304 :: 		DDB3_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;libs/PWM_timers.mbas,305 :: 		DDD7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD7_bit+0
	SBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;libs/PWM_timers.mbas,306 :: 		DDD4_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD4_bit+0
	SBR        R27, BitMask(DDD4_bit+0)
	OUT        DDD4_bit+0, R27
;libs/PWM_timers.mbas,307 :: 		DDD5_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD5_bit+0
	SBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
;libs/PWM_timers.mbas,310 :: 		end  sub
L_end_PWM_Port_Initialize:
	RET
; end of _PWM_Port_Initialize

_PWM_Initialize:

;libs/PWM_timers.mbas,314 :: 		dim j,k as byte
;libs/PWM_timers.mbas,378 :: 		ASSR=0x00
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, 0
	OUT        ASSR+0, R27
;libs/PWM_timers.mbas,383 :: 		TCCR0 = (1<<FOC2)or(1<<COM00)or(1<<COM01)or(1<<WGM00) or(0<<WGM01)or(1<<CS00) or(0<<CS01) or(1<<CS02) or (0<<WGM21)
	LDI        R27, 245
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,384 :: 		TCNT0=0x00
	LDI        R27, 0
	OUT        TCNT0+0, R27
;libs/PWM_timers.mbas,387 :: 		TCCR2 = (1<<FOC2)or(1<<COM01)or(0<<COM00)or(1<<WGM00) or(0<<WGM01)or(1<<CS00) or(0<<CS01) or(1<<CS02) or (0<<WGM21)
	LDI        R27, 229
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,388 :: 		TCNT2=0x00
	LDI        R27, 0
	OUT        TCNT2+0, R27
;libs/PWM_timers.mbas,389 :: 		ocr0=0xFF
	LDI        R27, 255
	OUT        OCR0+0, R27
;libs/PWM_timers.mbas,390 :: 		ocr2=0x00
	LDI        R27, 0
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,395 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, 0, _TIMER1)
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
;libs/PWM_timers.mbas,435 :: 		end sub
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

;libs/PWM_timers.mbas,439 :: 		k as byte
;libs/PWM_timers.mbas,440 :: 		J=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STD        Y+0, R27
;libs/PWM_timers.mbas,451 :: 		TCCR0=(1<<WGM00) or (1<<COM01) or (1<<COM00) or (1<<WGM01) or (1<<CS02) or (0<<CS01) or (1<<CS00)
	LDI        R27, 125
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,452 :: 		TCNT0=0x00
	LDI        R27, 0
	OUT        TCNT0+0, R27
;libs/PWM_timers.mbas,466 :: 		TCCR1A=0xA1
	LDI        R27, 161
	OUT        TCCR1A+0, R27
;libs/PWM_timers.mbas,467 :: 		TCCR1B=0x05
	LDI        R27, 5
	OUT        TCCR1B+0, R27
;libs/PWM_timers.mbas,468 :: 		TCNT1H=0x00
	LDI        R27, 0
	OUT        TCNT1H+0, R27
;libs/PWM_timers.mbas,469 :: 		TCNT1L=0x00
	LDI        R27, 0
	OUT        TCNT1L+0, R27
;libs/PWM_timers.mbas,470 :: 		ICR1H=0x00
	LDI        R27, 0
	OUT        ICR1H+0, R27
;libs/PWM_timers.mbas,471 :: 		ICR1L=0x00
	LDI        R27, 0
	OUT        ICR1L+0, R27
;libs/PWM_timers.mbas,472 :: 		OCR1AH=0x00
	LDI        R27, 0
	OUT        OCR1AH+0, R27
;libs/PWM_timers.mbas,473 :: 		OCR1AL=0x11
	LDI        R27, 17
	OUT        OCR1AL+0, R27
;libs/PWM_timers.mbas,474 :: 		OCR1BH=0x00
	LDI        R27, 0
	OUT        OCR1BH+0, R27
;libs/PWM_timers.mbas,475 :: 		OCR1BL=0x12
	LDI        R27, 18
	OUT        OCR1BL+0, R27
;libs/PWM_timers.mbas,488 :: 		ocr0=0 ocr2=0
	LDI        R27, 0
	OUT        OCR0+0, R27
	LDI        R27, 0
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,490 :: 		PWM1_Init(_PWM1_FAST_MODE, _PWM1_PRESCALER_8, _PWM1_NON_INVERTED, 127)''PWM1_Init(5000)'' Initialize PWM1
	LDI        R27, 127
	MOV        R5, R27
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM1_Init+0
;libs/PWM_timers.mbas,494 :: 		PWM1_Start()'' start PWM1
	CALL       _PWM1_Start+0
;libs/PWM_timers.mbas,497 :: 		PWM1_Set_Duty(j)''Set current duty for PWM1
	LDD        R2, Y+0
	CALL       _PWM1_Set_Duty+0
;libs/PWM_timers.mbas,499 :: 		ASSR=0x00
	LDI        R27, 0
	OUT        ASSR+0, R27
;libs/PWM_timers.mbas,500 :: 		TCCR2=0x27
	LDI        R27, 39
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,501 :: 		TCNT2=0x00
	LDI        R27, 0
	OUT        TCNT2+0, R27
;libs/PWM_timers.mbas,502 :: 		for k=10 to 0  step -1
	LDI        R27, 10
	STD        Y+1, R27
L_libs/PWM_timers_PWM_Initialize_old62:
;libs/PWM_timers.mbas,503 :: 		PWM_MAKE (k*10,255,1)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/PWM_timers.mbas,504 :: 		PWM_MAKE (k*10,255,2)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/PWM_timers.mbas,505 :: 		PWM_MAKE (k*10,255,3)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/PWM_timers.mbas,506 :: 		PWM_MAKE (k*10,255,4)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/PWM_timers.mbas,507 :: 		delay_ms(10)
	LDI        R17, 208
	LDI        R16, 202
L_libs/PWM_timers_PWM_Initialize_old66:
	DEC        R16
	BRNE       L_libs/PWM_timers_PWM_Initialize_old66
	DEC        R17
	BRNE       L_libs/PWM_timers_PWM_Initialize_old66
	NOP
;libs/PWM_timers.mbas,508 :: 		next k
	LDD        R16, Y+1
	CPI        R16, 0
	BRNE       L_libs/PWM_timers_PWM_Initialize_old133
	JMP        L_libs/PWM_timers_PWM_Initialize_old65
L_libs/PWM_timers_PWM_Initialize_old133:
	LDD        R16, Y+1
	SUBI       R16, 1
	STD        Y+1, R16
	JMP        L_libs/PWM_timers_PWM_Initialize_old62
L_libs/PWM_timers_PWM_Initialize_old65:
;libs/PWM_timers.mbas,509 :: 		PWM_MAKE (0,255,4)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,529 :: 		end sub
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

;libs/PWM_timers.mbas,533 :: 		dim Pwm_chanel_ini,chanel_ini,Heater_Motor_Time_ini as byte
;libs/PWM_timers.mbas,534 :: 		Lcd_0() lcd_out(1,1,"Initialsiing Heater")
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
;libs/PWM_timers.mbas,535 :: 		delay_ms(100)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__On_mSec_initial_heater69:
	DEC        R16
	BRNE       L__On_mSec_initial_heater69
	DEC        R17
	BRNE       L__On_mSec_initial_heater69
	DEC        R18
	BRNE       L__On_mSec_initial_heater69
	NOP
;libs/PWM_timers.mbas,536 :: 		for chanel_ini =1 to Choice_number
	LDI        R27, 1
	STD        Y+1, R27
L__On_mSec_initial_heater72:
;libs/PWM_timers.mbas,537 :: 		for Heater_Motor_Time_ini=1 to 2 ''Heater
	LDI        R27, 1
	STD        Y+2, R27
L__On_mSec_initial_heater77:
;libs/PWM_timers.mbas,538 :: 		for Pwm_chanel_ini =1 to 3
	LDI        R27, 1
	STD        Y+0, R27
L__On_mSec_initial_heater82:
;libs/PWM_timers.mbas,539 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0] =en
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
;libs/PWM_timers.mbas,540 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][1]=mint
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
;libs/PWM_timers.mbas,541 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][2] =sec
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
;libs/PWM_timers.mbas,542 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][3]=prc
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
;libs/PWM_timers.mbas,545 :: 		next Pwm_chanel_ini
	LDD        R16, Y+0
	CPI        R16, 3
	BRNE       L__On_mSec_initial_heater135
	JMP        L__On_mSec_initial_heater85
L__On_mSec_initial_heater135:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__On_mSec_initial_heater82
L__On_mSec_initial_heater85:
;libs/PWM_timers.mbas,546 :: 		next Heater_Motor_Time_ini
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L__On_mSec_initial_heater136
	JMP        L__On_mSec_initial_heater80
L__On_mSec_initial_heater136:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L__On_mSec_initial_heater77
L__On_mSec_initial_heater80:
;libs/PWM_timers.mbas,547 :: 		next chanel_ini
	LDD        R16, Y+1
	CPI        R16, 3
	BRNE       L__On_mSec_initial_heater137
	JMP        L__On_mSec_initial_heater75
L__On_mSec_initial_heater137:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__On_mSec_initial_heater72
L__On_mSec_initial_heater75:
;libs/PWM_timers.mbas,548 :: 		end sub
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

;libs/PWM_timers.mbas,551 :: 		dim Pwm_chanel_ini,chanel_ini,Heater_Motor_Time_ini as byte
;libs/PWM_timers.mbas,552 :: 		Lcd_0() lcd_out(1,1,"Initialsiing Motor")
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
;libs/PWM_timers.mbas,553 :: 		delay_ms(100)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__On_mSec_initial_Motor87:
	DEC        R16
	BRNE       L__On_mSec_initial_Motor87
	DEC        R17
	BRNE       L__On_mSec_initial_Motor87
	DEC        R18
	BRNE       L__On_mSec_initial_Motor87
	NOP
;libs/PWM_timers.mbas,554 :: 		for chanel_ini =1 to Choice_number
	LDI        R27, 1
	STD        Y+1, R27
L__On_mSec_initial_Motor90:
;libs/PWM_timers.mbas,555 :: 		for Heater_Motor_Time_ini=2 to 2 ''Motor
	LDI        R27, 2
	STD        Y+2, R27
L__On_mSec_initial_Motor95:
;libs/PWM_timers.mbas,556 :: 		for Pwm_chanel_ini =2 to 3
	LDI        R27, 2
	STD        Y+0, R27
L__On_mSec_initial_Motor100:
;libs/PWM_timers.mbas,557 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0] =en
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
;libs/PWM_timers.mbas,558 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][1]=mint
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
;libs/PWM_timers.mbas,559 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][2] =sec+chanel_ini
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
	LDD        R16, Y+1
	ADD        R16, R4
	ST         Z, R16
;libs/PWM_timers.mbas,560 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][3]=prc
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
;libs/PWM_timers.mbas,563 :: 		next Pwm_chanel_ini
	LDD        R16, Y+0
	CPI        R16, 3
	BRNE       L__On_mSec_initial_Motor139
	JMP        L__On_mSec_initial_Motor103
L__On_mSec_initial_Motor139:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__On_mSec_initial_Motor100
L__On_mSec_initial_Motor103:
;libs/PWM_timers.mbas,564 :: 		next Heater_Motor_Time_ini
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L__On_mSec_initial_Motor140
	JMP        L__On_mSec_initial_Motor98
L__On_mSec_initial_Motor140:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L__On_mSec_initial_Motor95
L__On_mSec_initial_Motor98:
;libs/PWM_timers.mbas,565 :: 		next chanel_ini
	LDD        R16, Y+1
	CPI        R16, 3
	BRNE       L__On_mSec_initial_Motor141
	JMP        L__On_mSec_initial_Motor93
L__On_mSec_initial_Motor141:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__On_mSec_initial_Motor90
L__On_mSec_initial_Motor93:
;libs/PWM_timers.mbas,566 :: 		end sub
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

;libs/PWM_timers.mbas,567 :: 		sub procedure  WDT_on_old()
;libs/PWM_timers.mbas,599 :: 		WDTCR =(1<<WDP2) or (1<<WDP1)  or (1<<WDP0)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 7
	OUT        WDTCR+0, R27
;libs/PWM_timers.mbas,605 :: 		Lcd_Cmd(_LCD_CLEAR)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;libs/PWM_timers.mbas,606 :: 		Lcd_Out(2,2,"Reset.")
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
;libs/PWM_timers.mbas,612 :: 		end sub
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

;libs/PWM_timers.mbas,618 :: 		end.
L_end_libs/PWM_timers_?main:
	RET
; end of _libs/PWM_timers_?main
