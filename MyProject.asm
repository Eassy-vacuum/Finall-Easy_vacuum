
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
	LDS        R27, _oldstate_menu+0
	CBR        R27, BitMask(_oldstate_menu+0)
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
	BRSH       L__key_test80
	JMP        L__key_test11
L__key_test80:
;MyProject.mbas,153 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;MyProject.mbas,155 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,3,1)<> 0)
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 3
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
	BREQ       L__key_test81
	LDI        R27, 255
L__key_test81:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,156 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,3,1)<> 0)then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 3
	MOV        R5, R27
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L__key_test82
	LDI        R17, 255
L__key_test82:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test83
	JMP        L__key_test15
L__key_test83:
;MyProject.mbas,159 :: 		k=1
	LDI        R27, 1
	STS        _k+0, R27
	LDI        R27, 0
	STS        _k+1, R27
;MyProject.mbas,160 :: 		for j=1 to 10  step 1
	LDI        R27, 1
	STS        _j+0, R27
L__key_test18:
;MyProject.mbas,161 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,200,1)<> 0)
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
	BREQ       L__key_test84
	LDI        R27, 255
L__key_test84:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,162 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,200,1)<> 0)then
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
	BREQ       L__key_test85
	LDI        R17, 255
L__key_test85:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test86
	JMP        L__key_test23
L__key_test86:
;MyProject.mbas,163 :: 		k=j
	LDS        R16, _j+0
	STS        _k+0, R16
	LDI        R27, 0
	STS        _k+1, R27
L__key_test23:
;MyProject.mbas,165 :: 		next j
	LDS        R16, _j+0
	CPI        R16, 10
	BRNE       L__key_test87
	JMP        L__key_test21
L__key_test87:
	LDS        R16, _j+0
	SUBI       R16, 255
	STS        _j+0, R16
	JMP        L__key_test18
L__key_test21:
L__key_test15:
;MyProject.mbas,167 :: 		if k=10 then
	LDS        R16, _k+0
	LDS        R17, _k+1
	CPI        R17, 0
	BRNE       L__key_test88
	CPI        R16, 10
L__key_test88:
	BREQ       L__key_test89
	JMP        L__key_test26
L__key_test89:
;MyProject.mbas,168 :: 		while_state_import=0 oldstate_3=1
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__key_test26:
;MyProject.mbas,171 :: 		if k=1 then
	LDS        R16, _k+0
	LDS        R17, _k+1
	CPI        R17, 0
	BRNE       L__key_test90
	CPI        R16, 1
L__key_test90:
	BREQ       L__key_test91
	JMP        L__key_test29
L__key_test91:
;MyProject.mbas,172 :: 		oldstate_4 = 1
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
L__key_test29:
;MyProject.mbas,175 :: 		if k=0  then
	LDS        R16, _k+0
	LDS        R17, _k+1
	CPI        R17, 0
	BRNE       L__key_test92
	CPI        R16, 0
L__key_test92:
	BREQ       L__key_test93
	JMP        L__key_test32
L__key_test93:
;MyProject.mbas,177 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,0.5,1)<> 0)
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
	BREQ       L__key_test94
	LDI        R27, 255
L__key_test94:
	MOV        R16, R27
	STD        Y+25, R16
;MyProject.mbas,178 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,0.5,1)<> 0)then    ' Detect logical one setting key
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
	BREQ       L__key_test95
	LDI        R17, 255
L__key_test95:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L__key_test96
	JMP        L__key_test35
L__key_test96:
;MyProject.mbas,179 :: 		oldstate_4 = 1                      ' Update flag
	LDS        R27, _oldstate_4+0
	SBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
L__key_test35:
;MyProject.mbas,182 :: 		end if
L__key_test32:
;MyProject.mbas,184 :: 		if (k<j) then ''else
	LDS        R17, _k+0
	LDS        R18, _k+1
	LDS        R16, _j+0
	CP         R17, R16
	LDI        R27, 0
	CPC        R18, R27
	BRLT       L__key_test97
	JMP        L__key_test38
L__key_test97:
;MyProject.mbas,185 :: 		if (oldstate_4 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0))
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
	STD        Y+25, R16
;MyProject.mbas,186 :: 		or (while_state_import and oldstate_4 and Button(Ok_SW_Port,Ok_SW_bit,0.5,0))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_4+0
	CBR        R20, 1
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_4+0)
	RJMP       L__key_test101
	SBR        R20, 1
L__key_test101:
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
	BRNE       L__key_test102
	JMP        L__key_test41
L__key_test102:
;MyProject.mbas,187 :: 		oldstate_4=0
	LDS        R27, _oldstate_4+0
	CBR        R27, BitMask(_oldstate_4+0)
	STS        _oldstate_4+0, R27
;MyProject.mbas,188 :: 		while_state_import_main2=1 oldstate_3=0
	LDS        R27, _while_state_import_main2+0
	SBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,189 :: 		Lcd_0() Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test43:
	DEC        R16
	BRNE       L__key_test43
	DEC        R17
	BRNE       L__key_test43
	DEC        R18
	BRNE       L__key_test43
	NOP
;MyProject.mbas,190 :: 		while (while_state_import_main2 )
L__key_test46:
	LDS        R27, _while_state_import_main2+0
	SBRS       R27, BitPos(_while_state_import_main2+0)
	JMP        L__key_test47
;MyProject.mbas,191 :: 		if (Button(HET_SW_Port, HET_SW_bit, 0.5, 0)) then    ' Detect logical one up key
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
	BRNE       L__key_test103
	JMP        L__key_test51
L__key_test103:
;MyProject.mbas,192 :: 		oldstate_3 = 1    while_state_import_main2=0                  ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
;MyProject.mbas,193 :: 		Easy_vacuum_95_10_4_simple_working(chanel,1,0)
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDS        R2, _chanel+0
	CALL       _Easy_vacuum_95_10_4_simple_working+0
L__key_test51:
;MyProject.mbas,195 :: 		if (oldstate_3 and Button(HET_SW_Port, HET_SW_bit,0.5, 1)) then
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
	BRNE       L__key_test104
	JMP        L__key_test54
L__key_test104:
;MyProject.mbas,196 :: 		while_state_import_main2=0  oldstate_3=0   while_state_2_2=6
	LDS        R27, _while_state_import_main2+0
	CBR        R27, BitMask(_while_state_import_main2+0)
	STS        _while_state_import_main2+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L__key_test54:
;MyProject.mbas,199 :: 		if (oldstate_3=0) then
	LDS        R27, _oldstate_3+0
	SBRC       R27, BitPos(_oldstate_3+0)
	JMP        L__key_test57
;MyProject.mbas,200 :: 		Lcd_Out(1,1,"Wating for :") Lcd_Out(2,1,"Pressing Heater micro SW") delay_ms(200)
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
L__key_test59:
	DEC        R16
	BRNE       L__key_test59
	DEC        R17
	BRNE       L__key_test59
	DEC        R18
	BRNE       L__key_test59
	NOP
L__key_test57:
;MyProject.mbas,202 :: 		wend
	JMP        L__key_test46
L__key_test47:
L__key_test41:
;MyProject.mbas,203 :: 		end if
L__key_test38:
;MyProject.mbas,221 :: 		if (oldstate_3 and Button(Menu_SW_Port,Menu_SW_bit,0.5,0))
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
;MyProject.mbas,222 :: 		or (while_state_import and oldstate_3 and Button(Ok_SW_Port,Ok_SW_bit,0.5,0))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CBR        R20, 1
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L__key_test108
	SBR        R20, 1
L__key_test108:
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
	BRNE       L__key_test109
	JMP        L__key_test62
L__key_test109:
;MyProject.mbas,223 :: 		while_state_import=0     oldstate_3=0  while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
;MyProject.mbas,224 :: 		Keypad_start(chanel)
	LDS        R2, _chanel+0
	CALL       _Keypad_start+0
L__key_test62:
;MyProject.mbas,229 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__key_test64:
	DEC        R16
	BRNE       L__key_test64
	DEC        R17
	BRNE       L__key_test64
	DEC        R18
	BRNE       L__key_test64
;MyProject.mbas,230 :: 		wend
	JMP        L__key_test10
L__key_test11:
;MyProject.mbas,231 :: 		wend delay_ms(1000)
	JMP        L__key_test2
L__key_test3:
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__key_test66:
	DEC        R16
	BRNE       L__key_test66
	DEC        R17
	BRNE       L__key_test66
	DEC        R18
	BRNE       L__key_test66
;MyProject.mbas,232 :: 		end sub
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

;MyProject.mbas,233 :: 		main:
;MyProject.mbas,321 :: 		Lcd_Port_Init()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_Port_Init+0
;MyProject.mbas,323 :: 		Key_Port_Init_mainfunc()
	CALL       _Key_Port_Init_mainfunc+0
;MyProject.mbas,324 :: 		PWM_Port_Initialize ()
	CALL       _PWM_Port_Initialize+0
;MyProject.mbas,326 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,327 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,328 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,339 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,340 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,342 :: 		chanel=1  Pwm_chanel=1  on_off2=1   week_new=week    chanel_active=1
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
;MyProject.mbas,457 :: 		PWM_Initialize () int_eeprom_ini()
	CALL       _PWM_Initialize+0
	CALL       _int_eeprom_ini+0
;MyProject.mbas,458 :: 		On_mSec_initial_Heater (1,0,12,100)
	LDI        R27, 100
	MOV        R5, R27
	LDI        R27, 12
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_heater+0
;MyProject.mbas,459 :: 		On_mSec_initial_Motor (1,0,5,100) eeprom_save()
	LDI        R27, 100
	MOV        R5, R27
	LDI        R27, 5
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_Motor+0
	CALL       _eeprom_save+0
;MyProject.mbas,461 :: 		while 1
L__main70:
;MyProject.mbas,462 :: 		key_test()
	CALL       _key_test+0
;MyProject.mbas,473 :: 		wend
	JMP        L__main70
;MyProject.mbas,475 :: 		wend
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
