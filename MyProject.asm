
_key_test_old:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,136 :: 		sub procedure key_test_old()
;MyProject.mbas,137 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0   oldstate_4=0
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
;MyProject.mbas,138 :: 		Heater_motor_index=2 Pwm_chanel_main=3   k=0
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;MyProject.mbas,139 :: 		chanel=Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]
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
;MyProject.mbas,141 :: 		while  (while_state_import )
L__key_test_old2:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_old3
;MyProject.mbas,142 :: 		oldstate_menu=oldstate_menu+1
	LDS        R16, _oldstate_menu+0
	SUBI       R16, 255
	STS        _oldstate_menu+0, R16
;MyProject.mbas,143 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,144 :: 		if ((oldstate_menu mod 6)=1) or ((oldstate_menu mod 6)=3)or ((oldstate_menu mod 6)=5) then
	LDS        R16, _oldstate_menu+0
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 1
	LDI        R18, 0
	BRNE       L__key_test_old149
	LDI        R18, 255
L__key_test_old149:
	CPI        R16, 3
	LDI        R17, 0
	BRNE       L__key_test_old150
	LDI        R17, 255
L__key_test_old150:
	OR         R17, R18
	CPI        R16, 5
	LDI        R27, 0
	BRNE       L__key_test_old151
	LDI        R27, 255
L__key_test_old151:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__key_test_old152
	JMP        L__key_test_old7
L__key_test_old152:
;MyProject.mbas,147 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Press Start SW")
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
;MyProject.mbas,148 :: 		else
L__key_test_old7:
;MyProject.mbas,150 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Or Hold Start SW")
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
;MyProject.mbas,151 :: 		end if
L__key_test_old8:
;MyProject.mbas,154 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,155 :: 		while (while_state_2_2<=5 )
L__key_test_old10:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L__key_test_old153
	JMP        L__key_test_old11
L__key_test_old153:
;MyProject.mbas,156 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,158 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,50,1)<> 0)
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
	BREQ       L__key_test_old154
	LDI        R27, 255
L__key_test_old154:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,159 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,50,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test_old155
	LDI        R17, 255
L__key_test_old155:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test_old156
	JMP        L__key_test_old15
L__key_test_old156:
;MyProject.mbas,160 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,161 :: 		while (while_state_import=1)
L__key_test_old18:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_old19
;MyProject.mbas,162 :: 		j=j+1
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
;MyProject.mbas,163 :: 		if (k<=4) then ''else
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 4
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__key_test_old157
	JMP        L__key_test_old23
L__key_test_old157:
;MyProject.mbas,164 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0)) then
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
	BRNE       L__key_test_old158
	JMP        L__key_test_old26
L__key_test_old158:
;MyProject.mbas,166 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,167 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,168 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test_old28:
	DEC        R16
	BRNE       L__key_test_old28
	DEC        R17
	BRNE       L__key_test_old28
	DEC        R18
	BRNE       L__key_test_old28
	NOP
;MyProject.mbas,169 :: 		while (while_state_import_main2 )
L__key_test_old31:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test_old32
;MyProject.mbas,170 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test_old159
	JMP        L__key_test_old36
L__key_test_old159:
;MyProject.mbas,171 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,172 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test_old36:
;MyProject.mbas,174 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test_old160
	JMP        L__key_test_old39
L__key_test_old160:
;MyProject.mbas,175 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test_old39:
;MyProject.mbas,178 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test_old42
;MyProject.mbas,179 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test_old44:
	DEC        R16
	BRNE       L__key_test_old44
	DEC        R17
	BRNE       L__key_test_old44
	DEC        R18
	BRNE       L__key_test_old44
	NOP
L__key_test_old42:
;MyProject.mbas,181 :: 		wend
	JMP        L__key_test_old31
L__key_test_old32:
L__key_test_old26:
;MyProject.mbas,182 :: 		end if
L__key_test_old23:
;MyProject.mbas,186 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,200,1)<> 0)
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
	BREQ       L__key_test_old161
	LDI        R27, 255
L__key_test_old161:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,187 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,200,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test_old162
	LDI        R17, 255
L__key_test_old162:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test_old163
	JMP        L__key_test_old47
L__key_test_old163:
;MyProject.mbas,188 :: 		k= k+1
	LDS        R16, _k+0
	LDS        R17, _k+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _k+0, R16
	STS        _k+1, R17
;MyProject.mbas,189 :: 		oldstate_4=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
L__key_test_old47:
;MyProject.mbas,191 :: 		if j>=16 then
	LDS        R16, _j+0
	CPI        R16, 16
	BRSH       L__key_test_old164
	JMP        L__key_test_old50
L__key_test_old164:
;MyProject.mbas,192 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0)) then
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
	BRNE       L__key_test_old165
	JMP        L__key_test_old53
L__key_test_old165:
;MyProject.mbas,194 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,195 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,196 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test_old55:
	DEC        R16
	BRNE       L__key_test_old55
	DEC        R17
	BRNE       L__key_test_old55
	DEC        R18
	BRNE       L__key_test_old55
	NOP
;MyProject.mbas,197 :: 		while (while_state_import_main2 )
L__key_test_old58:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test_old59
;MyProject.mbas,198 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test_old166
	JMP        L__key_test_old63
L__key_test_old166:
;MyProject.mbas,199 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,200 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test_old63:
;MyProject.mbas,202 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test_old167
	JMP        L__key_test_old66
L__key_test_old167:
;MyProject.mbas,203 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test_old66:
;MyProject.mbas,206 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test_old69
;MyProject.mbas,207 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test_old71:
	DEC        R16
	BRNE       L__key_test_old71
	DEC        R17
	BRNE       L__key_test_old71
	DEC        R18
	BRNE       L__key_test_old71
	NOP
L__key_test_old69:
;MyProject.mbas,209 :: 		wend
	JMP        L__key_test_old58
L__key_test_old59:
L__key_test_old53:
;MyProject.mbas,210 :: 		end if
L__key_test_old50:
;MyProject.mbas,213 :: 		if k>=10 then
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__key_test_old168
	JMP        L__key_test_old74
L__key_test_old168:
;MyProject.mbas,214 :: 		oldstate_3=1
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,215 :: 		if (oldstate_3 and Button(Menu_SW_Port,Menu_SW_bit,2,0))   then
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
	BRNE       L__key_test_old169
	JMP        L__key_test_old77
L__key_test_old169:
;MyProject.mbas,217 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
;MyProject.mbas,219 :: 		Keypad_start(chanel)
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
L__key_test_old77:
;MyProject.mbas,222 :: 		end if
L__key_test_old74:
;MyProject.mbas,233 :: 		wend
	JMP        L__key_test_old18
L__key_test_old19:
L__key_test_old15:
;MyProject.mbas,290 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test_old79:
	DEC        R16
	BRNE       L__key_test_old79
	DEC        R17
	BRNE       L__key_test_old79
	DEC        R18
	BRNE       L__key_test_old79
	NOP
;MyProject.mbas,291 :: 		wend
	JMP        L__key_test_old10
L__key_test_old11:
;MyProject.mbas,292 :: 		wend delay_ms(100)
	JMP        L__key_test_old2
L__key_test_old3:
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test_old81:
	DEC        R16
	BRNE       L__key_test_old81
	DEC        R17
	BRNE       L__key_test_old81
	DEC        R18
	BRNE       L__key_test_old81
;MyProject.mbas,293 :: 		end sub
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

_key_test:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 31
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,359 :: 		sub procedure key_test()
;MyProject.mbas,360 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0   oldstate_4=0
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
;MyProject.mbas,361 :: 		Heater_motor_index=2 Pwm_chanel_main=3   k=0
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;MyProject.mbas,362 :: 		chanel=Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]
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
;MyProject.mbas,364 :: 		while  (while_state_import )
L__key_test85:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test86
;MyProject.mbas,365 :: 		oldstate_menu=oldstate_menu+1
	LDS        R16, _oldstate_menu+0
	SUBI       R16, 255
	STS        _oldstate_menu+0, R16
;MyProject.mbas,367 :: 		if ((oldstate_menu mod 6)=1) or ((oldstate_menu mod 6)=3)or ((oldstate_menu mod 6)=5) then
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 1
	LDI        R27, 0
	BRNE       L__key_test171
	LDI        R27, 255
L__key_test171:
	MOV        R16, R27
	STD        Y+25, R16
	LDS        R16, _oldstate_menu+0
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 3
	LDI        R18, 0
	BRNE       L__key_test172
	LDI        R18, 255
L__key_test172:
	LDD        R17, Y+25
	OR         R17, R18
	CPI        R16, 5
	LDI        R27, 0
	BRNE       L__key_test173
	LDI        R27, 255
L__key_test173:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__key_test174
	JMP        L__key_test90
L__key_test174:
;MyProject.mbas,370 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Press Start SW")
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
	JMP        L__key_test91
;MyProject.mbas,371 :: 		else
L__key_test90:
;MyProject.mbas,373 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Or Hold Start SW")
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
;MyProject.mbas,374 :: 		end if
L__key_test91:
;MyProject.mbas,378 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,379 :: 		while (while_state_2_2<=8 )
L__key_test93:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 8
	CP         R16, R17
	BRSH       L__key_test175
	JMP        L__key_test94
L__key_test175:
;MyProject.mbas,380 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,384 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,5,1)<> 0)
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
	BREQ       L__key_test176
	LDI        R27, 255
L__key_test176:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,385 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,5,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test177
	LDI        R17, 255
L__key_test177:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test178
	JMP        L__key_test98
L__key_test178:
;MyProject.mbas,386 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,387 :: 		Write_Time(Dec2Bcd(1),Dec2Bcd(0),Dec2Bcd(0),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(1),Dec2Bcd(Start_year))
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
;MyProject.mbas,388 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
;MyProject.mbas,389 :: 		k =seconds
	LDS        R16, _seconds+0
	STS        _k+0, R16
	LDI        R27, 0
	STS        _k+1, R27
;MyProject.mbas,390 :: 		while (while_state_import=1)
L__key_test101:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test102
;MyProject.mbas,391 :: 		j=j+1
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
;MyProject.mbas,393 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)  Shamsi_transfer_time()
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
;MyProject.mbas,394 :: 		delay_ms(50)
	LDI        R18, 3
	LDI        R17, 8
	LDI        R16, 120
L__key_test105:
	DEC        R16
	BRNE       L__key_test105
	DEC        R17
	BRNE       L__key_test105
	DEC        R18
	BRNE       L__key_test105
;MyProject.mbas,395 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,5,0)) then
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
	BRNE       L__key_test179
	JMP        L__key_test108
L__key_test179:
;MyProject.mbas,417 :: 		if (seconds< k + 1 )  then
	LDS        R16, _k+0
	LDS        R17, _k+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	LDS        R16, _seconds+0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__key_test180
	JMP        L__key_test111
L__key_test180:
;MyProject.mbas,420 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,421 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,422 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test113:
	DEC        R16
	BRNE       L__key_test113
	DEC        R17
	BRNE       L__key_test113
	DEC        R18
	BRNE       L__key_test113
	NOP
;MyProject.mbas,423 :: 		while (while_state_import_main2 )
L__key_test116:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test117
;MyProject.mbas,424 :: 		if (Button(HET_SW_Port, HET_SW_bit, 5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test181
	JMP        L__key_test121
L__key_test181:
;MyProject.mbas,425 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,426 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test121:
;MyProject.mbas,429 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,50, 1)) then
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
	BRNE       L__key_test182
	JMP        L__key_test124
L__key_test182:
;MyProject.mbas,430 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=11
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
L__key_test124:
;MyProject.mbas,433 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test127
;MyProject.mbas,434 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test129:
	DEC        R16
	BRNE       L__key_test129
	DEC        R17
	BRNE       L__key_test129
	DEC        R18
	BRNE       L__key_test129
	NOP
L__key_test127:
;MyProject.mbas,436 :: 		wend
	JMP        L__key_test116
L__key_test117:
	JMP        L__key_test112
;MyProject.mbas,439 :: 		else
L__key_test111:
;MyProject.mbas,440 :: 		oldstate_3=1
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,443 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=11
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
;MyProject.mbas,445 :: 		Keypad_start(chanel)
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
;MyProject.mbas,447 :: 		end if
L__key_test112:
L__key_test108:
;MyProject.mbas,460 :: 		wend
	JMP        L__key_test101
L__key_test102:
L__key_test98:
;MyProject.mbas,464 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test131:
	DEC        R16
	BRNE       L__key_test131
	DEC        R17
	BRNE       L__key_test131
	DEC        R18
	BRNE       L__key_test131
	NOP
;MyProject.mbas,465 :: 		wend
	JMP        L__key_test93
L__key_test94:
;MyProject.mbas,466 :: 		wend delay_ms(100)
	JMP        L__key_test85
L__key_test86:
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test133:
	DEC        R16
	BRNE       L__key_test133
	DEC        R17
	BRNE       L__key_test133
	DEC        R18
	BRNE       L__key_test133
;MyProject.mbas,467 :: 		end sub
L_end_key_test:
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
; end of _key_test

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;MyProject.mbas,468 :: 		main:
;MyProject.mbas,556 :: 		Lcd_Port_Init()
	PUSH       R2
	CALL       _Lcd_Port_Init+0
;MyProject.mbas,558 :: 		Key_Port_Init_mainfunc()
	CALL       _Key_Port_Init_mainfunc+0
;MyProject.mbas,559 :: 		PWM_Port_Initialize ()
	CALL       _PWM_Port_Initialize+0
;MyProject.mbas,561 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,562 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,563 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,574 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,575 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,577 :: 		chanel=1  Pwm_chanel=1  on_off2=1   week_new=week    chanel_active=1
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
;MyProject.mbas,692 :: 		PWM_Initialize () int_eeprom_ini()
	CALL       _PWM_Initialize+0
	CALL       _int_eeprom_ini+0
;MyProject.mbas,693 :: 		Lcd_0() Delay_mS(200)
	CALL       _Lcd_0+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__main136:
	DEC        R16
	BRNE       L__main136
	DEC        R17
	BRNE       L__main136
	DEC        R18
	BRNE       L__main136
	NOP
;MyProject.mbas,697 :: 		while 1
L__main139:
;MyProject.mbas,698 :: 		key_test()
	CALL       _key_test+0
;MyProject.mbas,709 :: 		wend
	JMP        L__main139
;MyProject.mbas,711 :: 		wend
L_end_main:
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
