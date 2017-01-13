
_Key_Port_Init_mainfunc:

;libs/main_function.mbas,96 :: 		sub procedure Key_Port_Init_mainfunc()
;libs/main_function.mbas,107 :: 		DDB4_bit = 0 DDB2_bit = 0  DDB0_bit = 0  DDB1_bit = 0              ' Set PORTE pin 7 as input pin for the Heater switches
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
;libs/main_function.mbas,108 :: 		DDD2_bit = 0 DDD3_bit = 0
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
;libs/main_function.mbas,110 :: 		DDD6_bit = 1
	IN         R27, DDD6_bit+0
	SBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;libs/main_function.mbas,112 :: 		end sub
L_end_Key_Port_Init_mainfunc:
	RET
; end of _Key_Port_Init_mainfunc

_Buzzer_on_off:

;libs/main_function.mbas,114 :: 		sub procedure Buzzer_on_off(dim on_ as byte)
;libs/main_function.mbas,115 :: 		if On_=1 then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 1
	CP         R2, R27
	BREQ       L__Buzzer_on_off233
	JMP        L__Buzzer_on_off3
L__Buzzer_on_off233:
;libs/main_function.mbas,116 :: 		PWM_MAKE (100,255,3)delay_ms(300)PWM_MAKE (0,255,3)
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Buzzer_on_off5:
	DEC        R16
	BRNE       L__Buzzer_on_off5
	DEC        R17
	BRNE       L__Buzzer_on_off5
	DEC        R18
	BRNE       L__Buzzer_on_off5
	NOP
	NOP
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	JMP        L__Buzzer_on_off4
;libs/main_function.mbas,117 :: 		else
L__Buzzer_on_off3:
;libs/main_function.mbas,118 :: 		PWM_MAKE (0,255,3)delay_ms(300)PWM_MAKE (100,255,3)
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Buzzer_on_off7:
	DEC        R16
	BRNE       L__Buzzer_on_off7
	DEC        R17
	BRNE       L__Buzzer_on_off7
	DEC        R18
	BRNE       L__Buzzer_on_off7
	NOP
	NOP
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,119 :: 		end if
L__Buzzer_on_off4:
;libs/main_function.mbas,121 :: 		end sub
L_end_Buzzer_on_off:
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _Buzzer_on_off

libs/main_function_Show_message_done:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 13
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,123 :: 		dim mi,se as byte
;libs/main_function.mbas,126 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
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
;libs/main_function.mbas,127 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
;libs/main_function.mbas,128 :: 		Lcd_0()Lcd_Out(1,1,ht_or_mot) Lcd_Out(1,6," On thakes :") Lcd_Out(2,1,"Min:") Lcd_Out(2,8,",sec:")
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 101
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
	MOVW       R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 44
	ST         Z+, R27
	LDI        R27, 115
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
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,131 :: 		Start_seconds_next  =  ((Start_seconds_next and 0xF0) >> 4)*10 + (Start_seconds_next and 0x0F)
	LDS        R16, _Start_seconds_next+0
	LDS        R17, _Start_seconds_next+1
	ANDI       R16, 240
	ANDI       R17, 0
	LDI        R27, 4
L_libs/main_function_Show_message_done235:
	ASR        R17
	ROR        R16
	DEC        R27
	BRNE       L_libs/main_function_Show_message_done235
L_libs/main_function_Show_message_done236:
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
;libs/main_function.mbas,132 :: 		Start_minutes_next  =  ((Start_minutes_next and 0xF0) >> 4)*10 + (Start_minutes_next and 0x0F)
	LDS        R16, _Start_minutes_next+0
	LDS        R17, _Start_minutes_next+1
	ANDI       R16, 240
	ANDI       R17, 0
	LDI        R27, 4
L_libs/main_function_Show_message_done237:
	ASR        R17
	ROR        R16
	DEC        R27
	BRNE       L_libs/main_function_Show_message_done237
L_libs/main_function_Show_message_done238:
	LDI        R20, 10
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDS        R18, _Start_minutes_next+0
	LDS        R19, _Start_minutes_next+1
	ANDI       R18, 15
	ANDI       R19, 0
	ADD        R18, R16
	ADC        R19, R17
	STS        _Start_minutes_next+0, R18
	STS        _Start_minutes_next+1, R19
;libs/main_function.mbas,133 :: 		mi=Start_minutes_next se=Start_seconds_next
; mi start address is: 17 (R17)
	MOV        R17, R18
; se start address is: 21 (R21)
	LDS        R21, _Start_seconds_next+0
;libs/main_function.mbas,134 :: 		Lcd_Chr(2, 5, (mi div 10) + 48)
	LDI        R20, 10
	MOV        R16, R18
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	PUSH       R21
	PUSH       R17
	MOV        R4, R16
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R17
;libs/main_function.mbas,135 :: 		Lcd_Chr(2,6, (mi mod 10) + 48)
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
	POP        R21
;libs/main_function.mbas,136 :: 		Lcd_Chr(2,12, (se div 10) + 48)
	LDI        R20, 10
	MOV        R16, R21
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	PUSH       R21
	MOV        R4, R16
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R21
;libs/main_function.mbas,137 :: 		Lcd_Chr(2,13, (se mod 10) + 48)
	LDI        R20, 10
	MOV        R16, R21
	CALL       _Div_8x8_U+0
	MOV        R16, R25
; se end address is: 21 (R21)
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;libs/main_function.mbas,139 :: 		end sub
L_end_Show_message_done:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 12
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Show_message_done

libs/main_function_Heater_relay_on:

;libs/main_function.mbas,140 :: 		sub procedure Heater_relay_on()
;libs/main_function.mbas,141 :: 		if (while_state_import_main=0) then
	LDS        R27, _while_state_import_main+0
	SBRC       R27, BitPos(_while_state_import_main+0)
	JMP        L_libs/main_function_Heater_relay_on12
;libs/main_function.mbas,142 :: 		Heater_relay_Pin =1
	IN         R27, PIND6_bit+0
	SBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,143 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L_libs/main_function_Heater_relay_on12:
;libs/main_function.mbas,146 :: 		end sub
L_end_Heater_relay_on:
	RET
; end of libs/main_function_Heater_relay_on

libs/main_function_Saving_Mot_heater_On_mSec:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 12
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,149 :: 		dim Heater_motor_index_1 as byte
;libs/main_function.mbas,151 :: 		if auto_setting_enable=1 then
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	CP         R2, R27
	BREQ       L_libs/main_function_Saving_Mot_heater_On_mSec241
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec16
L_libs/main_function_Saving_Mot_heater_On_mSec241:
;libs/main_function.mbas,152 :: 		for  Heater_motor_index_1=1 to 2
; Heater_motor_index_1 start address is: 21 (R21)
	LDI        R21, 1
; Heater_motor_index_1 end address is: 21 (R21)
L_libs/main_function_Saving_Mot_heater_On_mSec19:
;libs/main_function.mbas,153 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index_1-1][Pwm_chanel_main-1][1]= minutes
; Heater_motor_index_1 start address is: 21 (R21)
	LDS        R16, _chanel+0
	SUBI       R16, 1
	PUSH       R21
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	POP        R21
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R21
	SUBI       R20, 1
	STD        Y+10, R16
	STD        Y+11, R17
	PUSH       R21
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+10
	LDD        R19, Y+11
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
;libs/main_function.mbas,154 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index_1-1][Pwm_chanel_main-1][2]= seconds
	LDS        R16, _chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 24
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	POP        R21
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R21
	SUBI       R20, 1
	STD        Y+10, R16
	STD        Y+11, R17
	PUSH       R21
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	POP        R21
	LDD        R18, Y+10
	LDD        R19, Y+11
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
;libs/main_function.mbas,155 :: 		next Heater_motor_index_1
	CPI        R21, 2
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec242
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec22
L_libs/main_function_Saving_Mot_heater_On_mSec242:
	MOV        R16, R21
	SUBI       R16, 255
	MOV        R21, R16
; Heater_motor_index_1 end address is: 21 (R21)
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec19
L_libs/main_function_Saving_Mot_heater_On_mSec22:
;libs/main_function.mbas,156 :: 		Lcd_0()Lcd_Out(1,1,"Saving") Lcd_Out(2,1,"On EEPROM") delay_ms(200)
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Saving_Mot_heater_On_mSec23:
	DEC        R16
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec23
	DEC        R17
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec23
	DEC        R18
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec23
	NOP
L_libs/main_function_Saving_Mot_heater_On_mSec16:
;libs/main_function.mbas,167 :: 		end sub                                        ' endless loop
L_end_Saving_Mot_heater_On_mSec:
	POP        R5
	POP        R4
	POP        R3
	ADIW       R28, 11
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

;libs/main_function.mbas,168 :: 		sub procedure Easy_vacuum_95_10_4_simple_heater(dim program_number as byte,dim Interupt_en as byte,dim byref Time_on as integer)
;libs/main_function.mbas,171 :: 		Heater_motor_index=0 Pwm_chanel_main=Heater_pwm_num  ''as Heater
	PUSH       R6
	LDI        R27, 0
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,172 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,173 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater27:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater28
;libs/main_function.mbas,174 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater244
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater32
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater244:
;libs/main_function.mbas,175 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater245
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater35
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater245:
;libs/main_function.mbas,176 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater35:
;libs/main_function.mbas,178 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater246
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater38
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater246:
;libs/main_function.mbas,179 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater38:
;libs/main_function.mbas,180 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater33
;libs/main_function.mbas,181 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater32:
;libs/main_function.mbas,182 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,183 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater40:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater40
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater40
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater40
	NOP
;libs/main_function.mbas,184 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater33:
;libs/main_function.mbas,185 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater28:
;libs/main_function.mbas,186 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,188 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,192 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,193 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
;libs/main_function.mbas,194 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,195 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater42:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater42
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater42
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater42
	NOP
;libs/main_function.mbas,196 :: 		Lcd_Out(1,1,"On pwm heater mode")
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
;libs/main_function.mbas,198 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater247
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater45
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater247:
;libs/main_function.mbas,199 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater45:
;libs/main_function.mbas,201 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater248
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater48
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater248:
;libs/main_function.mbas,202 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,203 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater48:
;libs/main_function.mbas,205 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater249
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater51
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater249:
;libs/main_function.mbas,206 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,207 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,208 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,209 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
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
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater53:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater53
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater53
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater53
	NOP
	NOP
;libs/main_function.mbas,210 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
;libs/main_function.mbas,211 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,214 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater51:
;libs/main_function.mbas,216 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater55:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater55
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater55
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater55
	NOP
;libs/main_function.mbas,217 :: 		end sub
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

;libs/main_function.mbas,220 :: 		sub procedure Easy_vacuum_95_10_4_simple_Motor(dim program_number as byte,dim Interupt_en,Time_on as integer)
;libs/main_function.mbas,223 :: 		Heater_motor_index=1 Pwm_chanel_main=Motor_pwm_num  ''as Motor
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,224 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,225 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor59:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor60
;libs/main_function.mbas,226 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R4, R27
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor251
	LDI        R27, 0
	CP         R3, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor251:
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor252
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor64
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor252:
;libs/main_function.mbas,227 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor253
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor67
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor253:
;libs/main_function.mbas,228 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor67:
;libs/main_function.mbas,230 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor254
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor70
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor254:
;libs/main_function.mbas,231 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor70:
;libs/main_function.mbas,233 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor65
;libs/main_function.mbas,234 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor64:
;libs/main_function.mbas,235 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,236 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor72:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor72
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor72
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor72
	NOP
;libs/main_function.mbas,237 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor65:
;libs/main_function.mbas,238 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor59
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor60:
;libs/main_function.mbas,239 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,241 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,242 :: 		Time_on=(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]*60+Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1])*1000
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
;libs/main_function.mbas,243 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,244 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
;libs/main_function.mbas,245 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,246 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor74:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor74
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor74
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor74
	NOP
;libs/main_function.mbas,247 :: 		Lcd_Out(1,1,"On pwm Mtor mode")
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
;libs/main_function.mbas,249 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor255
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor77
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor255:
;libs/main_function.mbas,250 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,251 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,252 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,253 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
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
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor79:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor79
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor79
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor79
	NOP
	NOP
;libs/main_function.mbas,254 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
;libs/main_function.mbas,255 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,257 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor77:
;libs/main_function.mbas,259 :: 		Lcd_0()Lcd_Out(1,1,"End") Lcd_Out(2,1,"...") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor81:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor81
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor81
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor81
	NOP
;libs/main_function.mbas,260 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_Motor:
	ADIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/main_function_Easy_vacuum_95_10_4_simple_Motor

_Easy_vacuum_95_10_4_simple_working:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,265 :: 		dim pwm_precnt as integer
;libs/main_function.mbas,266 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
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
;libs/main_function.mbas,290 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,291 :: 		while  (while_state_import )
L__Easy_vacuum_95_10_4_simple_working85:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working86
;libs/main_function.mbas,298 :: 		if (Interupt_en=0)  then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working257
	JMP        L__Easy_vacuum_95_10_4_simple_working90
L__Easy_vacuum_95_10_4_simple_working257:
;libs/main_function.mbas,299 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working258
	JMP        L__Easy_vacuum_95_10_4_simple_working93
L__Easy_vacuum_95_10_4_simple_working258:
;libs/main_function.mbas,300 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,301 :: 		Interupt_en=1 while_state_import=0 Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working93:
;libs/main_function.mbas,303 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working259
	JMP        L__Easy_vacuum_95_10_4_simple_working96
L__Easy_vacuum_95_10_4_simple_working259:
;libs/main_function.mbas,304 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working96:
;libs/main_function.mbas,305 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working91
;libs/main_function.mbas,306 :: 		else
L__Easy_vacuum_95_10_4_simple_working90:
;libs/main_function.mbas,307 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,308 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working98:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working98
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working98
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working98
	NOP
;libs/main_function.mbas,309 :: 		end if
L__Easy_vacuum_95_10_4_simple_working91:
;libs/main_function.mbas,310 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working85
L__Easy_vacuum_95_10_4_simple_working86:
;libs/main_function.mbas,314 :: 		if (Interupt_en=1) then
	LDI        R27, 1
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working260
	JMP        L__Easy_vacuum_95_10_4_simple_working101
L__Easy_vacuum_95_10_4_simple_working260:
;libs/main_function.mbas,325 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,381 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,385 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,391 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,395 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,396 :: 		if (auto_setting_enable=1)then  '''making unlimit time for auto setting
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working261
	JMP        L__Easy_vacuum_95_10_4_simple_working104
L__Easy_vacuum_95_10_4_simple_working261:
;libs/main_function.mbas,397 :: 		for  Pwm_chanel_main=Heater_pwm_num to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__Easy_vacuum_95_10_4_simple_working107:
;libs/main_function.mbas,398 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=60
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
;libs/main_function.mbas,399 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=60
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
;libs/main_function.mbas,400 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]=1
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
;libs/main_function.mbas,401 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L__Easy_vacuum_95_10_4_simple_working262
	JMP        L__Easy_vacuum_95_10_4_simple_working110
L__Easy_vacuum_95_10_4_simple_working262:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working107
L__Easy_vacuum_95_10_4_simple_working110:
L__Easy_vacuum_95_10_4_simple_working104:
;libs/main_function.mbas,403 :: 		Heater_motor_index=2 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,404 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3], txt_byte_min)
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
;libs/main_function.mbas,405 :: 		pwm_precnt=StrToInt(txt_byte_min)
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R3, R27
	CALL       _StrToInt+0
	POP        R2
	POP        R3
	POP        R4
; pwm_precnt start address is: 25 (R25)
	MOV        R25, R16
	MOV        R26, R17
;libs/main_function.mbas,407 :: 		while_state_import=1    while_state_import_main=0   j=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDI        R27, 1
	STS        _j+0, R27
;libs/main_function.mbas,411 :: 		if (auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds)  and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working263
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working263:
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
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R20, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working264
	LDI        R20, 255
L__Easy_vacuum_95_10_4_simple_working264:
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+0)
	LDD        R21, Y+27
	LDD        R22, Y+28
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working265
	LDI        R18, 255
L__Easy_vacuum_95_10_4_simple_working265:
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
	BREQ       L__Easy_vacuum_95_10_4_simple_working266
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working266:
	MOV        R16, R27
	MOV        R17, R20
	AND        R17, R16
	LDD        R16, Y+29
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working267
	JMP        L__Easy_vacuum_95_10_4_simple_working115
L__Easy_vacuum_95_10_4_simple_working267:
;libs/main_function.mbas,416 :: 		inttostr(pwm_precnt,txt)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R25
	MOV        R3, R26
; pwm_precnt end address is: 25 (R25)
	CALL       _IntToStr+0
;libs/main_function.mbas,417 :: 		inttostr(minutes,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _minutes+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,418 :: 		Lcd_Out(2,1,txt) Lcd_Out(1,1,"1 chcked:") delay_ms(500)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
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
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_4_simple_working117:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working117
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working117
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working117
	NOP
;libs/main_function.mbas,419 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working268
	JMP        L__Easy_vacuum_95_10_4_simple_working120
L__Easy_vacuum_95_10_4_simple_working268:
;libs/main_function.mbas,420 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 12
	LDI        R17, 0
	LDS        R20, _Heater_motor_index+0
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
;libs/main_function.mbas,421 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working120:
;libs/main_function.mbas,424 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple_working122:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working122
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working122
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working122
;libs/main_function.mbas,425 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working269
	JMP        L__Easy_vacuum_95_10_4_simple_working125
L__Easy_vacuum_95_10_4_simple_working269:
;libs/main_function.mbas,426 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0   while_state_import=0                 ' Update flag
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
L__Easy_vacuum_95_10_4_simple_working125:
;libs/main_function.mbas,429 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working270
	JMP        L__Easy_vacuum_95_10_4_simple_working128
L__Easy_vacuum_95_10_4_simple_working270:
;libs/main_function.mbas,430 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,431 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,432 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_working128:
;libs/main_function.mbas,433 :: 		end if
L__Easy_vacuum_95_10_4_simple_working115:
;libs/main_function.mbas,437 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,444 :: 		Write_Time(hours, 0x00, 0x00, day, week,   month,year)
	LDS        R8, _year+0
	LDS        R7, _month+0
	LDS        R6, _week+0
	LDS        R5, _day+0
	CLR        R4
	CLR        R3
	LDS        R2, _hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,445 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,446 :: 		oldstate_3 =0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,449 :: 		j=0  Heater_motor_index=2
	LDI        R27, 0
	STS        _j+0, R27
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
;libs/main_function.mbas,450 :: 		Heater_relay_Pin =0  oldstate_3 = 0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,451 :: 		while_state_import=1    while_state_import_main=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,452 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_working131:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working132
;libs/main_function.mbas,455 :: 		if (auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working271
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working271:
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
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R22, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working272
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working272:
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
	LDS        R16, _seconds+0
	CP         R17, R16
	LDI        R16, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working273
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working273:
	MOV        R17, R22
	AND        R17, R16
	LDD        R16, Y+29
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working274
	JMP        L__Easy_vacuum_95_10_4_simple_working139
L__Easy_vacuum_95_10_4_simple_working274:
;libs/main_function.mbas,457 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
;libs/main_function.mbas,458 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,459 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working141:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working141
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working141
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working141
	NOP
;libs/main_function.mbas,460 :: 		Show_message_done("Heater") delay_ms(300)
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
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_working143:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working143
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working143
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working143
	NOP
	NOP
;libs/main_function.mbas,463 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working275
	JMP        L__Easy_vacuum_95_10_4_simple_working146
L__Easy_vacuum_95_10_4_simple_working275:
;libs/main_function.mbas,464 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,465 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working146:
;libs/main_function.mbas,471 :: 		Heater_relay_on()
	CALL       libs/main_function_Heater_relay_on+0
;libs/main_function.mbas,476 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working276
	JMP        L__Easy_vacuum_95_10_4_simple_working149
L__Easy_vacuum_95_10_4_simple_working276:
;libs/main_function.mbas,477 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 1)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working277
	JMP        L__Easy_vacuum_95_10_4_simple_working152
L__Easy_vacuum_95_10_4_simple_working277:
;libs/main_function.mbas,478 :: 		oldstate_3 = 1 while_state_import=0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,479 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,480 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,481 :: 		Saving_Mot_heater_On_mSec(auto_setting_enable) Buzzer_on_off(1)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R4
	CALL       libs/main_function_Saving_Mot_heater_On_mSec+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working152:
;libs/main_function.mbas,483 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working150
;libs/main_function.mbas,490 :: 		else
L__Easy_vacuum_95_10_4_simple_working149:
;libs/main_function.mbas,491 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working278
	JMP        L__Easy_vacuum_95_10_4_simple_working155
L__Easy_vacuum_95_10_4_simple_working278:
;libs/main_function.mbas,492 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,493 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,495 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working155:
;libs/main_function.mbas,497 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working279
	JMP        L__Easy_vacuum_95_10_4_simple_working158
L__Easy_vacuum_95_10_4_simple_working279:
;libs/main_function.mbas,498 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,499 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,500 :: 		Heater_relay_Pin =0  ''Saving_Mot_heater_On_mSec(auto_setting_enable)
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_working158:
;libs/main_function.mbas,502 :: 		end if
L__Easy_vacuum_95_10_4_simple_working150:
;libs/main_function.mbas,504 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,505 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
	JMP        L__Easy_vacuum_95_10_4_simple_working140
;libs/main_function.mbas,506 :: 		else
L__Easy_vacuum_95_10_4_simple_working139:
;libs/main_function.mbas,509 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,510 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,511 :: 		Show_message_done("Heater") delay_ms(3000)
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
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 122
	LDI        R17, 193
	LDI        R16, 130
L__Easy_vacuum_95_10_4_simple_working160:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working160
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working160
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working160
	NOP
	NOP
;libs/main_function.mbas,512 :: 		Lcd_0()  ''Saving_Mot_heater_On_mSec()
	CALL       _Lcd_0+0
;libs/main_function.mbas,513 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,514 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,515 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
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
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_working162:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working162
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working162
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working162
	NOP
	NOP
;libs/main_function.mbas,516 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
	POP        R2
	POP        R3
	POP        R4
;libs/main_function.mbas,517 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,518 :: 		end if
L__Easy_vacuum_95_10_4_simple_working140:
;libs/main_function.mbas,521 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working131
L__Easy_vacuum_95_10_4_simple_working132:
;libs/main_function.mbas,524 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working101:
;libs/main_function.mbas,530 :: 		Heater_motor_index=2 ''as Motor
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
;libs/main_function.mbas,531 :: 		Pwm_chanel_main=Motor_pwm_num ''Motor
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,532 :: 		while_state_import=1 Pwm_chanel=Pwm_chanel_main ''while_state_import_main2=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel+0, R27
;libs/main_function.mbas,534 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,535 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working164:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working164
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working164
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working164
	NOP
;libs/main_function.mbas,536 :: 		if (oldstate_3=1) then
	LDS        R27, _oldstate_3+0
	SBRS       R27, BitPos(_oldstate_3+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working167
;libs/main_function.mbas,537 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working280
	JMP        L__Easy_vacuum_95_10_4_simple_working170
L__Easy_vacuum_95_10_4_simple_working280:
;libs/main_function.mbas,538 :: 		while_state_import_main=1 oldstate_3=0
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	JMP        L__Easy_vacuum_95_10_4_simple_working171
;libs/main_function.mbas,539 :: 		else
L__Easy_vacuum_95_10_4_simple_working170:
;libs/main_function.mbas,540 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,541 :: 		end if
L__Easy_vacuum_95_10_4_simple_working171:
L__Easy_vacuum_95_10_4_simple_working167:
;libs/main_function.mbas,543 :: 		while  (while_state_import_main )
L__Easy_vacuum_95_10_4_simple_working173:
	LDS        R27, _while_state_import_main+0
	SBRS       R27, BitPos(_while_state_import_main+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working174
;libs/main_function.mbas,545 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working281
	JMP        L__Easy_vacuum_95_10_4_simple_working178
L__Easy_vacuum_95_10_4_simple_working281:
;libs/main_function.mbas,546 :: 		oldstate_3 = 1  while_state_import_main=0 Buzzer_on_off(1)                   ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working178:
;libs/main_function.mbas,548 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working282
	JMP        L__Easy_vacuum_95_10_4_simple_working181
L__Easy_vacuum_95_10_4_simple_working282:
;libs/main_function.mbas,549 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L__Easy_vacuum_95_10_4_simple_working181:
;libs/main_function.mbas,551 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working183:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working183
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working183
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working183
	NOP
;libs/main_function.mbas,552 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working173
L__Easy_vacuum_95_10_4_simple_working174:
;libs/main_function.mbas,553 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,563 :: 		LCD_Out(2,9, "motor running")  ''Show on LCD
	MOVW       R30, R28
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
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,564 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
	MOVW       R30, R28
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,565 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple_working188:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working188
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working188
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working188
;libs/main_function.mbas,566 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,570 :: 		week=1
	LDI        R27, 1
	STS        _week+0, R27
;libs/main_function.mbas,571 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,573 :: 		if  (Pwm_chanel_main=Heater_pwm_num) then
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4_simple_working283
	JMP        L__Easy_vacuum_95_10_4_simple_working191
L__Easy_vacuum_95_10_4_simple_working283:
;libs/main_function.mbas,574 :: 		txt="Heater"
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
;libs/main_function.mbas,575 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working192
;libs/main_function.mbas,576 :: 		else if  (Pwm_chanel_main=Motor_pwm_num)  then
L__Easy_vacuum_95_10_4_simple_working191:
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple_working284
	JMP        L__Easy_vacuum_95_10_4_simple_working194
L__Easy_vacuum_95_10_4_simple_working284:
;libs/main_function.mbas,577 :: 		txt="Motor"
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
;libs/main_function.mbas,578 :: 		Mo_start_min= minutes   Mo_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _Mo_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _Mo_start_sec+0, R16
L__Easy_vacuum_95_10_4_simple_working194:
;libs/main_function.mbas,580 :: 		end if
L__Easy_vacuum_95_10_4_simple_working192:
;libs/main_function.mbas,591 :: 		Write_Time(hours, 0x00, 0x00, day, week,   month,year)
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
;libs/main_function.mbas,592 :: 		while_state_import=1  j=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 0
	STS        _j+0, R27
;libs/main_function.mbas,593 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,594 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_4_simple_working197:
;libs/main_function.mbas,597 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,598 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_working205:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working206
;libs/main_function.mbas,600 :: 		if  (auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds)  then ''and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working285
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working285:
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
	LDS        R18, _minutes+0
	CP         R19, R18
	LDI        R22, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working286
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working286:
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
	LDS        R16, _seconds+0
	CP         R17, R16
	LDI        R16, 0
	BRLO       L__Easy_vacuum_95_10_4_simple_working287
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working287:
	MOV        R17, R22
	AND        R17, R16
	LDD        R16, Y+29
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working288
	JMP        L__Easy_vacuum_95_10_4_simple_working210
L__Easy_vacuum_95_10_4_simple_working288:
;libs/main_function.mbas,603 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,604 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
;libs/main_function.mbas,605 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel_active+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,606 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working212:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working212
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working212
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working212
	NOP
;libs/main_function.mbas,607 :: 		Show_message_done("Motor") delay_ms(300)
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
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_working214:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working214
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working214
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working214
	NOP
	NOP
;libs/main_function.mbas,608 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,609 :: 		pwm_precnt=integer ( ceil(Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]/10))
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
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
	POP        R2
	POP        R3
	POP        R4
	CALL       _float_fpint+0
;libs/main_function.mbas,610 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working289
	JMP        L__Easy_vacuum_95_10_4_simple_working217
L__Easy_vacuum_95_10_4_simple_working289:
;libs/main_function.mbas,615 :: 		PWM_MAKE (Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,616 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working217:
;libs/main_function.mbas,619 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,620 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,621 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working290
	JMP        L__Easy_vacuum_95_10_4_simple_working220
L__Easy_vacuum_95_10_4_simple_working290:
;libs/main_function.mbas,623 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 1)) then    ' Detect logical one up key
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
	TST        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working291
	JMP        L__Easy_vacuum_95_10_4_simple_working223
L__Easy_vacuum_95_10_4_simple_working291:
;libs/main_function.mbas,624 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,625 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,626 :: 		Saving_Mot_heater_On_mSec(auto_setting_enable)  Buzzer_on_off(1)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R4
	CALL       libs/main_function_Saving_Mot_heater_On_mSec+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working223:
;libs/main_function.mbas,627 :: 		end if
L__Easy_vacuum_95_10_4_simple_working220:
;libs/main_function.mbas,629 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working211
;libs/main_function.mbas,630 :: 		else
L__Easy_vacuum_95_10_4_simple_working210:
;libs/main_function.mbas,632 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,633 :: 		Show_message_done("Motor") delay_ms(2000)
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
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L__Easy_vacuum_95_10_4_simple_working225:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working225
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working225
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working225
	NOP
	NOP
	NOP
	NOP
;libs/main_function.mbas,634 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,635 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,636 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working227:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working227
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working227
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working227
	NOP
;libs/main_function.mbas,637 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
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
;libs/main_function.mbas,638 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
;libs/main_function.mbas,640 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,641 :: 		end if
L__Easy_vacuum_95_10_4_simple_working211:
;libs/main_function.mbas,642 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working205
L__Easy_vacuum_95_10_4_simple_working206:
;libs/main_function.mbas,647 :: 		end if
L__Easy_vacuum_95_10_4_simple_working203:
;libs/main_function.mbas,648 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4_simple_working292
	JMP        L__Easy_vacuum_95_10_4_simple_working200
L__Easy_vacuum_95_10_4_simple_working292:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working197
L__Easy_vacuum_95_10_4_simple_working200:
;libs/main_function.mbas,652 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,654 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,658 :: 		Read_Time(@Start_hours, @End_minutes_next, @End_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,661 :: 		Write_Time((Start_hours),(Start_minutes+End_minutes_next),(Start_seconds+End_seconds_next),
	LDS        R17, _Start_minutes+0
	LDS        R16, _End_minutes_next+0
	MOV        R18, R17
	ADD        R18, R16
	LDS        R17, _Start_seconds+0
	LDS        R16, _End_seconds_next+0
	ADD        R16, R17
;libs/main_function.mbas,662 :: 		(Start_day),(Start_week),(Start_month),(Start_year))
	LDS        R8, _Start_year+0
	LDS        R7, _Start_month+0
	LDS        R6, _Start_week+0
	LDS        R5, _Start_day+0
	MOV        R4, R16
	MOV        R3, R18
	LDS        R2, _Start_hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,671 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,672 :: 		inttostr(End_seconds_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_seconds_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,673 :: 		Lcd_Out(1,1,"Sec ended is :") Lcd_Out(1,10,txt)
	MOVW       R30, R28
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
;libs/main_function.mbas,674 :: 		inttostr(End_minutes_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_minutes_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,675 :: 		Lcd_Out(2,1,"Min ended is :") Lcd_Out(2,10,txt) delay_ms(200)
	MOVW       R30, R28
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working229:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working229
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working229
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working229
	NOP
;libs/main_function.mbas,676 :: 		end sub
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

;libs/main_function.mbas,678 :: 		end.
L_end_libs/main_function_?main:
	RET
; end of _libs/main_function_?main
