
_key_test:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,133 :: 		sub procedure key_test()
;MyProject.mbas,134 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _oldstate_menu+0
	CBR        R27, BitMask(_oldstate_menu+0)
	STS        _oldstate_menu+0, R27
;MyProject.mbas,135 :: 		Heater_motor_index=2 Pwm_chanel_main=3
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
;MyProject.mbas,136 :: 		chanel=Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]
	LDI        R18, 12
	LDI        R19, 0
	LDI        R16, #lo_addr(_Mot_heater_On_mSec+144)
	LDI        R17, hi_addr(_Mot_heater_On_mSec+144)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 8
	LD         R16, Z
	STS        _chanel+0, R16
;MyProject.mbas,138 :: 		while  (while_state_import )
L__key_test2:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test3
;MyProject.mbas,139 :: 		oldstate_menu=oldstate_menu+1
	LDS        R0, _oldstate_menu+0
	CLR        R16
	SBRC       R0, BitPos(_oldstate_menu+0)
	INC        R16
	SUBI       R16, 255
	BST        R16, 0
	LDS        R27, _oldstate_menu+0
	BLD        R27, BitPos(_oldstate_menu+0)
	STS        _oldstate_menu+0, R27
;MyProject.mbas,140 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,141 :: 		if oldstate_menu=1 then
	LDS        R27, _oldstate_menu+0
	SBRS       R27, BitPos(_oldstate_menu+0)
	JMP        L__key_test7
;MyProject.mbas,142 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;MyProject.mbas,143 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
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
	JMP        L__key_test8
;MyProject.mbas,144 :: 		else
L__key_test7:
;MyProject.mbas,145 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
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
;MyProject.mbas,146 :: 		end if
L__key_test8:
;MyProject.mbas,149 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,150 :: 		while (while_state_2_2<=5 )
L__key_test10:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L__key_test47
	JMP        L__key_test11
L__key_test47:
;MyProject.mbas,151 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,153 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 1)) then    ' Detect logical one up key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	TST        R16
	BRNE       L__key_test48
	JMP        L__key_test18
L__key_test48:
;MyProject.mbas,154 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,156 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test18:
;MyProject.mbas,158 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 0)) then
	CLR        R6
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__key_test49
	JMP        L__key_test21
L__key_test49:
;MyProject.mbas,159 :: 		while_state_import=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test21:
;MyProject.mbas,165 :: 		end if
L__key_test16:
;MyProject.mbas,167 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,0.5,1)<> 0)
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__key_test50
	LDI        R27, 255
L__key_test50:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,168 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,0.5,1)<> 0)then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L__key_test51
	LDI        R17, 255
L__key_test51:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test52
	JMP        L__key_test26
L__key_test52:
;MyProject.mbas,169 :: 		Keypad_start(chanel) while_state_import=0 oldstate_3=1                  ' Update flag
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__key_test26:
;MyProject.mbas,172 :: 		if (oldstate_3 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0))
	CLR        R6
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	STD        Y+25, R16
;MyProject.mbas,173 :: 		or (while_state_import and oldstate_3 and Button(Ok_SW_Port,Ok_SW_bit,0.5,0))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CBR        R20, 1
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L__key_test56
	SBR        R20, 1
L__key_test56:
	CLR        R6
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CLR        R17
	SBRC       R20, 0
	INC        R17
	AND        R17, R16
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test57
	JMP        L__key_test29
L__key_test57:
;MyProject.mbas,174 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test29:
;MyProject.mbas,178 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test31:
	DEC        R16
	BRNE       L__key_test31
	DEC        R17
	BRNE       L__key_test31
	DEC        R18
	BRNE       L__key_test31
;MyProject.mbas,179 :: 		wend
	JMP        L__key_test10
L__key_test11:
;MyProject.mbas,180 :: 		wend delay_ms(1000)
	JMP        L__key_test2
L__key_test3:
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__key_test33:
	DEC        R16
	BRNE       L__key_test33
	DEC        R17
	BRNE       L__key_test33
	DEC        R18
	BRNE       L__key_test33
;MyProject.mbas,181 :: 		end sub
L_end_key_test:
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
	RET
; end of _key_test

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 5
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,182 :: 		main:
;MyProject.mbas,270 :: 		Lcd_Port_Init()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	CALL       _Lcd_Port_Init+0
;MyProject.mbas,272 :: 		Key_Port_Init_mainfunc()
	CALL       _Key_Port_Init_mainfunc+0
;MyProject.mbas,273 :: 		PWM_Port_Initialize ()
	CALL       _PWM_Port_Initialize+0
;MyProject.mbas,275 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,276 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,277 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,278 :: 		LCD_Out(2,1,"TEST")
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
;MyProject.mbas,279 :: 		hours=0x05  minutes=0x54   seconds=0x00 day= 0x31 week=2   month=0x12  year=0x15
	LDI        R27, 5
	STS        _hours+0, R27
	LDI        R27, 84
	STS        _minutes+0, R27
	LDI        R27, 0
	STS        _seconds+0, R27
	LDI        R27, 49
	STS        _day+0, R27
	LDI        R27, 2
	STS        _week+0, R27
	LDI        R27, 18
	STS        _month+0, R27
	LDI        R27, 21
	STS        _year+0, R27
;MyProject.mbas,282 :: 		Write_Time(hours, minutes, seconds, 0x31, 0x01,   0x12,year)'
	LDI        R27, 21
	MOV        R8, R27
	LDI        R27, 18
	MOV        R7, R27
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 49
	MOV        R5, R27
	CLR        R4
	LDI        R27, 84
	MOV        R3, R27
	LDI        R27, 5
	MOV        R2, R27
	CALL       _Write_Time+0
;MyProject.mbas,288 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,289 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,291 :: 		chanel=1  Pwm_chanel=1  on_off2=1   week_new=week    chanel_active=1
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
;MyProject.mbas,406 :: 		PWM_Initialize () int_eeprom_ini()
	CALL       _PWM_Initialize+0
	CALL       _int_eeprom_ini+0
;MyProject.mbas,408 :: 		while 1
L__main37:
;MyProject.mbas,409 :: 		key_test()
	CALL       _key_test+0
;MyProject.mbas,420 :: 		wend
	JMP        L__main37
;MyProject.mbas,422 :: 		wend
L_end_main:
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
