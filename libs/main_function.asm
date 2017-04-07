
_DS1307:

;libs/main_function.mbas,179 :: 		sub procedure DS1307(dim hours, minutes, seconds as byte)
;libs/main_function.mbas,187 :: 		if seconds>=Start_seconds+1 or ((seconds=0) and (Start_seconds=59))  then
	LDS        R16, _Start_seconds+0
	MOV        R18, R16
	SUBI       R18, 255
	LDI        R27, 0
	CP         R4, R27
	LDI        R17, 0
	BRNE       L__DS1307455
	LDI        R17, 255
L__DS1307455:
	CPI        R16, 59
	LDI        R27, 0
	BRNE       L__DS1307456
	LDI        R27, 255
L__DS1307456:
	MOV        R16, R27
	AND        R16, R17
	OR         R16, R18
	CP         R4, R16
	BRSH       L__DS1307457
	JMP        L__DS13072
L__DS1307457:
;libs/main_function.mbas,188 :: 		target_sec=target_sec+1   Start_seconds=seconds
	LDS        R16, _target_sec+0
	SUBI       R16, 255
	STS        _target_sec+0, R16
	STS        _Start_seconds+0, R4
	JMP        L__DS13073
;libs/main_function.mbas,189 :: 		else if seconds<>Start_seconds  then
L__DS13072:
	LDS        R16, _Start_seconds+0
	CP         R4, R16
	BRNE       L__DS1307458
	JMP        L__DS13075
L__DS1307458:
;libs/main_function.mbas,190 :: 		Start_seconds=seconds
	STS        _Start_seconds+0, R4
L__DS13075:
;libs/main_function.mbas,192 :: 		end if
L__DS13073:
;libs/main_function.mbas,193 :: 		if minutes>=Start_minutes+1 or ((minutes=0) and (Start_minutes=59))  then
	LDS        R16, _Start_minutes+0
	MOV        R18, R16
	SUBI       R18, 255
	LDI        R27, 0
	CP         R3, R27
	LDI        R17, 0
	BRNE       L__DS1307459
	LDI        R17, 255
L__DS1307459:
	CPI        R16, 59
	LDI        R27, 0
	BRNE       L__DS1307460
	LDI        R27, 255
L__DS1307460:
	MOV        R16, R27
	AND        R16, R17
	OR         R16, R18
	CP         R3, R16
	BRSH       L__DS1307461
	JMP        L__DS13078
L__DS1307461:
;libs/main_function.mbas,194 :: 		Start_minutes=minutes
	STS        _Start_minutes+0, R3
	JMP        L__DS13079
;libs/main_function.mbas,196 :: 		else if minutes<>Start_minutes  then
L__DS13078:
	LDS        R16, _Start_minutes+0
	CP         R3, R16
	BRNE       L__DS1307462
	JMP        L__DS130711
L__DS1307462:
;libs/main_function.mbas,197 :: 		Start_minutes=minutes
	STS        _Start_minutes+0, R3
L__DS130711:
;libs/main_function.mbas,199 :: 		end if
L__DS13079:
;libs/main_function.mbas,209 :: 		if target_sec>=60 then
	LDS        R16, _target_sec+0
	CPI        R16, 60
	BRSH       L__DS1307463
	JMP        L__DS130714
L__DS1307463:
;libs/main_function.mbas,210 :: 		target_sec=0         target_min=target_min+1
	LDI        R27, 0
	STS        _target_sec+0, R27
	LDS        R16, _target_min+0
	SUBI       R16, 255
	STS        _target_min+0, R16
L__DS130714:
;libs/main_function.mbas,212 :: 		if target_min>=60 then
	LDS        R16, _target_min+0
	CPI        R16, 60
	BRSH       L__DS1307464
	JMP        L__DS130717
L__DS1307464:
;libs/main_function.mbas,213 :: 		target_min=0  target_sec=0       target_hr=target_hr+1
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_sec+0, R27
	LDS        R16, _target_hr+0
	SUBI       R16, 255
	STS        _target_hr+0, R16
L__DS130717:
;libs/main_function.mbas,215 :: 		if target_hr>=24 then
	LDS        R16, _target_hr+0
	CPI        R16, 24
	BRSH       L__DS1307465
	JMP        L__DS130720
L__DS1307465:
;libs/main_function.mbas,216 :: 		target_hr=0 target_min=0 target_sec=0
	LDI        R27, 0
	STS        _target_hr+0, R27
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_sec+0, R27
L__DS130720:
;libs/main_function.mbas,232 :: 		end sub
L_end_DS1307:
	RET
; end of _DS1307

_Key_Port_Init_mainfunc:

;libs/main_function.mbas,234 :: 		sub procedure Key_Port_Init_mainfunc()
;libs/main_function.mbas,252 :: 		DDB4_bit = 0 DDB2_bit = 0  DDB0_bit = 0  DDB1_bit = 0              ' Set PORTE pin 7 as input pin for the Heater switches
	IN         R27, DDB4_bit+0
	CBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
	IN         R27, DDB2_bit+0
	CBR        R27, BitMask(DDB2_bit+0)
	OUT        DDB2_bit+0, R27
	IN         R27, DDB0_bit+0
	CBR        R27, BitMask(DDB0_bit+0)
	OUT        DDB0_bit+0, R27
	IN         R27, DDB1_bit+0
	CBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
;libs/main_function.mbas,253 :: 		DDD2_bit = 0 DDD3_bit = 0
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
;libs/main_function.mbas,255 :: 		DDD6_bit = 1
	IN         R27, DDD6_bit+0
	SBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;libs/main_function.mbas,257 :: 		end sub
L_end_Key_Port_Init_mainfunc:
	RET
; end of _Key_Port_Init_mainfunc

_Buzzer_on_off:

;libs/main_function.mbas,259 :: 		sub procedure Buzzer_on_off(dim on_ as byte)
;libs/main_function.mbas,273 :: 		end sub
L_end_Buzzer_on_off:
	RET
; end of _Buzzer_on_off

libs/main_function_Show_message_done:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 8
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,276 :: 		txt_1 as string[1]
;libs/main_function.mbas,279 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_Start_seconds_next+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_Start_seconds_next+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_Start_minutes_next+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_Start_minutes_next+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,280 :: 		Buzzer_on_off(1)
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
;libs/main_function.mbas,281 :: 		Lcd_0()Lcd_Out(1,1,ht_or_mot)  Lcd_Out(1,8,"Prog:") bytetostr(chanel_1,txt_1) Lcd_Out(1,12,txt_1) Lcd_Out(1,12,":")
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
	MOVW       R4, R2
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R4
	MOVW       R16, R28
	MOV        R2, R4
	MOV        R3, R16
	MOV        R4, R17
	CALL       _ByteToStr+0
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, 58
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,282 :: 		Lcd_Out(2,1,"Min:") Lcd_Out(2,9,",Sec:")
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 44
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,285 :: 		Start_seconds_next  =  ((Start_seconds_next and 0xF0) >> 4)*10 + (Start_seconds_next and 0x0F)
	LDS        R16, _Start_seconds_next+0
	LDS        R17, _Start_seconds_next+1
	ANDI       R16, 240
	ANDI       R17, 0
	LDI        R27, 4
L_libs/main_function_Show_message_done469:
	ASR        R17
	ROR        R16
	DEC        R27
	BRNE       L_libs/main_function_Show_message_done469
L_libs/main_function_Show_message_done470:
	LDI        R20, 10
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDS        R18, _Start_seconds_next+0
	LDS        R19, _Start_seconds_next+1
	ANDI       R18, 15
	ANDI       R19, 0
	ADD        R16, R18
	ADC        R17, R19
	STS        _Start_seconds_next+0, R16
	STS        _Start_seconds_next+1, R17
;libs/main_function.mbas,286 :: 		Start_minutes_next  =  ((Start_minutes_next and 0xF0) >> 4)*10 + (Start_minutes_next and 0x0F)
	LDS        R16, _Start_minutes_next+0
	LDS        R17, _Start_minutes_next+1
	ANDI       R16, 240
	ANDI       R17, 0
	LDI        R27, 4
L_libs/main_function_Show_message_done471:
	ASR        R17
	ROR        R16
	DEC        R27
	BRNE       L_libs/main_function_Show_message_done471
L_libs/main_function_Show_message_done472:
	LDI        R20, 10
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDS        R18, _Start_minutes_next+0
	LDS        R19, _Start_minutes_next+1
	ANDI       R18, 15
	ANDI       R19, 0
	ADD        R16, R18
	ADC        R17, R19
	STS        _Start_minutes_next+0, R16
	STS        _Start_minutes_next+1, R17
;libs/main_function.mbas,288 :: 		mi=target_min se=target_sec
; mi start address is: 17 (R17)
	LDS        R17, _target_min+0
; se start address is: 18 (R18)
	LDS        R18, _target_sec+0
;libs/main_function.mbas,289 :: 		Lcd_Chr(2, 5, (mi div 10) + 48)
	LDS        R16, _target_min+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	PUSH       R18
	PUSH       R17
	MOV        R4, R16
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R17
;libs/main_function.mbas,290 :: 		Lcd_Chr(2,6, (mi mod 10) + 48)
	LDI        R20, 10
	MOV        R16, R17
	CALL       _Div_8x8_U+0
	MOV        R16, R25
; mi end address is: 17 (R17)
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R18
;libs/main_function.mbas,291 :: 		Lcd_Chr(2,14, (se div 10) + 48)
	LDI        R20, 10
	MOV        R16, R18
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	PUSH       R18
	MOV        R4, R16
	LDI        R27, 14
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R18
;libs/main_function.mbas,292 :: 		Lcd_Chr(2,15, (se mod 10) + 48)
	LDI        R20, 10
	MOV        R16, R18
	CALL       _Div_8x8_U+0
	MOV        R16, R25
; se end address is: 18 (R18)
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 15
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;libs/main_function.mbas,296 :: 		end sub
L_end_Show_message_done:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Show_message_done

libs/main_function_Heater_relay_on:

;libs/main_function.mbas,297 :: 		sub procedure Heater_relay_on()
;libs/main_function.mbas,298 :: 		if (while_state_import_main=0) then
	LDS        R27, _while_state_import_main+0
	SBRC       R27, BitPos(_while_state_import_main+0)
	JMP        L_libs/main_function_Heater_relay_on27
;libs/main_function.mbas,299 :: 		Heater_relay_Pin =1
	IN         R27, PIND6_bit+0
	SBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,300 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L_libs/main_function_Heater_relay_on27:
;libs/main_function.mbas,303 :: 		end sub
L_end_Heater_relay_on:
	RET
; end of libs/main_function_Heater_relay_on

libs/main_function_Saving_Mot_heater_On_mSec:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 15
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,306 :: 		dim Heater_motor_index_1 as byte
;libs/main_function.mbas,308 :: 		if auto_setting_enable=1 then
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	CP         R2, R27
	BREQ       L_libs/main_function_Saving_Mot_heater_On_mSec475
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec31
L_libs/main_function_Saving_Mot_heater_On_mSec475:
;libs/main_function.mbas,309 :: 		for  Heater_motor_index_1=1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L_libs/main_function_Saving_Mot_heater_On_mSec34:
;libs/main_function.mbas,310 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index_1-1][Pwm_chanel_main-1][1]= target_min
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+13, R16
	STD        Y+14, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+13
	LDD        R19, Y+14
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _target_min+0
	ST         Z, R16
;libs/main_function.mbas,311 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1], txt_byte_min)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+13, R16
	STD        Y+14, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+13
	LDD        R19, Y+14
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	PUSH       R2
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/main_function.mbas,312 :: 		Lcd_0()Lcd_Out(1,1,txt_byte_min) Lcd_Out(2,1,"On EEPROM") delay_ms(2000)
	CALL       _Lcd_0+0
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 163
	LDI        R17, 87
	LDI        R16, 3
L_libs/main_function_Saving_Mot_heater_On_mSec38:
	DEC        R16
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec38
	DEC        R17
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec38
	DEC        R18
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec38
	NOP
;libs/main_function.mbas,313 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index_1-1][Pwm_chanel_main-1][2]= target_sec
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+0
	SUBI       R20, 1
	STD        Y+13, R16
	STD        Y+14, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+13
	LDD        R19, Y+14
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _target_sec+0
	ST         Z, R16
;libs/main_function.mbas,314 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2], txt_byte_min)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+13, R16
	STD        Y+14, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+13
	LDD        R19, Y+14
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/main_function.mbas,315 :: 		Lcd_0()Lcd_Out(1,1,txt_byte_min) Lcd_Out(2,1,"On EEPROM") delay_ms(2000)
	CALL       _Lcd_0+0
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	LDI        R18, 163
	LDI        R17, 87
	LDI        R16, 3
L_libs/main_function_Saving_Mot_heater_On_mSec40:
	DEC        R16
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec40
	DEC        R17
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec40
	DEC        R18
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec40
	NOP
;libs/main_function.mbas,316 :: 		next Heater_motor_index_1
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec476
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec37
L_libs/main_function_Saving_Mot_heater_On_mSec476:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec34
L_libs/main_function_Saving_Mot_heater_On_mSec37:
;libs/main_function.mbas,317 :: 		Lcd_0()Lcd_Out(1,1,"Saving") Lcd_Out(2,1,"On EEPROM") delay_ms(200)
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 1
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Saving_Mot_heater_On_mSec42:
	DEC        R16
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec42
	DEC        R17
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec42
	DEC        R18
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec42
L_libs/main_function_Saving_Mot_heater_On_mSec31:
;libs/main_function.mbas,328 :: 		end sub                                        ' endless loop
L_end_Saving_Mot_heater_On_mSec:
	POP        R5
	POP        R4
	POP        R3
	ADIW       R28, 14
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Saving_Mot_heater_On_mSec

libs/main_function_Easy_vacuum_95_10_4_simple_heater:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,329 :: 		sub procedure Easy_vacuum_95_10_4_simple_heater(dim program_number as byte,dim Interupt_en as byte,dim byref Time_on as integer)
;libs/main_function.mbas,332 :: 		Heater_motor_index=0 Pwm_chanel_main=Heater_pwm_num  ''as Heater
	PUSH       R6
	LDI        R27, 0
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,333 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
;libs/main_function.mbas,334 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater46:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater47
;libs/main_function.mbas,335 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater478
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater51
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater478:
;libs/main_function.mbas,336 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater479
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater54
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater479:
;libs/main_function.mbas,337 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater54:
;libs/main_function.mbas,339 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater480
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater57
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater480:
;libs/main_function.mbas,340 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater57:
;libs/main_function.mbas,341 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater52
;libs/main_function.mbas,342 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater51:
;libs/main_function.mbas,343 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,344 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
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
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater59:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater59
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater59
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater59
;libs/main_function.mbas,345 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater52:
;libs/main_function.mbas,346 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater46
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater47:
;libs/main_function.mbas,347 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,349 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,353 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,354 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,355 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,356 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater61:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater61
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater61
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater61
;libs/main_function.mbas,357 :: 		Lcd_Out(1,1,"On pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
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
;libs/main_function.mbas,359 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater481
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater64
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater481:
;libs/main_function.mbas,360 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater64:
;libs/main_function.mbas,362 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater482
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater67
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater482:
;libs/main_function.mbas,363 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,364 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater67:
;libs/main_function.mbas,366 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	CPI        R16, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater483
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater70
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater483:
;libs/main_function.mbas,367 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,368 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,369 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,370 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 25
	LDI        R17, 90
	LDI        R16, 178
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater72:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater72
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater72
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater72
	NOP
	NOP
;libs/main_function.mbas,371 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
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
;libs/main_function.mbas,372 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,375 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater70:
;libs/main_function.mbas,377 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
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
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater74:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater74
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater74
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater74
;libs/main_function.mbas,378 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_heater:
	POP        R6
	ADIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Easy_vacuum_95_10_4_simple_heater

libs/main_function_Easy_vacuum_95_10_4_simple_Motor:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 31
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,381 :: 		sub procedure Easy_vacuum_95_10_4_simple_Motor(dim program_number as byte,dim Interupt_en,Time_on as integer)
;libs/main_function.mbas,384 :: 		Heater_motor_index=1 Pwm_chanel_main=Motor_pwm_num  ''as Motor
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,385 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
;libs/main_function.mbas,386 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor78:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor79
;libs/main_function.mbas,387 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R4, R27
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor485
	LDI        R27, 0
	CP         R3, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor485:
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor486
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor83
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor486:
;libs/main_function.mbas,388 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor487
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor86
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor487:
;libs/main_function.mbas,389 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor86:
;libs/main_function.mbas,391 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor488
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor89
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor488:
;libs/main_function.mbas,392 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor89:
;libs/main_function.mbas,394 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor84
;libs/main_function.mbas,395 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor83:
;libs/main_function.mbas,396 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,397 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
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
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor91:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor91
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor91
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor91
;libs/main_function.mbas,398 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor84:
;libs/main_function.mbas,399 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor78
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor79:
;libs/main_function.mbas,400 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,402 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,403 :: 		Time_on=(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]*60+Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1])*1000
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	STD        Y+29, R16
	STD        Y+30, R17
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	STD        Y+27, R16
	STD        Y+28, R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R16, Z
	LDI        R17, 0
	LDI        R20, 60
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+25, R16
	STD        Y+26, R17
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+29
	LDD        R17, Y+30
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+27
	LDD        R17, Y+28
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R18, Z
	LDD        R16, Y+25
	LDD        R17, Y+26
	ADD        R16, R18
	LDI        R27, 0
	ADC        R17, R27
	LDI        R20, 232
	LDI        R21, 3
	CALL       _HWMul_16x16+0
	MOV        R5, R16
	MOV        R6, R17
;libs/main_function.mbas,404 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,405 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,406 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,407 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor93:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor93
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor93
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor93
;libs/main_function.mbas,408 :: 		Lcd_Out(1,1,"On pwm Mtor mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/main_function.mbas,410 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	CPI        R16, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor489
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor96
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor489:
;libs/main_function.mbas,411 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,412 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,413 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,414 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 25
	LDI        R17, 90
	LDI        R16, 178
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor98:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor98
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor98
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor98
	NOP
	NOP
;libs/main_function.mbas,415 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
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
;libs/main_function.mbas,416 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,418 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor96:
;libs/main_function.mbas,420 :: 		Lcd_0()Lcd_Out(1,1,"End") Lcd_Out(2,1,"...") delay_ms(200) '' DDD7_bit =0
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	LDI        R27, 69
	STD        Y+0, R27
	LDI        R27, 110
	STD        Y+1, R27
	LDI        R27, 100
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
	LDI        R27, 46
	STD        Y+0, R27
	LDI        R27, 46
	STD        Y+1, R27
	LDI        R27, 46
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor100:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor100
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor100
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor100
;libs/main_function.mbas,421 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_Motor:
	ADIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Easy_vacuum_95_10_4_simple_Motor

libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 32
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,426 :: 		dim pwm_precnt as integer
;libs/main_function.mbas,427 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,451 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
;libs/main_function.mbas,452 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun104:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun105
;libs/main_function.mbas,459 :: 		if (Interupt_en=0)  then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun491
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun109
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun491:
;libs/main_function.mbas,460 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun492
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun112
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun492:
;libs/main_function.mbas,461 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,462 :: 		Interupt_en=1 while_state_import=0 Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun112:
;libs/main_function.mbas,464 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun493
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun115
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun493:
;libs/main_function.mbas,465 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun115:
;libs/main_function.mbas,466 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun110
;libs/main_function.mbas,467 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun109:
;libs/main_function.mbas,468 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,469 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun117:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun117
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun117
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun117
;libs/main_function.mbas,470 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun110:
;libs/main_function.mbas,471 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun104
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun105:
;libs/main_function.mbas,475 :: 		if (Interupt_en=1) then
	LDI        R27, 1
	CP         R3, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun494
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun120
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun494:
;libs/main_function.mbas,486 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,542 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,546 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_Start_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_Start_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_Start_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_Start_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,552 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,556 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,557 :: 		if (auto_setting_enable=1)then  '''making unlimit time for auto setting
	LDI        R27, 1
	CP         R4, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun495
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun123
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun495:
;libs/main_function.mbas,558 :: 		for  Pwm_chanel_main=Heater_pwm_num to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun126:
;libs/main_function.mbas,559 :: 		for  Heater_motor_index=1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun131:
;libs/main_function.mbas,560 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=60
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDI        R27, 60
	ST         Z, R27
;libs/main_function.mbas,561 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=60
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDI        R27, 60
	ST         Z, R27
;libs/main_function.mbas,562 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]=1
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 1
	ST         Z, R27
;libs/main_function.mbas,563 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun496
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun134
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun496:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun131
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun134:
;libs/main_function.mbas,564 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun497
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun129
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun497:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun126
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun129:
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun123:
;libs/main_function.mbas,567 :: 		Heater_motor_index=2 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,568 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3], txt_byte_min)
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 244
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/main_function.mbas,569 :: 		pwm_precnt=StrToInt(txt_byte_min)
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R3, R27
	CALL       _StrToInt+0
	POP        R2
	POP        R3
	POP        R4
	STD        Y+0, R16
	STD        Y+1, R17
;libs/main_function.mbas,571 :: 		while_state_import=1    while_state_import_main=0   j=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDI        R27, 1
	STS        _j+0, R27
;libs/main_function.mbas,575 :: 		if (auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds)  and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun498
	LDI        R16, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun498:
	STD        Y+31, R16
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun499
	LDI        R20, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun499:
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R21, Y+29
	LDD        R22, Y+30
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R23
	ADC        R19, R24
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z
	LDS        R18, _seconds+0
	CP         R19, R18
	LDI        R18, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun500
	LDI        R18, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun500:
	AND        R20, R18
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R16, R18
	ADC        R17, R19
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun501
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun501:
	MOV        R16, R27
	MOV        R17, R20
	AND        R17, R16
	LDD        R16, Y+31
	OR         R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun502
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun139
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun502:
;libs/main_function.mbas,580 :: 		inttostr(pwm_precnt,txt)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _IntToStr+0
;libs/main_function.mbas,581 :: 		inttostr(minutes,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _minutes+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,583 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun503
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun142
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun503:
;libs/main_function.mbas,584 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDS        R20, _Heater_motor_index+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,585 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun142:
;libs/main_function.mbas,588 :: 		delay_ms(100)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun144:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun144
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun144
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun144
	NOP
;libs/main_function.mbas,589 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun504
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun147
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun504:
;libs/main_function.mbas,590 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0   while_state_import=0                 ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun147:
;libs/main_function.mbas,593 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun505
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun150
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun505:
;libs/main_function.mbas,594 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,595 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,596 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun150:
;libs/main_function.mbas,597 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun139:
;libs/main_function.mbas,601 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,608 :: 		Write_Time(hours, 0x00, 0x00, day, week,   month,year)
	LDS        R8, _year+0
	LDS        R7, _month+0
	LDS        R6, _week+0
	LDS        R5, _day+0
	CLR        R4
	CLR        R3
	LDS        R2, _hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,609 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,610 :: 		oldstate_3 =0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,613 :: 		j=0  Heater_motor_index=2   ht_start_sec=0 ht_start_min=0''sec_n1[0]=0 sec_n1[1]=0
	LDI        R27, 0
	STS        _j+0, R27
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 0
	STS        _ht_start_sec+0, R27
	LDI        R27, 0
	STS        _ht_start_min+0, R27
;libs/main_function.mbas,614 :: 		Heater_relay_Pin =0  oldstate_3 = 0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,615 :: 		while_state_import=1    while_state_import_main=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,616 :: 		while( while_state_import)
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun153:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun154
;libs/main_function.mbas,619 :: 		if (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]= minutes ) and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]< (seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R22, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun506
	LDI        R22, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun506:
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+29
	LDD        R19, Y+30
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R17, R16
	LDI        R16, 0
	BRSH       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun507
	LDI        R16, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun507:
	AND        R16, R22
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun508
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun161
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun508:
;libs/main_function.mbas,620 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun161:
;libs/main_function.mbas,622 :: 		if (while_state_import<>0)and ((auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) or    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]> seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R27, _while_state_import+0
	BST        R27, BitPos(_while_state_import+0)
	BLD        R25, 0
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun509
	LDI        R16, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun509:
	STD        Y+31, R16
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R27, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun510
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun510:
	MOV        R19, R27
	LDD        R18, Y+31
	MOV        R22, R18
	OR         R22, R19
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+29
	LDD        R19, Y+30
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRSH       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun511
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun511:
	MOV        R16, R27
	MOV        R17, R22
	OR         R17, R16
	CLR        R16
	SBRC       R25, 0
	INC        R16
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun512
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun164
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun512:
;libs/main_function.mbas,625 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,626 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,627 :: 		bytetostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _chanel+0
	CALL       _ByteToStr+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,629 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun513
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun167
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun513:
;libs/main_function.mbas,630 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,631 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun167:
;libs/main_function.mbas,635 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 0)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun514
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun170
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun514:
;libs/main_function.mbas,636 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun170:
;libs/main_function.mbas,640 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 1)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun515
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun173
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun515:
;libs/main_function.mbas,642 :: 		while_state_import=0                    ' Update flag
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,643 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,645 :: 		delay_ms(200)
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun175:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun175
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun175
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun175
;libs/main_function.mbas,646 :: 		PWM_MAKE (Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Motor_pwm_num-1][3],255,Motor_pwm_num)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,647 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,651 :: 		Buzzer_on_off(1)
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun173:
;libs/main_function.mbas,655 :: 		Heater_relay_on()
	CALL       libs/main_function_Heater_relay_on+0
;libs/main_function.mbas,660 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun516
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun178
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun516:
;libs/main_function.mbas,661 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 1)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun517
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun181
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun517:
;libs/main_function.mbas,662 :: 		oldstate_3 = 1 while_state_import=0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,663 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,666 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,668 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=minutes
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _minutes+0
	ST         Z, R16
;libs/main_function.mbas,669 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=seconds
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _seconds+0
	ST         Z, R16
;libs/main_function.mbas,670 :: 		Buzzer_on_off(1)
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun181:
;libs/main_function.mbas,672 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun179
;libs/main_function.mbas,679 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun178:
;libs/main_function.mbas,680 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) and (j=2) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R17, _j+0
	CPI        R17, 2
	LDI        R27, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun518
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun518:
	MOV        R17, R27
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun519
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun184
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun519:
;libs/main_function.mbas,681 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,682 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,684 :: 		Buzzer_on_off(1)
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun184:
;libs/main_function.mbas,686 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun520
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun187
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun520:
;libs/main_function.mbas,687 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,688 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,689 :: 		Heater_relay_Pin =0  ''Saving_Mot_heater_On_mSec(auto_setting_enable)
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun187:
;libs/main_function.mbas,691 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun179:
;libs/main_function.mbas,695 :: 		ht_start_sec=seconds
	LDS        R18, _seconds+0
	STS        _ht_start_sec+0, R18
;libs/main_function.mbas,696 :: 		if (seconds<>ht_start_min ) or (seconds=0) then
	LDS        R16, _ht_start_min+0
	CP         R18, R16
	LDI        R17, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun521
	LDI        R17, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun521:
	CPI        R18, 0
	LDI        R16, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun522
	LDI        R16, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun522:
	OR         R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun523
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun190
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun523:
;libs/main_function.mbas,697 :: 		ht_start_min=seconds
	LDS        R16, _seconds+0
	STS        _ht_start_min+0, R16
;libs/main_function.mbas,698 :: 		Show_message_done("Heater",chanel)
	MOVW       R30, R28
	ADIW       R30, 2
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
	SUBI       R16, 254
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	POP        R2
	POP        R3
	POP        R4
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun190:
;libs/main_function.mbas,699 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun165
;libs/main_function.mbas,701 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun164:
;libs/main_function.mbas,704 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,705 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,706 :: 		Show_message_done("Heater",chanel) delay_ms(100)
	MOVW       R30, R28
	ADIW       R30, 2
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
	SUBI       R16, 254
	SBCI       R17, 255
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun192:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun192
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun192
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun192
	NOP
;libs/main_function.mbas,707 :: 		Lcd_0()  ''Saving_Mot_heater_On_mSec()
	CALL       _Lcd_0+0
;libs/main_function.mbas,708 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,709 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,710 :: 		if j=1 then Lcd_Out(2,1,"Heater off") Lcd_Out(2,10,txt) delay_ms(300)  end if
	LDS        R16, _j+0
	CPI        R16, 1
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun524
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun195
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun524:
	MOVW       R30, R28
	ADIW       R30, 2
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 25
	LDI        R17, 90
	LDI        R16, 178
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun197:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun197
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun197
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun197
	NOP
	NOP
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun195:
;libs/main_function.mbas,711 :: 		if j=0 then Lcd_Out(2,1,"Heater Error") Lcd_Out(2,10,txt) delay_ms(300)  end if
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun525
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun200
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun525:
	MOVW       R30, R28
	ADIW       R30, 2
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 25
	LDI        R17, 90
	LDI        R16, 178
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun202:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun202
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun202
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun202
	NOP
	NOP
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun200:
;libs/main_function.mbas,712 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,713 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,714 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun165:
;libs/main_function.mbas,717 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun153
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun154:
;libs/main_function.mbas,720 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun120:
;libs/main_function.mbas,726 :: 		Heater_motor_index=2 ''as Motor
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
;libs/main_function.mbas,727 :: 		Pwm_chanel_main=Motor_pwm_num ''Motor
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,728 :: 		while_state_import=1 Pwm_chanel=Pwm_chanel_main ''while_state_import_main2=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel+0, R27
;libs/main_function.mbas,730 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,731 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun204:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun204
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun204
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun204
;libs/main_function.mbas,732 :: 		if (oldstate_3=1) then
	LDS        R27, _oldstate_3+0
	SBRS       R27, BitPos(_oldstate_3+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun207
;libs/main_function.mbas,733 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun526
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun210
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun526:
;libs/main_function.mbas,734 :: 		while_state_import_main=1 oldstate_3=0
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun211
;libs/main_function.mbas,735 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun210:
;libs/main_function.mbas,736 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,737 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun211:
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun207:
;libs/main_function.mbas,757 :: 		while  (while_state_import_main )
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun213:
	LDS        R27, _while_state_import_main+0
	SBRS       R27, BitPos(_while_state_import_main+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun214
;libs/main_function.mbas,758 :: 		if ( Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun527
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun218
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun527:
;libs/main_function.mbas,759 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun218:
;libs/main_function.mbas,761 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!") delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun220:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun220
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun220
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun220
;libs/main_function.mbas,762 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun213
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun214:
;libs/main_function.mbas,763 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,773 :: 		LCD_Out(2,9, "motor running")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,774 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,776 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_Start_seconds_next+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_Start_seconds_next+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_Start_minutes_next+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_Start_minutes_next+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,780 :: 		week=1
	LDI        R27, 1
	STS        _week+0, R27
;libs/main_function.mbas,781 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,783 :: 		if  (Pwm_chanel_main=Heater_pwm_num) then
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 1
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun528
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun226
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun528:
;libs/main_function.mbas,784 :: 		txt="Heater"
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
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
;libs/main_function.mbas,785 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun227
;libs/main_function.mbas,786 :: 		else if  (Pwm_chanel_main=Motor_pwm_num)  then
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun226:
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 2
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun529
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun229
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun529:
;libs/main_function.mbas,787 :: 		txt="Motor"
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
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
;libs/main_function.mbas,788 :: 		Mo_start_min= minutes   Mo_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _Mo_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _Mo_start_sec+0, R16
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun229:
;libs/main_function.mbas,790 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun227:
;libs/main_function.mbas,801 :: 		Write_Time(hours, 0x00, 0x00, day, week,   month,year)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R8, _year+0
	LDS        R7, _month+0
	LDS        R6, _week+0
	LDS        R5, _day+0
	CLR        R4
	CLR        R3
	LDS        R2, _hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,802 :: 		while_state_import=1  j=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 0
	STS        _j+0, R27
;libs/main_function.mbas,803 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,804 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun232:
;libs/main_function.mbas,807 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,808 :: 		while( while_state_import)
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun240:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun241
;libs/main_function.mbas,810 :: 		if (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]= minutes ) and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]< (seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R22, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun530
	LDI        R22, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun530:
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+29
	LDD        R19, Y+30
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R17, R16
	LDI        R16, 0
	BRSH       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun531
	LDI        R16, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun531:
	AND        R16, R22
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun532
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun245
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun532:
;libs/main_function.mbas,812 :: 		if (j=2) then    ' Detect logical one up key
	LDS        R16, _j+0
	CPI        R16, 2
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun533
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun248
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun533:
;libs/main_function.mbas,813 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,815 :: 		Show_message_done("Motor",chanel) delay_ms(2000)
	MOVW       R30, R28
	ADIW       R30, 2
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
	SUBI       R16, 254
	SBCI       R17, 255
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 163
	LDI        R17, 87
	LDI        R16, 3
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun250:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun250
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun250
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun250
	NOP
;libs/main_function.mbas,816 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,817 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,818 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun252:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun252
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun252
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun252
;libs/main_function.mbas,819 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,820 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,822 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun249
;libs/main_function.mbas,823 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun248:
;libs/main_function.mbas,825 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!") delay_ms(3000)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 244
	LDI        R17, 130
	LDI        R16, 6
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun254:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun254
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun254
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun254
;libs/main_function.mbas,826 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0))   then
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun534
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun257
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun534:
;libs/main_function.mbas,827 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun257:
;libs/main_function.mbas,829 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun249:
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun245:
;libs/main_function.mbas,831 :: 		if (while_state_import<>0)and ((auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) or    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]> seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R27, _while_state_import+0
	BST        R27, BitPos(_while_state_import+0)
	BLD        R25, 0
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun535
	LDI        R16, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun535:
	STD        Y+31, R16
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R27, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun536
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun536:
	MOV        R19, R27
	LDD        R18, Y+31
	MOV        R22, R18
	OR         R22, R19
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+29
	LDD        R19, Y+30
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _seconds+0
	CP         R16, R17
	LDI        R27, 0
	BRSH       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun537
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun537:
	MOV        R16, R27
	MOV        R17, R22
	OR         R17, R16
	CLR        R16
	SBRC       R25, 0
	INC        R16
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun538
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun260
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun538:
;libs/main_function.mbas,840 :: 		pwm_precnt=integer ( ceil(Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]/10))
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	LDI        R17, 0
	MOV        R18, R17
	MOV        R19, R17
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
	CALL       _float_fpint+0
	STD        Y+0, R16
	STD        Y+1, R17
;libs/main_function.mbas,841 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun539
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun263
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun539:
;libs/main_function.mbas,846 :: 		PWM_MAKE (Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,847 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun263:
;libs/main_function.mbas,849 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun540
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun266
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun540:
;libs/main_function.mbas,850 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun266:
;libs/main_function.mbas,858 :: 		ht_start_sec=seconds
	LDS        R18, _seconds+0
	STS        _ht_start_sec+0, R18
;libs/main_function.mbas,859 :: 		if (seconds<>ht_start_min ) or (seconds=0) then
	LDS        R16, _ht_start_min+0
	CP         R18, R16
	LDI        R17, 0
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun541
	LDI        R17, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun541:
	CPI        R18, 0
	LDI        R16, 0
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun542
	LDI        R16, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun542:
	OR         R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun543
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun269
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun543:
;libs/main_function.mbas,860 :: 		ht_start_min=seconds
	LDS        R16, _seconds+0
	STS        _ht_start_min+0, R16
;libs/main_function.mbas,861 :: 		Show_message_done("Motor",chanel)
	MOVW       R30, R28
	ADIW       R30, 2
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
	SUBI       R16, 254
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	POP        R2
	POP        R3
	POP        R4
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun269:
;libs/main_function.mbas,865 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,866 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,867 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun544
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun272
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun544:
;libs/main_function.mbas,869 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 1) and (seconds >=3)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R17, _seconds+0
	CPI        R17, 3
	LDI        R27, 0
	BRLO       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun545
	LDI        R27, 255
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun545:
	MOV        R17, R27
	AND        R16, R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun546
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun275
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun546:
;libs/main_function.mbas,870 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,871 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,873 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=minutes
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _minutes+0
	ST         Z, R16
;libs/main_function.mbas,874 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=seconds
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _seconds+0
	ST         Z, R16
;libs/main_function.mbas,875 :: 		Buzzer_on_off(1)
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun275:
;libs/main_function.mbas,876 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun272:
;libs/main_function.mbas,878 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun261
;libs/main_function.mbas,879 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun260:
;libs/main_function.mbas,881 :: 		if (j=2) then    ' Detect logical one up key
	LDS        R16, _j+0
	CPI        R16, 2
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun547
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun278
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun547:
;libs/main_function.mbas,882 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,884 :: 		Show_message_done("Motor",chanel) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 2
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
	SUBI       R16, 254
	SBCI       R17, 255
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun280:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun280
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun280
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun280
;libs/main_function.mbas,885 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,886 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,887 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun282:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun282
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun282
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun282
;libs/main_function.mbas,888 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,889 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,891 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun279
;libs/main_function.mbas,892 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun278:
;libs/main_function.mbas,894 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!") delay_ms(500)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun284:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun284
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun284
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun284
;libs/main_function.mbas,895 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0))   then
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun548
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun287
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun548:
;libs/main_function.mbas,896 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun287:
;libs/main_function.mbas,898 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun279:
;libs/main_function.mbas,900 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun261:
;libs/main_function.mbas,901 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun240
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun241:
;libs/main_function.mbas,906 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun238:
;libs/main_function.mbas,907 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun549
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun235
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun549:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun232
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun235:
;libs/main_function.mbas,911 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
;libs/main_function.mbas,913 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,917 :: 		Read_Time(@Start_hours, @End_minutes_next, @End_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_End_seconds_next+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_End_seconds_next+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_End_minutes_next+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_End_minutes_next+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,920 :: 		Write_Time((Start_hours),(Start_minutes+End_minutes_next),(Start_seconds+End_seconds_next),
	LDS        R17, _Start_minutes+0
	LDS        R16, _End_minutes_next+0
	MOV        R18, R17
	ADD        R18, R16
	LDS        R17, _Start_seconds+0
	LDS        R16, _End_seconds_next+0
	ADD        R16, R17
;libs/main_function.mbas,921 :: 		(Start_day),(Start_week),(Start_month),(Start_year))
	LDS        R8, _Start_year+0
	LDS        R7, _Start_month+0
	LDS        R6, _Start_week+0
	LDS        R5, _Start_day+0
	MOV        R4, R16
	MOV        R3, R18
	LDS        R2, _Start_hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,930 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,931 :: 		inttostr(End_seconds_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_seconds_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,932 :: 		Lcd_Out(1,1,"Sec ended is :") Lcd_Out(1,10,txt)
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,933 :: 		inttostr(End_minutes_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_minutes_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,934 :: 		Lcd_Out(2,1,"Min ended is :") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun289:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun289
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun289
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun289
;libs/main_function.mbas,935 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	ADIW       R28, 31
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Easy_vacuum_95_10_4_simple_working_NoDS1307_fun

_Easy_vacuum_95_10_4_simple_working:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,940 :: 		dim pwm_precnt as integer
;libs/main_function.mbas,941 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,965 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1   k=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;libs/main_function.mbas,966 :: 		while  (while_state_import )
L__Easy_vacuum_95_10_4_simple_working293:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working294
;libs/main_function.mbas,973 :: 		if (Interupt_en=0)  then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working551
	JMP        L__Easy_vacuum_95_10_4_simple_working298
L__Easy_vacuum_95_10_4_simple_working551:
;libs/main_function.mbas,974 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working552
	JMP        L__Easy_vacuum_95_10_4_simple_working301
L__Easy_vacuum_95_10_4_simple_working552:
;libs/main_function.mbas,975 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,976 :: 		Interupt_en=1 while_state_import=0 Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L__Easy_vacuum_95_10_4_simple_working301:
;libs/main_function.mbas,978 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working553
	JMP        L__Easy_vacuum_95_10_4_simple_working304
L__Easy_vacuum_95_10_4_simple_working553:
;libs/main_function.mbas,979 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working304:
;libs/main_function.mbas,980 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working299
;libs/main_function.mbas,981 :: 		else
L__Easy_vacuum_95_10_4_simple_working298:
;libs/main_function.mbas,982 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,983 :: 		if k=0 then
	LDS        R16, _k+0
	LDS        R17, _k+1
	CPI        R17, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working554
	CPI        R16, 0
L__Easy_vacuum_95_10_4_simple_working554:
	BREQ       L__Easy_vacuum_95_10_4_simple_working555
	JMP        L__Easy_vacuum_95_10_4_simple_working307
L__Easy_vacuum_95_10_4_simple_working555:
;libs/main_function.mbas,984 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") ''delay_ms(200) '' DDD7_bit =0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
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
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,985 :: 		k=1
	LDI        R27, 1
	STS        _k+0, R27
	LDI        R27, 0
	STS        _k+1, R27
L__Easy_vacuum_95_10_4_simple_working307:
;libs/main_function.mbas,987 :: 		end if
L__Easy_vacuum_95_10_4_simple_working299:
;libs/main_function.mbas,988 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working293
L__Easy_vacuum_95_10_4_simple_working294:
;libs/main_function.mbas,992 :: 		if (Interupt_en=1) then
	LDI        R27, 1
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working556
	JMP        L__Easy_vacuum_95_10_4_simple_working310
L__Easy_vacuum_95_10_4_simple_working556:
;libs/main_function.mbas,1003 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,1059 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,1063 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
	LDI        R27, #lo_addr(_Start_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_Start_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_Start_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_Start_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_Start_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_Start_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Start_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Start_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_Start_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_Start_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;libs/main_function.mbas,1069 :: 		target_sec=0 target_min=0 target_hr=0
	LDI        R27, 0
	STS        _target_sec+0, R27
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_hr+0, R27
;libs/main_function.mbas,1070 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1071 :: 		Start_seconds=seconds Start_minutes=minutes Start_hours=hours
	LDS        R16, _seconds+0
	STS        _Start_seconds+0, R16
	LDS        R16, _minutes+0
	STS        _Start_minutes+0, R16
	LDS        R16, _hours+0
	STS        _Start_hours+0, R16
;libs/main_function.mbas,1072 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1073 :: 		DS1307(hours, minutes, seconds) 'seconds=target_sec minutes=target_min hours=target_hr
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _seconds+0
	LDS        R3, _minutes+0
	LDS        R2, _hours+0
	CALL       _DS1307+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1078 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,1079 :: 		if (auto_setting_enable=1)then  '''making unlimit time for auto setting
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working557
	JMP        L__Easy_vacuum_95_10_4_simple_working313
L__Easy_vacuum_95_10_4_simple_working557:
;libs/main_function.mbas,1080 :: 		for  Pwm_chanel_main=Heater_pwm_num to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__Easy_vacuum_95_10_4_simple_working316:
;libs/main_function.mbas,1081 :: 		for  Heater_motor_index=1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L__Easy_vacuum_95_10_4_simple_working321:
;libs/main_function.mbas,1082 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=60
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LDI        R27, 60
	ST         Z, R27
;libs/main_function.mbas,1083 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=60
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LDI        R27, 60
	ST         Z, R27
;libs/main_function.mbas,1084 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]=1
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 1
	ST         Z, R27
;libs/main_function.mbas,1085 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L__Easy_vacuum_95_10_4_simple_working558
	JMP        L__Easy_vacuum_95_10_4_simple_working324
L__Easy_vacuum_95_10_4_simple_working558:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working321
L__Easy_vacuum_95_10_4_simple_working324:
;libs/main_function.mbas,1086 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L__Easy_vacuum_95_10_4_simple_working559
	JMP        L__Easy_vacuum_95_10_4_simple_working319
L__Easy_vacuum_95_10_4_simple_working559:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working316
L__Easy_vacuum_95_10_4_simple_working319:
L__Easy_vacuum_95_10_4_simple_working313:
;libs/main_function.mbas,1089 :: 		Heater_motor_index=2 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,1090 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3], txt_byte_min)
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 244
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/main_function.mbas,1091 :: 		pwm_precnt=StrToInt(txt_byte_min)
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R3, R27
	CALL       _StrToInt+0
;libs/main_function.mbas,1093 :: 		while_state_import=1    while_state_import_main=0   j=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDI        R27, 1
	STS        _j+0, R27
;libs/main_function.mbas,1137 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1138 :: 		Start_seconds=seconds Start_minutes=minutes Start_hours=hours
	LDS        R16, _seconds+0
	STS        _Start_seconds+0, R16
	LDS        R16, _minutes+0
	STS        _Start_minutes+0, R16
	LDS        R16, _hours+0
	STS        _Start_hours+0, R16
;libs/main_function.mbas,1139 :: 		DS1307(hours, minutes, seconds) 'seconds=target_sec minutes=target_min hours=target_hr
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _seconds+0
	LDS        R3, _minutes+0
	LDS        R2, _hours+0
	CALL       _DS1307+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1140 :: 		target_sec=0 target_min=0 target_hr=0
	LDI        R27, 0
	STS        _target_sec+0, R27
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_hr+0, R27
;libs/main_function.mbas,1141 :: 		oldstate_3 =0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,1144 :: 		ht_start_min=target_sec
	LDI        R27, 0
	STS        _ht_start_min+0, R27
;libs/main_function.mbas,1145 :: 		j=0  Heater_motor_index=2   ht_start_sec=0 ht_start_min=0  ''sec_n1[0]=0 sec_n1[1]=0
	LDI        R27, 0
	STS        _j+0, R27
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 0
	STS        _ht_start_sec+0, R27
	LDI        R27, 0
	STS        _ht_start_min+0, R27
;libs/main_function.mbas,1146 :: 		Heater_relay_Pin =0  oldstate_3 = 0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,1147 :: 		while_state_import=1    while_state_import_main=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,1148 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_working326:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working327
;libs/main_function.mbas,1173 :: 		if (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]= target_min ) and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]<= (target_sec)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _target_min+0
	CP         R19, R18
	LDI        R22, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working560
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working560:
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _target_sec+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working561
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working561:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple_working562
	JMP        L__Easy_vacuum_95_10_4_simple_working334
L__Easy_vacuum_95_10_4_simple_working562:
;libs/main_function.mbas,1174 :: 		if  (target_min<>0) and (target_sec<>0) then
	LDS        R16, _target_min+0
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working563
	LDI        R17, 255
L__Easy_vacuum_95_10_4_simple_working563:
	LDS        R16, _target_sec+0
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working564
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working564:
	MOV        R16, R27
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working565
	JMP        L__Easy_vacuum_95_10_4_simple_working337
L__Easy_vacuum_95_10_4_simple_working565:
;libs/main_function.mbas,1175 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,1176 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1177 :: 		DS1307(hours, minutes, seconds) 'seconds=target_sec minutes=target_min hours=target_hr
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _seconds+0
	LDS        R3, _minutes+0
	LDS        R2, _hours+0
	CALL       _DS1307+0
;libs/main_function.mbas,1178 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working337:
;libs/main_function.mbas,1179 :: 		end if
L__Easy_vacuum_95_10_4_simple_working334:
;libs/main_function.mbas,1181 :: 		if (while_state_import<>0)and ((auto_setting_enable=1))  or (((Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]> target_min ) or    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= target_sec))) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R27, _while_state_import+0
	BST        R27, BitPos(_while_state_import+0)
	BLD        R25, 0
	LDI        R27, 1
	CP         R4, R27
	LDI        R17, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working566
	LDI        R17, 255
L__Easy_vacuum_95_10_4_simple_working566:
	CLR        R16
	SBRC       R25, 0
	INC        R16
	AND        R16, R17
	STD        Y+29, R16
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _target_min+0
	CP         R18, R19
	LDI        R22, 0
	BRSH       L__Easy_vacuum_95_10_4_simple_working567
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working567:
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _target_sec+0
	CP         R17, R16
	LDI        R16, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working568
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working568:
	MOV        R17, R22
	OR         R17, R16
	LDD        R16, Y+29
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working569
	JMP        L__Easy_vacuum_95_10_4_simple_working340
L__Easy_vacuum_95_10_4_simple_working569:
;libs/main_function.mbas,1185 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1186 :: 		DS1307(hours, minutes, seconds) 'seconds=target_sec minutes=target_min hours=target_hr
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _seconds+0
	LDS        R3, _minutes+0
	LDS        R2, _hours+0
	CALL       _DS1307+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1188 :: 		ht_start_sec=target_sec
	LDS        R17, _target_sec+0
	STS        _ht_start_sec+0, R17
;libs/main_function.mbas,1201 :: 		if (target_sec<>ht_start_min )  then
	LDS        R16, _ht_start_min+0
	CP         R17, R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working570
	JMP        L__Easy_vacuum_95_10_4_simple_working343
L__Easy_vacuum_95_10_4_simple_working570:
;libs/main_function.mbas,1203 :: 		ht_start_min=target_sec
	LDS        R16, _target_sec+0
	STS        _ht_start_min+0, R16
;libs/main_function.mbas,1204 :: 		Show_message_done("Heater",chanel)
	MOVW       R30, R28
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
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working343:
;libs/main_function.mbas,1208 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working571
	JMP        L__Easy_vacuum_95_10_4_simple_working346
L__Easy_vacuum_95_10_4_simple_working571:
;libs/main_function.mbas,1209 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1210 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working346:
;libs/main_function.mbas,1214 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 0)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working572
	JMP        L__Easy_vacuum_95_10_4_simple_working349
L__Easy_vacuum_95_10_4_simple_working572:
;libs/main_function.mbas,1215 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working349:
;libs/main_function.mbas,1219 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 1)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working573
	JMP        L__Easy_vacuum_95_10_4_simple_working352
L__Easy_vacuum_95_10_4_simple_working573:
;libs/main_function.mbas,1221 :: 		while_state_import=0                    ' Update flag
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,1222 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,1224 :: 		delay_ms(200)
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Easy_vacuum_95_10_4_simple_working354:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working354
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working354
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working354
;libs/main_function.mbas,1225 :: 		PWM_MAKE (Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Motor_pwm_num-1][3],255,Motor_pwm_num)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1226 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,1230 :: 		Buzzer_on_off(1)
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L__Easy_vacuum_95_10_4_simple_working352:
;libs/main_function.mbas,1234 :: 		Heater_relay_on()
	CALL       libs/main_function_Heater_relay_on+0
;libs/main_function.mbas,1239 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working574
	JMP        L__Easy_vacuum_95_10_4_simple_working357
L__Easy_vacuum_95_10_4_simple_working574:
;libs/main_function.mbas,1240 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 1)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working575
	JMP        L__Easy_vacuum_95_10_4_simple_working360
L__Easy_vacuum_95_10_4_simple_working575:
;libs/main_function.mbas,1241 :: 		oldstate_3 = 1 while_state_import=0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,1242 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1245 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,1247 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=target_min
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _target_min+0
	ST         Z, R16
;libs/main_function.mbas,1248 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=target_sec
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _target_sec+0
	ST         Z, R16
;libs/main_function.mbas,1249 :: 		Buzzer_on_off(1)
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L__Easy_vacuum_95_10_4_simple_working360:
;libs/main_function.mbas,1251 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working358
;libs/main_function.mbas,1258 :: 		else
L__Easy_vacuum_95_10_4_simple_working357:
;libs/main_function.mbas,1259 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) and (j=2) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R17, _j+0
	CPI        R17, 2
	LDI        R27, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working576
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working576:
	MOV        R17, R27
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working577
	JMP        L__Easy_vacuum_95_10_4_simple_working363
L__Easy_vacuum_95_10_4_simple_working577:
;libs/main_function.mbas,1260 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,1261 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1263 :: 		Buzzer_on_off(1)
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L__Easy_vacuum_95_10_4_simple_working363:
;libs/main_function.mbas,1265 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working578
	JMP        L__Easy_vacuum_95_10_4_simple_working366
L__Easy_vacuum_95_10_4_simple_working578:
;libs/main_function.mbas,1266 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,1267 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1268 :: 		Heater_relay_Pin =0  ''Saving_Mot_heater_On_mSec(auto_setting_enable)
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_working366:
;libs/main_function.mbas,1270 :: 		end if
L__Easy_vacuum_95_10_4_simple_working358:
	JMP        L__Easy_vacuum_95_10_4_simple_working341
;libs/main_function.mbas,1276 :: 		else
L__Easy_vacuum_95_10_4_simple_working340:
;libs/main_function.mbas,1279 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,1280 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1281 :: 		DS1307(hours, minutes, seconds) 'seconds=target_sec minutes=target_min hours=target_hr
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _seconds+0
	LDS        R3, _minutes+0
	LDS        R2, _hours+0
	CALL       _DS1307+0
;libs/main_function.mbas,1282 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,1283 :: 		Show_message_done("Heater",chanel) ''delay_ms(100)
	MOVW       R30, R28
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
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
;libs/main_function.mbas,1284 :: 		Lcd_0()  ''Saving_Mot_heater_On_mSec()
	CALL       _Lcd_0+0
;libs/main_function.mbas,1285 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,1286 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1287 :: 		if j=1 then Lcd_Out(2,1,"Heater off") Lcd_Out(2,10,txt) delay_ms(300)  end if
	LDS        R16, _j+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4_simple_working579
	JMP        L__Easy_vacuum_95_10_4_simple_working369
L__Easy_vacuum_95_10_4_simple_working579:
	MOVW       R30, R28
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 25
	LDI        R17, 90
	LDI        R16, 178
L__Easy_vacuum_95_10_4_simple_working371:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working371
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working371
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working371
	NOP
	NOP
L__Easy_vacuum_95_10_4_simple_working369:
;libs/main_function.mbas,1288 :: 		if j=0 then Lcd_Out(2,1,"Heater Error") Lcd_Out(2,10,txt) delay_ms(300)  end if
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working580
	JMP        L__Easy_vacuum_95_10_4_simple_working374
L__Easy_vacuum_95_10_4_simple_working580:
	MOVW       R30, R28
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 25
	LDI        R17, 90
	LDI        R16, 178
L__Easy_vacuum_95_10_4_simple_working376:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working376
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working376
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working376
	NOP
	NOP
L__Easy_vacuum_95_10_4_simple_working374:
;libs/main_function.mbas,1289 :: 		Lcd_Out(1,1,"Off pwm heater mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 104
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1290 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,1291 :: 		end if
L__Easy_vacuum_95_10_4_simple_working341:
;libs/main_function.mbas,1295 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working326
L__Easy_vacuum_95_10_4_simple_working327:
;libs/main_function.mbas,1298 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working310:
;libs/main_function.mbas,1304 :: 		Heater_motor_index=2 ''as Motor
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
;libs/main_function.mbas,1305 :: 		Pwm_chanel_main=Motor_pwm_num ''Motor
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,1306 :: 		while_state_import=1 Pwm_chanel=Pwm_chanel_main ''while_state_import_main2=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel+0, R27
;libs/main_function.mbas,1308 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,1309 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
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
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 87
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
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Easy_vacuum_95_10_4_simple_working378:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working378
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working378
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working378
;libs/main_function.mbas,1310 :: 		if (oldstate_3=1) then
	LDS        R27, _oldstate_3+0
	SBRS       R27, BitPos(_oldstate_3+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working381
;libs/main_function.mbas,1311 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working581
	JMP        L__Easy_vacuum_95_10_4_simple_working384
L__Easy_vacuum_95_10_4_simple_working581:
;libs/main_function.mbas,1312 :: 		while_state_import_main=1 oldstate_3=0
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	JMP        L__Easy_vacuum_95_10_4_simple_working385
;libs/main_function.mbas,1313 :: 		else
L__Easy_vacuum_95_10_4_simple_working384:
;libs/main_function.mbas,1314 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,1315 :: 		end if
L__Easy_vacuum_95_10_4_simple_working385:
L__Easy_vacuum_95_10_4_simple_working381:
;libs/main_function.mbas,1334 :: 		k=0
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;libs/main_function.mbas,1335 :: 		while  (while_state_import_main )
L__Easy_vacuum_95_10_4_simple_working387:
	LDS        R27, _while_state_import_main+0
	SBRS       R27, BitPos(_while_state_import_main+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working388
;libs/main_function.mbas,1336 :: 		if ( Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working582
	JMP        L__Easy_vacuum_95_10_4_simple_working392
L__Easy_vacuum_95_10_4_simple_working582:
;libs/main_function.mbas,1337 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L__Easy_vacuum_95_10_4_simple_working392:
;libs/main_function.mbas,1339 :: 		if k=0 then
	LDS        R16, _k+0
	LDS        R17, _k+1
	CPI        R17, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working583
	CPI        R16, 0
L__Easy_vacuum_95_10_4_simple_working583:
	BREQ       L__Easy_vacuum_95_10_4_simple_working584
	JMP        L__Easy_vacuum_95_10_4_simple_working395
L__Easy_vacuum_95_10_4_simple_working584:
;libs/main_function.mbas,1340 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!")'' delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1341 :: 		k=1
	LDI        R27, 1
	STS        _k+0, R27
	LDI        R27, 0
	STS        _k+1, R27
L__Easy_vacuum_95_10_4_simple_working395:
;libs/main_function.mbas,1343 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working387
L__Easy_vacuum_95_10_4_simple_working388:
;libs/main_function.mbas,1344 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,1385 :: 		while_state_import=1  j=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 0
	STS        _j+0, R27
;libs/main_function.mbas,1386 :: 		target_sec=0 target_min=0 target_hr=0
	LDI        R27, 0
	STS        _target_sec+0, R27
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_hr+0, R27
;libs/main_function.mbas,1392 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_4_simple_working398:
;libs/main_function.mbas,1396 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1397 :: 		Start_seconds=seconds Start_minutes=minutes Start_hours=hours
	LDS        R16, _seconds+0
	STS        _Start_seconds+0, R16
	LDS        R16, _minutes+0
	STS        _Start_minutes+0, R16
	LDS        R16, _hours+0
	STS        _Start_hours+0, R16
;libs/main_function.mbas,1398 :: 		target_sec=1 target_min=0 target_hr=0
	LDI        R27, 1
	STS        _target_sec+0, R27
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_hr+0, R27
;libs/main_function.mbas,1400 :: 		ht_start_min=target_sec
	LDI        R27, 1
	STS        _ht_start_min+0, R27
;libs/main_function.mbas,1401 :: 		while_state_import=1  k=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;libs/main_function.mbas,1402 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_working406:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working407
;libs/main_function.mbas,1404 :: 		if (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]= target_min ) and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]<= (target_sec)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _target_min+0
	CP         R19, R18
	LDI        R22, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working585
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working585:
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _target_sec+0
	CP         R16, R17
	LDI        R27, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working586
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working586:
	MOV        R16, R27
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple_working587
	JMP        L__Easy_vacuum_95_10_4_simple_working411
L__Easy_vacuum_95_10_4_simple_working587:
;libs/main_function.mbas,1406 :: 		if (j=2) then    ' Detect logical one up key
	LDS        R16, _j+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple_working588
	JMP        L__Easy_vacuum_95_10_4_simple_working414
L__Easy_vacuum_95_10_4_simple_working588:
;libs/main_function.mbas,1407 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,1409 :: 		Show_message_done("Motor",chanel) delay_ms(200)
	MOVW       R30, R28
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
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Easy_vacuum_95_10_4_simple_working416:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working416
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working416
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working416
;libs/main_function.mbas,1410 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,1411 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,1412 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Easy_vacuum_95_10_4_simple_working418:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working418
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working418
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working418
;libs/main_function.mbas,1413 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
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
;libs/main_function.mbas,1414 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1416 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L__Easy_vacuum_95_10_4_simple_working415
;libs/main_function.mbas,1417 :: 		else
L__Easy_vacuum_95_10_4_simple_working414:
;libs/main_function.mbas,1418 :: 		if k=0 then
	LDS        R16, _k+0
	LDS        R17, _k+1
	CPI        R17, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working589
	CPI        R16, 0
L__Easy_vacuum_95_10_4_simple_working589:
	BREQ       L__Easy_vacuum_95_10_4_simple_working590
	JMP        L__Easy_vacuum_95_10_4_simple_working421
L__Easy_vacuum_95_10_4_simple_working590:
;libs/main_function.mbas,1419 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!")'' delay_ms(300)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
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
	MOVW       R30, R28
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1420 :: 		k=1
	LDI        R27, 1
	STS        _k+0, R27
	LDI        R27, 0
	STS        _k+1, R27
L__Easy_vacuum_95_10_4_simple_working421:
;libs/main_function.mbas,1422 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0))   then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working591
	JMP        L__Easy_vacuum_95_10_4_simple_working424
L__Easy_vacuum_95_10_4_simple_working591:
;libs/main_function.mbas,1423 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working424:
;libs/main_function.mbas,1425 :: 		end if
L__Easy_vacuum_95_10_4_simple_working415:
;libs/main_function.mbas,1427 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1428 :: 		Start_seconds=seconds Start_minutes=minutes Start_hours=hours
	LDS        R16, _seconds+0
	STS        _Start_seconds+0, R16
	LDS        R16, _minutes+0
	STS        _Start_minutes+0, R16
	LDS        R16, _hours+0
	STS        _Start_hours+0, R16
;libs/main_function.mbas,1429 :: 		target_sec=1 target_min=0 target_hr=0
	LDI        R27, 1
	STS        _target_sec+0, R27
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_hr+0, R27
L__Easy_vacuum_95_10_4_simple_working411:
;libs/main_function.mbas,1437 :: 		if (while_state_import<>0)and ((auto_setting_enable=1)) or (((Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]> target_min ) or    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= target_sec))) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R27, _while_state_import+0
	BST        R27, BitPos(_while_state_import+0)
	BLD        R25, 0
	LDI        R27, 1
	CP         R4, R27
	LDI        R17, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working592
	LDI        R17, 255
L__Easy_vacuum_95_10_4_simple_working592:
	CLR        R16
	SBRC       R25, 0
	INC        R16
	AND        R16, R17
	STD        Y+29, R16
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+27, R16
	STD        Y+28, R17
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	MOVW       R20, R16
	ADD        R20, R18
	ADC        R21, R19
	LDS        R18, _Pwm_chanel_main+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 1
	LD         R19, Z
	LDS        R18, _target_min+0
	CP         R18, R19
	LDI        R22, 0
	BRSH       L__Easy_vacuum_95_10_4_simple_working593
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working593:
	LDI        R20, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R21, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R18, Y+27
	LDD        R19, Y+28
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z
	LDS        R16, _target_sec+0
	CP         R17, R16
	LDI        R16, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working594
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working594:
	MOV        R17, R22
	OR         R17, R16
	LDD        R16, Y+29
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working595
	JMP        L__Easy_vacuum_95_10_4_simple_working427
L__Easy_vacuum_95_10_4_simple_working595:
;libs/main_function.mbas,1447 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,1449 :: 		DS1307(hours, minutes, seconds) 'seconds=target_sec minutes=target_min hours=target_hr
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _seconds+0
	LDS        R3, _minutes+0
	LDS        R2, _hours+0
	CALL       _DS1307+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1451 :: 		ht_start_sec=target_sec
	LDS        R17, _target_sec+0
	STS        _ht_start_sec+0, R17
;libs/main_function.mbas,1452 :: 		if (target_sec<>ht_start_min ) then
	LDS        R16, _ht_start_min+0
	CP         R17, R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working596
	JMP        L__Easy_vacuum_95_10_4_simple_working430
L__Easy_vacuum_95_10_4_simple_working596:
;libs/main_function.mbas,1467 :: 		ht_start_min=target_sec
	LDS        R16, _target_sec+0
	STS        _ht_start_min+0, R16
;libs/main_function.mbas,1468 :: 		Show_message_done("Motor",chanel)
	MOVW       R30, R28
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
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _chanel+0
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working430:
;libs/main_function.mbas,1471 :: 		pwm_precnt=integer ( ceil(Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]/10))
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	LDI        R17, 0
	MOV        R18, R17
	MOV        R19, R17
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
;libs/main_function.mbas,1472 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working597
	JMP        L__Easy_vacuum_95_10_4_simple_working433
L__Easy_vacuum_95_10_4_simple_working597:
;libs/main_function.mbas,1477 :: 		PWM_MAKE (Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LD         R16, Z
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1478 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working433:
;libs/main_function.mbas,1480 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working598
	JMP        L__Easy_vacuum_95_10_4_simple_working436
L__Easy_vacuum_95_10_4_simple_working598:
;libs/main_function.mbas,1481 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working436:
;libs/main_function.mbas,1494 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working599
	JMP        L__Easy_vacuum_95_10_4_simple_working439
L__Easy_vacuum_95_10_4_simple_working599:
;libs/main_function.mbas,1496 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 1) and (seconds >=3)) then    ' Detect logical one up key
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R17, _seconds+0
	CPI        R17, 3
	LDI        R27, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working600
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working600:
	MOV        R17, R27
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working601
	JMP        L__Easy_vacuum_95_10_4_simple_working442
L__Easy_vacuum_95_10_4_simple_working601:
;libs/main_function.mbas,1497 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,1498 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1500 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=minutes
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _minutes+0
	ST         Z, R16
;libs/main_function.mbas,1501 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=seconds
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _Heater_motor_index+0
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
	LDS        R16, _Pwm_chanel_main+0
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
	LDS        R16, _seconds+0
	ST         Z, R16
;libs/main_function.mbas,1502 :: 		Buzzer_on_off(1)
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
L__Easy_vacuum_95_10_4_simple_working442:
;libs/main_function.mbas,1503 :: 		end if
L__Easy_vacuum_95_10_4_simple_working439:
;libs/main_function.mbas,1505 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working428
;libs/main_function.mbas,1507 :: 		else
L__Easy_vacuum_95_10_4_simple_working427:
;libs/main_function.mbas,1509 :: 		if (j=2) then    ' Detect logical one up key
	LDS        R16, _j+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple_working602
	JMP        L__Easy_vacuum_95_10_4_simple_working445
L__Easy_vacuum_95_10_4_simple_working602:
;libs/main_function.mbas,1510 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,1513 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,1514 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,1515 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Easy_vacuum_95_10_4_simple_working447:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working447
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working447
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working447
;libs/main_function.mbas,1516 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
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
;libs/main_function.mbas,1517 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1519 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L__Easy_vacuum_95_10_4_simple_working446
;libs/main_function.mbas,1520 :: 		else
L__Easy_vacuum_95_10_4_simple_working445:
;libs/main_function.mbas,1522 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!") delay_ms(500)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
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
	MOVW       R30, R28
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
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
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__Easy_vacuum_95_10_4_simple_working449:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working449
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working449
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working449
;libs/main_function.mbas,1523 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0))   then
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working603
	JMP        L__Easy_vacuum_95_10_4_simple_working452
L__Easy_vacuum_95_10_4_simple_working603:
;libs/main_function.mbas,1524 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working452:
;libs/main_function.mbas,1526 :: 		end if
L__Easy_vacuum_95_10_4_simple_working446:
;libs/main_function.mbas,1528 :: 		end if
L__Easy_vacuum_95_10_4_simple_working428:
;libs/main_function.mbas,1529 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working406
L__Easy_vacuum_95_10_4_simple_working407:
;libs/main_function.mbas,1534 :: 		end if
L__Easy_vacuum_95_10_4_simple_working404:
;libs/main_function.mbas,1535 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4_simple_working604
	JMP        L__Easy_vacuum_95_10_4_simple_working401
L__Easy_vacuum_95_10_4_simple_working604:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working398
L__Easy_vacuum_95_10_4_simple_working401:
;libs/main_function.mbas,1539 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,1541 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,1563 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_working:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	ADIW       R28, 29
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Easy_vacuum_95_10_4_simple_working

_libs/main_function_?main:

;libs/main_function.mbas,1565 :: 		end.
L_end_libs/main_function_?main:
	RET
; end of _libs/main_function_?main
