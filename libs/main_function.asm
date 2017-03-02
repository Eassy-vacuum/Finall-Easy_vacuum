
_Key_Port_Init_mainfunc:

;libs/main_function.mbas,97 :: 		sub procedure Key_Port_Init_mainfunc()
;libs/main_function.mbas,108 :: 		DDB4_bit = 0 DDB2_bit = 0  DDB0_bit = 0  DDB1_bit = 0              ' Set PORTE pin 7 as input pin for the Heater switches
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
;libs/main_function.mbas,109 :: 		DDD2_bit = 0 DDD3_bit = 0
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
;libs/main_function.mbas,111 :: 		DDD6_bit = 1
	IN         R27, DDD6_bit+0
	SBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;libs/main_function.mbas,113 :: 		end sub
L_end_Key_Port_Init_mainfunc:
	RET
; end of _Key_Port_Init_mainfunc

_Buzzer_on_off:

;libs/main_function.mbas,115 :: 		sub procedure Buzzer_on_off(dim on_ as byte)
;libs/main_function.mbas,116 :: 		if On_=1 then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 1
	CP         R2, R27
	BREQ       L__Buzzer_on_off273
	JMP        L__Buzzer_on_off3
L__Buzzer_on_off273:
;libs/main_function.mbas,117 :: 		PWM_MAKE (100,255,3)delay_ms(300)PWM_MAKE (0,255,3)
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
;libs/main_function.mbas,118 :: 		else
L__Buzzer_on_off3:
;libs/main_function.mbas,119 :: 		PWM_MAKE (0,255,3)delay_ms(300)PWM_MAKE (100,255,3)
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
;libs/main_function.mbas,120 :: 		end if
L__Buzzer_on_off4:
;libs/main_function.mbas,122 :: 		end sub
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
	SBIW       R28, 8
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/main_function.mbas,125 :: 		txt_1 as string[1]
;libs/main_function.mbas,128 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,129 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
;libs/main_function.mbas,130 :: 		Lcd_0()Lcd_Out(1,1,ht_or_mot)  Lcd_Out(1,8,"Prog:") bytetostr(chanel_1,txt_1) Lcd_Out(1,12,txt_1) Lcd_Out(1,12,":")
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
;libs/main_function.mbas,131 :: 		Lcd_Out(2,1,"Min:") Lcd_Out(2,9,",Sec:")
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
;libs/main_function.mbas,134 :: 		Start_seconds_next  =  ((Start_seconds_next and 0xF0) >> 4)*10 + (Start_seconds_next and 0x0F)
	LDS        R16, _Start_seconds_next+0
	LDS        R17, _Start_seconds_next+1
	ANDI       R16, 240
	ANDI       R17, 0
	LDI        R27, 4
L_libs/main_function_Show_message_done275:
	ASR        R17
	ROR        R16
	DEC        R27
	BRNE       L_libs/main_function_Show_message_done275
L_libs/main_function_Show_message_done276:
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
;libs/main_function.mbas,135 :: 		Start_minutes_next  =  ((Start_minutes_next and 0xF0) >> 4)*10 + (Start_minutes_next and 0x0F)
	LDS        R16, _Start_minutes_next+0
	LDS        R17, _Start_minutes_next+1
	ANDI       R16, 240
	ANDI       R17, 0
	LDI        R27, 4
L_libs/main_function_Show_message_done277:
	ASR        R17
	ROR        R16
	DEC        R27
	BRNE       L_libs/main_function_Show_message_done277
L_libs/main_function_Show_message_done278:
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
;libs/main_function.mbas,136 :: 		mi=Start_minutes_next se=Start_seconds_next
; mi start address is: 17 (R17)
	MOV        R17, R18
; se start address is: 21 (R21)
	LDS        R21, _Start_seconds_next+0
;libs/main_function.mbas,137 :: 		Lcd_Chr(2, 5, (mi div 10) + 48)
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
;libs/main_function.mbas,138 :: 		Lcd_Chr(2,6, (mi mod 10) + 48)
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
;libs/main_function.mbas,139 :: 		Lcd_Chr(2,14, (se div 10) + 48)
	LDI        R20, 10
	MOV        R16, R21
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	PUSH       R21
	MOV        R4, R16
	LDI        R27, 14
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R21
;libs/main_function.mbas,140 :: 		Lcd_Chr(2,15, (se mod 10) + 48)
	LDI        R20, 10
	MOV        R16, R21
	CALL       _Div_8x8_U+0
	MOV        R16, R25
; se end address is: 21 (R21)
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 15
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;libs/main_function.mbas,142 :: 		end sub
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

;libs/main_function.mbas,143 :: 		sub procedure Heater_relay_on()
;libs/main_function.mbas,144 :: 		if (while_state_import_main=0) then
	LDS        R27, _while_state_import_main+0
	SBRC       R27, BitPos(_while_state_import_main+0)
	JMP        L_libs/main_function_Heater_relay_on12
;libs/main_function.mbas,145 :: 		Heater_relay_Pin =1
	IN         R27, PIND6_bit+0
	SBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,146 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L_libs/main_function_Heater_relay_on12:
;libs/main_function.mbas,149 :: 		end sub
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

;libs/main_function.mbas,152 :: 		dim Heater_motor_index_1 as byte
;libs/main_function.mbas,154 :: 		if auto_setting_enable=1 then
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	CP         R2, R27
	BREQ       L_libs/main_function_Saving_Mot_heater_On_mSec281
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec16
L_libs/main_function_Saving_Mot_heater_On_mSec281:
;libs/main_function.mbas,155 :: 		for  Heater_motor_index_1=1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L_libs/main_function_Saving_Mot_heater_On_mSec19:
;libs/main_function.mbas,156 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index_1-1][Pwm_chanel_main-1][1]= minutes
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
;libs/main_function.mbas,157 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1], txt_byte_min)
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
;libs/main_function.mbas,159 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index_1-1][Pwm_chanel_main-1][2]= seconds
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
;libs/main_function.mbas,160 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2], txt_byte_min)
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
;libs/main_function.mbas,161 :: 		Lcd_0()Lcd_Out(1,1,txt_byte_min) Lcd_Out(2,1,"On EEPROM") delay_ms(2000)
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
;libs/main_function.mbas,162 :: 		next Heater_motor_index_1
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L_libs/main_function_Saving_Mot_heater_On_mSec282
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec22
L_libs/main_function_Saving_Mot_heater_On_mSec282:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/main_function_Saving_Mot_heater_On_mSec19
L_libs/main_function_Saving_Mot_heater_On_mSec22:
;libs/main_function.mbas,163 :: 		Lcd_0()Lcd_Out(1,1,"Saving") Lcd_Out(2,1,"On EEPROM") delay_ms(200)
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
;libs/main_function.mbas,174 :: 		end sub                                        ' endless loop
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

;libs/main_function.mbas,175 :: 		sub procedure Easy_vacuum_95_10_4_simple_heater(dim program_number as byte,dim Interupt_en as byte,dim byref Time_on as integer)
;libs/main_function.mbas,178 :: 		Heater_motor_index=0 Pwm_chanel_main=Heater_pwm_num  ''as Heater
	PUSH       R6
	LDI        R27, 0
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,179 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,180 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater31:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater32
;libs/main_function.mbas,181 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater284
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater36
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater284:
;libs/main_function.mbas,182 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater285
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater39
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater285:
;libs/main_function.mbas,183 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater39:
;libs/main_function.mbas,185 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater286
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater42
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater286:
;libs/main_function.mbas,186 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater42:
;libs/main_function.mbas,187 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater37
;libs/main_function.mbas,188 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater36:
;libs/main_function.mbas,189 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,190 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
;libs/main_function.mbas,191 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater37:
;libs/main_function.mbas,192 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater31
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater32:
;libs/main_function.mbas,193 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,195 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,199 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,200 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
;libs/main_function.mbas,201 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,202 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
;libs/main_function.mbas,203 :: 		Lcd_Out(1,1,"On pwm heater mode")
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
;libs/main_function.mbas,205 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater287
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater49
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater287:
;libs/main_function.mbas,206 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater49:
;libs/main_function.mbas,208 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater288
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater52
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater288:
;libs/main_function.mbas,209 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,210 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,212 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_heater289
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_heater55
L_libs/main_function_Easy_vacuum_95_10_4_simple_heater289:
;libs/main_function.mbas,213 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,214 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,215 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,216 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
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
;libs/main_function.mbas,217 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
;libs/main_function.mbas,218 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,221 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,223 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
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
;libs/main_function.mbas,224 :: 		end sub
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

;libs/main_function.mbas,227 :: 		sub procedure Easy_vacuum_95_10_4_simple_Motor(dim program_number as byte,dim Interupt_en,Time_on as integer)
;libs/main_function.mbas,230 :: 		Heater_motor_index=1 Pwm_chanel_main=Motor_pwm_num  ''as Motor
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,231 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,232 :: 		while  (while_state_import )
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor63:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor64
;libs/main_function.mbas,233 :: 		if (Interupt_en=0) then
	LDI        R27, 0
	CP         R4, R27
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor291
	LDI        R27, 0
	CP         R3, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor291:
	BREQ       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor292
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor68
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor292:
;libs/main_function.mbas,234 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor293
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor71
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor293:
;libs/main_function.mbas,235 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor71:
;libs/main_function.mbas,237 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor294
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor74
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor294:
;libs/main_function.mbas,238 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor74:
;libs/main_function.mbas,240 :: 		end if
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor69
;libs/main_function.mbas,241 :: 		else
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor68:
;libs/main_function.mbas,242 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,243 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
;libs/main_function.mbas,244 :: 		end if
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor69:
;libs/main_function.mbas,245 :: 		wend
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor63
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor64:
;libs/main_function.mbas,246 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,248 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,249 :: 		Time_on=(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]*60+Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1])*1000
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
;libs/main_function.mbas,250 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,251 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is ACTIVE:")
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
;libs/main_function.mbas,252 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,253 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
;libs/main_function.mbas,254 :: 		Lcd_Out(1,1,"On pwm Mtor mode")
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
;libs/main_function.mbas,256 :: 		if ( Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]  <> 0) then   ''if enabled
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
	BRNE       L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor295
	JMP        L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor81
L_libs/main_function_Easy_vacuum_95_10_4_simple_Motor295:
;libs/main_function.mbas,257 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,258 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,259 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,260 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(300)
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
;libs/main_function.mbas,261 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
;libs/main_function.mbas,262 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,264 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,266 :: 		Lcd_0()Lcd_Out(1,1,"End") Lcd_Out(2,1,"...") delay_ms(200) '' DDD7_bit =0
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
;libs/main_function.mbas,267 :: 		end sub
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

;libs/main_function.mbas,272 :: 		dim pwm_precnt as integer
;libs/main_function.mbas,273 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
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
;libs/main_function.mbas,297 :: 		while_state_import=1  oldstate_3=0 chanel=program_number   week=1   on_off2 = 1
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
;libs/main_function.mbas,298 :: 		while  (while_state_import )
L__Easy_vacuum_95_10_4_simple_working89:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working90
;libs/main_function.mbas,305 :: 		if (Interupt_en=0)  then
	LDI        R27, 0
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working297
	JMP        L__Easy_vacuum_95_10_4_simple_working94
L__Easy_vacuum_95_10_4_simple_working297:
;libs/main_function.mbas,306 :: 		if (Button(HET_SW_Port, HET_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working298
	JMP        L__Easy_vacuum_95_10_4_simple_working97
L__Easy_vacuum_95_10_4_simple_working298:
;libs/main_function.mbas,307 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,308 :: 		Interupt_en=1 while_state_import=0 Buzzer_on_off(1)
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
;libs/main_function.mbas,310 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working299
	JMP        L__Easy_vacuum_95_10_4_simple_working100
L__Easy_vacuum_95_10_4_simple_working299:
;libs/main_function.mbas,311 :: 		Interupt_en=1 while_state_import=0
	LDI        R27, 1
	MOV        R3, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working100:
;libs/main_function.mbas,312 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working95
;libs/main_function.mbas,313 :: 		else
L__Easy_vacuum_95_10_4_simple_working94:
;libs/main_function.mbas,314 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,315 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200) '' DDD7_bit =0
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
;libs/main_function.mbas,316 :: 		end if
L__Easy_vacuum_95_10_4_simple_working95:
;libs/main_function.mbas,317 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working89
L__Easy_vacuum_95_10_4_simple_working90:
;libs/main_function.mbas,321 :: 		if (Interupt_en=1) then
	LDI        R27, 1
	CP         R3, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working300
	JMP        L__Easy_vacuum_95_10_4_simple_working105
L__Easy_vacuum_95_10_4_simple_working300:
;libs/main_function.mbas,332 :: 		Heater_motor_index=1 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,388 :: 		Lcd_0()
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;libs/main_function.mbas,392 :: 		Read_Time(@Start_hours, @Start_minutes, @Start_seconds, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,398 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,402 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,403 :: 		if (auto_setting_enable=1)then  '''making unlimit time for auto setting
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working301
	JMP        L__Easy_vacuum_95_10_4_simple_working108
L__Easy_vacuum_95_10_4_simple_working301:
;libs/main_function.mbas,404 :: 		for  Pwm_chanel_main=Heater_pwm_num to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__Easy_vacuum_95_10_4_simple_working111:
;libs/main_function.mbas,405 :: 		for  Heater_motor_index=1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L__Easy_vacuum_95_10_4_simple_working116:
;libs/main_function.mbas,406 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=60
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
;libs/main_function.mbas,407 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=60
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
;libs/main_function.mbas,408 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]=1
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
;libs/main_function.mbas,409 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L__Easy_vacuum_95_10_4_simple_working302
	JMP        L__Easy_vacuum_95_10_4_simple_working119
L__Easy_vacuum_95_10_4_simple_working302:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working116
L__Easy_vacuum_95_10_4_simple_working119:
;libs/main_function.mbas,410 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L__Easy_vacuum_95_10_4_simple_working303
	JMP        L__Easy_vacuum_95_10_4_simple_working114
L__Easy_vacuum_95_10_4_simple_working303:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working111
L__Easy_vacuum_95_10_4_simple_working114:
L__Easy_vacuum_95_10_4_simple_working108:
;libs/main_function.mbas,413 :: 		Heater_motor_index=2 chanel=program_number Pwm_chanel_main=Heater_pwm_num''as heater
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	STS        _chanel+0, R2
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,414 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3], txt_byte_min)
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
;libs/main_function.mbas,415 :: 		pwm_precnt=StrToInt(txt_byte_min)
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
;libs/main_function.mbas,417 :: 		while_state_import=1    while_state_import_main=0   j=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDI        R27, 1
	STS        _j+0, R27
;libs/main_function.mbas,421 :: 		if (auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) and    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]>= seconds)  and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working304
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working304:
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working305
	LDI        R20, 255
L__Easy_vacuum_95_10_4_simple_working305:
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working306
	LDI        R18, 255
L__Easy_vacuum_95_10_4_simple_working306:
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
	BREQ       L__Easy_vacuum_95_10_4_simple_working307
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working307:
	MOV        R16, R27
	MOV        R17, R20
	AND        R17, R16
	LDD        R16, Y+31
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working308
	JMP        L__Easy_vacuum_95_10_4_simple_working124
L__Easy_vacuum_95_10_4_simple_working308:
;libs/main_function.mbas,426 :: 		inttostr(pwm_precnt,txt)
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
;libs/main_function.mbas,427 :: 		inttostr(minutes,txt)
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
;libs/main_function.mbas,429 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working309
	JMP        L__Easy_vacuum_95_10_4_simple_working127
L__Easy_vacuum_95_10_4_simple_working309:
;libs/main_function.mbas,430 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,431 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working127:
;libs/main_function.mbas,434 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Easy_vacuum_95_10_4_simple_working129:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working129
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working129
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working129
;libs/main_function.mbas,435 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working310
	JMP        L__Easy_vacuum_95_10_4_simple_working132
L__Easy_vacuum_95_10_4_simple_working310:
;libs/main_function.mbas,436 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0   while_state_import=0                 ' Update flag
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
L__Easy_vacuum_95_10_4_simple_working132:
;libs/main_function.mbas,439 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working311
	JMP        L__Easy_vacuum_95_10_4_simple_working135
L__Easy_vacuum_95_10_4_simple_working311:
;libs/main_function.mbas,440 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,441 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,442 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_working135:
;libs/main_function.mbas,443 :: 		end if
L__Easy_vacuum_95_10_4_simple_working124:
;libs/main_function.mbas,447 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,454 :: 		Write_Time(hours, 0x00, 0x00, day, week,   month,year)
	LDS        R8, _year+0
	LDS        R7, _month+0
	LDS        R6, _week+0
	LDS        R5, _day+0
	CLR        R4
	CLR        R3
	LDS        R2, _hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,455 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,456 :: 		oldstate_3 =0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,459 :: 		j=0  Heater_motor_index=2   ht_start_sec=0 ht_start_min=0''sec_n1[0]=0 sec_n1[1]=0
	LDI        R27, 0
	STS        _j+0, R27
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 0
	STS        _ht_start_sec+0, R27
	LDI        R27, 0
	STS        _ht_start_min+0, R27
;libs/main_function.mbas,460 :: 		Heater_relay_Pin =0  oldstate_3 = 0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;libs/main_function.mbas,461 :: 		while_state_import=1    while_state_import_main=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,462 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_working138:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working139
;libs/main_function.mbas,465 :: 		if (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]= minutes ) and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]< (seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working312
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working312:
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
	BRSH       L__Easy_vacuum_95_10_4_simple_working313
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working313:
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple_working314
	JMP        L__Easy_vacuum_95_10_4_simple_working146
L__Easy_vacuum_95_10_4_simple_working314:
;libs/main_function.mbas,466 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working146:
;libs/main_function.mbas,468 :: 		if (while_state_import<>0)and ((auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) or    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]> seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R27, _while_state_import+0
	BST        R27, BitPos(_while_state_import+0)
	BLD        R25, 0
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working315
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working315:
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working316
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working316:
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
	BRSH       L__Easy_vacuum_95_10_4_simple_working317
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working317:
	MOV        R16, R27
	MOV        R17, R22
	OR         R17, R16
	CLR        R16
	SBRC       R25, 0
	INC        R16
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working318
	JMP        L__Easy_vacuum_95_10_4_simple_working149
L__Easy_vacuum_95_10_4_simple_working318:
;libs/main_function.mbas,471 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,472 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,473 :: 		bytetostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
;libs/main_function.mbas,475 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working319
	JMP        L__Easy_vacuum_95_10_4_simple_working152
L__Easy_vacuum_95_10_4_simple_working319:
;libs/main_function.mbas,476 :: 		PWM_MAKE (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,477 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working152:
;libs/main_function.mbas,481 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 0)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working320
	JMP        L__Easy_vacuum_95_10_4_simple_working155
L__Easy_vacuum_95_10_4_simple_working320:
;libs/main_function.mbas,482 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working155:
;libs/main_function.mbas,485 :: 		Heater_relay_on()
	CALL       libs/main_function_Heater_relay_on+0
;libs/main_function.mbas,490 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working321
	JMP        L__Easy_vacuum_95_10_4_simple_working158
L__Easy_vacuum_95_10_4_simple_working321:
;libs/main_function.mbas,491 :: 		if (Button(HET_SW_Port,HET_SW_bit, swich_time, 1)) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working322
	JMP        L__Easy_vacuum_95_10_4_simple_working161
L__Easy_vacuum_95_10_4_simple_working322:
;libs/main_function.mbas,492 :: 		oldstate_3 = 1 while_state_import=0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,493 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,494 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,496 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=minutes
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
;libs/main_function.mbas,497 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=seconds
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
;libs/main_function.mbas,498 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working161:
;libs/main_function.mbas,500 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working159
;libs/main_function.mbas,507 :: 		else
L__Easy_vacuum_95_10_4_simple_working158:
;libs/main_function.mbas,508 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) and (j=2) then    ' Detect logical one up key
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working323
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working323:
	MOV        R17, R27
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working324
	JMP        L__Easy_vacuum_95_10_4_simple_working164
L__Easy_vacuum_95_10_4_simple_working324:
;libs/main_function.mbas,509 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
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
;libs/main_function.mbas,512 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working164:
;libs/main_function.mbas,514 :: 		if (oldstate_3 and Button(Mot_SW_Port,Mot_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working325
	JMP        L__Easy_vacuum_95_10_4_simple_working167
L__Easy_vacuum_95_10_4_simple_working325:
;libs/main_function.mbas,515 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,516 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,517 :: 		Heater_relay_Pin =0  ''Saving_Mot_heater_On_mSec(auto_setting_enable)
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
L__Easy_vacuum_95_10_4_simple_working167:
;libs/main_function.mbas,519 :: 		end if
L__Easy_vacuum_95_10_4_simple_working159:
;libs/main_function.mbas,523 :: 		ht_start_sec=seconds
	LDS        R18, _seconds+0
	STS        _ht_start_sec+0, R18
;libs/main_function.mbas,524 :: 		if (seconds<>ht_start_min ) or (seconds=0) then
	LDS        R16, _ht_start_min+0
	CP         R18, R16
	LDI        R17, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working326
	LDI        R17, 255
L__Easy_vacuum_95_10_4_simple_working326:
	CPI        R18, 0
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working327
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working327:
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working328
	JMP        L__Easy_vacuum_95_10_4_simple_working170
L__Easy_vacuum_95_10_4_simple_working328:
;libs/main_function.mbas,525 :: 		ht_start_min=seconds
	LDS        R16, _seconds+0
	STS        _ht_start_min+0, R16
;libs/main_function.mbas,526 :: 		Show_message_done("Heater",chanel)
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
L__Easy_vacuum_95_10_4_simple_working170:
;libs/main_function.mbas,527 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working150
;libs/main_function.mbas,529 :: 		else
L__Easy_vacuum_95_10_4_simple_working149:
;libs/main_function.mbas,532 :: 		Heater_relay_Pin =0
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,533 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,534 :: 		Show_message_done("Heater",chanel) delay_ms(100)
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
;libs/main_function.mbas,535 :: 		Lcd_0()  ''Saving_Mot_heater_On_mSec()
	CALL       _Lcd_0+0
;libs/main_function.mbas,536 :: 		inttostr(chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,537 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,538 :: 		if j=1 then Lcd_Out(2,1,"Heater off") Lcd_Out(2,10,txt) delay_ms(300)  end if
	LDS        R16, _j+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4_simple_working329
	JMP        L__Easy_vacuum_95_10_4_simple_working175
L__Easy_vacuum_95_10_4_simple_working329:
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
;libs/main_function.mbas,539 :: 		if j=0 then Lcd_Out(2,1,"Heater Error") Lcd_Out(2,10,txt) delay_ms(300)  end if
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working330
	JMP        L__Easy_vacuum_95_10_4_simple_working180
L__Easy_vacuum_95_10_4_simple_working330:
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
;libs/main_function.mbas,540 :: 		Lcd_Out(1,1,"Off pwm heater mode")
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
;libs/main_function.mbas,541 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,542 :: 		end if
L__Easy_vacuum_95_10_4_simple_working150:
;libs/main_function.mbas,545 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working138
L__Easy_vacuum_95_10_4_simple_working139:
;libs/main_function.mbas,548 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L__Easy_vacuum_95_10_4_simple_working105:
;libs/main_function.mbas,554 :: 		Heater_motor_index=2 ''as Motor
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
;libs/main_function.mbas,555 :: 		Pwm_chanel_main=Motor_pwm_num ''Motor
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
;libs/main_function.mbas,556 :: 		while_state_import=1 Pwm_chanel=Pwm_chanel_main ''while_state_import_main2=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel+0, R27
;libs/main_function.mbas,558 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,559 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Motor micro SW") delay_ms(200) '' DDD7_bit =0
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
;libs/main_function.mbas,560 :: 		if (oldstate_3=1) then
	LDS        R27, _oldstate_3+0
	SBRS       R27, BitPos(_oldstate_3+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working187
;libs/main_function.mbas,561 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working331
	JMP        L__Easy_vacuum_95_10_4_simple_working190
L__Easy_vacuum_95_10_4_simple_working331:
;libs/main_function.mbas,562 :: 		while_state_import_main=1 oldstate_3=0
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	JMP        L__Easy_vacuum_95_10_4_simple_working191
;libs/main_function.mbas,563 :: 		else
L__Easy_vacuum_95_10_4_simple_working190:
;libs/main_function.mbas,564 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,565 :: 		end if
L__Easy_vacuum_95_10_4_simple_working191:
L__Easy_vacuum_95_10_4_simple_working187:
;libs/main_function.mbas,585 :: 		while  (while_state_import_main )
L__Easy_vacuum_95_10_4_simple_working193:
	LDS        R27, _while_state_import_main+0
	SBRS       R27, BitPos(_while_state_import_main+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working194
;libs/main_function.mbas,586 :: 		if ( Button(HET_SW_Port, HET_SW_bit,swich_time, 1)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working332
	JMP        L__Easy_vacuum_95_10_4_simple_working198
L__Easy_vacuum_95_10_4_simple_working332:
;libs/main_function.mbas,587 :: 		while_state_import_main=0
	LDS        R27, _while_state_import_main+0
	CBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
L__Easy_vacuum_95_10_4_simple_working198:
;libs/main_function.mbas,589 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!") delay_ms(200)
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
;libs/main_function.mbas,590 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working193
L__Easy_vacuum_95_10_4_simple_working194:
;libs/main_function.mbas,591 :: 		while_state_import_main=1
	LDS        R27, _while_state_import_main+0
	SBR        R27, BitMask(_while_state_import_main+0)
	STS        _while_state_import_main+0, R27
;libs/main_function.mbas,601 :: 		LCD_Out(2,9, "motor running")  ''Show on LCD
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
;libs/main_function.mbas,602 :: 		LCD_Out(2,1, "Value: ")  ''Show on LCD
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
;libs/main_function.mbas,604 :: 		Read_Time(@Start_hours, @Start_minutes_next, @Start_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,608 :: 		week=1
	LDI        R27, 1
	STS        _week+0, R27
;libs/main_function.mbas,609 :: 		chanel=program_number
	STS        _chanel+0, R2
;libs/main_function.mbas,611 :: 		if  (Pwm_chanel_main=Heater_pwm_num) then
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 1
	BREQ       L__Easy_vacuum_95_10_4_simple_working333
	JMP        L__Easy_vacuum_95_10_4_simple_working206
L__Easy_vacuum_95_10_4_simple_working333:
;libs/main_function.mbas,612 :: 		txt="Heater"
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
;libs/main_function.mbas,613 :: 		ht_start_min= minutes   ht_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _ht_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _ht_start_sec+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working207
;libs/main_function.mbas,614 :: 		else if  (Pwm_chanel_main=Motor_pwm_num)  then
L__Easy_vacuum_95_10_4_simple_working206:
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple_working334
	JMP        L__Easy_vacuum_95_10_4_simple_working209
L__Easy_vacuum_95_10_4_simple_working334:
;libs/main_function.mbas,615 :: 		txt="Motor"
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
;libs/main_function.mbas,616 :: 		Mo_start_min= minutes   Mo_start_sec=seconds
	LDS        R16, _minutes+0
	STS        _Mo_start_min+0, R16
	LDS        R16, _seconds+0
	STS        _Mo_start_sec+0, R16
L__Easy_vacuum_95_10_4_simple_working209:
;libs/main_function.mbas,618 :: 		end if
L__Easy_vacuum_95_10_4_simple_working207:
;libs/main_function.mbas,629 :: 		Write_Time(hours, 0x00, 0x00, day, week,   month,year)
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
;libs/main_function.mbas,630 :: 		while_state_import=1  j=0
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 0
	STS        _j+0, R27
;libs/main_function.mbas,631 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,632 :: 		for on_off2 =1 to 1   ' equal to on or off estate
	LDI        R27, 1
	STS        _on_off2+0, R27
L__Easy_vacuum_95_10_4_simple_working212:
;libs/main_function.mbas,635 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,636 :: 		while( while_state_import)
L__Easy_vacuum_95_10_4_simple_working220:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Easy_vacuum_95_10_4_simple_working221
;libs/main_function.mbas,638 :: 		if (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]= minutes ) and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]< (seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working335
	LDI        R22, 255
L__Easy_vacuum_95_10_4_simple_working335:
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
	BRSH       L__Easy_vacuum_95_10_4_simple_working336
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working336:
	AND        R16, R22
	BRNE       L__Easy_vacuum_95_10_4_simple_working337
	JMP        L__Easy_vacuum_95_10_4_simple_working225
L__Easy_vacuum_95_10_4_simple_working337:
;libs/main_function.mbas,640 :: 		if (j=2) then    ' Detect logical one up key
	LDS        R16, _j+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple_working338
	JMP        L__Easy_vacuum_95_10_4_simple_working228
L__Easy_vacuum_95_10_4_simple_working338:
;libs/main_function.mbas,641 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,643 :: 		Show_message_done("Motor",chanel) delay_ms(2000)
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
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L__Easy_vacuum_95_10_4_simple_working230:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working230
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working230
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working230
	NOP
	NOP
	NOP
	NOP
;libs/main_function.mbas,644 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,645 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,646 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
L__Easy_vacuum_95_10_4_simple_working232:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working232
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working232
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working232
	NOP
;libs/main_function.mbas,647 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
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
;libs/main_function.mbas,648 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
;libs/main_function.mbas,650 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L__Easy_vacuum_95_10_4_simple_working229
;libs/main_function.mbas,651 :: 		else
L__Easy_vacuum_95_10_4_simple_working228:
;libs/main_function.mbas,653 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!") delay_ms(3000)
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
	LDI        R18, 122
	LDI        R17, 193
	LDI        R16, 130
L__Easy_vacuum_95_10_4_simple_working234:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working234
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working234
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working234
	NOP
	NOP
;libs/main_function.mbas,654 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0))   then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working339
	JMP        L__Easy_vacuum_95_10_4_simple_working237
L__Easy_vacuum_95_10_4_simple_working339:
;libs/main_function.mbas,655 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working237:
;libs/main_function.mbas,657 :: 		end if
L__Easy_vacuum_95_10_4_simple_working229:
L__Easy_vacuum_95_10_4_simple_working225:
;libs/main_function.mbas,659 :: 		if (while_state_import<>0)and ((auto_setting_enable=1) or (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]>= minutes ) or    (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]> seconds)) then '' and (Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]<>0) then  '''OFF mode
	LDS        R27, _while_state_import+0
	BST        R27, BitPos(_while_state_import+0)
	BLD        R25, 0
	LDI        R27, 1
	CP         R4, R27
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working340
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working340:
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working341
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working341:
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
	BRSH       L__Easy_vacuum_95_10_4_simple_working342
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working342:
	MOV        R16, R27
	MOV        R17, R22
	OR         R17, R16
	CLR        R16
	SBRC       R25, 0
	INC        R16
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working343
	JMP        L__Easy_vacuum_95_10_4_simple_working240
L__Easy_vacuum_95_10_4_simple_working343:
;libs/main_function.mbas,668 :: 		pwm_precnt=integer ( ceil(Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]/10))
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
;libs/main_function.mbas,669 :: 		if j=0 then
	LDS        R16, _j+0
	CPI        R16, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working344
	JMP        L__Easy_vacuum_95_10_4_simple_working243
L__Easy_vacuum_95_10_4_simple_working344:
;libs/main_function.mbas,674 :: 		PWM_MAKE (Mot_heater_On_mSec[chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;libs/main_function.mbas,675 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working243:
;libs/main_function.mbas,677 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0)) then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working345
	JMP        L__Easy_vacuum_95_10_4_simple_working246
L__Easy_vacuum_95_10_4_simple_working345:
;libs/main_function.mbas,678 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working246:
;libs/main_function.mbas,686 :: 		ht_start_sec=seconds
	LDS        R18, _seconds+0
	STS        _ht_start_sec+0, R18
;libs/main_function.mbas,687 :: 		if (seconds<>ht_start_min ) or (seconds=0) then
	LDS        R16, _ht_start_min+0
	CP         R18, R16
	LDI        R17, 0
	BREQ       L__Easy_vacuum_95_10_4_simple_working346
	LDI        R17, 255
L__Easy_vacuum_95_10_4_simple_working346:
	CPI        R18, 0
	LDI        R16, 0
	BRNE       L__Easy_vacuum_95_10_4_simple_working347
	LDI        R16, 255
L__Easy_vacuum_95_10_4_simple_working347:
	OR         R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working348
	JMP        L__Easy_vacuum_95_10_4_simple_working249
L__Easy_vacuum_95_10_4_simple_working348:
;libs/main_function.mbas,688 :: 		ht_start_min=seconds
	LDS        R16, _seconds+0
	STS        _ht_start_min+0, R16
;libs/main_function.mbas,689 :: 		Show_message_done("Motor",chanel)
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
L__Easy_vacuum_95_10_4_simple_working249:
;libs/main_function.mbas,693 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,694 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
;libs/main_function.mbas,695 :: 		if (auto_setting_enable=1) then
	LDI        R27, 1
	CP         R4, R27
	BREQ       L__Easy_vacuum_95_10_4_simple_working349
	JMP        L__Easy_vacuum_95_10_4_simple_working252
L__Easy_vacuum_95_10_4_simple_working349:
;libs/main_function.mbas,697 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 1) and (seconds >=3)) then    ' Detect logical one up key
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
	BRLO       L__Easy_vacuum_95_10_4_simple_working350
	LDI        R27, 255
L__Easy_vacuum_95_10_4_simple_working350:
	MOV        R17, R27
	AND        R16, R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working351
	JMP        L__Easy_vacuum_95_10_4_simple_working255
L__Easy_vacuum_95_10_4_simple_working351:
;libs/main_function.mbas,698 :: 		oldstate_3 = 1 while_state_import=0  Heater_relay_Pin =0                    ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	IN         R27, PIND6_bit+0
	CBR        R27, BitMask(PIND6_bit+0)
	OUT        PIND6_bit+0, R27
;libs/main_function.mbas,699 :: 		PWM_MAKE (0,255,Pwm_chanel_main)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,701 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=minutes
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
;libs/main_function.mbas,702 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=seconds
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
;libs/main_function.mbas,703 :: 		Buzzer_on_off(1)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
L__Easy_vacuum_95_10_4_simple_working255:
;libs/main_function.mbas,704 :: 		end if
L__Easy_vacuum_95_10_4_simple_working252:
;libs/main_function.mbas,706 :: 		end if
	JMP        L__Easy_vacuum_95_10_4_simple_working241
;libs/main_function.mbas,707 :: 		else
L__Easy_vacuum_95_10_4_simple_working240:
;libs/main_function.mbas,709 :: 		if (j=2) then    ' Detect logical one up key
	LDS        R16, _j+0
	CPI        R16, 2
	BREQ       L__Easy_vacuum_95_10_4_simple_working352
	JMP        L__Easy_vacuum_95_10_4_simple_working258
L__Easy_vacuum_95_10_4_simple_working352:
;libs/main_function.mbas,710 :: 		PWM_MAKE (0,255,Pwm_chanel_main)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDS        R4, _Pwm_chanel_main+0
	LDI        R27, 255
	MOV        R3, R27
	CLR        R2
	CALL       _PWM_MAKE+0
;libs/main_function.mbas,712 :: 		Show_message_done("Motor",chanel) delay_ms(2000)
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
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L__Easy_vacuum_95_10_4_simple_working260:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working260
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working260
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working260
	NOP
	NOP
	NOP
	NOP
;libs/main_function.mbas,713 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,714 :: 		Lcd_Out(1,1,txt) Lcd_Out(1,8,"is Off:")
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
;libs/main_function.mbas,715 :: 		Lcd_Out(2,1,"Prog num:") Lcd_Out(2,10,txt) delay_ms(200)
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
L__Easy_vacuum_95_10_4_simple_working262:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working262
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working262
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working262
	NOP
;libs/main_function.mbas,716 :: 		Lcd_Out(1,1,"Off pwm Motor mode")
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
;libs/main_function.mbas,717 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
;libs/main_function.mbas,719 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L__Easy_vacuum_95_10_4_simple_working259
;libs/main_function.mbas,720 :: 		else
L__Easy_vacuum_95_10_4_simple_working258:
;libs/main_function.mbas,722 :: 		Lcd_0()Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Downing the Pad !!") delay_ms(3000)
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
	LDI        R18, 122
	LDI        R17, 193
	LDI        R16, 130
L__Easy_vacuum_95_10_4_simple_working264:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working264
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working264
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working264
	NOP
	NOP
;libs/main_function.mbas,723 :: 		if (Button(Mot_SW_Port,Mot_SW_bit, swich_time, 0))   then
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
	BRNE       L__Easy_vacuum_95_10_4_simple_working353
	JMP        L__Easy_vacuum_95_10_4_simple_working267
L__Easy_vacuum_95_10_4_simple_working353:
;libs/main_function.mbas,724 :: 		j=2
	LDI        R27, 2
	STS        _j+0, R27
L__Easy_vacuum_95_10_4_simple_working267:
;libs/main_function.mbas,726 :: 		end if
L__Easy_vacuum_95_10_4_simple_working259:
;libs/main_function.mbas,728 :: 		end if
L__Easy_vacuum_95_10_4_simple_working241:
;libs/main_function.mbas,729 :: 		wend
	JMP        L__Easy_vacuum_95_10_4_simple_working220
L__Easy_vacuum_95_10_4_simple_working221:
;libs/main_function.mbas,734 :: 		end if
L__Easy_vacuum_95_10_4_simple_working218:
;libs/main_function.mbas,735 :: 		next on_off2
	LDS        R16, _on_off2+0
	CPI        R16, 1
	BRNE       L__Easy_vacuum_95_10_4_simple_working354
	JMP        L__Easy_vacuum_95_10_4_simple_working215
L__Easy_vacuum_95_10_4_simple_working354:
	LDS        R16, _on_off2+0
	SUBI       R16, 255
	STS        _on_off2+0, R16
	JMP        L__Easy_vacuum_95_10_4_simple_working212
L__Easy_vacuum_95_10_4_simple_working215:
;libs/main_function.mbas,739 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;libs/main_function.mbas,741 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/main_function.mbas,745 :: 		Read_Time(@Start_hours, @End_minutes_next, @End_seconds_next, @Start_day, @Start_week, @Start_month, @Start_year)
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
;libs/main_function.mbas,748 :: 		Write_Time((Start_hours),(Start_minutes+End_minutes_next),(Start_seconds+End_seconds_next),
	LDS        R17, _Start_minutes+0
	LDS        R16, _End_minutes_next+0
	MOV        R18, R17
	ADD        R18, R16
	LDS        R17, _Start_seconds+0
	LDS        R16, _End_seconds_next+0
	ADD        R16, R17
;libs/main_function.mbas,749 :: 		(Start_day),(Start_week),(Start_month),(Start_year))
	LDS        R8, _Start_year+0
	LDS        R7, _Start_month+0
	LDS        R6, _Start_week+0
	LDS        R5, _Start_day+0
	MOV        R4, R16
	MOV        R3, R18
	LDS        R2, _Start_hours+0
	CALL       _Write_Time+0
;libs/main_function.mbas,758 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/main_function.mbas,759 :: 		inttostr(End_seconds_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_seconds_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,760 :: 		Lcd_Out(1,1,"Sec ended is :") Lcd_Out(1,10,txt)
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
;libs/main_function.mbas,761 :: 		inttostr(End_minutes_next,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _End_minutes_next+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;libs/main_function.mbas,762 :: 		Lcd_Out(2,1,"Min ended is :") Lcd_Out(2,10,txt) delay_ms(200)
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
L__Easy_vacuum_95_10_4_simple_working269:
	DEC        R16
	BRNE       L__Easy_vacuum_95_10_4_simple_working269
	DEC        R17
	BRNE       L__Easy_vacuum_95_10_4_simple_working269
	DEC        R18
	BRNE       L__Easy_vacuum_95_10_4_simple_working269
	NOP
;libs/main_function.mbas,763 :: 		end sub
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

;libs/main_function.mbas,765 :: 		end.
L_end_libs/main_function_?main:
	RET
; end of _libs/main_function_?main
