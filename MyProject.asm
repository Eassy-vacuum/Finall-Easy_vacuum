
_key_test_old:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,135 :: 		sub procedure key_test_old()
;MyProject.mbas,136 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0   oldstate_4=0
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
;MyProject.mbas,137 :: 		Heater_motor_index=2 Pwm_chanel_main=3   k=0
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;MyProject.mbas,138 :: 		chanel=Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]
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
;MyProject.mbas,140 :: 		while  (while_state_import )
L__key_test_old2:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_old3
;MyProject.mbas,141 :: 		oldstate_menu=oldstate_menu+1
	LDS        R16, _oldstate_menu+0
	SUBI       R16, 255
	STS        _oldstate_menu+0, R16
;MyProject.mbas,142 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,143 :: 		if ((oldstate_menu mod 6)=1) or ((oldstate_menu mod 6)=3)or ((oldstate_menu mod 6)=5) then
	LDS        R16, _oldstate_menu+0
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 1
	LDI        R18, 0
	BRNE       L__key_test_old198
	LDI        R18, 255
L__key_test_old198:
	CPI        R16, 3
	LDI        R17, 0
	BRNE       L__key_test_old199
	LDI        R17, 255
L__key_test_old199:
	OR         R17, R18
	CPI        R16, 5
	LDI        R27, 0
	BRNE       L__key_test_old200
	LDI        R27, 255
L__key_test_old200:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__key_test_old201
	JMP        L__key_test_old7
L__key_test_old201:
;MyProject.mbas,146 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Press Start SW")
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
;MyProject.mbas,147 :: 		else
L__key_test_old7:
;MyProject.mbas,149 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Or Hold Start SW")
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
;MyProject.mbas,150 :: 		end if
L__key_test_old8:
;MyProject.mbas,153 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,154 :: 		while (while_state_2_2<=5 )
L__key_test_old10:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L__key_test_old202
	JMP        L__key_test_old11
L__key_test_old202:
;MyProject.mbas,155 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,157 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,50,1)<> 0)
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
	BREQ       L__key_test_old203
	LDI        R27, 255
L__key_test_old203:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,158 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,50,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test_old204
	LDI        R17, 255
L__key_test_old204:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test_old205
	JMP        L__key_test_old15
L__key_test_old205:
;MyProject.mbas,159 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,160 :: 		while (while_state_import=1)
L__key_test_old18:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_old19
;MyProject.mbas,161 :: 		j=j+1
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
;MyProject.mbas,162 :: 		if (k<=4) then ''else
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 4
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__key_test_old206
	JMP        L__key_test_old23
L__key_test_old206:
;MyProject.mbas,163 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0)) then
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
	BRNE       L__key_test_old207
	JMP        L__key_test_old26
L__key_test_old207:
;MyProject.mbas,165 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,166 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,167 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
;MyProject.mbas,168 :: 		while (while_state_import_main2 )
L__key_test_old31:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test_old32
;MyProject.mbas,169 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test_old208
	JMP        L__key_test_old36
L__key_test_old208:
;MyProject.mbas,170 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,171 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test_old36:
;MyProject.mbas,173 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test_old209
	JMP        L__key_test_old39
L__key_test_old209:
;MyProject.mbas,174 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test_old39:
;MyProject.mbas,177 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test_old42
;MyProject.mbas,178 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
;MyProject.mbas,180 :: 		wend
	JMP        L__key_test_old31
L__key_test_old32:
L__key_test_old26:
;MyProject.mbas,181 :: 		end if
L__key_test_old23:
;MyProject.mbas,185 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,200,1)<> 0)
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
	BREQ       L__key_test_old210
	LDI        R27, 255
L__key_test_old210:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,186 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,200,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test_old211
	LDI        R17, 255
L__key_test_old211:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test_old212
	JMP        L__key_test_old47
L__key_test_old212:
;MyProject.mbas,187 :: 		k= k+1
	LDS        R16, _k+0
	LDS        R17, _k+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _k+0, R16
	STS        _k+1, R17
;MyProject.mbas,188 :: 		oldstate_4=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
L__key_test_old47:
;MyProject.mbas,190 :: 		if j>=16 then
	LDS        R16, _j+0
	CPI        R16, 16
	BRSH       L__key_test_old213
	JMP        L__key_test_old50
L__key_test_old213:
;MyProject.mbas,191 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0)) then
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
	BRNE       L__key_test_old214
	JMP        L__key_test_old53
L__key_test_old214:
;MyProject.mbas,193 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,194 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,195 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
;MyProject.mbas,196 :: 		while (while_state_import_main2 )
L__key_test_old58:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test_old59
;MyProject.mbas,197 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test_old215
	JMP        L__key_test_old63
L__key_test_old215:
;MyProject.mbas,198 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,199 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test_old63:
;MyProject.mbas,201 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test_old216
	JMP        L__key_test_old66
L__key_test_old216:
;MyProject.mbas,202 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test_old66:
;MyProject.mbas,205 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test_old69
;MyProject.mbas,206 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
;MyProject.mbas,208 :: 		wend
	JMP        L__key_test_old58
L__key_test_old59:
L__key_test_old53:
;MyProject.mbas,209 :: 		end if
L__key_test_old50:
;MyProject.mbas,212 :: 		if k>=10 then
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__key_test_old217
	JMP        L__key_test_old74
L__key_test_old217:
;MyProject.mbas,213 :: 		oldstate_3=1
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,214 :: 		if (oldstate_3 and Button(Menu_SW_Port,Menu_SW_bit,2,0))   then
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
	BRNE       L__key_test_old218
	JMP        L__key_test_old77
L__key_test_old218:
;MyProject.mbas,216 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
;MyProject.mbas,218 :: 		Keypad_start(chanel)
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
L__key_test_old77:
;MyProject.mbas,221 :: 		end if
L__key_test_old74:
;MyProject.mbas,232 :: 		wend
	JMP        L__key_test_old18
L__key_test_old19:
L__key_test_old15:
;MyProject.mbas,289 :: 		Delay_mS(200)
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
;MyProject.mbas,290 :: 		wend
	JMP        L__key_test_old10
L__key_test_old11:
;MyProject.mbas,291 :: 		wend delay_ms(100)
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
;MyProject.mbas,292 :: 		end sub
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

_key_test_currpted:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,293 :: 		sub procedure key_test_currpted()
;MyProject.mbas,294 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0   oldstate_4=0
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
;MyProject.mbas,295 :: 		Heater_motor_index=2 Pwm_chanel_main=3   k=0
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
;MyProject.mbas,296 :: 		chanel=Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]
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
;MyProject.mbas,298 :: 		while  (while_state_import )
L__key_test_currpted85:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_currpted86
;MyProject.mbas,299 :: 		oldstate_menu=oldstate_menu+1
	LDS        R16, _oldstate_menu+0
	SUBI       R16, 255
	STS        _oldstate_menu+0, R16
;MyProject.mbas,301 :: 		if ((oldstate_menu mod 6)=1) or ((oldstate_menu mod 6)=3)or ((oldstate_menu mod 6)=5) then
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 1
	LDI        R27, 0
	BRNE       L__key_test_currpted220
	LDI        R27, 255
L__key_test_currpted220:
	MOV        R16, R27
	STD        Y+25, R16
	LDS        R16, _oldstate_menu+0
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 3
	LDI        R18, 0
	BRNE       L__key_test_currpted221
	LDI        R18, 255
L__key_test_currpted221:
	LDD        R17, Y+25
	OR         R17, R18
	CPI        R16, 5
	LDI        R27, 0
	BRNE       L__key_test_currpted222
	LDI        R27, 255
L__key_test_currpted222:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__key_test_currpted223
	JMP        L__key_test_currpted90
L__key_test_currpted223:
;MyProject.mbas,304 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Press Start SW")
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
	JMP        L__key_test_currpted91
;MyProject.mbas,305 :: 		else
L__key_test_currpted90:
;MyProject.mbas,307 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Or Hold Start SW")
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
;MyProject.mbas,308 :: 		end if
L__key_test_currpted91:
;MyProject.mbas,309 :: 		while_state_2_1=1
	LDI        R27, 1
	STS        _while_state_2_1+0, R27
	LDI        R27, 0
	STS        _while_state_2_1+1, R27
;MyProject.mbas,310 :: 		while (while_state_2_1<=400)
L__key_test_currpted93:
	LDS        R18, _while_state_2_1+0
	LDS        R19, _while_state_2_1+1
	LDI        R16, 144
	LDI        R17, 1
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__key_test_currpted224
	JMP        L__key_test_currpted94
L__key_test_currpted224:
;MyProject.mbas,311 :: 		while_state_2_1=while_state_2_1+1
	LDS        R16, _while_state_2_1+0
	LDS        R17, _while_state_2_1+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _while_state_2_1+0, R16
	STS        _while_state_2_1+1, R17
;MyProject.mbas,312 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,313 :: 		sec_n1[0]=seconds
	LDS        R16, _seconds+0
	STS        _sec_n1+0, R16
;MyProject.mbas,314 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,50,1)<> 0) then
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
	BRNE       L__key_test_currpted225
	JMP        L__key_test_currpted98
L__key_test_currpted225:
;MyProject.mbas,316 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,317 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,318 :: 		while (while_state_import=1 )
L__key_test_currpted101:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test_currpted102
;MyProject.mbas,319 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,320 :: 		sec_n1[1]=seconds
	LDS        R17, _seconds+0
	STS        _sec_n1+1, R17
;MyProject.mbas,321 :: 		if (seconds>=sec_n1[0]+3 )  then
	LDS        R16, _sec_n1+0
	SUBI       R16, 253
	CP         R17, R16
	BRSH       L__key_test_currpted226
	JMP        L__key_test_currpted106
L__key_test_currpted226:
;MyProject.mbas,322 :: 		if (oldstate_4 and (Button(Menu_SW_Port,Menu_SW_bit,0.5,0) ))then ' or Button(Ok_SW_Port,Menu_SW_bit,0.5,0) ) then
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
	BRNE       L__key_test_currpted227
	JMP        L__key_test_currpted109
L__key_test_currpted227:
;MyProject.mbas,323 :: 		while_state_import=0   oldstate_4=0  oldstate_3=0  while_state_2_1=555
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 43
	STS        _while_state_2_1+0, R27
	LDI        R27, 2
	STS        _while_state_2_1+1, R27
;MyProject.mbas,325 :: 		Keypad_start(chanel)
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
;MyProject.mbas,326 :: 		while_state_2_1=555
	LDI        R27, 43
	STS        _while_state_2_1+0, R27
	LDI        R27, 2
	STS        _while_state_2_1+1, R27
L__key_test_currpted109:
;MyProject.mbas,327 :: 		end if
	JMP        L__key_test_currpted107
;MyProject.mbas,328 :: 		else
L__key_test_currpted106:
;MyProject.mbas,330 :: 		if (oldstate_4 and (Button(Menu_SW_Port,Menu_SW_bit,0.5,0) ))then ' or Button(Ok_SW_Port,Menu_SW_bit,0.5,0) ) then
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
	BRNE       L__key_test_currpted228
	JMP        L__key_test_currpted112
L__key_test_currpted228:
;MyProject.mbas,332 :: 		oldstate_4=0 while_state_import=0  while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,333 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,334 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test_currpted114:
	DEC        R16
	BRNE       L__key_test_currpted114
	DEC        R17
	BRNE       L__key_test_currpted114
	DEC        R18
	BRNE       L__key_test_currpted114
	NOP
;MyProject.mbas,335 :: 		while (while_state_import_main2 )
L__key_test_currpted117:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test_currpted118
;MyProject.mbas,336 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test_currpted229
	JMP        L__key_test_currpted122
L__key_test_currpted229:
;MyProject.mbas,337 :: 		while_state_import=0  oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,338 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test_currpted122:
;MyProject.mbas,340 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test_currpted230
	JMP        L__key_test_currpted125
L__key_test_currpted230:
;MyProject.mbas,341 :: 		while_state_import_main2=0 while_state_import=0
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,342 :: 		oldstate_3=0   while_state_2_1=555
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 43
	STS        _while_state_2_1+0, R27
	LDI        R27, 2
	STS        _while_state_2_1+1, R27
L__key_test_currpted125:
;MyProject.mbas,345 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test_currpted128
;MyProject.mbas,346 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test_currpted130:
	DEC        R16
	BRNE       L__key_test_currpted130
	DEC        R17
	BRNE       L__key_test_currpted130
	DEC        R18
	BRNE       L__key_test_currpted130
	NOP
L__key_test_currpted128:
;MyProject.mbas,348 :: 		wend
	JMP        L__key_test_currpted117
L__key_test_currpted118:
L__key_test_currpted112:
;MyProject.mbas,350 :: 		end if
L__key_test_currpted107:
;MyProject.mbas,352 :: 		wend
	JMP        L__key_test_currpted101
L__key_test_currpted102:
L__key_test_currpted98:
;MyProject.mbas,354 :: 		wend
	JMP        L__key_test_currpted93
L__key_test_currpted94:
;MyProject.mbas,355 :: 		wend delay_ms(100)
	JMP        L__key_test_currpted85
L__key_test_currpted86:
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test_currpted132:
	DEC        R16
	BRNE       L__key_test_currpted132
	DEC        R17
	BRNE       L__key_test_currpted132
	DEC        R18
	BRNE       L__key_test_currpted132
;MyProject.mbas,356 :: 		end sub
L_end_key_test_currpted:
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
; end of _key_test_currpted

_key_test:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
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
L__key_test136:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test137
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
	BRNE       L__key_test232
	LDI        R27, 255
L__key_test232:
	MOV        R16, R27
	STD        Y+25, R16
	LDS        R16, _oldstate_menu+0
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 3
	LDI        R18, 0
	BRNE       L__key_test233
	LDI        R18, 255
L__key_test233:
	LDD        R17, Y+25
	OR         R17, R18
	CPI        R16, 5
	LDI        R27, 0
	BRNE       L__key_test234
	LDI        R27, 255
L__key_test234:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__key_test235
	JMP        L__key_test141
L__key_test235:
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
	JMP        L__key_test142
;MyProject.mbas,371 :: 		else
L__key_test141:
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
L__key_test142:
;MyProject.mbas,378 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,379 :: 		while (while_state_2_2<=8 )
L__key_test144:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 8
	CP         R16, R17
	BRSH       L__key_test236
	JMP        L__key_test145
L__key_test236:
;MyProject.mbas,380 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,381 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,382 :: 		sec_n1[0]=seconds
	LDS        R16, _seconds+0
	STS        _sec_n1+0, R16
;MyProject.mbas,384 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,50,1)<> 0)
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
	BREQ       L__key_test237
	LDI        R27, 255
L__key_test237:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,385 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,50,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test238
	LDI        R17, 255
L__key_test238:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test239
	JMP        L__key_test149
L__key_test239:
;MyProject.mbas,386 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,388 :: 		while (while_state_import=1)
L__key_test152:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test153
;MyProject.mbas,389 :: 		j=j+1
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
;MyProject.mbas,390 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
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
;MyProject.mbas,391 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,2,0)) then
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
	LDS        R0, _oldstate_4+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_4+0)
	INC        R17
	AND        R16, R17
	BRNE       L__key_test240
	JMP        L__key_test157
L__key_test240:
;MyProject.mbas,413 :: 		if (seconds<sec_n1[0]+3 )  then
	LDS        R16, _sec_n1+0
	MOV        R17, R16
	SUBI       R17, 253
	LDS        R16, _seconds+0
	CP         R16, R17
	BRLO       L__key_test241
	JMP        L__key_test160
L__key_test241:
;MyProject.mbas,416 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,417 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,418 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test162:
	DEC        R16
	BRNE       L__key_test162
	DEC        R17
	BRNE       L__key_test162
	DEC        R18
	BRNE       L__key_test162
	NOP
;MyProject.mbas,419 :: 		while (while_state_import_main2 )
L__key_test165:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test166
;MyProject.mbas,420 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test242
	JMP        L__key_test170
L__key_test242:
;MyProject.mbas,421 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,422 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test170:
;MyProject.mbas,425 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test243
	JMP        L__key_test173
L__key_test243:
;MyProject.mbas,426 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=11
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
L__key_test173:
;MyProject.mbas,429 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test176
;MyProject.mbas,430 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test178:
	DEC        R16
	BRNE       L__key_test178
	DEC        R17
	BRNE       L__key_test178
	DEC        R18
	BRNE       L__key_test178
	NOP
L__key_test176:
;MyProject.mbas,432 :: 		wend
	JMP        L__key_test165
L__key_test166:
	JMP        L__key_test161
;MyProject.mbas,435 :: 		else
L__key_test160:
;MyProject.mbas,436 :: 		oldstate_3=1
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,439 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=11
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 11
	STS        _while_state_2_2+0, R27
;MyProject.mbas,441 :: 		Keypad_start(chanel)
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
;MyProject.mbas,443 :: 		end if
L__key_test161:
L__key_test157:
;MyProject.mbas,456 :: 		wend
	JMP        L__key_test152
L__key_test153:
L__key_test149:
;MyProject.mbas,460 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test180:
	DEC        R16
	BRNE       L__key_test180
	DEC        R17
	BRNE       L__key_test180
	DEC        R18
	BRNE       L__key_test180
	NOP
;MyProject.mbas,461 :: 		wend
	JMP        L__key_test144
L__key_test145:
;MyProject.mbas,462 :: 		wend delay_ms(100)
	JMP        L__key_test136
L__key_test137:
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test182:
	DEC        R16
	BRNE       L__key_test182
	DEC        R17
	BRNE       L__key_test182
	DEC        R18
	BRNE       L__key_test182
;MyProject.mbas,463 :: 		end sub
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

;MyProject.mbas,464 :: 		main:
;MyProject.mbas,552 :: 		Lcd_Port_Init()
	PUSH       R2
	CALL       _Lcd_Port_Init+0
;MyProject.mbas,554 :: 		Key_Port_Init_mainfunc()
	CALL       _Key_Port_Init_mainfunc+0
;MyProject.mbas,555 :: 		PWM_Port_Initialize ()
	CALL       _PWM_Port_Initialize+0
;MyProject.mbas,557 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,558 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,559 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,570 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,571 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,573 :: 		chanel=1  Pwm_chanel=1  on_off2=1   week_new=week    chanel_active=1
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
;MyProject.mbas,688 :: 		PWM_Initialize () int_eeprom_ini()
	CALL       _PWM_Initialize+0
	CALL       _int_eeprom_ini+0
;MyProject.mbas,689 :: 		Lcd_0() Delay_mS(200)
	CALL       _Lcd_0+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__main185:
	DEC        R16
	BRNE       L__main185
	DEC        R17
	BRNE       L__main185
	DEC        R18
	BRNE       L__main185
	NOP
;MyProject.mbas,693 :: 		while 1
L__main188:
;MyProject.mbas,694 :: 		key_test()
	CALL       _key_test+0
;MyProject.mbas,705 :: 		wend
	JMP        L__main188
;MyProject.mbas,707 :: 		wend
L_end_main:
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
