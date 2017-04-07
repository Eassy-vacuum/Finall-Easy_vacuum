
_key_test_old:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,181 :: 		sub procedure key_test_old()
;MyProject.mbas,182 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0   oldstate_4=0
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
	LDI        R27, 0
	STS        _oldstate_menu+0, R27
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,183 :: 		Heater_motor_index=2 Pwm_chanel_main=3   k=0
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;MyProject.mbas,184 :: 		chanel=Mot_heater_On_mSec [Choice_number-1][Heater_motor_index-1][Pwm_chanel_main-1][0]
	LDI        R18, 12
	LDI        R19, 0
	LDI        R16, #lo_addr(_Mot_heater_On_mSec+48)
	LDI        R17, hi_addr(_Mot_heater_On_mSec+48)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 8
	LD         R16, Z
	STS        _chanel+0, R16
;MyProject.mbas,186 :: 		while  (while_state_import )
L__key_test_old2:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_old3
;MyProject.mbas,187 :: 		oldstate_menu=oldstate_menu+1
	LDS        R16, _oldstate_menu+0
	SUBI       R16, 255
	STS        _oldstate_menu+0, R16
;MyProject.mbas,188 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,189 :: 		if ((oldstate_menu mod 6)=1) or ((oldstate_menu mod 6)=3)or ((oldstate_menu mod 6)=5) then
	LDS        R16, _oldstate_menu+0
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 1
	LDI        R18, 0
	BRNE       L__key_test_old209
	LDI        R18, 255
L__key_test_old209:
	CPI        R16, 3
	LDI        R17, 0
	BRNE       L__key_test_old210
	LDI        R17, 255
L__key_test_old210:
	OR         R17, R18
	CPI        R16, 5
	LDI        R27, 0
	BRNE       L__key_test_old211
	LDI        R27, 255
L__key_test_old211:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__key_test_old212
	JMP        L__key_test_old7
L__key_test_old212:
;MyProject.mbas,192 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Press Start SW")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
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
	JMP        L__key_test_old8
;MyProject.mbas,193 :: 		else
L__key_test_old7:
;MyProject.mbas,195 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Or Hold Start SW")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
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
;MyProject.mbas,196 :: 		end if
L__key_test_old8:
;MyProject.mbas,199 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,200 :: 		while (while_state_2_2<=5 )
L__key_test_old10:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L__key_test_old213
	JMP        L__key_test_old11
L__key_test_old213:
;MyProject.mbas,201 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,203 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,50,1)<> 0)
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 50
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__key_test_old214
	LDI        R27, 255
L__key_test_old214:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,204 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,50,1)<> 0)then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 50
	MOV        R5, R27
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L__key_test_old215
	LDI        R17, 255
L__key_test_old215:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test_old216
	JMP        L__key_test_old15
L__key_test_old216:
;MyProject.mbas,205 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,206 :: 		while (while_state_import=1)
L__key_test_old18:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_old19
;MyProject.mbas,207 :: 		j=j+1
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
;MyProject.mbas,208 :: 		if (k<=4) then ''else
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 4
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__key_test_old217
	JMP        L__key_test_old23
L__key_test_old217:
;MyProject.mbas,209 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0)) then
	CLR        R6
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_4+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_4+0)
	INC        R17
	AND        R16, R17
	BRNE       L__key_test_old218
	JMP        L__key_test_old26
L__key_test_old218:
;MyProject.mbas,211 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,212 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,213 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test_old28:
	DEC        R16
	BRNE       L__key_test_old28
	DEC        R17
	BRNE       L__key_test_old28
	DEC        R18
	BRNE       L__key_test_old28
;MyProject.mbas,214 :: 		while (while_state_import_main2 )
L__key_test_old31:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test_old32
;MyProject.mbas,215 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
	CLR        R6
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	TST        R16
	BRNE       L__key_test_old219
	JMP        L__key_test_old36
L__key_test_old219:
;MyProject.mbas,216 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,217 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test_old36:
;MyProject.mbas,219 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__key_test_old220
	JMP        L__key_test_old39
L__key_test_old220:
;MyProject.mbas,220 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test_old39:
;MyProject.mbas,223 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test_old42
;MyProject.mbas,224 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test_old44:
	DEC        R16
	BRNE       L__key_test_old44
	DEC        R17
	BRNE       L__key_test_old44
	DEC        R18
	BRNE       L__key_test_old44
L__key_test_old42:
;MyProject.mbas,226 :: 		wend
	JMP        L__key_test_old31
L__key_test_old32:
L__key_test_old26:
;MyProject.mbas,227 :: 		end if
L__key_test_old23:
;MyProject.mbas,231 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,200,1)<> 0)
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 200
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__key_test_old221
	LDI        R27, 255
L__key_test_old221:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,232 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,200,1)<> 0)then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 200
	MOV        R5, R27
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L__key_test_old222
	LDI        R17, 255
L__key_test_old222:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test_old223
	JMP        L__key_test_old47
L__key_test_old223:
;MyProject.mbas,233 :: 		k= k+1
	LDS        R16, _k+0
	LDS        R17, _k+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _k+0, R16
	STS        _k+1, R17
;MyProject.mbas,234 :: 		oldstate_4=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
L__key_test_old47:
;MyProject.mbas,236 :: 		if j>=16 then
	LDS        R16, _j+0
	CPI        R16, 16
	BRSH       L__key_test_old224
	JMP        L__key_test_old50
L__key_test_old224:
;MyProject.mbas,237 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0)) then
	CLR        R6
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_4+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_4+0)
	INC        R17
	AND        R16, R17
	BRNE       L__key_test_old225
	JMP        L__key_test_old53
L__key_test_old225:
;MyProject.mbas,239 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,240 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,241 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test_old55:
	DEC        R16
	BRNE       L__key_test_old55
	DEC        R17
	BRNE       L__key_test_old55
	DEC        R18
	BRNE       L__key_test_old55
;MyProject.mbas,242 :: 		while (while_state_import_main2 )
L__key_test_old58:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test_old59
;MyProject.mbas,243 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
	CLR        R6
	CLR        R5
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	TST        R16
	BRNE       L__key_test_old226
	JMP        L__key_test_old63
L__key_test_old226:
;MyProject.mbas,244 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,245 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test_old63:
;MyProject.mbas,247 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__key_test_old227
	JMP        L__key_test_old66
L__key_test_old227:
;MyProject.mbas,248 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test_old66:
;MyProject.mbas,251 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test_old69
;MyProject.mbas,252 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test_old71:
	DEC        R16
	BRNE       L__key_test_old71
	DEC        R17
	BRNE       L__key_test_old71
	DEC        R18
	BRNE       L__key_test_old71
L__key_test_old69:
;MyProject.mbas,254 :: 		wend
	JMP        L__key_test_old58
L__key_test_old59:
L__key_test_old53:
;MyProject.mbas,255 :: 		end if
L__key_test_old50:
;MyProject.mbas,258 :: 		if k>=10 then
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__key_test_old228
	JMP        L__key_test_old74
L__key_test_old228:
;MyProject.mbas,259 :: 		oldstate_3=1
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,260 :: 		if (oldstate_3 and Button(Menu_SW_Port,Menu_SW_bit,2,0))   then
	CLR        R6
	LDI        R27, 2
	MOV        R5, R27
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
	BRNE       L__key_test_old229
	JMP        L__key_test_old77
L__key_test_old229:
;MyProject.mbas,262 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
;MyProject.mbas,264 :: 		Keypad_start(chanel,"advance")
	MOVW       R30, R28
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOV        R3, R16
	MOV        R4, R17
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
L__key_test_old77:
;MyProject.mbas,267 :: 		end if
L__key_test_old74:
;MyProject.mbas,278 :: 		wend
	JMP        L__key_test_old18
L__key_test_old19:
L__key_test_old15:
;MyProject.mbas,335 :: 		Delay_mS(200)
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test_old79:
	DEC        R16
	BRNE       L__key_test_old79
	DEC        R17
	BRNE       L__key_test_old79
	DEC        R18
	BRNE       L__key_test_old79
;MyProject.mbas,336 :: 		wend
	JMP        L__key_test_old10
L__key_test_old11:
;MyProject.mbas,337 :: 		wend delay_ms(100)
	JMP        L__key_test_old2
L__key_test_old3:
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test_old81:
	DEC        R16
	BRNE       L__key_test_old81
	DEC        R17
	BRNE       L__key_test_old81
	DEC        R18
	BRNE       L__key_test_old81
	NOP
;MyProject.mbas,338 :: 		end sub
L_end_key_test_old:
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
; end of _key_test_old

_key_test_0:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 31
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,405 :: 		sub procedure key_test_0()
;MyProject.mbas,406 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0   oldstate_4=0
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
	LDI        R27, 0
	STS        _oldstate_menu+0, R27
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,407 :: 		Heater_motor_index=2 Pwm_chanel_main=3   k=0
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;MyProject.mbas,408 :: 		chanel=Mot_heater_On_mSec [Choice_number-1][Heater_motor_index-1][Pwm_chanel_main-1][0]
	LDI        R18, 12
	LDI        R19, 0
	LDI        R16, #lo_addr(_Mot_heater_On_mSec+48)
	LDI        R17, hi_addr(_Mot_heater_On_mSec+48)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 8
	LD         R16, Z
	STS        _chanel+0, R16
;MyProject.mbas,410 :: 		while  (while_state_import )
L__key_test_085:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_086
;MyProject.mbas,411 :: 		oldstate_menu=oldstate_menu+1
	LDS        R16, _oldstate_menu+0
	SUBI       R16, 255
	STS        _oldstate_menu+0, R16
;MyProject.mbas,413 :: 		if ((oldstate_menu mod 6)=1) or ((oldstate_menu mod 6)=3)or ((oldstate_menu mod 6)=5) then
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 1
	LDI        R27, 0
	BRNE       L__key_test_0231
	LDI        R27, 255
L__key_test_0231:
	MOV        R16, R27
	STD        Y+25, R16
	LDS        R16, _oldstate_menu+0
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 3
	LDI        R18, 0
	BRNE       L__key_test_0232
	LDI        R18, 255
L__key_test_0232:
	LDD        R17, Y+25
	OR         R17, R18
	CPI        R16, 5
	LDI        R27, 0
	BRNE       L__key_test_0233
	LDI        R27, 255
L__key_test_0233:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__key_test_0234
	JMP        L__key_test_090
L__key_test_0234:
;MyProject.mbas,416 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Press Start SW")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
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
	JMP        L__key_test_091
;MyProject.mbas,417 :: 		else
L__key_test_090:
;MyProject.mbas,419 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Or Hold Start SW")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
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
;MyProject.mbas,420 :: 		end if
L__key_test_091:
;MyProject.mbas,424 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,425 :: 		while (while_state_2_2<=8 )
L__key_test_093:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 8
	CP         R16, R17
	BRSH       L__key_test_0235
	JMP        L__key_test_094
L__key_test_0235:
;MyProject.mbas,426 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,430 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,5,1)<> 0)
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__key_test_0236
	LDI        R27, 255
L__key_test_0236:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,431 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,5,1)<> 0)then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L__key_test_0237
	LDI        R17, 255
L__key_test_0237:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test_0238
	JMP        L__key_test_098
L__key_test_0238:
;MyProject.mbas,432 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,433 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+30, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+29, R16
	CLR        R2
	CALL       _Dec2Bcd+0
	STD        Y+28, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+27, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+26, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Dec2Bcd+0
	STD        Y+25, R16
	LDS        R2, _Start_year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+30
	LDD        R21, Y+29
	LDD        R20, Y+28
	LDD        R19, Y+27
	LDD        R18, Y+26
	LDD        R17, Y+25
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
;MyProject.mbas,436 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,439 :: 		k =seconds
	LDS        R16, _seconds+0
	STS        _k+0, R16
	LDI        R27, 0
	STS        _k+1, R27
;MyProject.mbas,440 :: 		while (while_state_import=1)
L__key_test_0101:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_0102
;MyProject.mbas,441 :: 		j=j+1
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
;MyProject.mbas,443 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,444 :: 		delay_ms(50)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test_0105:
	DEC        R16
	BRNE       L__key_test_0105
	DEC        R17
	BRNE       L__key_test_0105
	DEC        R18
	BRNE       L__key_test_0105
;MyProject.mbas,445 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,5,0)) then
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_4+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_4+0)
	INC        R17
	AND        R16, R17
	BRNE       L__key_test_0239
	JMP        L__key_test_0108
L__key_test_0239:
;MyProject.mbas,467 :: 		if (seconds< k + 1 )  then
	LDS        R16, _k+0
	LDS        R17, _k+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	LDS        R16, _seconds+0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__key_test_0240
	JMP        L__key_test_0111
L__key_test_0240:
;MyProject.mbas,470 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,471 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,472 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test_0113:
	DEC        R16
	BRNE       L__key_test_0113
	DEC        R17
	BRNE       L__key_test_0113
	DEC        R18
	BRNE       L__key_test_0113
;MyProject.mbas,473 :: 		while (while_state_import_main2 )
L__key_test_0116:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test_0117
;MyProject.mbas,474 :: 		if (Button(HET_SW_Port, HET_SW_bit, 5, 0)) then    ' Detect logical one up key
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
	TST        R16
	BRNE       L__key_test_0241
	JMP        L__key_test_0121
L__key_test_0241:
;MyProject.mbas,475 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,476 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test_0121:
;MyProject.mbas,479 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,50, 1)) then
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 50
	MOV        R5, R27
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
	BRNE       L__key_test_0242
	JMP        L__key_test_0124
L__key_test_0242:
;MyProject.mbas,480 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=11
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
L__key_test_0124:
;MyProject.mbas,483 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test_0127
;MyProject.mbas,484 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test_0129:
	DEC        R16
	BRNE       L__key_test_0129
	DEC        R17
	BRNE       L__key_test_0129
	DEC        R18
	BRNE       L__key_test_0129
L__key_test_0127:
;MyProject.mbas,486 :: 		wend
	JMP        L__key_test_0116
L__key_test_0117:
	JMP        L__key_test_0112
;MyProject.mbas,489 :: 		else
L__key_test_0111:
;MyProject.mbas,490 :: 		oldstate_3=1
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,493 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=11
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
;MyProject.mbas,495 :: 		Keypad_start(chanel,"advance")
	MOVW       R30, R28
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOV        R3, R16
	MOV        R4, R17
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
;MyProject.mbas,497 :: 		end if
L__key_test_0112:
L__key_test_0108:
;MyProject.mbas,510 :: 		wend
	JMP        L__key_test_0101
L__key_test_0102:
L__key_test_098:
;MyProject.mbas,514 :: 		Delay_mS(200)
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test_0131:
	DEC        R16
	BRNE       L__key_test_0131
	DEC        R17
	BRNE       L__key_test_0131
	DEC        R18
	BRNE       L__key_test_0131
;MyProject.mbas,515 :: 		wend
	JMP        L__key_test_093
L__key_test_094:
;MyProject.mbas,516 :: 		wend delay_ms(100)
	JMP        L__key_test_085
L__key_test_086:
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test_0133:
	DEC        R16
	BRNE       L__key_test_0133
	DEC        R17
	BRNE       L__key_test_0133
	DEC        R18
	BRNE       L__key_test_0133
	NOP
;MyProject.mbas,517 :: 		end sub
L_end_key_test_0:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _key_test_0

_key_test:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,519 :: 		sub procedure key_test()
;MyProject.mbas,520 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0   oldstate_4=0
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
	LDI        R27, 0
	STS        _oldstate_menu+0, R27
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,521 :: 		Heater_motor_index=2 Pwm_chanel_main=3   k=0
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;MyProject.mbas,523 :: 		chanel=Mot_heater_On_mSec [Choice_number-1][Heater_motor_index-1][Pwm_chanel_main-1][0]
	LDI        R18, 12
	LDI        R19, 0
	LDI        R16, #lo_addr(_Mot_heater_On_mSec+48)
	LDI        R17, hi_addr(_Mot_heater_On_mSec+48)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 8
	LD         R16, Z
	STS        _chanel+0, R16
;MyProject.mbas,525 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,526 :: 		Start_seconds=seconds   kp1=0
	LDS        R16, _seconds+0
	STS        _Start_seconds+0, R16
	LDI        R27, 0
	STS        _kp1+0, R27
;MyProject.mbas,527 :: 		Lcd_0() Lcd_Out(1,1,"      Ready      ") Lcd_Out(2,1,"Press Start SW")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
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
;MyProject.mbas,528 :: 		while  (while_state_import )
L__key_test137:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test138
;MyProject.mbas,529 :: 		oldstate_menu=oldstate_menu+1
	LDS        R16, _oldstate_menu+0
	SUBI       R16, 255
	STS        _oldstate_menu+0, R16
;MyProject.mbas,530 :: 		if seconds<>Start_seconds   then
	LDS        R17, _seconds+0
	LDS        R16, _Start_seconds+0
	CP         R17, R16
	BRNE       L__key_test244
	JMP        L__key_test142
L__key_test244:
;MyProject.mbas,531 :: 		inc(kp1)
	LDS        R16, _kp1+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _kp1+0, R17
;MyProject.mbas,532 :: 		Start_seconds=seconds
	LDS        R16, _seconds+0
	STS        _Start_seconds+0, R16
;MyProject.mbas,533 :: 		if ((kp1 mod 2)=1)  then
	MOV        R16, R17
	ANDI       R16, 1
	CPI        R16, 1
	BREQ       L__key_test245
	JMP        L__key_test145
L__key_test245:
;MyProject.mbas,534 :: 		Lcd_0() Lcd_Out(1,1,"      Ready      ") Lcd_Out(2,1,"Press Start SW")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
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
	JMP        L__key_test146
;MyProject.mbas,535 :: 		else
L__key_test145:
;MyProject.mbas,536 :: 		Lcd_0() Lcd_Out(1,1,"      Ready      ") Lcd_Out(2,1,"Or Hold Start SW")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
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
	MOVW       R30, R28
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
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
;MyProject.mbas,537 :: 		end if
L__key_test146:
L__key_test142:
;MyProject.mbas,539 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,551 :: 		target_sec=0 target_min=0 target_hr=0
	LDI        R27, 0
	STS        _target_sec+0, R27
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_hr+0, R27
;MyProject.mbas,552 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,553 :: 		while (while_state_2_2<=8 )
L__key_test148:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 8
	CP         R16, R17
	BRSH       L__key_test246
	JMP        L__key_test149
L__key_test246:
;MyProject.mbas,554 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,557 :: 		if (Button(Up_SW_Port, Up_SW_bit,1,1)<>0) then
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__key_test247
	JMP        L__key_test153
L__key_test247:
;MyProject.mbas,558 :: 		while_state_import=0   while_state_2_2=11
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
;MyProject.mbas,559 :: 		Keypad_start(chanel,"heater")
	MOVW       R30, R28
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOV        R3, R16
	MOV        R4, R17
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
L__key_test153:
;MyProject.mbas,561 :: 		if (Button(Down_SW_Port, Down_SW_bit,1,1)<> 0) then
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__key_test248
	JMP        L__key_test156
L__key_test248:
;MyProject.mbas,562 :: 		while_state_import=0   while_state_2_2=11
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
;MyProject.mbas,563 :: 		Keypad_start(chanel,"motor")
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOV        R3, R16
	MOV        R4, R17
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
L__key_test156:
;MyProject.mbas,565 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,5,1)<> 0)
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L__key_test249
	LDI        R27, 255
L__key_test249:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,566 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,5,1)<> 0)then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L__key_test250
	LDI        R17, 255
L__key_test250:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test251
	JMP        L__key_test159
L__key_test251:
;MyProject.mbas,567 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,570 :: 		target_sec=0 target_min=0 target_hr=0
	LDI        R27, 0
	STS        _target_sec+0, R27
	LDI        R27, 0
	STS        _target_min+0, R27
	LDI        R27, 0
	STS        _target_hr+0, R27
;MyProject.mbas,571 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,572 :: 		Start_seconds=seconds Start_minutes=minutes Start_hours=hours
	LDS        R16, _seconds+0
	STS        _Start_seconds+0, R16
	LDS        R16, _minutes+0
	STS        _Start_minutes+0, R16
	LDS        R16, _hours+0
	STS        _Start_hours+0, R16
;MyProject.mbas,573 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,575 :: 		DS1307(hours, minutes, seconds) 'seconds=target_sec minutes=target_min hours=target_hr
	LDS        R4, _seconds+0
	LDS        R3, _minutes+0
	LDS        R2, _hours+0
	CALL       _DS1307+0
;MyProject.mbas,576 :: 		k =target_sec
	LDS        R16, _target_sec+0
	STS        _k+0, R16
	LDI        R27, 0
	STS        _k+1, R27
;MyProject.mbas,578 :: 		while (while_state_import=1)
L__key_test162:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test163
;MyProject.mbas,579 :: 		j=j+1
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
;MyProject.mbas,581 :: 		Start_seconds=seconds Start_minutes=minutes Start_hours=hours
	LDS        R16, _seconds+0
	STS        _Start_seconds+0, R16
	LDS        R16, _minutes+0
	STS        _Start_minutes+0, R16
	LDS        R16, _hours+0
	STS        _Start_hours+0, R16
;MyProject.mbas,582 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,584 :: 		DS1307(hours, minutes, seconds) 'seconds=target_sec minutes=target_min hours=target_hr
	LDS        R4, _seconds+0
	LDS        R3, _minutes+0
	LDS        R2, _hours+0
	CALL       _DS1307+0
;MyProject.mbas,586 :: 		delay_ms(50)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test166:
	DEC        R16
	BRNE       L__key_test166
	DEC        R17
	BRNE       L__key_test166
	DEC        R18
	BRNE       L__key_test166
;MyProject.mbas,587 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,5,0)) then
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_4+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_4+0)
	INC        R17
	AND        R16, R17
	BRNE       L__key_test252
	JMP        L__key_test169
L__key_test252:
;MyProject.mbas,609 :: 		if (target_sec< k + 2 )  then
	LDS        R16, _k+0
	LDS        R17, _k+1
	MOVW       R18, R16
	SUBI       R18, 254
	SBCI       R19, 255
	LDS        R16, _target_sec+0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__key_test253
	JMP        L__key_test172
L__key_test253:
;MyProject.mbas,612 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,613 :: 		while_state_import_main2=1 oldstate_3=0    j=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 0
	STS        _j+0, R27
;MyProject.mbas,615 :: 		while (while_state_import_main2 )
L__key_test175:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test176
;MyProject.mbas,616 :: 		if (oldstate_3=0) and (j=0) then
	LDS        R27, _oldstate_3+0
	CBR        R20, 1
	SBRS       R27, BitPos(_oldstate_3+0)
	SBR        R20, 1
	LDS        R16, _j+0
	CPI        R16, 0
	LDI        R17, 0
	BRNE       L__key_test256
	LDI        R17, 255
L__key_test256:
	CLR        R16
	SBRC       R20, 0
	INC        R16
	AND        R16, R17
	BRNE       L__key_test257
	JMP        L__key_test180
L__key_test257:
;MyProject.mbas,617 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") ''delay_ms(700)
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
;MyProject.mbas,618 :: 		j=1
	LDI        R27, 1
	STS        _j+0, R27
L__key_test180:
;MyProject.mbas,620 :: 		if (Button(HET_SW_Port, HET_SW_bit, 5, 0)<>0) then    ' Detect logical one up key
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
	CPI        R16, 0
	BRNE       L__key_test258
	JMP        L__key_test183
L__key_test258:
;MyProject.mbas,621 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,622 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test183:
;MyProject.mbas,626 :: 		if (oldstate_3) then
	LDS        R27, _oldstate_3+0
	SBRS       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test186
;MyProject.mbas,627 :: 		if Button(HET_SW_Port, HET_SW_bit,50, 1)<>0 then
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 50
	MOV        R5, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__key_test259
	JMP        L__key_test189
L__key_test259:
;MyProject.mbas,628 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=11
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
L__key_test189:
;MyProject.mbas,631 :: 		end if
L__key_test186:
;MyProject.mbas,634 :: 		wend
	JMP        L__key_test175
L__key_test176:
	JMP        L__key_test173
;MyProject.mbas,637 :: 		else
L__key_test172:
;MyProject.mbas,638 :: 		oldstate_3=1
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,641 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=11
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
;MyProject.mbas,643 :: 		Keypad_start(chanel,"advance")
	MOVW       R30, R28
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOV        R3, R16
	MOV        R4, R17
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
;MyProject.mbas,645 :: 		end if
L__key_test173:
L__key_test169:
;MyProject.mbas,658 :: 		wend
	JMP        L__key_test162
L__key_test163:
L__key_test159:
;MyProject.mbas,662 :: 		Delay_mS(200)
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__key_test191:
	DEC        R16
	BRNE       L__key_test191
	DEC        R17
	BRNE       L__key_test191
	DEC        R18
	BRNE       L__key_test191
;MyProject.mbas,663 :: 		wend
	JMP        L__key_test148
L__key_test149:
;MyProject.mbas,664 :: 		wend delay_ms(100)
	JMP        L__key_test137
L__key_test138:
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test193:
	DEC        R16
	BRNE       L__key_test193
	DEC        R17
	BRNE       L__key_test193
	DEC        R18
	BRNE       L__key_test193
	NOP
;MyProject.mbas,665 :: 		end sub
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

;MyProject.mbas,667 :: 		main:
;MyProject.mbas,755 :: 		Lcd_Port_Init()
	PUSH       R2
	CALL       _Lcd_Port_Init+0
;MyProject.mbas,757 :: 		Key_Port_Init_mainfunc()
	CALL       _Key_Port_Init_mainfunc+0
;MyProject.mbas,758 :: 		PWM_Port_Initialize ()
	CALL       _PWM_Port_Initialize+0
;MyProject.mbas,760 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,761 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,762 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,773 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,774 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,776 :: 		chanel=1  Pwm_chanel=1  on_off2=1   week_new=week    chanel_active=1
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
;MyProject.mbas,891 :: 		PWM_Initialize () int_eeprom_ini()
	CALL       _PWM_Initialize+0
	CALL       _int_eeprom_ini+0
;MyProject.mbas,892 :: 		timer0_init()
	CALL       _timer0_init+0
;MyProject.mbas,893 :: 		Lcd_0() Delay_mS(200)
	CALL       _Lcd_0+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__main196:
	DEC        R16
	BRNE       L__main196
	DEC        R17
	BRNE       L__main196
	DEC        R18
	BRNE       L__main196
;MyProject.mbas,926 :: 		while 1
L__main199:
;MyProject.mbas,929 :: 		key_test()
	CALL       _key_test+0
;MyProject.mbas,940 :: 		wend
	JMP        L__main199
;MyProject.mbas,942 :: 		wend
L_end_main:
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
