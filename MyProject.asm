
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
;MyProject.mbas,134 :: 		while_state_import=1  oldstate_3=0  oldstate_menu=0   oldstate_4=0
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
;MyProject.mbas,135 :: 		Heater_motor_index=2 Pwm_chanel_main=3   k=0
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
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
	LDS        R16, _oldstate_menu+0
	SUBI       R16, 255
	STS        _oldstate_menu+0, R16
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
;MyProject.mbas,141 :: 		if ((oldstate_menu mod 6)=1) or ((oldstate_menu mod 6)=3)or ((oldstate_menu mod 6)=5) then
	LDS        R16, _oldstate_menu+0
	LDI        R20, 6
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	CPI        R16, 1
	LDI        R18, 0
	BRNE       L__key_test95
	LDI        R18, 255
L__key_test95:
	CPI        R16, 3
	LDI        R17, 0
	BRNE       L__key_test96
	LDI        R17, 255
L__key_test96:
	OR         R17, R18
	CPI        R16, 5
	LDI        R27, 0
	BRNE       L__key_test97
	LDI        R27, 255
L__key_test97:
	MOV        R16, R27
	OR         R16, R17
	BRNE       L__key_test98
	JMP        L__key_test7
L__key_test98:
;MyProject.mbas,144 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Press Start SW")
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
	JMP        L__key_test8
;MyProject.mbas,145 :: 		else
L__key_test7:
;MyProject.mbas,147 :: 		Lcd_0()Lcd_Out(1,1,"Ready to Work") Lcd_Out(2,1,"Or Hold Start SW")
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
;MyProject.mbas,148 :: 		end if
L__key_test8:
;MyProject.mbas,151 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;MyProject.mbas,152 :: 		while (while_state_2_2<=5 )
L__key_test10:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L__key_test99
	JMP        L__key_test11
L__key_test99:
;MyProject.mbas,153 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,155 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,50,1)<> 0)
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
	BREQ       L__key_test100
	LDI        R27, 255
L__key_test100:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,156 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,50,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test101
	LDI        R17, 255
L__key_test101:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test102
	JMP        L__key_test15
L__key_test102:
;MyProject.mbas,157 :: 		oldstate_4=1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,158 :: 		while (while_state_import=1)
L__key_test18:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__key_test19
;MyProject.mbas,159 :: 		j=j+1
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
;MyProject.mbas,160 :: 		if (k<2) then ''else
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 2
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__key_test103
	JMP        L__key_test23
L__key_test103:
;MyProject.mbas,161 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0)) then
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
	BRNE       L__key_test104
	JMP        L__key_test26
L__key_test104:
;MyProject.mbas,163 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,164 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,165 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test28:
	DEC        R16
	BRNE       L__key_test28
	DEC        R17
	BRNE       L__key_test28
	DEC        R18
	BRNE       L__key_test28
	NOP
;MyProject.mbas,166 :: 		while (while_state_import_main2 )
L__key_test31:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test32
;MyProject.mbas,167 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test105
	JMP        L__key_test36
L__key_test105:
;MyProject.mbas,168 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,169 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test36:
;MyProject.mbas,171 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test106
	JMP        L__key_test39
L__key_test106:
;MyProject.mbas,172 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test39:
;MyProject.mbas,175 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test42
;MyProject.mbas,176 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test44:
	DEC        R16
	BRNE       L__key_test44
	DEC        R17
	BRNE       L__key_test44
	DEC        R18
	BRNE       L__key_test44
	NOP
L__key_test42:
;MyProject.mbas,178 :: 		wend
	JMP        L__key_test31
L__key_test32:
L__key_test26:
;MyProject.mbas,179 :: 		end if
L__key_test23:
;MyProject.mbas,183 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,200,1)<> 0)
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
	BREQ       L__key_test107
	LDI        R27, 255
L__key_test107:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,184 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,200,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test108
	LDI        R17, 255
L__key_test108:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test109
	JMP        L__key_test47
L__key_test109:
;MyProject.mbas,185 :: 		k= k+1
	LDS        R16, _k+0
	LDS        R17, _k+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _k+0, R16
	STS        _k+1, R17
;MyProject.mbas,186 :: 		oldstate_4=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
L__key_test47:
;MyProject.mbas,188 :: 		if j>=16 then
	LDS        R16, _j+0
	CPI        R16, 16
	BRSH       L__key_test110
	JMP        L__key_test50
L__key_test110:
;MyProject.mbas,189 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0)) then
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
	BRNE       L__key_test111
	JMP        L__key_test53
L__key_test111:
;MyProject.mbas,191 :: 		oldstate_4=0 while_state_import=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,192 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,193 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test55:
	DEC        R16
	BRNE       L__key_test55
	DEC        R17
	BRNE       L__key_test55
	DEC        R18
	BRNE       L__key_test55
	NOP
;MyProject.mbas,194 :: 		while (while_state_import_main2 )
L__key_test58:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test59
;MyProject.mbas,195 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test112
	JMP        L__key_test63
L__key_test112:
;MyProject.mbas,196 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,197 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test63:
;MyProject.mbas,199 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test113
	JMP        L__key_test66
L__key_test113:
;MyProject.mbas,200 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test66:
;MyProject.mbas,203 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test69
;MyProject.mbas,204 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test71:
	DEC        R16
	BRNE       L__key_test71
	DEC        R17
	BRNE       L__key_test71
	DEC        R18
	BRNE       L__key_test71
	NOP
L__key_test69:
;MyProject.mbas,206 :: 		wend
	JMP        L__key_test58
L__key_test59:
L__key_test53:
;MyProject.mbas,207 :: 		end if
L__key_test50:
;MyProject.mbas,210 :: 		if k>=10 then
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__key_test114
	JMP        L__key_test74
L__key_test114:
;MyProject.mbas,211 :: 		oldstate_3=1
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__key_test74:
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
	BRNE       L__key_test115
	JMP        L__key_test77
L__key_test115:
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
L__key_test77:
;MyProject.mbas,222 :: 		wend
	JMP        L__key_test18
L__key_test19:
L__key_test15:
;MyProject.mbas,279 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__key_test79:
	DEC        R16
	BRNE       L__key_test79
	DEC        R17
	BRNE       L__key_test79
	DEC        R18
	BRNE       L__key_test79
	NOP
;MyProject.mbas,280 :: 		wend
	JMP        L__key_test10
L__key_test11:
;MyProject.mbas,281 :: 		wend delay_ms(100)
	JMP        L__key_test2
L__key_test3:
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test81:
	DEC        R16
	BRNE       L__key_test81
	DEC        R17
	BRNE       L__key_test81
	DEC        R18
	BRNE       L__key_test81
;MyProject.mbas,282 :: 		end sub
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

;MyProject.mbas,283 :: 		main:
;MyProject.mbas,371 :: 		Lcd_Port_Init()
	PUSH       R2
	CALL       _Lcd_Port_Init+0
;MyProject.mbas,373 :: 		Key_Port_Init_mainfunc()
	CALL       _Key_Port_Init_mainfunc+0
;MyProject.mbas,374 :: 		PWM_Port_Initialize ()
	CALL       _PWM_Port_Initialize+0
;MyProject.mbas,376 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,377 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,378 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,389 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,390 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,392 :: 		chanel=1  Pwm_chanel=1  on_off2=1   week_new=week    chanel_active=1
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
;MyProject.mbas,507 :: 		PWM_Initialize () int_eeprom_ini()
	CALL       _PWM_Initialize+0
	CALL       _int_eeprom_ini+0
;MyProject.mbas,511 :: 		while 1
L__main85:
;MyProject.mbas,512 :: 		key_test()
	CALL       _key_test+0
;MyProject.mbas,523 :: 		wend
	JMP        L__main85
;MyProject.mbas,525 :: 		wend
L_end_main:
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
