
libs/Alarm_clock_Key_Port_Init:

;libs/Alarm_clock.mbas,12 :: 		sub procedure Key_Port_Init()
;libs/Alarm_clock.mbas,15 :: 		DDD7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD7_bit+0
	SBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;libs/Alarm_clock.mbas,16 :: 		DDD6_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD6_bit+0
	SBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;libs/Alarm_clock.mbas,19 :: 		end sub
L_end_Key_Port_Init:
	RET
; end of libs/Alarm_clock_Key_Port_Init

_timer0_init:

;libs/Alarm_clock.mbas,23 :: 		sub procedure timer0_init()
;libs/Alarm_clock.mbas,29 :: 		TCCR0=0x04
	LDI        R27, 4
	OUT        TCCR0+0, R27
;libs/Alarm_clock.mbas,30 :: 		TCNT0=0x06
	LDI        R27, 6
	OUT        TCNT0+0, R27
;libs/Alarm_clock.mbas,31 :: 		OCR0=0x00
	LDI        R27, 0
	OUT        OCR0+0, R27
;libs/Alarm_clock.mbas,33 :: 		TIMSK=0x01
	LDI        R27, 1
	OUT        TIMSK+0, R27
;libs/Alarm_clock.mbas,36 :: 		SREG_I_bit = 1                                   '' // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/Alarm_clock.mbas,37 :: 		Delay_ms(100)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__timer0_init2:
	DEC        R16
	BRNE       L__timer0_init2
	DEC        R17
	BRNE       L__timer0_init2
	DEC        R18
	BRNE       L__timer0_init2
	NOP
;libs/Alarm_clock.mbas,38 :: 		PORTD6_bit=not PORTD6_bit      ' toggle PORTD6_bit
	IN         R0, PORTD6_bit+0
	LDI        R27, BitMask(PORTD6_bit+0)
	EOR        R0, R27
	OUT        PORTD6_bit+0, R0
;libs/Alarm_clock.mbas,39 :: 		second_alarm_clock=0 minutes_alarm_clock=0  hours_alarm_clock=0
	LDI        R27, 0
	STS        _second_alarm_clock+0, R27
	LDI        R27, 0
	STS        _minutes_alarm_clock+0, R27
	LDI        R27, 0
	STS        _hours_alarm_clock+0, R27
;libs/Alarm_clock.mbas,40 :: 		end sub
L_end_timer0_init:
	RET
; end of _timer0_init

_timer2_init:

;libs/Alarm_clock.mbas,42 :: 		sub procedure timer2_init()
;libs/Alarm_clock.mbas,51 :: 		ASSR=0x00
	LDI        R27, 0
	OUT        ASSR+0, R27
;libs/Alarm_clock.mbas,52 :: 		TCCR2=0x0F
	LDI        R27, 15
	OUT        TCCR2+0, R27
;libs/Alarm_clock.mbas,53 :: 		TCNT2=0x06
	LDI        R27, 6
	OUT        TCNT2+0, R27
;libs/Alarm_clock.mbas,55 :: 		TOIE2_bit  = 1             ' Timer1 overflow interrupt enable
	IN         R27, TOIE2_bit+0
	SBR        R27, BitMask(TOIE2_bit+0)
	OUT        TOIE2_bit+0, R27
;libs/Alarm_clock.mbas,58 :: 		TIMSK=0x80
	LDI        R27, 128
	OUT        TIMSK+0, R27
;libs/Alarm_clock.mbas,61 :: 		SREG_I_bit = 1                                   '' // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;libs/Alarm_clock.mbas,62 :: 		Delay_ms(100)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__timer2_init5:
	DEC        R16
	BRNE       L__timer2_init5
	DEC        R17
	BRNE       L__timer2_init5
	DEC        R18
	BRNE       L__timer2_init5
	NOP
;libs/Alarm_clock.mbas,63 :: 		PORTD6_bit=not PORTD6_bit      ' toggle PORTD6_bit
	IN         R0, PORTD6_bit+0
	LDI        R27, BitMask(PORTD6_bit+0)
	EOR        R0, R27
	OUT        PORTD6_bit+0, R0
;libs/Alarm_clock.mbas,64 :: 		second_alarm_clock=0 minutes_alarm_clock=0 hours_alarm_clock=0
	LDI        R27, 0
	STS        _second_alarm_clock+0, R27
	LDI        R27, 0
	STS        _minutes_alarm_clock+0, R27
	LDI        R27, 0
	STS        _hours_alarm_clock+0, R27
;libs/Alarm_clock.mbas,65 :: 		end   sub
L_end_timer2_init:
	RET
; end of _timer2_init

libs/Alarm_clock_Timer0Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;libs/Alarm_clock.mbas,67 :: 		sub procedure Timer0Overflow_ISR iv IVT_ADDR_TIMER0_OVF
;libs/Alarm_clock.mbas,69 :: 		TCNT0=0x06
	LDI        R27, 6
	OUT        TCNT0+0, R27
;libs/Alarm_clock.mbas,70 :: 		if (counter1 >= _THRESHOLD) then
	LDS        R16, _counter1+0
	CPI        R16, 240
	BRSH       L_libs/Alarm_clock_Timer0Overflow_ISR32
	JMP        L_libs/Alarm_clock_Timer0Overflow_ISR9
L_libs/Alarm_clock_Timer0Overflow_ISR32:
;libs/Alarm_clock.mbas,71 :: 		counter1 = 0              ' reset counter
	LDI        R27, 0
	STS        _counter1+0, R27
;libs/Alarm_clock.mbas,72 :: 		inc(second_alarm_clock)
	LDS        R16, _second_alarm_clock+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _second_alarm_clock+0, R17
;libs/Alarm_clock.mbas,73 :: 		if  second_alarm_clock>59 then
	LDI        R16, 59
	CP         R16, R17
	BRLO       L_libs/Alarm_clock_Timer0Overflow_ISR33
	JMP        L_libs/Alarm_clock_Timer0Overflow_ISR12
L_libs/Alarm_clock_Timer0Overflow_ISR33:
;libs/Alarm_clock.mbas,74 :: 		second_alarm_clock=0   inc(minutes_alarm_clock) ' reset  second_alarm_clock
	LDI        R27, 0
	STS        _second_alarm_clock+0, R27
	LDS        R16, _minutes_alarm_clock+0
	SUBI       R16, 255
	STS        _minutes_alarm_clock+0, R16
L_libs/Alarm_clock_Timer0Overflow_ISR12:
;libs/Alarm_clock.mbas,76 :: 		if minutes_alarm_clock>59 then
	LDS        R17, _minutes_alarm_clock+0
	LDI        R16, 59
	CP         R16, R17
	BRLO       L_libs/Alarm_clock_Timer0Overflow_ISR34
	JMP        L_libs/Alarm_clock_Timer0Overflow_ISR15
L_libs/Alarm_clock_Timer0Overflow_ISR34:
;libs/Alarm_clock.mbas,77 :: 		minutes_alarm_clock=0 inc(hours_alarm_clock)
	LDI        R27, 0
	STS        _minutes_alarm_clock+0, R27
	LDS        R16, _hours_alarm_clock+0
	SUBI       R16, 255
	STS        _hours_alarm_clock+0, R16
L_libs/Alarm_clock_Timer0Overflow_ISR15:
;libs/Alarm_clock.mbas,79 :: 		if hours_alarm_clock>23 then
	LDS        R17, _hours_alarm_clock+0
	LDI        R16, 23
	CP         R16, R17
	BRLO       L_libs/Alarm_clock_Timer0Overflow_ISR35
	JMP        L_libs/Alarm_clock_Timer0Overflow_ISR18
L_libs/Alarm_clock_Timer0Overflow_ISR35:
;libs/Alarm_clock.mbas,80 :: 		hours_alarm_clock=0
	LDI        R27, 0
	STS        _hours_alarm_clock+0, R27
L_libs/Alarm_clock_Timer0Overflow_ISR18:
;libs/Alarm_clock.mbas,81 :: 		end if
	JMP        L_libs/Alarm_clock_Timer0Overflow_ISR10
;libs/Alarm_clock.mbas,84 :: 		else
L_libs/Alarm_clock_Timer0Overflow_ISR9:
;libs/Alarm_clock.mbas,85 :: 		Inc(counter1)           ' increment counter
	LDS        R16, _counter1+0
	SUBI       R16, 255
	STS        _counter1+0, R16
;libs/Alarm_clock.mbas,87 :: 		end if
L_libs/Alarm_clock_Timer0Overflow_ISR10:
;libs/Alarm_clock.mbas,89 :: 		end sub
L_end_Timer0Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of libs/Alarm_clock_Timer0Overflow_ISR

libs/Alarm_clock_Timer2Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;libs/Alarm_clock.mbas,91 :: 		sub procedure Timer2Overflow_ISR iv IVT_ADDR_TIMER2_OVF
;libs/Alarm_clock.mbas,93 :: 		TCNT2=0x06
	LDI        R27, 6
	OUT        TCNT2+0, R27
;libs/Alarm_clock.mbas,94 :: 		if (counter1 >= _THRESHOLD) then
	LDS        R16, _counter1+0
	CPI        R16, 240
	BRSH       L_libs/Alarm_clock_Timer2Overflow_ISR37
	JMP        L_libs/Alarm_clock_Timer2Overflow_ISR22
L_libs/Alarm_clock_Timer2Overflow_ISR37:
;libs/Alarm_clock.mbas,95 :: 		PORTD7_bit=not PORTD7_bit      ' toggle PORTD7_bit
	IN         R0, PORTD7_bit+0
	LDI        R27, BitMask(PORTD7_bit+0)
	EOR        R0, R27
	OUT        PORTD7_bit+0, R0
;libs/Alarm_clock.mbas,96 :: 		PORTD6_bit=not PORTD6_bit      ' toggle PORTD6_bit
	IN         R0, PORTD6_bit+0
	LDI        R27, BitMask(PORTD6_bit+0)
	EOR        R0, R27
	OUT        PORTD6_bit+0, R0
;libs/Alarm_clock.mbas,97 :: 		counter1 = 0              ' reset counter
	LDI        R27, 0
	STS        _counter1+0, R27
	JMP        L_libs/Alarm_clock_Timer2Overflow_ISR23
;libs/Alarm_clock.mbas,98 :: 		else
L_libs/Alarm_clock_Timer2Overflow_ISR22:
;libs/Alarm_clock.mbas,99 :: 		Inc(counter1)           ' increment counter
	LDS        R16, _counter1+0
	SUBI       R16, 255
	STS        _counter1+0, R16
;libs/Alarm_clock.mbas,100 :: 		end if
L_libs/Alarm_clock_Timer2Overflow_ISR23:
;libs/Alarm_clock.mbas,102 :: 		end sub
L_end_Timer2Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of libs/Alarm_clock_Timer2Overflow_ISR

_libs/Alarm_clock_?main:

;libs/Alarm_clock.mbas,103 :: 		end.
L_end_libs/Alarm_clock_?main:
	RET
; end of _libs/Alarm_clock_?main
