
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 6
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,218 :: 		main:
;MyProject.mbas,257 :: 		DDB0_bit = 1                                       ' set Button pin as input
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
;MyProject.mbas,258 :: 		DDA2_bit = 1                                        ' set Button pin as input
	IN         R27, DDA2_bit+0
	SBR        R27, BitMask(DDA2_bit+0)
	OUT        DDA2_bit+0, R27
;MyProject.mbas,259 :: 		DDA5_bit = 1                                        ' set Button pin as input
	IN         R27, DDA5_bit+0
	SBR        R27, BitMask(DDA5_bit+0)
	OUT        DDA5_bit+0, R27
;MyProject.mbas,260 :: 		DDA4_bit = 1                                        ' set Button pin as input
	IN         R27, DDA4_bit+0
	SBR        R27, BitMask(DDA4_bit+0)
	OUT        DDA4_bit+0, R27
;MyProject.mbas,261 :: 		DDA3_bit = 1                                        ' set Button pin as input
	IN         R27, DDA3_bit+0
	SBR        R27, BitMask(DDA3_bit+0)
	OUT        DDA3_bit+0, R27
;MyProject.mbas,262 :: 		DDC2_bit =1   DDC3_bit =1
	IN         R27, DDC2_bit+0
	SBR        R27, BitMask(DDC2_bit+0)
	OUT        DDC2_bit+0, R27
	IN         R27, DDC3_bit+0
	SBR        R27, BitMask(DDC3_bit+0)
	OUT        DDC3_bit+0, R27
;MyProject.mbas,263 :: 		DDC4_bit =1   DDC5_bit =1  ' configure PORTD as output
	IN         R27, DDC4_bit+0
	SBR        R27, BitMask(DDC4_bit+0)
	OUT        DDC4_bit+0, R27
	IN         R27, DDC5_bit+0
	SBR        R27, BitMask(DDC5_bit+0)
	OUT        DDC5_bit+0, R27
;MyProject.mbas,264 :: 		DDC6_bit =1
	IN         R27, DDC6_bit+0
	SBR        R27, BitMask(DDC6_bit+0)
	OUT        DDC6_bit+0, R27
;MyProject.mbas,265 :: 		DDC7_bit =1
	IN         R27, DDC7_bit+0
	SBR        R27, BitMask(DDC7_bit+0)
	OUT        DDC7_bit+0, R27
;MyProject.mbas,268 :: 		DDD2_bit =0 DDD3_bit =0   DDD4_bit =0  ' configure PORTD as output
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
	IN         R27, DDD4_bit+0
	CBR        R27, BitMask(DDD4_bit+0)
	OUT        DDD4_bit+0, R27
;MyProject.mbas,269 :: 		DDD5_bit =0 DDD6_bit =0     DDD7_bit =0
	IN         R27, DDD5_bit+0
	CBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
	IN         R27, DDD6_bit+0
	CBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
	IN         R27, DDD7_bit+0
	CBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;MyProject.mbas,273 :: 		DDB1_bit =1      DDB3_bit =1
	IN         R27, DDB1_bit+0
	SBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;MyProject.mbas,274 :: 		DDA0_bit =1 DDA1_bit =1      DDA2_bit =1  DDA3_bit =1
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
;MyProject.mbas,279 :: 		DDB4_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB4_bit+0
	SBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
;MyProject.mbas,280 :: 		DDB5_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB5_bit+0
	SBR        R27, BitMask(DDB5_bit+0)
	OUT        DDB5_bit+0, R27
;MyProject.mbas,281 :: 		DDB6_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB6_bit+0
	SBR        R27, BitMask(DDB6_bit+0)
	OUT        DDB6_bit+0, R27
;MyProject.mbas,282 :: 		DDB7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB7_bit+0
	SBR        R27, BitMask(DDB7_bit+0)
	OUT        DDB7_bit+0, R27
;MyProject.mbas,287 :: 		DDC2_bit =1   DDC3_bit =1
	IN         R27, DDC2_bit+0
	SBR        R27, BitMask(DDC2_bit+0)
	OUT        DDC2_bit+0, R27
	IN         R27, DDC3_bit+0
	SBR        R27, BitMask(DDC3_bit+0)
	OUT        DDC3_bit+0, R27
;MyProject.mbas,288 :: 		DDC4_bit =1   DDC5_bit =1  ' configure PORTD as output
	IN         R27, DDC4_bit+0
	SBR        R27, BitMask(DDC4_bit+0)
	OUT        DDC4_bit+0, R27
	IN         R27, DDC5_bit+0
	SBR        R27, BitMask(DDC5_bit+0)
	OUT        DDC5_bit+0, R27
;MyProject.mbas,289 :: 		DDC6_bit =1   DDC7_bit =1
	IN         R27, DDC6_bit+0
	SBR        R27, BitMask(DDC6_bit+0)
	OUT        DDC6_bit+0, R27
	IN         R27, DDC7_bit+0
	SBR        R27, BitMask(DDC7_bit+0)
	OUT        DDC7_bit+0, R27
;MyProject.mbas,293 :: 		DDB4_bit = 0 DDB2_bit = 0                  ' Set PORTE pin 7 as input pin for the Heater switches
	IN         R27, DDB4_bit+0
	CBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
	IN         R27, DDB2_bit+0
	CBR        R27, BitMask(DDB2_bit+0)
	OUT        DDB2_bit+0, R27
;MyProject.mbas,294 :: 		DDD2_bit = 0 DDD3_bit = 0   DDD5_bit = 0  DDD6_bit = 0
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
	IN         R27, DDD5_bit+0
	CBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
	IN         R27, DDD6_bit+0
	CBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;MyProject.mbas,298 :: 		DDB3_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;MyProject.mbas,299 :: 		DDD7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD7_bit+0
	SBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;MyProject.mbas,300 :: 		DDD4_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDD4_bit+0
	SBR        R27, BitMask(DDD4_bit+0)
	OUT        DDD4_bit+0, R27
;MyProject.mbas,302 :: 		PIND7_bit =0
	IN         R27, PIND7_bit+0
	CBR        R27, BitMask(PIND7_bit+0)
	OUT        PIND7_bit+0, R27
;MyProject.mbas,305 :: 		Lcd_Port_Init()
	CALL       _Lcd_Port_Init+0
;MyProject.mbas,307 :: 		Key_Port_Init_mainfunc()
	CALL       _Key_Port_Init_mainfunc+0
;MyProject.mbas,308 :: 		PWM_Port_Initialize ()
	CALL       _PWM_Port_Initialize+0
;MyProject.mbas,310 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,311 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,312 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,313 :: 		LCD_Out(2,1,"TEST")
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
;MyProject.mbas,314 :: 		hours=0x0  minutes=0x0   seconds=0x00 day= 0x2 week=2   month=0x11  year=0x15
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
;MyProject.mbas,317 :: 		Write_Time(hours, minutes, seconds, 0x13, 0x02,   0x11,year)'
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
;MyProject.mbas,323 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,324 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,326 :: 		chanel=1  Pwm_chanel=1  on_off2=1   week_new=week    chanel_active=1
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
;MyProject.mbas,385 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,386 :: 		LCD_Load()
	CALL       _LCD_Load+0
;MyProject.mbas,387 :: 		CustomChar(1,1)
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _CustomChar+0
;MyProject.mbas,388 :: 		LCD_Chr(1,5,3)
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,389 :: 		LCD_Chr(2,2,0)    ' Display custom char 0 (heart)
	CLR        R4
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,390 :: 		LCD_Chr(2,4,4)    ' Display custom char B
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,391 :: 		Delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__main1:
	DEC        R16
	BRNE       L__main1
	DEC        R17
	BRNE       L__main1
	DEC        R18
	BRNE       L__main1
	NOP
	NOP
;MyProject.mbas,393 :: 		On_mSec_initial_Heater (1,0,10,100) 'On_mSec_initial_Heater(dim en,mint,sec,prc as byte)'On_mSec_initial_Heater[chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0]
	LDI        R27, 100
	MOV        R5, R27
	LDI        R27, 10
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_heater+0
;MyProject.mbas,394 :: 		On_mSec_initial_Motor (1,0,10,18)
	LDI        R27, 18
	MOV        R5, R27
	LDI        R27, 10
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_Motor+0
;MyProject.mbas,405 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,406 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;MyProject.mbas,407 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;MyProject.mbas,410 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;MyProject.mbas,425 :: 		PWM_Initialize ()
	CALL       _PWM_Initialize+0
;MyProject.mbas,444 :: 		Interupt_first_time=0 Interupt_first_time2=0
	LDI        R27, 0
	STS        _Interupt_first_time+0, R27
	LDI        R27, 0
	STS        _Interupt_first_time2+0, R27
;MyProject.mbas,445 :: 		ISC2_Bit = 1                                    '' // Set interrupts to be detected on rising edge
	IN         R27, ISC2_bit+0
	SBR        R27, BitMask(ISC2_bit+0)
	OUT        ISC2_bit+0, R27
;MyProject.mbas,446 :: 		ISC00_bit = 1
	IN         R27, ISC00_bit+0
	SBR        R27, BitMask(ISC00_bit+0)
	OUT        ISC00_bit+0, R27
;MyProject.mbas,447 :: 		INTF2_bit = 0
	IN         R27, INTF2_bit+0
	CBR        R27, BitMask(INTF2_bit+0)
	OUT        INTF2_bit+0, R27
;MyProject.mbas,448 :: 		SREG_I_bit = 0
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,449 :: 		Delay_ms(100)                                  ''  // Enable Interrupts
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__main3:
	DEC        R16
	BRNE       L__main3
	DEC        R17
	BRNE       L__main3
	DEC        R18
	BRNE       L__main3
;MyProject.mbas,452 :: 		INT2_bit =1
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;MyProject.mbas,453 :: 		INT0_bit =1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,454 :: 		SREG_I_bit = 1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,459 :: 		chanel=1
	LDI        R27, 1
	STS        _chanel+0, R27
;MyProject.mbas,460 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,461 :: 		while TRUE
L__main6:
;MyProject.mbas,464 :: 		Lcd_Out(1,1,"main ")
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,470 :: 		wend
	JMP        L__main6
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
