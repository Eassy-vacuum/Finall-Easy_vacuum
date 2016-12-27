
_pwm_set_1B:

;libs/PWM_timers.mbas,40 :: 		Sub procedure pwm_set_1B(dim pulse_width as  char )
;libs/PWM_timers.mbas,42 :: 		OCR1BL = pulse_width ''  //Load Pulse width
	OUT        OCR1BL+0, R2
;libs/PWM_timers.mbas,43 :: 		OCR1AL = pulse_width ''  //Load Pulse width
	OUT        OCR1AL+0, R2
;libs/PWM_timers.mbas,44 :: 		OCR0 = pulse_width
	OUT        OCR0+0, R2
;libs/PWM_timers.mbas,45 :: 		OCR2 = pulse_width
	OUT        OCR2+0, R2
;libs/PWM_timers.mbas,50 :: 		TCCR0 = (1<<FOC2)or (1<<COM21)or(1<<COM20) or(1<<WGM20) or (1<<CS00)
	LDI        R27, 241
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,51 :: 		TCCR1A  = (1<<FOC2)or(1<<COM21)or(1<<COM20)or (1<<WGM20)or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR1A+0, R27
;libs/PWM_timers.mbas,52 :: 		TCCR2 = (1<<FOC2)or(1<<COM21)or(1<<COM20)or(1<<WGM20) or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,54 :: 		TCCR1B = 1<<CS10
	LDI        R27, 1
	OUT        TCCR1B+0, R27
;libs/PWM_timers.mbas,55 :: 		end sub
L_end_pwm_set_1B:
	RET
; end of _pwm_set_1B

libs/PWM_timers_Timer2_Compare:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;libs/PWM_timers.mbas,57 :: 		Sub procedure Timer2_Compare iv IVT_ADDR_TIMER2_COMP 'L?st aus alle (8Mhz/1024/125) 16ms
;libs/PWM_timers.mbas,58 :: 		inc(_ss)
	LDS        R16, __ss+0
	LDS        R17, __ss+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __ss+0, R16
	STS        __ss+1, R17
;libs/PWM_timers.mbas,59 :: 		End sub
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

;libs/PWM_timers.mbas,61 :: 		sub procedure Timer0_overflow iv IVT_ADDR_TIMER0_OVF
;libs/PWM_timers.mbas,62 :: 		inc(_zz)
	LDS        R16, __zz+0
	LDS        R17, __zz+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __zz+0, R16
	STS        __zz+1, R17
;libs/PWM_timers.mbas,63 :: 		TIFR.TOV0=0
	IN         R27, TIFR+0
	CBR        R27, 1
	OUT        TIFR+0, R27
;libs/PWM_timers.mbas,65 :: 		end sub
L_end_Timer0_overflow:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of libs/PWM_timers_Timer0_overflow

libs/PWM_timers_SetRegister:

;libs/PWM_timers.mbas,67 :: 		sub procedure SetRegister()
;libs/PWM_timers.mbas,77 :: 		TCCR2.WGM21=1 'CTC Mode Aktivierung Timer2
	IN         R27, TCCR2+0
	SBR        R27, 8
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,78 :: 		TCCR2.COM20=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 16
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,79 :: 		TCCR2.COM21=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 32
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,81 :: 		TCCR0.CS02=1 'Ext Flanke Interrupt (T0)
	IN         R27, TCCR0+0
	SBR        R27, 4
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,82 :: 		TCCR0.CS01=1
	IN         R27, TCCR0+0
	SBR        R27, 2
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,83 :: 		TCCR0.CS00=1
	IN         R27, TCCR0+0
	SBR        R27, 1
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,85 :: 		TCCR2.CS22=1 'Set Prescaler Timer2 1024 setzen
	IN         R27, TCCR2+0
	SBR        R27, 4
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,86 :: 		TCCR2.CS21=1
	IN         R27, TCCR2+0
	SBR        R27, 2
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,87 :: 		TCCR2.CS20=1
	IN         R27, TCCR2+0
	SBR        R27, 1
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,89 :: 		OCR2=124 'Set Output Compare register Timer2 to 124 (for Loop 0-124 => 125)
	LDI        R27, 124
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,90 :: 		TIMSK.OCIE2=1 ' Enable comp match flag interrupt Timer 2
	IN         R27, TIMSK+0
	SBR        R27, 128
	OUT        TIMSK+0, R27
;libs/PWM_timers.mbas,91 :: 		TIMSK.TOIE0=1 ' Enable OV flag interrupt Timer 0
	IN         R27, TIMSK+0
	SBR        R27, 1
	OUT        TIMSK+0, R27
;libs/PWM_timers.mbas,92 :: 		SREG.SREG_I=1
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;libs/PWM_timers.mbas,93 :: 		End Sub
L_end_SetRegister:
	RET
; end of libs/PWM_timers_SetRegister

_SetPWM0:

;libs/PWM_timers.mbas,97 :: 		dim txt_s as string[4]
;libs/PWM_timers.mbas,100 :: 		OCR0=duty
	OUT        OCR0+0, R2
;libs/PWM_timers.mbas,104 :: 		end sub
L_end_SetPWM0:
	RET
; end of _SetPWM0

libs/PWM_timers_SetPWM1_A:

;libs/PWM_timers.mbas,105 :: 		sub procedure SetPWM1_A(dim duty as integer)
;libs/PWM_timers.mbas,109 :: 		OCR1AH=0x00
	LDI        R27, 0
	OUT        OCR1AH+0, R27
;libs/PWM_timers.mbas,110 :: 		OCR1AL=duty
	OUT        OCR1AL+0, R2
;libs/PWM_timers.mbas,112 :: 		end sub
L_end_SetPWM1_A:
	RET
; end of libs/PWM_timers_SetPWM1_A

libs/PWM_timers_SetPWM2:

;libs/PWM_timers.mbas,113 :: 		sub procedure SetPWM2(dim duty as integer)
;libs/PWM_timers.mbas,118 :: 		OCR2=duty
	OUT        OCR2+0, R2
;libs/PWM_timers.mbas,120 :: 		end sub
L_end_SetPWM2:
	RET
; end of libs/PWM_timers_SetPWM2

libs/PWM_timers_SetPWM1_B:

;libs/PWM_timers.mbas,121 :: 		sub procedure SetPWM1_B(dim duty as integer)
;libs/PWM_timers.mbas,125 :: 		OCR1BH=0x00
	LDI        R27, 0
	OUT        OCR1BH+0, R27
;libs/PWM_timers.mbas,126 :: 		OCR1BL=duty
	OUT        OCR1BL+0, R2
;libs/PWM_timers.mbas,127 :: 		end sub
L_end_SetPWM1_B:
	RET
; end of libs/PWM_timers_SetPWM1_B

_PWM_MAKE:

;libs/PWM_timers.mbas,150 :: 		jjyear as float
;libs/PWM_timers.mbas,152 :: 		jjyear=ceil((jj*max_duty)/100)
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
; jjyear start address is: 20 (R20)
	MOVW       R20, R16
	MOVW       R22, R18
;libs/PWM_timers.mbas,153 :: 		FloatToStr(jjyear, st)
	PUSH       R23
	PUSH       R22
	PUSH       R21
	PUSH       R20
	PUSH       R5
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
;libs/PWM_timers.mbas,158 :: 		Lcd_0()
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R20
	POP        R21
	POP        R22
	POP        R23
;libs/PWM_timers.mbas,162 :: 		ii = integer (jjyear)
	MOVW       R16, R20
	MOVW       R18, R22
	CALL       _float_fpint+0
; jjyear end address is: 20 (R20)
; ii start address is: 18 (R18)
	MOVW       R18, R16
;libs/PWM_timers.mbas,163 :: 		IntToStr(ii, txt)
	PUSH       R19
	PUSH       R18
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;libs/PWM_timers.mbas,164 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/PWM_timers.mbas,165 :: 		Lcd_Out(2,6,txt)
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
;libs/PWM_timers.mbas,166 :: 		IntToStr(jj, txt)
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/PWM_timers.mbas,167 :: 		Lcd_Out(2,1,txt)
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
	POP        R18
	POP        R19
;libs/PWM_timers.mbas,173 :: 		case 2
	LDI        R27, 2
	CP         R5, R27
	BREQ       L__PWM_MAKE137
	JMP        L__PWM_MAKE12
L__PWM_MAKE137:
;libs/PWM_timers.mbas,176 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE12:
;libs/PWM_timers.mbas,177 :: 		case 1
; ii start address is: 18 (R18)
	LDI        R27, 1
	CP         R5, R27
	BREQ       L__PWM_MAKE138
	JMP        L__PWM_MAKE15
L__PWM_MAKE138:
;libs/PWM_timers.mbas,180 :: 		PWM16bit_Change_Duty(ii,_TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE15:
;libs/PWM_timers.mbas,181 :: 		case 30  ''old
; ii start address is: 18 (R18)
	LDI        R27, 30
	CP         R5, R27
	BREQ       L__PWM_MAKE139
	JMP        L__PWM_MAKE18
L__PWM_MAKE139:
;libs/PWM_timers.mbas,184 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE140
	JMP        L__PWM_MAKE20
L__PWM_MAKE140:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,185 :: 		SetPWM0(max_duty)
	MOV        R2, R3
	MOV        R3, R4
	CALL       _SetPWM0+0
	JMP        L__PWM_MAKE21
;libs/PWM_timers.mbas,186 :: 		else
L__PWM_MAKE20:
;libs/PWM_timers.mbas,187 :: 		if jj=max_duty  then
; ii start address is: 18 (R18)
	MOV        R16, R2
	LDI        R17, 0
	CP         R16, R3
	CPC        R17, R4
	BREQ       L__PWM_MAKE141
	JMP        L__PWM_MAKE23
L__PWM_MAKE141:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,188 :: 		SetPWM0(0x00)
	CLR        R2
	CLR        R3
	CALL       _SetPWM0+0
	JMP        L__PWM_MAKE24
;libs/PWM_timers.mbas,189 :: 		else
L__PWM_MAKE23:
;libs/PWM_timers.mbas,190 :: 		SetPWM0(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	MOV        R17, R4
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       _SetPWM0+0
;libs/PWM_timers.mbas,191 :: 		end if
L__PWM_MAKE24:
;libs/PWM_timers.mbas,193 :: 		end if
L__PWM_MAKE21:
	JMP        L__PWM_MAKE9
L__PWM_MAKE18:
;libs/PWM_timers.mbas,194 :: 		case 3
; ii start address is: 18 (R18)
	LDI        R27, 3
	CP         R5, R27
	BREQ       L__PWM_MAKE142
	JMP        L__PWM_MAKE27
L__PWM_MAKE142:
;libs/PWM_timers.mbas,197 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE143
	JMP        L__PWM_MAKE29
L__PWM_MAKE143:
;libs/PWM_timers.mbas,198 :: 		SetPWM0(ii)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _SetPWM0+0
	JMP        L__PWM_MAKE30
;libs/PWM_timers.mbas,199 :: 		else
L__PWM_MAKE29:
;libs/PWM_timers.mbas,200 :: 		SetPWM0(ii)
; ii start address is: 18 (R18)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _SetPWM0+0
;libs/PWM_timers.mbas,202 :: 		end if
L__PWM_MAKE30:
	JMP        L__PWM_MAKE9
L__PWM_MAKE27:
;libs/PWM_timers.mbas,203 :: 		case 4
; ii start address is: 18 (R18)
	LDI        R27, 4
	CP         R5, R27
	BREQ       L__PWM_MAKE144
	JMP        L__PWM_MAKE33
L__PWM_MAKE144:
;libs/PWM_timers.mbas,212 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE145
	JMP        L__PWM_MAKE35
L__PWM_MAKE145:
; ii end address is: 18 (R18)
;libs/PWM_timers.mbas,213 :: 		SetPWM2(0)
	CLR        R2
	CLR        R3
	CALL       libs/PWM_timers_SetPWM2+0
	JMP        L__PWM_MAKE36
;libs/PWM_timers.mbas,214 :: 		else
L__PWM_MAKE35:
;libs/PWM_timers.mbas,215 :: 		SetPWM2(ii)
; ii start address is: 18 (R18)
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       libs/PWM_timers_SetPWM2+0
;libs/PWM_timers.mbas,217 :: 		end if
L__PWM_MAKE36:
	JMP        L__PWM_MAKE9
L__PWM_MAKE33:
;libs/PWM_timers.mbas,218 :: 		case 55
; ii start address is: 18 (R18)
	LDI        R27, 55
	CP         R5, R27
	BREQ       L__PWM_MAKE146
	JMP        L__PWM_MAKE39
L__PWM_MAKE146:
;libs/PWM_timers.mbas,223 :: 		PWM2_Set_Duty(ii)''Set current duty for PWM2
	MOV        R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE39:
;libs/PWM_timers.mbas,224 :: 		case 45
; ii start address is: 18 (R18)
	LDI        R27, 45
	CP         R5, R27
	BREQ       L__PWM_MAKE147
	JMP        L__PWM_MAKE42
L__PWM_MAKE147:
;libs/PWM_timers.mbas,228 :: 		PWM16bit_Change_Duty(ii,2 )
	LDI        R27, 2
	MOV        R4, R27
	MOVW       R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE42:
;libs/PWM_timers.mbas,230 :: 		case 50
; ii start address is: 18 (R18)
	LDI        R27, 50
	CP         R5, R27
	BREQ       L__PWM_MAKE148
	JMP        L__PWM_MAKE45
L__PWM_MAKE148:
;libs/PWM_timers.mbas,235 :: 		PWM2_Set_Duty(ii)''Set current duty for PWM2
	MOV        R2, R18
; ii end address is: 18 (R18)
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE9
L__PWM_MAKE45:
;libs/PWM_timers.mbas,236 :: 		case 25
; ii start address is: 18 (R18)
	LDI        R27, 25
	CP         R5, R27
	BREQ       L__PWM_MAKE149
	JMP        L__PWM_MAKE48
L__PWM_MAKE149:
;libs/PWM_timers.mbas,239 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE150
	JMP        L__PWM_MAKE50
L__PWM_MAKE150:
;libs/PWM_timers.mbas,240 :: 		SetPWM1_A(max_duty-ii)
	MOV        R16, R3
	MOV        R17, R4
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_A+0
	JMP        L__PWM_MAKE51
;libs/PWM_timers.mbas,241 :: 		else
L__PWM_MAKE50:
;libs/PWM_timers.mbas,242 :: 		SetPWM1_A(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	MOV        R17, R4
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_A+0
;libs/PWM_timers.mbas,244 :: 		end if
L__PWM_MAKE51:
	JMP        L__PWM_MAKE9
L__PWM_MAKE48:
;libs/PWM_timers.mbas,245 :: 		case 35
; ii start address is: 18 (R18)
	LDI        R27, 35
	CP         R5, R27
	BREQ       L__PWM_MAKE151
	JMP        L__PWM_MAKE54
L__PWM_MAKE151:
;libs/PWM_timers.mbas,248 :: 		if jj=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__PWM_MAKE152
	JMP        L__PWM_MAKE56
L__PWM_MAKE152:
;libs/PWM_timers.mbas,249 :: 		SetPWM1_B(max_duty-ii)
	MOV        R16, R3
	MOV        R17, R4
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_B+0
	JMP        L__PWM_MAKE57
;libs/PWM_timers.mbas,250 :: 		else
L__PWM_MAKE56:
;libs/PWM_timers.mbas,251 :: 		SetPWM1_B(max_duty-ii)
; ii start address is: 18 (R18)
	MOV        R16, R3
	MOV        R17, R4
	SUB        R16, R18
	SBC        R17, R19
; ii end address is: 18 (R18)
	MOVW       R2, R16
	CALL       libs/PWM_timers_SetPWM1_B+0
;libs/PWM_timers.mbas,253 :: 		end if
L__PWM_MAKE57:
	JMP        L__PWM_MAKE9
L__PWM_MAKE54:
;libs/PWM_timers.mbas,255 :: 		case 5
	LDI        R27, 5
	CP         R5, R27
	BREQ       L__PWM_MAKE153
	JMP        L__PWM_MAKE60
L__PWM_MAKE153:
	JMP        L__PWM_MAKE9
L__PWM_MAKE60:
;libs/PWM_timers.mbas,259 :: 		case 6
	LDI        R27, 6
	CP         R5, R27
	BREQ       L__PWM_MAKE154
	JMP        L__PWM_MAKE63
L__PWM_MAKE154:
	JMP        L__PWM_MAKE9
L__PWM_MAKE63:
;libs/PWM_timers.mbas,263 :: 		case 7
	LDI        R27, 7
	CP         R5, R27
	BREQ       L__PWM_MAKE155
	JMP        L__PWM_MAKE66
L__PWM_MAKE155:
	JMP        L__PWM_MAKE9
L__PWM_MAKE66:
L__PWM_MAKE9:
;libs/PWM_timers.mbas,268 :: 		end sub
L_end_PWM_MAKE:
	POP        R7
	POP        R6
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _PWM_MAKE

_PWM_Port_Initialize:

;libs/PWM_timers.mbas,271 :: 		sub procedure PWM_Port_Initialize ()
;libs/PWM_timers.mbas,282 :: 		DDB3_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;libs/PWM_timers.mbas,283 :: 		DDD7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD7_bit+0
	SBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;libs/PWM_timers.mbas,284 :: 		DDD4_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD4_bit+0
	SBR        R27, BitMask(DDD4_bit+0)
	OUT        DDD4_bit+0, R27
;libs/PWM_timers.mbas,285 :: 		DDD5_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD5_bit+0
	SBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
;libs/PWM_timers.mbas,288 :: 		end  sub
L_end_PWM_Port_Initialize:
	RET
; end of _PWM_Port_Initialize

_PWM_Initialize:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,293 :: 		k as integer
;libs/PWM_timers.mbas,356 :: 		ASSR=0x00
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, 0
	OUT        ASSR+0, R27
;libs/PWM_timers.mbas,361 :: 		TCCR0 = (1<<FOC2)or(1<<COM00)or(1<<COM01)or(1<<WGM00) or(0<<WGM01)or(1<<CS00) or(0<<CS01) or(1<<CS02) or (0<<WGM21)
	LDI        R27, 245
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,362 :: 		TCNT0=0x00
	LDI        R27, 0
	OUT        TCNT0+0, R27
;libs/PWM_timers.mbas,365 :: 		TCCR2 = (1<<FOC2)or(1<<COM01)or(0<<COM00)or(1<<WGM00) or(0<<WGM01)or(1<<CS00) or(0<<CS01) or(1<<CS02) or (0<<WGM21)
	LDI        R27, 229
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,366 :: 		TCNT2=0x00
	LDI        R27, 0
	OUT        TCNT2+0, R27
;libs/PWM_timers.mbas,367 :: 		ocr0=0xFF
	LDI        R27, 255
	OUT        OCR0+0, R27
;libs/PWM_timers.mbas,368 :: 		ocr2=0xFF
	LDI        R27, 255
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,371 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_1024, _PWM16_NON_INVERTED, 255, _TIMER1)
	LDI        R27, 1
	MOV        R7, R27
	LDI        R27, 255
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 160
	MOV        R4, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 11
	MOV        R2, R27
	CALL       _PWM16bit_Init+0
;libs/PWM_timers.mbas,374 :: 		for k=0 to 10  step 5
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
L__PWM_Initialize69:
	LDD        R18, Y+0
	LDD        R19, Y+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__PWM_Initialize158
	JMP        L__PWM_Initialize73
L__PWM_Initialize158:
;libs/PWM_timers.mbas,375 :: 		PWM_MAKE (k*10,255,1)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
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
;libs/PWM_timers.mbas,376 :: 		PWM_MAKE (k*10,255,2)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 2
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,377 :: 		PWM_MAKE (k*10,255,3)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 3
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,378 :: 		PWM_MAKE (k*10,255,4)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 4
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,379 :: 		PWM_MAKE (k*10,255,5)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,380 :: 		delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L__PWM_Initialize74:
	DEC        R16
	BRNE       L__PWM_Initialize74
	DEC        R17
	BRNE       L__PWM_Initialize74
;libs/PWM_timers.mbas,381 :: 		next k
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__PWM_Initialize159
	CPI        R16, 10
L__PWM_Initialize159:
	BRNE       L__PWM_Initialize160
	JMP        L__PWM_Initialize73
L__PWM_Initialize160:
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 251
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
	JMP        L__PWM_Initialize69
L__PWM_Initialize73:
;libs/PWM_timers.mbas,382 :: 		for k=10 to 0  step -5
	LDI        R27, 10
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
L__PWM_Initialize76:
	LDD        R18, Y+0
	LDD        R19, Y+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__PWM_Initialize161
	JMP        L__PWM_Initialize80
L__PWM_Initialize161:
;libs/PWM_timers.mbas,383 :: 		PWM_MAKE (k*10,255,1)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
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
;libs/PWM_timers.mbas,384 :: 		PWM_MAKE (k*10,255,2)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 2
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,385 :: 		PWM_MAKE (k*10,255,3)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 3
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,386 :: 		PWM_MAKE (k*10,255,4)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 4
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,387 :: 		PWM_MAKE (k*10,255,5)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+0
	LDD        R21, Y+1
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,388 :: 		delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L__PWM_Initialize81:
	DEC        R16
	BRNE       L__PWM_Initialize81
	DEC        R17
	BRNE       L__PWM_Initialize81
;libs/PWM_timers.mbas,389 :: 		next k
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__PWM_Initialize162
	CPI        R16, 0
L__PWM_Initialize162:
	BRNE       L__PWM_Initialize163
	JMP        L__PWM_Initialize80
L__PWM_Initialize163:
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 5
	SBCI       R17, 0
	STD        Y+0, R16
	STD        Y+1, R17
	JMP        L__PWM_Initialize76
L__PWM_Initialize80:
;libs/PWM_timers.mbas,410 :: 		end sub
L_end_PWM_Initialize:
	POP        R7
	POP        R6
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
; end of _PWM_Initialize

libs/PWM_timers_PWM_Initialize_old:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,414 :: 		k as integer
;libs/PWM_timers.mbas,415 :: 		J=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STD        Y+0, R27
;libs/PWM_timers.mbas,426 :: 		TCCR0=(1<<WGM00) or (1<<COM01) or (1<<COM00) or (1<<WGM01) or (1<<CS02) or (0<<CS01) or (1<<CS00)
	LDI        R27, 125
	OUT        TCCR0+0, R27
;libs/PWM_timers.mbas,427 :: 		TCNT0=0x00
	LDI        R27, 0
	OUT        TCNT0+0, R27
;libs/PWM_timers.mbas,441 :: 		TCCR1A=0xA1
	LDI        R27, 161
	OUT        TCCR1A+0, R27
;libs/PWM_timers.mbas,442 :: 		TCCR1B=0x05
	LDI        R27, 5
	OUT        TCCR1B+0, R27
;libs/PWM_timers.mbas,443 :: 		TCNT1H=0x00
	LDI        R27, 0
	OUT        TCNT1H+0, R27
;libs/PWM_timers.mbas,444 :: 		TCNT1L=0x00
	LDI        R27, 0
	OUT        TCNT1L+0, R27
;libs/PWM_timers.mbas,445 :: 		ICR1H=0x00
	LDI        R27, 0
	OUT        ICR1H+0, R27
;libs/PWM_timers.mbas,446 :: 		ICR1L=0x00
	LDI        R27, 0
	OUT        ICR1L+0, R27
;libs/PWM_timers.mbas,447 :: 		OCR1AH=0x00
	LDI        R27, 0
	OUT        OCR1AH+0, R27
;libs/PWM_timers.mbas,448 :: 		OCR1AL=0x11
	LDI        R27, 17
	OUT        OCR1AL+0, R27
;libs/PWM_timers.mbas,449 :: 		OCR1BH=0x00
	LDI        R27, 0
	OUT        OCR1BH+0, R27
;libs/PWM_timers.mbas,450 :: 		OCR1BL=0x12
	LDI        R27, 18
	OUT        OCR1BL+0, R27
;libs/PWM_timers.mbas,463 :: 		ocr0=0 ocr2=0
	LDI        R27, 0
	OUT        OCR0+0, R27
	LDI        R27, 0
	OUT        OCR2+0, R27
;libs/PWM_timers.mbas,465 :: 		PWM1_Init(_PWM1_FAST_MODE, _PWM1_PRESCALER_8, _PWM1_NON_INVERTED, 127)''PWM1_Init(5000)'' Initialize PWM1
	LDI        R27, 127
	MOV        R5, R27
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM1_Init+0
;libs/PWM_timers.mbas,469 :: 		PWM1_Start()'' start PWM1
	CALL       _PWM1_Start+0
;libs/PWM_timers.mbas,472 :: 		PWM1_Set_Duty(j)''Set current duty for PWM1
	LDD        R2, Y+0
	CALL       _PWM1_Set_Duty+0
;libs/PWM_timers.mbas,474 :: 		ASSR=0x00
	LDI        R27, 0
	OUT        ASSR+0, R27
;libs/PWM_timers.mbas,475 :: 		TCCR2=0x27
	LDI        R27, 39
	OUT        TCCR2+0, R27
;libs/PWM_timers.mbas,476 :: 		TCNT2=0x00
	LDI        R27, 0
	OUT        TCNT2+0, R27
;libs/PWM_timers.mbas,477 :: 		for k=10 to 0  step -1
	LDI        R27, 10
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
L_libs/PWM_timers_PWM_Initialize_old85:
;libs/PWM_timers.mbas,478 :: 		PWM_MAKE (k*10,255,1)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/PWM_timers.mbas,479 :: 		PWM_MAKE (k*10,255,2)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+1
	LDD        R21, Y+2
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 2
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,480 :: 		PWM_MAKE (k*10,255,3)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+1
	LDD        R21, Y+2
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 3
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,481 :: 		PWM_MAKE (k*10,255,4)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+1
	LDD        R21, Y+2
	LDI        R16, 10
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 4
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,482 :: 		delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L_libs/PWM_timers_PWM_Initialize_old89:
	DEC        R16
	BRNE       L_libs/PWM_timers_PWM_Initialize_old89
	DEC        R17
	BRNE       L_libs/PWM_timers_PWM_Initialize_old89
;libs/PWM_timers.mbas,483 :: 		next k
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L_libs/PWM_timers_PWM_Initialize_old165
	CPI        R16, 0
L_libs/PWM_timers_PWM_Initialize_old165:
	BRNE       L_libs/PWM_timers_PWM_Initialize_old166
	JMP        L_libs/PWM_timers_PWM_Initialize_old88
L_libs/PWM_timers_PWM_Initialize_old166:
	LDD        R16, Y+1
	LDD        R17, Y+2
	SUBI       R16, 1
	SBCI       R17, 0
	STD        Y+1, R16
	STD        Y+2, R17
	JMP        L_libs/PWM_timers_PWM_Initialize_old85
L_libs/PWM_timers_PWM_Initialize_old88:
;libs/PWM_timers.mbas,484 :: 		PWM_MAKE (0,255,4)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDI        R27, 4
	MOV        R5, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/PWM_timers.mbas,504 :: 		end sub
L_end_PWM_Initialize_old:
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

;libs/PWM_timers.mbas,508 :: 		dim Pwm_chanel_ini,chanel_ini,Heater_Motor_Time_ini as byte
;libs/PWM_timers.mbas,509 :: 		Lcd_0() lcd_out(1,1,"Initialsiing Heater")
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
;libs/PWM_timers.mbas,510 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__On_mSec_initial_heater92:
	DEC        R16
	BRNE       L__On_mSec_initial_heater92
	DEC        R17
	BRNE       L__On_mSec_initial_heater92
	DEC        R18
	BRNE       L__On_mSec_initial_heater92
;libs/PWM_timers.mbas,511 :: 		for chanel_ini =1 to 4
	LDI        R27, 1
	STD        Y+1, R27
L__On_mSec_initial_heater95:
;libs/PWM_timers.mbas,512 :: 		for Heater_Motor_Time_ini=1 to 1 ''Heater
	LDI        R27, 1
	STD        Y+2, R27
L__On_mSec_initial_heater100:
;libs/PWM_timers.mbas,513 :: 		for Pwm_chanel_ini =1 to 3
	LDI        R27, 1
	STD        Y+0, R27
L__On_mSec_initial_heater105:
;libs/PWM_timers.mbas,514 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0] =en
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
;libs/PWM_timers.mbas,515 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][1]=mint
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
;libs/PWM_timers.mbas,516 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][2] =sec
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
;libs/PWM_timers.mbas,517 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][3]=prc
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
;libs/PWM_timers.mbas,520 :: 		next Pwm_chanel_ini
	LDD        R16, Y+0
	CPI        R16, 3
	BRNE       L__On_mSec_initial_heater168
	JMP        L__On_mSec_initial_heater108
L__On_mSec_initial_heater168:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__On_mSec_initial_heater105
L__On_mSec_initial_heater108:
;libs/PWM_timers.mbas,521 :: 		next Heater_Motor_Time_ini
	LDD        R16, Y+2
	CPI        R16, 1
	BRNE       L__On_mSec_initial_heater169
	JMP        L__On_mSec_initial_heater103
L__On_mSec_initial_heater169:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L__On_mSec_initial_heater100
L__On_mSec_initial_heater103:
;libs/PWM_timers.mbas,522 :: 		next chanel_ini
	LDD        R16, Y+1
	CPI        R16, 4
	BRNE       L__On_mSec_initial_heater170
	JMP        L__On_mSec_initial_heater98
L__On_mSec_initial_heater170:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__On_mSec_initial_heater95
L__On_mSec_initial_heater98:
;libs/PWM_timers.mbas,523 :: 		end sub
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
	SBIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,526 :: 		dim Pwm_chanel_ini,chanel_ini,Heater_Motor_Time_ini as byte
;libs/PWM_timers.mbas,527 :: 		Lcd_0() lcd_out(1,1,"Initialsiing Heater")
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
;libs/PWM_timers.mbas,528 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__On_mSec_initial_Motor110:
	DEC        R16
	BRNE       L__On_mSec_initial_Motor110
	DEC        R17
	BRNE       L__On_mSec_initial_Motor110
	DEC        R18
	BRNE       L__On_mSec_initial_Motor110
;libs/PWM_timers.mbas,529 :: 		for chanel_ini =1 to 4
	LDI        R27, 1
	STD        Y+1, R27
L__On_mSec_initial_Motor113:
;libs/PWM_timers.mbas,530 :: 		for Heater_Motor_Time_ini=2 to 2 ''Motor
	LDI        R27, 2
	STD        Y+2, R27
L__On_mSec_initial_Motor118:
;libs/PWM_timers.mbas,531 :: 		for Pwm_chanel_ini =1 to 3
	LDI        R27, 1
	STD        Y+0, R27
L__On_mSec_initial_Motor123:
;libs/PWM_timers.mbas,532 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0] =en
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
;libs/PWM_timers.mbas,533 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][1]=mint
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
;libs/PWM_timers.mbas,534 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][2] =sec
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
;libs/PWM_timers.mbas,535 :: 		Mot_heater_On_mSec [chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][3]=prc
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
;libs/PWM_timers.mbas,538 :: 		next Pwm_chanel_ini
	LDD        R16, Y+0
	CPI        R16, 3
	BRNE       L__On_mSec_initial_Motor172
	JMP        L__On_mSec_initial_Motor126
L__On_mSec_initial_Motor172:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__On_mSec_initial_Motor123
L__On_mSec_initial_Motor126:
;libs/PWM_timers.mbas,539 :: 		next Heater_Motor_Time_ini
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L__On_mSec_initial_Motor173
	JMP        L__On_mSec_initial_Motor121
L__On_mSec_initial_Motor173:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L__On_mSec_initial_Motor118
L__On_mSec_initial_Motor121:
;libs/PWM_timers.mbas,540 :: 		next chanel_ini
	LDD        R16, Y+1
	CPI        R16, 4
	BRNE       L__On_mSec_initial_Motor174
	JMP        L__On_mSec_initial_Motor116
L__On_mSec_initial_Motor174:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__On_mSec_initial_Motor113
L__On_mSec_initial_Motor116:
;libs/PWM_timers.mbas,541 :: 		end sub
L_end_On_mSec_initial_Motor:
	ADIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _On_mSec_initial_Motor

_WDT_on:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/PWM_timers.mbas,542 :: 		sub procedure  WDT_on()
;libs/PWM_timers.mbas,574 :: 		WDTCR =(1<<WDP2) or (1<<WDP1)  or (1<<WDP0)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 7
	OUT        WDTCR+0, R27
;libs/PWM_timers.mbas,580 :: 		Lcd_Cmd(_LCD_CLEAR)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;libs/PWM_timers.mbas,581 :: 		Lcd_Out(2,2,"Reset.")
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
;libs/PWM_timers.mbas,587 :: 		end sub
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

;libs/PWM_timers.mbas,590 :: 		end.
L_end_libs/PWM_timers_?main:
	RET
; end of _libs/PWM_timers_?main
