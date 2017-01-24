
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
	BREQ       L__Buzzer_on_off251
	JMP        L__Buzzer_on_off3
L__Buzzer_on_off251:
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
L_libs/main_function_Show_message_done253:
	ASR        R17
	ROR        R16
	DEC        R27
	BRNE       L_libs/main_function_Show_message_done253
L_libs/main_function_Show_message_done254:
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
L_libs/main_function_Show_message_done255:
	ASR        R17
	ROR        R16
	DEC        R27
	BRNE       L_libs/main_function_Show_message_done255
L_libs/main_function_Show_message_done256:
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
	SBIW       R28, 15
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
	BREQ       L_libs/main_function_Saving_Mot_heater_On_mSec259
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec16
L_libs/main_function_Saving_Mot_heater_On_mSec259:
;libs/main_function.mbas,152 :: 		for  Heater_motor_index_1=1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L_libs/main_function_Saving_Mot_heater_On_mSec19:
;libs/main_function.mbas,153 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index_1-1][Pwm_chanel_main-1][1]= minutes
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
	LDS        R16, _minutes+0
	ST         Z, R16
;libs/main_function.mbas,154 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1], txt_byte_min)
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
;libs/main_function.mbas,155 :: 		Lcd_0()Lcd_Out(1,1,txt_byte_min) Lcd_Out(2,1,"On EEPROM") delay_ms(2000)
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
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L_libs/main_function_Saving_Mot_heater_On_mSec23:
	DEC        R16
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec23
	DEC        R17
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec23
	DEC        R18
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec23
	NOP
	NOP
	NOP
	NOP
;libs/main_function.mbas,156 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index_1-1][Pwm_chanel_main-1][2]= seconds
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
	LDS        R16, _seconds+0
	ST         Z, R16
;libs/main_function.mbas,157 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2], txt_byte_min)
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
;libs/main_function.mbas,158 :: 		Lcd_0()Lcd_Out(1,1,txt_byte_min) Lcd_Out(2,1,"On EEPROM") delay_ms(2000)
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
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L_libs/main_function_Saving_Mot_heater_On_mSec25:
	DEC        R16
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec25
	DEC        R17
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec25
	DEC        R18
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec25
	NOP
	NOP
	NOP
	NOP
;libs/main_function.mbas,159 :: 		next Heater_motor_index_1
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec260
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec22
L_libs/main_function_Saving_Mot_heater_On_mSec260:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec19
L_libs/main_function_Saving_Mot_heater_On_mSec22:
;libs/main_function.mbas,160 :: 		Lcd_0()Lcd_Out(1,1,"Saving") Lcd_Out(2,1,"On EEPROM") delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/main_function_Saving_Mot_heater_On_mSec27:
	DEC        R16
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec27
	DEC        R17
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec27
	DEC        R18
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec27
	NOP
L_libs/main_function_Saving_Mot_heater_On_mSec16:
;libs/main_function.mbas,171 :: 		end sub                                        ' endless loop
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

;libs/main_function.mbas,172 :: 		sub procedure Easy_vacuum_95_10_4_simple_heater(dim program_number as byte,dim Interupt_en as byte,dim byref Time_on as integer)
;libs/main_function.mbas,175 :: 		Heater_motor_index=0 Pwm_chanel_main=Heater_pwm_num  ''as Heater
	PUSH       R6
	LDI        R27, 0
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,176 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,177 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater31:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater32
;libs/main_function.mbas,178 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater262
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater36
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater262:
;libs/main_function.mbas,179 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater263
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater39
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater263:
;libs/main_function.mbas,180 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater39:
;libs/main_function.mbas,182 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater264
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater42
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater264:
;libs/main_function.mbas,183 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater42:
;libs/main_function.mbas,184 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater37
;libs/main_function.mbas,185 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater36:
;libs/main_function.mbas,186 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,187 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater44:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater44
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater44
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater44
	NOP
;libs/main_function.mbas,188 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater37:
;libs/main_function.mbas,189 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater31
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater32:
;libs/main_function.mbas,190 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,192 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,196 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,197 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
;libs/main_function.mbas,198 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,199 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater46:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater46
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater46
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater46
	NOP
;libs/main_function.mbas,200 :: 		Lcd_Out(1,1,"On pwm heater mode")
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
;libs/main_function.mbas,202 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater265
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater49
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater265:
;libs/main_function.mbas,203 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater49:
;libs/main_function.mbas,205 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater266
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater52
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater266:
;libs/main_function.mbas,206 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,207 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater52:
;libs/main_function.mbas,209 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater267
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater55
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater267:
;libs/main_function.mbas,210 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,211 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,212 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,213 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater57:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater57
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater57
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater57
	NOP
	NOP
;libs/main_function.mbas,214 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
;libs/main_function.mbas,215 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,218 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater55:
;libs/main_function.mbas,220 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater59:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater59
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater59
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater59
	NOP
;libs/main_function.mbas,221 :: 		end sub
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

;libs/main_function.mbas,224 :: 		sub procedure Easy_vacuum_95_10_4_simple_Motor(dim program_number as byte,dim Interupt_en,Time_on as integer)
;libs/main_function.mbas,227 :: 		Heater_motor_index=1 Pwm_chanel_main=Motor_pwm_num  ''as Motor
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,228 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,229 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor63:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor64
;libs/main_function.mbas,230 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R4, R27
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor269
	LDI        R27, 0
	CP         R3, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor269:
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor270
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor68
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor270:
;libs/main_function.mbas,231 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor271
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor71
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor271:
;libs/main_function.mbas,232 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor71:
;libs/main_function.mbas,234 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor272
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor74
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor272:
;libs/main_function.mbas,235 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor74:
;libs/main_function.mbas,237 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor69
;libs/main_function.mbas,238 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor68:
;libs/main_function.mbas,239 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,240 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor76:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor76
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor76
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor76
	NOP
;libs/main_function.mbas,241 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor69:
;libs/main_function.mbas,242 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor63
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor64:
;libs/main_function.mbas,243 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,245 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,246 :: 		Time_on=(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]*60+Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1])*1000
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
;libs/main_function.mbas,247 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,248 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
;libs/main_function.mbas,249 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,250 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor78:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor78
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor78
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor78
	NOP
;libs/main_function.mbas,251 :: 		Lcd_Out(1,1,"On pwm Mtor mode")
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
;libs/main_function.mbas,253 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor273
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor81
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor273:
;libs/main_function.mbas,254 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,255 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,256 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,257 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor83:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor83
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor83
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor83
	NOP
	NOP
;libs/main_function.mbas,258 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
;libs/main_function.mbas,259 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,261 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor81:
;libs/main_function.mbas,263 :: 		Lcd_0()Lcd_Out(1,1,"End") Lcd_Out(2,1,"...") delay_ms(200) '' DDD7_bit =0
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
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor85:
	DEC        R16
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor85
	DEC        R17
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor85
	DEC        R18
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor85
	NOP
;libs/main_function.mbas,264 :: 		end sub
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
	SBIW       R28, 32
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,269 :: 		dim pwm_precnt as integer
;libs/main_function.mbas,270 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
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
;libs/main_function.mbas,294 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,295 :: 		while  (while_state_import )
L__Easy_vacuum_95_10_4_simple_working89:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working90
;libs/main_function.mbas,302 :: 		if (Interupt_en=0)  then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working275
	JMP        L__Easy_vacuum_95_10_4_simple_working94
L__Easy_vacuum_95_10_4_simple_working275:
;libs/main_function.mbas,303 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working276
	JMP        L__Easy_vacuum_95_10_4_simple_working97
L__Easy_vacuum_95_10_4_simple_working276:
;libs/main_function.mbas,304 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,305 :: 		Interupt_en=1 while_state_import=0 Buzzer_on_off(1)
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
L__Easy_vacuum_95_10_4_simple_working97:
;libs/main_function.mbas,307 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working277
	JMP        L__Easy_vacuum_95_10_4_simple_working100
L__Easy_vacuum_95_10_4_simple_working277:
;libs/main_function.mbas,308 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working100:
;libs/main_function.mbas,309 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working95
;libs/main_function.mbas,310 :: 		else
L__Easy_vacuum_95_10_4_simple_working94:
;libs/main_function.mbas,311 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,312 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working102:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working102
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working102
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working102
	NOP
;libs/main_function.mbas,313 :: 		end if
L__Easy_vacuum_95_10_4_simple_working95:
;libs/main_function.mbas,314 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working89
L__Easy_vacuum_95_10_4_simple_working90:
;libs/main_function.mbas,318 :: 		if (Interupt_en=1) then
	LDI        R27, 1
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working278
	JMP        L__Easy_vacuum_95_10_4_simple_working105
L__Easy_vacuum_95_10_4_simple_working278:
;libs/main_function.mbas,329 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,385 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,389 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,395 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,399 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,400 :: 		if (auto_setting_enable=1)then  '''making unlimit time for auto setting
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working279
	JMP        L__Easy_vacuum_95_10_4_simple_working108
L__Easy_vacuum_95_10_4_simple_working279:
;libs/main_function.mbas,401 :: 		for  Pwm_chanel_main=Heater_pwm_num to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__Easy_vacuum_95_10_4_simple_working111:
;libs/main_function.mbas,402 :: 		for  Heater_motor_index=1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L__Easy_vacuum_95_10_4_simple_working116:
;libs/main_function.mbas,403 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=60
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
;libs/main_function.mbas,404 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=60
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
;libs/main_function.mbas,405 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]=1
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
;libs/main_function.mbas,406 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L__Easy_vacuum_95_10_4_simple_working280
	JMP        L__Easy_vacuum_95_10_4_simple_working119
L__Easy_vacuum_95_10_4_simple_working280:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working116
L__Easy_vacuum_95_10_4_simple_working119:
;libs/main_function.mbas,407 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L__Easy_vacuum_95_10_4_simple_working281
	JMP        L__Easy_vacuum_95_10_4_simple_working114
L__Easy_vacuum_95_10_4_simple_working281:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working111
L__Easy_vacuum_95_10_4_simple_working114:
L__Easy_vacuum_95_10_4_simple_working108:
;libs/main_function.mbas,410 :: 		Heater_motor_index=2 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,411 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3], txt_byte_min)
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
;libs/main_function.mbas,412 :: 		pwm_precnt=StrToInt(txt_byte_min)
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
;libs/main_function.mbas,414 :: 		while_state_import=1    while_state_import_main=0   j=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDI        R27, 1
	STS        _j+0, R27
;libs/main_function.mbas,418 :: 		if (auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds)  and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working282
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working282:
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working283
	LDI        R20, 255
L__Easy_vacuum_95_10_4_simple_working283:
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working284
	LDI        R18, 255
L__Easy_vacuum_95_10_4_simple_working284:
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
	BREQ       L__Easy_vacuum_95_10_4_simple_working285
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working285:
	MOV        R16, R27
	MOV        R17, R20
	AND        R17, R16
	LDD        R16, Y+31
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working286
	JMP        L__Easy_vacuum_95_10_4_simple_working124
L__Easy_vacuum_95_10_4_simple_working286:
;libs/main_function.mbas,423 :: 		inttostr(pwm_precnt,txt)
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
;libs/main_function.mbas,424 :: 		inttostr(minutes,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _minutes+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,425 :: 		Lcd_Out(2,1,txt) Lcd_Out(1,1,"1 chcked:") delay_ms(500)
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
	ADIW       R30, 2
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
	SUBI       R16, 254
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
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Easy_vacuum_95_10_4_simple_working126:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working126
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working126
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working126
	NOP
;libs/main_function.mbas,426 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working287
	JMP        L__Easy_vacuum_95_10_4_simple_working129
L__Easy_vacuum_95_10_4_simple_working287:
;libs/main_function.mbas,427 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,428 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working129:
;libs/main_function.mbas,431 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple_working131:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working131
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working131
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working131
;libs/main_function.mbas,432 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working288
	JMP        L__Easy_vacuum_95_10_4_simple_working134
L__Easy_vacuum_95_10_4_simple_working288:
;libs/main_function.mbas,433 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0   while_state_import=0                 ' Update flag
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
L__Easy_vacuum_95_10_4_simple_working134:
;libs/main_function.mbas,436 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working289
	JMP        L__Easy_vacuum_95_10_4_simple_working137
L__Easy_vacuum_95_10_4_simple_working289:
;libs/main_function.mbas,437 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,438 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,439 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_working137:
;libs/main_function.mbas,440 :: 		end if
L__Easy_vacuum_95_10_4_simple_working124:
;libs/main_function.mbas,444 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,451 :: 		Write_Time(hours, 0x00, 0x00, day, week,   month,year)
	LDS        R8, _year+0
	LDS        R7, _month+0
	LDS        R6, _week+0
	LDS        R5, _day+0
	CLR        R4
	CLR        R3
	LDS        R2, _hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,452 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,453 :: 		oldstate_3 =0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,456 :: 		j=0  Heater_motor_index=2
	LDI        R27, 0
	STS        _j+0, R27
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
;libs/main_function.mbas,457 :: 		Heater_relay_Pin =0  oldstate_3 = 0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,458 :: 		while_state_import=1    while_state_import_main=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,459 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_working140:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working141
;libs/main_function.mbas,462 :: 		if (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]= minutes ) and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]< (seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working290
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working290:
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
	BRSH       L__Easy_vacuum_95_10_4_simple_working291
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working291:
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple_working292
	JMP        L__Easy_vacuum_95_10_4_simple_working148
L__Easy_vacuum_95_10_4_simple_working292:
;libs/main_function.mbas,463 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working148:
;libs/main_function.mbas,465 :: 		if (while_state_import<>0)and ((auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) or    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]> seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R27, _while_state_import+0
	BST        R27, BitPos(_while_state_import+0)
	BLD        R25, 0
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working293
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working293:
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working294
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working294:
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
	BRSH       L__Easy_vacuum_95_10_4_simple_working295
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working295:
	MOV        R16, R27
	MOV        R17, R22
	OR         R17, R16
	CLR        R16
	SBRC       R25, 0
	INC        R16
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working296
	JMP        L__Easy_vacuum_95_10_4_simple_working151
L__Easy_vacuum_95_10_4_simple_working296:
;libs/main_function.mbas,468 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,469 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,470 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
;libs/main_function.mbas,472 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working297
	JMP        L__Easy_vacuum_95_10_4_simple_working154
L__Easy_vacuum_95_10_4_simple_working297:
;libs/main_function.mbas,473 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,474 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working154:
;libs/main_function.mbas,480 :: 		Heater_relay_on()
	CALL       libs/main_function_Heater_relay_on+0
;libs/main_function.mbas,485 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working298
	JMP        L__Easy_vacuum_95_10_4_simple_working157
L__Easy_vacuum_95_10_4_simple_working298:
;libs/main_function.mbas,486 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 1)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working299
	JMP        L__Easy_vacuum_95_10_4_simple_working160
L__Easy_vacuum_95_10_4_simple_working299:
;libs/main_function.mbas,487 :: 		oldstate_3 = 1 while_state_import=0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,488 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,489 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,491 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=minutes
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
;libs/main_function.mbas,492 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=seconds
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
;libs/main_function.mbas,493 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working160:
;libs/main_function.mbas,495 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working158
;libs/main_function.mbas,502 :: 		else
L__Easy_vacuum_95_10_4_simple_working157:
;libs/main_function.mbas,503 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working300
	JMP        L__Easy_vacuum_95_10_4_simple_working163
L__Easy_vacuum_95_10_4_simple_working300:
;libs/main_function.mbas,504 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,505 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,507 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working163:
;libs/main_function.mbas,509 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working301
	JMP        L__Easy_vacuum_95_10_4_simple_working166
L__Easy_vacuum_95_10_4_simple_working301:
;libs/main_function.mbas,510 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,511 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,512 :: 		Heater_relay_Pin =0  ''Saving_Mot_heater_On_mSec(auto_setting_enable)
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_working166:
;libs/main_function.mbas,514 :: 		end if
L__Easy_vacuum_95_10_4_simple_working158:
;libs/main_function.mbas,515 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
	ADIW       R30, 2
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
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,516 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,517 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working168:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working168
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working168
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working168
	NOP
;libs/main_function.mbas,518 :: 		Show_message_done("Heater") delay_ms(300)
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
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_working170:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working170
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working170
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working170
	NOP
	NOP
	JMP        L__Easy_vacuum_95_10_4_simple_working152
;libs/main_function.mbas,520 :: 		else
L__Easy_vacuum_95_10_4_simple_working151:
;libs/main_function.mbas,523 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,524 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,525 :: 		Show_message_done("Heater") delay_ms(100)
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
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple_working172:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working172
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working172
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working172
;libs/main_function.mbas,526 :: 		Lcd_0()  ''Saving_Mot_heater_On_mSec()
	CALL       _Lcd_0+0
;libs/main_function.mbas,527 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,528 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,529 :: 		if j=1 then Lcd_Out(2,1,"Heater off") Lcd_Out(2,10,txt) delay_ms(300)  end if
	LDS        R16, _j+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4_simple_working302
	JMP        L__Easy_vacuum_95_10_4_simple_working175
L__Easy_vacuum_95_10_4_simple_working302:
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
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_working177:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working177
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working177
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working177
	NOP
	NOP
L__Easy_vacuum_95_10_4_simple_working175:
;libs/main_function.mbas,530 :: 		if j=0 then Lcd_Out(2,1,"Heater Error") Lcd_Out(2,10,txt) delay_ms(300)  end if
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working303
	JMP        L__Easy_vacuum_95_10_4_simple_working180
L__Easy_vacuum_95_10_4_simple_working303:
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
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_working182:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working182
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working182
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working182
	NOP
	NOP
L__Easy_vacuum_95_10_4_simple_working180:
;libs/main_function.mbas,531 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
;libs/main_function.mbas,532 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,533 :: 		end if
L__Easy_vacuum_95_10_4_simple_working152:
;libs/main_function.mbas,536 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working140
L__Easy_vacuum_95_10_4_simple_working141:
;libs/main_function.mbas,539 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working105:
;libs/main_function.mbas,545 :: 		Heater_motor_index=2 ''as Motor
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
;libs/main_function.mbas,546 :: 		Pwm_chanel_main=Motor_pwm_num ''Motor
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,547 :: 		while_state_import=1 Pwm_chanel=Pwm_chanel_main ''while_state_import_main2=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel+0, R27
;libs/main_function.mbas,549 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,550 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working184:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working184
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working184
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working184
	NOP
;libs/main_function.mbas,551 :: 		if (oldstate_3=1) then
	LDS        R27, _oldstate_3+0
	SBRS       R27, BitPos(_oldstate_3+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working187
;libs/main_function.mbas,552 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working304
	JMP        L__Easy_vacuum_95_10_4_simple_working190
L__Easy_vacuum_95_10_4_simple_working304:
;libs/main_function.mbas,553 :: 		while_state_import_main=1 oldstate_3=0
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	JMP        L__Easy_vacuum_95_10_4_simple_working191
;libs/main_function.mbas,554 :: 		else
L__Easy_vacuum_95_10_4_simple_working190:
;libs/main_function.mbas,555 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,556 :: 		end if
L__Easy_vacuum_95_10_4_simple_working191:
L__Easy_vacuum_95_10_4_simple_working187:
;libs/main_function.mbas,576 :: 		while  (while_state_import_main )
L__Easy_vacuum_95_10_4_simple_working193:
	LDS        R27, _while_state_import_main+0
	SBRS       R27, BitPos(_while_state_import_main+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working194
;libs/main_function.mbas,577 :: 		if ( Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working305
	JMP        L__Easy_vacuum_95_10_4_simple_working198
L__Easy_vacuum_95_10_4_simple_working305:
;libs/main_function.mbas,578 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L__Easy_vacuum_95_10_4_simple_working198:
;libs/main_function.mbas,580 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the pad !!") delay_ms(200)
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
	LDI        R27, 112
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working200:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working200
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working200
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working200
	NOP
;libs/main_function.mbas,581 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working193
L__Easy_vacuum_95_10_4_simple_working194:
;libs/main_function.mbas,582 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,592 :: 		LCD_Out(2,9, "motor running")  ''Show on LCD
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
;libs/main_function.mbas,593 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
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
;libs/main_function.mbas,595 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,599 :: 		week=1
	LDI        R27, 1
	STS        _week+0, R27
;libs/main_function.mbas,600 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,602 :: 		if  (Pwm_chanel_main=Heater_pwm_num) then
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4_simple_working306
	JMP        L__Easy_vacuum_95_10_4_simple_working206
L__Easy_vacuum_95_10_4_simple_working306:
;libs/main_function.mbas,603 :: 		txt="Heater"
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
;libs/main_function.mbas,604 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working207
;libs/main_function.mbas,605 :: 		else if  (Pwm_chanel_main=Motor_pwm_num)  then
L__Easy_vacuum_95_10_4_simple_working206:
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple_working307
	JMP        L__Easy_vacuum_95_10_4_simple_working209
L__Easy_vacuum_95_10_4_simple_working307:
;libs/main_function.mbas,606 :: 		txt="Motor"
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
;libs/main_function.mbas,607 :: 		Mo_start_min= minutes   Mo_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _Mo_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _Mo_start_sec+0, R16
L__Easy_vacuum_95_10_4_simple_working209:
;libs/main_function.mbas,609 :: 		end if
L__Easy_vacuum_95_10_4_simple_working207:
;libs/main_function.mbas,620 :: 		Write_Time(hours, 0x00, 0x00, day, week,   month,year)
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
;libs/main_function.mbas,621 :: 		while_state_import=1  j=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 0
	STS        _j+0, R27
;libs/main_function.mbas,622 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,623 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_4_simple_working212:
;libs/main_function.mbas,626 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,627 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_working220:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working221
;libs/main_function.mbas,629 :: 		if (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]= minutes ) and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]< (seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working308
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working308:
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
	BRSH       L__Easy_vacuum_95_10_4_simple_working309
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working309:
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple_working310
	JMP        L__Easy_vacuum_95_10_4_simple_working225
L__Easy_vacuum_95_10_4_simple_working310:
;libs/main_function.mbas,630 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working225:
;libs/main_function.mbas,632 :: 		if (while_state_import<>0)and ((auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) or    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]> seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R27, _while_state_import+0
	BST        R27, BitPos(_while_state_import+0)
	BLD        R25, 0
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working311
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working311:
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working312
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working312:
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
	BRSH       L__Easy_vacuum_95_10_4_simple_working313
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working313:
	MOV        R16, R27
	MOV        R17, R22
	OR         R17, R16
	CLR        R16
	SBRC       R25, 0
	INC        R16
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working314
	JMP        L__Easy_vacuum_95_10_4_simple_working228
L__Easy_vacuum_95_10_4_simple_working314:
;libs/main_function.mbas,641 :: 		pwm_precnt=integer ( ceil(Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]/10))
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
;libs/main_function.mbas,642 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working315
	JMP        L__Easy_vacuum_95_10_4_simple_working231
L__Easy_vacuum_95_10_4_simple_working315:
;libs/main_function.mbas,647 :: 		PWM_MAKE (Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,648 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working231:
;libs/main_function.mbas,650 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,651 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/main_function.mbas,652 :: 		inttostr(chanel_active,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel_active+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,653 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working233:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working233
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working233
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working233
	NOP
;libs/main_function.mbas,654 :: 		Show_message_done("Motor") delay_ms(300)
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
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L__Easy_vacuum_95_10_4_simple_working235:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working235
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working235
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working235
	NOP
	NOP
;libs/main_function.mbas,655 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,658 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,659 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,660 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working316
	JMP        L__Easy_vacuum_95_10_4_simple_working238
L__Easy_vacuum_95_10_4_simple_working316:
;libs/main_function.mbas,662 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 1)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working317
	JMP        L__Easy_vacuum_95_10_4_simple_working241
L__Easy_vacuum_95_10_4_simple_working317:
;libs/main_function.mbas,663 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,664 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,666 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=minutes
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
;libs/main_function.mbas,667 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=seconds
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
;libs/main_function.mbas,668 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working241:
;libs/main_function.mbas,669 :: 		end if
L__Easy_vacuum_95_10_4_simple_working238:
;libs/main_function.mbas,671 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working229
;libs/main_function.mbas,672 :: 		else
L__Easy_vacuum_95_10_4_simple_working228:
;libs/main_function.mbas,674 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,675 :: 		Show_message_done("Motor") delay_ms(2000)
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
	MOVW       R2, R16
	CALL       libs/main_function_Show_message_done+0
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L__Easy_vacuum_95_10_4_simple_working243:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working243
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working243
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working243
	NOP
	NOP
	NOP
	NOP
;libs/main_function.mbas,676 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,677 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,678 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working245:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working245
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working245
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working245
	NOP
;libs/main_function.mbas,679 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
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
;libs/main_function.mbas,680 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
;libs/main_function.mbas,682 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,683 :: 		end if
L__Easy_vacuum_95_10_4_simple_working229:
;libs/main_function.mbas,684 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working220
L__Easy_vacuum_95_10_4_simple_working221:
;libs/main_function.mbas,689 :: 		end if
L__Easy_vacuum_95_10_4_simple_working218:
;libs/main_function.mbas,690 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4_simple_working318
	JMP        L__Easy_vacuum_95_10_4_simple_working215
L__Easy_vacuum_95_10_4_simple_working318:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working212
L__Easy_vacuum_95_10_4_simple_working215:
;libs/main_function.mbas,694 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,696 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,700 :: 		Read_Time(@Start_hours, @End_minutes_next, @End_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,703 :: 		Write_Time((Start_hours),(Start_minutes+End_minutes_next),(Start_seconds+End_seconds_next),
	LDS        R17, _Start_minutes+0
	LDS        R16, _End_minutes_next+0
	MOV        R18, R17
	ADD        R18, R16
	LDS        R17, _Start_seconds+0
	LDS        R16, _End_seconds_next+0
	ADD        R16, R17
;libs/main_function.mbas,704 :: 		(Start_day),(Start_week),(Start_month),(Start_year))
	LDS        R8, _Start_year+0
	LDS        R7, _Start_month+0
	LDS        R6, _Start_week+0
	LDS        R5, _Start_day+0
	MOV        R4, R16
	MOV        R3, R18
	LDS        R2, _Start_hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,713 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,714 :: 		inttostr(End_seconds_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_seconds_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,715 :: 		Lcd_Out(1,1,"Sec ended is :") Lcd_Out(1,10,txt)
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
;libs/main_function.mbas,716 :: 		inttostr(End_minutes_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_minutes_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,717 :: 		Lcd_Out(2,1,"Min ended is :") Lcd_Out(2,10,txt) delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Easy_vacuum_95_10_4_simple_working247:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working247
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working247
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working247
	NOP
;libs/main_function.mbas,718 :: 		end sub
L_end_Easy_vacuum_95_10_4_simple_working:
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
; end of _Easy_vacuum_95_10_4_simple_working

_libs/main_function_?main:

;libs/main_function.mbas,720 :: 		end.
L_end_libs/main_function_?main:
	RET
; end of _libs/main_function_?main
