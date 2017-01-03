
_Key_Port_Init:

;libs/keypad_Atmega32.mbas,117 :: 		sub procedure Key_Port_Init()
;libs/keypad_Atmega32.mbas,128 :: 		DDB0_bit = 0 DDB1_bit = 0   DDB2_bit = 0 DDB4_bit = 0                ' Set PORTE pin 7 as input pin for the Heater switches
	IN         R27, DDB0_bit+0
	CBR        R27, BitMask(DDB0_bit+0)
	OUT        DDB0_bit+0, R27
	IN         R27, DDB1_bit+0
	CBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
	IN         R27, DDB2_bit+0
	CBR        R27, BitMask(DDB2_bit+0)
	OUT        DDB2_bit+0, R27
	IN         R27, DDB4_bit+0
	CBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
;libs/keypad_Atmega32.mbas,129 :: 		DDD2_bit = 0 DDD3_bit = 0     DDD6_bit = 0     '' DDD5_bit = 0
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
	IN         R27, DDD6_bit+0
	CBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;libs/keypad_Atmega32.mbas,132 :: 		end sub
L_end_Key_Port_Init:
	RET
; end of _Key_Port_Init

libs/keypad_Atmega32_Show_text:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	ADIW       R28, 5

;libs/keypad_Atmega32.mbas,139 :: 		,dim byref text_main_2,text_new_2 as string[16],dim lcd_line_2 as byte,dim byref location_my_2 as string[1],dim num_ as byte )
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDD        R16, Y+0
	LDD        R17, Y+1
	STD        Y+0, R16
	STD        Y+1, R17
	LDD        R16, Y+2
	LDD        R17, Y+3
	STD        Y+2, R16
	STD        Y+3, R17
	LDD        R16, Y+4
	STD        Y+4, R16
; location_my_2 start address is: 16 (R16)
	LDD        R16, Y+5
	LDD        R17, Y+6
; location_my_2 end address is: 16 (R16)
; num_ start address is: 16 (R16)
	LDD        R16, Y+7
;libs/keypad_Atmega32.mbas,148 :: 		if num_ = 1 then
	CPI        R16, 1
	BREQ       L_libs/keypad_Atmega32_Show_text189
	JMP        L_libs/keypad_Atmega32_Show_text3
L_libs/keypad_Atmega32_Show_text189:
; num_ end address is: 16 (R16)
;libs/keypad_Atmega32.mbas,149 :: 		LCD_Out(lcd_line_1,1,text_main_1)  ''Show on LCD
	MOVW       R4, R2
	LDI        R27, 1
	MOV        R3, R27
	MOV        R2, R6
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,150 :: 		LCD_Out(lcd_line_2,1,text_main_2)  ''Show on LCD
	LDD        R4, Y+0
	LDD        R5, Y+1
	LDI        R27, 1
	MOV        R3, R27
	LDD        R2, Y+4
	CALL       _Lcd_Out+0
	JMP        L_libs/keypad_Atmega32_Show_text4
;libs/keypad_Atmega32.mbas,151 :: 		else
L_libs/keypad_Atmega32_Show_text3:
;libs/keypad_Atmega32.mbas,152 :: 		LCD_Out(lcd_line_1,1,text_new_1)  ''Show on LCD
	LDI        R27, 1
	MOV        R3, R27
	MOV        R2, R6
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,153 :: 		LCD_Out(lcd_line_2,1,text_new_2)  ''Show on LCD
	LDD        R4, Y+2
	LDD        R5, Y+3
	LDI        R27, 1
	MOV        R3, R27
	LDD        R2, Y+4
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,154 :: 		end if
L_libs/keypad_Atmega32_Show_text4:
;libs/keypad_Atmega32.mbas,157 :: 		end sub
L_end_Show_text:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Show_text

libs/keypad_Atmega32_Keypad__teben:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,165 :: 		dim oldstate_up,oldstate_down,oldstate_men_ok,var_in_lcd,num_ as byte
;libs/keypad_Atmega32.mbas,181 :: 		First_second_comand=1 lcd_line=1
	PUSH       R7
	PUSH       R8
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,182 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,185 :: 		if var_in=0 then
	LDI        R27, 0
	CP         R2, R27
	BREQ       L_libs/keypad_Atmega32_Keypad__teben191
	JMP        L_libs/keypad_Atmega32_Keypad__teben7
L_libs/keypad_Atmega32_Keypad__teben191:
;libs/keypad_Atmega32.mbas,186 :: 		var_in_lcd=var_in+1
	MOV        R16, R2
	SUBI       R16, 255
	STD        Y+4, R16
	JMP        L_libs/keypad_Atmega32_Keypad__teben8
;libs/keypad_Atmega32.mbas,187 :: 		else
L_libs/keypad_Atmega32_Keypad__teben7:
;libs/keypad_Atmega32.mbas,188 :: 		var_in_lcd=var_in
	STD        Y+4, R2
;libs/keypad_Atmega32.mbas,189 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben8:
;libs/keypad_Atmega32.mbas,190 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,191 :: 		oldstate_up=0 oldstate_down=0    num_=0
	LDI        R27, 0
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+5, R27
;libs/keypad_Atmega32.mbas,192 :: 		oldstate_men_ok=0  oldstate_2=0
	LDI        R27, 0
	STD        Y+3, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,193 :: 		while  (while_state_import )
L_libs/keypad_Atmega32_Keypad__teben10:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/keypad_Atmega32_Keypad__teben11
;libs/keypad_Atmega32.mbas,194 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,196 :: 		if var_in>Choice_number then   var_in_lcd=(var_in mod Choice_number) end if
	CP         R5, R2
	BRLO       L_libs/keypad_Atmega32_Keypad__teben192
	JMP        L_libs/keypad_Atmega32_Keypad__teben15
L_libs/keypad_Atmega32_Keypad__teben192:
	MOV        R20, R5
	MOV        R16, R2
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	STD        Y+4, R16
L_libs/keypad_Atmega32_Keypad__teben15:
;libs/keypad_Atmega32.mbas,197 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+4
	CPI        R16, 0
	BREQ       L_libs/keypad_Atmega32_Keypad__teben193
	JMP        L_libs/keypad_Atmega32_Keypad__teben18
L_libs/keypad_Atmega32_Keypad__teben193:
	LDI        R27, 1
	STD        Y+4, R27
L_libs/keypad_Atmega32_Keypad__teben18:
;libs/keypad_Atmega32.mbas,198 :: 		if num_=2 then num_=0 end if
	LDD        R16, Y+5
	CPI        R16, 2
	BREQ       L_libs/keypad_Atmega32_Keypad__teben194
	JMP        L_libs/keypad_Atmega32_Keypad__teben21
L_libs/keypad_Atmega32_Keypad__teben194:
	LDI        R27, 0
	STD        Y+5, R27
L_libs/keypad_Atmega32_Keypad__teben21:
;libs/keypad_Atmega32.mbas,199 :: 		num_=num_+1
	LDD        R16, Y+5
	SUBI       R16, 255
	STD        Y+5, R16
;libs/keypad_Atmega32.mbas,200 :: 		if   var_in_old_on_off<>0 then
	LDI        R27, 0
	CP         R6, R27
	BRNE       L_libs/keypad_Atmega32_Keypad__teben195
	JMP        L_libs/keypad_Atmega32_Keypad__teben24
L_libs/keypad_Atmega32_Keypad__teben195:
;libs/keypad_Atmega32.mbas,201 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	STD        Y+28, R16
	STD        Y+29, R17
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	STD        Y+20, R16
	STD        Y+21, R17
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+4
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+26, R18
	STD        Y+27, R19
;libs/keypad_Atmega32.mbas,202 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+28
	LDD        R23, Y+29
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+20
	LDD        R21, Y+21
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+24, R18
	STD        Y+25, R19
;libs/keypad_Atmega32.mbas,203 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][2],
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R18, R22
	ADC        R19, R23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 222
	SBCI       R17, 255
	STD        Y+22, R16
	STD        Y+23, R17
;libs/keypad_Atmega32.mbas,204 :: 		Options_array[First_second_comand-1][lcd_line][var_in_old_on_off-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	STD        Y+20, R16
	STD        Y+21, R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R6
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	MOV        R7, R16
	MOV        R8, R17
	ADD        R7, R18
	ADC        R8, R19
;libs/keypad_Atmega32.mbas,205 :: 		Options_array[First_second_comand-1][lcd_line][var_in_old_on_off-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+28
	LDD        R23, Y+29
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+20
	LDD        R21, Y+21
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	MOV        R25, R18
	MOV        R26, R19
	SUBI       R25, 239
	SBCI       R26, 255
;libs/keypad_Atmega32.mbas,206 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_old_on_off-1][2],num_)
	LDS        R18, _lcd_line+0
	MOV        R24, R18
	SUBI       R24, 255
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R18, R22
	ADC        R19, R23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R22, R16
	SUBI       R22, 222
	SBCI       R23, 255
	LDD        R20, Y+26
	LDD        R21, Y+27
	LDD        R18, Y+24
	LDD        R19, Y+25
	LDD        R16, Y+22
	LDD        R17, Y+23
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R16, Y+5
	PUSH       R16
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R8
	PUSH       R7
	MOV        R7, R16
	MOV        R8, R17
	LDS        R6, _lcd_line+0
	MOVW       R4, R18
	MOVW       R2, R20
	CALL       libs/keypad_Atmega32_Show_text+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 8
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	JMP        L_libs/keypad_Atmega32_Keypad__teben25
;libs/keypad_Atmega32.mbas,207 :: 		else
L_libs/keypad_Atmega32_Keypad__teben24:
;libs/keypad_Atmega32.mbas,208 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	STD        Y+28, R16
	STD        Y+29, R17
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	STD        Y+20, R16
	STD        Y+21, R17
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+4
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	STD        Y+26, R16
	STD        Y+27, R17
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+24, R18
	STD        Y+25, R19
;libs/keypad_Atmega32.mbas,209 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+28
	LDD        R23, Y+29
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+20
	LDD        R21, Y+21
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+22, R18
	STD        Y+23, R19
;libs/keypad_Atmega32.mbas,210 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][2],
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R18, R22
	ADC        R19, R23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 222
	SBCI       R17, 255
	STD        Y+20, R16
	STD        Y+21, R17
;libs/keypad_Atmega32.mbas,211 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	ADD        R18, R16
	ADC        R19, R17
	LDD        R22, Y+26
	LDD        R23, Y+27
	MOV        R7, R22
	MOV        R8, R23
	ADD        R7, R18
	ADC        R8, R19
;libs/keypad_Atmega32.mbas,212 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R20, Y+28
	LDD        R21, Y+29
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R22
	ADC        R19, R23
	MOV        R25, R18
	MOV        R26, R19
	SUBI       R25, 239
	SBCI       R26, 255
;libs/keypad_Atmega32.mbas,213 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][2],num_)
	LDS        R18, _lcd_line+0
	MOV        R24, R18
	SUBI       R24, 255
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R22
	ADC        R17, R23
	MOVW       R22, R16
	SUBI       R22, 222
	SBCI       R23, 255
	LDD        R20, Y+24
	LDD        R21, Y+25
	LDD        R18, Y+22
	LDD        R19, Y+23
	LDD        R16, Y+20
	LDD        R17, Y+21
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R16, Y+5
	PUSH       R16
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R8
	PUSH       R7
	MOV        R7, R16
	MOV        R8, R17
	LDS        R6, _lcd_line+0
	MOVW       R4, R18
	MOVW       R2, R20
	CALL       libs/keypad_Atmega32_Show_text+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 8
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,214 :: 		if case_is_selceted_show[lcd_line-1][1]<> 0  then
	LDS        R16, _lcd_line+0
	SUBI       R16, 1
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R16, Z
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben196
	JMP        L_libs/keypad_Atmega32_Keypad__teben27
L_libs/keypad_Atmega32_Keypad__teben196:
;libs/keypad_Atmega32.mbas,215 :: 		Bytetostr(var_in,txt)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,216 :: 		LCD_Out(lcd_line,case_is_selceted_show[lcd_line-1][1], txt)
	LDS        R16, _lcd_line+0
	SUBI       R16, 1
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R3, R16
	LDS        R2, _lcd_line+0
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
L_libs/keypad_Atmega32_Keypad__teben27:
;libs/keypad_Atmega32.mbas,218 :: 		if case_is_selceted_show[lcd_line][1]<> 0  then
	LDS        R16, _lcd_line+0
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R16, Z
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben197
	JMP        L_libs/keypad_Atmega32_Keypad__teben30
L_libs/keypad_Atmega32_Keypad__teben197:
;libs/keypad_Atmega32.mbas,219 :: 		Bytetostr(var_in,txt)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,220 :: 		LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][1], txt)
	LDS        R16, _lcd_line+0
	MOV        R20, R16
	SUBI       R20, 255
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R3, R16
	MOV        R2, R20
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
L_libs/keypad_Atmega32_Keypad__teben30:
;libs/keypad_Atmega32.mbas,222 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben25:
;libs/keypad_Atmega32.mbas,223 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,224 :: 		while (while_state_2_2<=5 )
L_libs/keypad_Atmega32_Keypad__teben33:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L_libs/keypad_Atmega32_Keypad__teben198
	JMP        L_libs/keypad_Atmega32_Keypad__teben34
L_libs/keypad_Atmega32_Keypad__teben198:
;libs/keypad_Atmega32.mbas,225 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;libs/keypad_Atmega32.mbas,226 :: 		if (Button(Up_SW_Port, Up_SW_bit,swich_time,On_state)) then    ' Detect logical one up key
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben199
	JMP        L_libs/keypad_Atmega32_Keypad__teben38
L_libs/keypad_Atmega32_Keypad__teben199:
;libs/keypad_Atmega32.mbas,227 :: 		oldstate_up = 1  Buzzer_on_off(1)    while_state_2_2=6                 ' Update flag
	LDI        R27, 1
	STD        Y+1, R27
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L_libs/keypad_Atmega32_Keypad__teben38:
;libs/keypad_Atmega32.mbas,229 :: 		if (oldstate_up and Button(Up_SW_Port, Up_SW_bit,swich_time,Off_state)) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	LDD        R17, Y+1
	AND        R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben200
	JMP        L_libs/keypad_Atmega32_Keypad__teben41
L_libs/keypad_Atmega32_Keypad__teben200:
;libs/keypad_Atmega32.mbas,230 :: 		if (var_in=p_max) then
	CP         R2, R3
	BREQ       L_libs/keypad_Atmega32_Keypad__teben201
	JMP        L_libs/keypad_Atmega32_Keypad__teben44
L_libs/keypad_Atmega32_Keypad__teben201:
;libs/keypad_Atmega32.mbas,231 :: 		var_in=p_min
	MOV        R2, R4
	JMP        L_libs/keypad_Atmega32_Keypad__teben45
;libs/keypad_Atmega32.mbas,232 :: 		else
L_libs/keypad_Atmega32_Keypad__teben44:
;libs/keypad_Atmega32.mbas,233 :: 		var_in=var_in+1
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
;libs/keypad_Atmega32.mbas,234 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben45:
;libs/keypad_Atmega32.mbas,235 :: 		if (var_in_lcd=Choice_number) then
	LDD        R16, Y+4
	CP         R16, R5
	BREQ       L_libs/keypad_Atmega32_Keypad__teben202
	JMP        L_libs/keypad_Atmega32_Keypad__teben47
L_libs/keypad_Atmega32_Keypad__teben202:
;libs/keypad_Atmega32.mbas,236 :: 		var_in_lcd=1
	LDI        R27, 1
	STD        Y+4, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben48
;libs/keypad_Atmega32.mbas,237 :: 		else
L_libs/keypad_Atmega32_Keypad__teben47:
;libs/keypad_Atmega32.mbas,238 :: 		var_in_lcd=var_in_lcd+1
	LDD        R16, Y+4
	SUBI       R16, 255
	STD        Y+4, R16
;libs/keypad_Atmega32.mbas,239 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben48:
;libs/keypad_Atmega32.mbas,241 :: 		oldstate_up = 0  while_state_2_2=6
	LDI        R27, 0
	STD        Y+1, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L_libs/keypad_Atmega32_Keypad__teben41:
;libs/keypad_Atmega32.mbas,244 :: 		if (Button(Down_SW_Port, Down_SW_bit,swich_time,On_state)) then    ' Detect logical one Down key
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben203
	JMP        L_libs/keypad_Atmega32_Keypad__teben50
L_libs/keypad_Atmega32_Keypad__teben203:
;libs/keypad_Atmega32.mbas,245 :: 		oldstate_down = 1    Buzzer_on_off(1)  while_state_2_2=6                 ' Update flag
	LDI        R27, 1
	STD        Y+2, R27
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L_libs/keypad_Atmega32_Keypad__teben50:
;libs/keypad_Atmega32.mbas,247 :: 		if (oldstate_down and Button(Down_SW_Port, Down_SW_bit,swich_time,Off_state)) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	LDD        R17, Y+2
	AND        R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben204
	JMP        L_libs/keypad_Atmega32_Keypad__teben53
L_libs/keypad_Atmega32_Keypad__teben204:
;libs/keypad_Atmega32.mbas,248 :: 		if (var_in=p_min) then
	CP         R2, R4
	BREQ       L_libs/keypad_Atmega32_Keypad__teben205
	JMP        L_libs/keypad_Atmega32_Keypad__teben56
L_libs/keypad_Atmega32_Keypad__teben205:
;libs/keypad_Atmega32.mbas,249 :: 		var_in=p_max
	MOV        R2, R3
	JMP        L_libs/keypad_Atmega32_Keypad__teben57
;libs/keypad_Atmega32.mbas,250 :: 		else
L_libs/keypad_Atmega32_Keypad__teben56:
;libs/keypad_Atmega32.mbas,251 :: 		var_in=var_in-1
	MOV        R16, R2
	SUBI       R16, 1
	MOV        R2, R16
;libs/keypad_Atmega32.mbas,252 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben57:
;libs/keypad_Atmega32.mbas,253 :: 		if (var_in_lcd=1) then
	LDD        R16, Y+4
	CPI        R16, 1
	BREQ       L_libs/keypad_Atmega32_Keypad__teben206
	JMP        L_libs/keypad_Atmega32_Keypad__teben59
L_libs/keypad_Atmega32_Keypad__teben206:
;libs/keypad_Atmega32.mbas,254 :: 		var_in_lcd=Choice_number
	STD        Y+4, R5
	JMP        L_libs/keypad_Atmega32_Keypad__teben60
;libs/keypad_Atmega32.mbas,255 :: 		else
L_libs/keypad_Atmega32_Keypad__teben59:
;libs/keypad_Atmega32.mbas,256 :: 		var_in_lcd=var_in_lcd-1
	LDD        R16, Y+4
	SUBI       R16, 1
	STD        Y+4, R16
;libs/keypad_Atmega32.mbas,257 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben60:
;libs/keypad_Atmega32.mbas,258 :: 		oldstate_down=0  while_state_2_2=6
	LDI        R27, 0
	STD        Y+2, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L_libs/keypad_Atmega32_Keypad__teben53:
;libs/keypad_Atmega32.mbas,260 :: 		var_in_global=var_in
	STS        _var_in_global+0, R2
;libs/keypad_Atmega32.mbas,261 :: 		First_second_comand=2  oldstate_2 = 0
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,262 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,swich_time,Off_state)<> 0)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben207
	LDI        R27, 255
L_libs/keypad_Atmega32_Keypad__teben207:
	MOV        R16, R27
	STD        Y+18, R16
;libs/keypad_Atmega32.mbas,263 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,swich_time,Off_state)<> 0)then    ' Detect logical one setting key
	CLR        R6
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L_libs/keypad_Atmega32_Keypad__teben208
	LDI        R17, 255
L_libs/keypad_Atmega32_Keypad__teben208:
	LDD        R16, Y+18
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben209
	JMP        L_libs/keypad_Atmega32_Keypad__teben62
L_libs/keypad_Atmega32_Keypad__teben209:
;libs/keypad_Atmega32.mbas,264 :: 		oldstate_men_ok = 1   Buzzer_on_off(1)    while_state_2_2=6                ' Update flag
	LDI        R27, 1
	STD        Y+3, R27
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L_libs/keypad_Atmega32_Keypad__teben62:
;libs/keypad_Atmega32.mbas,266 :: 		if (oldstate_men_ok and Button(Menu_SW_Port,Menu_SW_bit,swich_time,On_state))
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	LDD        R17, Y+3
	AND        R16, R17
	STD        Y+18, R16
;libs/keypad_Atmega32.mbas,267 :: 		or (while_state_import and oldstate_3 and Button(Ok_SW_Port,Ok_SW_bit,swich_time,On_state))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CLT
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L_libs/keypad_Atmega32_Keypad__teben213
	SET
L_libs/keypad_Atmega32_Keypad__teben213:
	BLD        R3, 0
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CLR        R17
	SBRC       R3, 0
	INC        R17
	AND        R17, R16
	LDD        R16, Y+18
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben214
	JMP        L_libs/keypad_Atmega32_Keypad__teben65
L_libs/keypad_Atmega32_Keypad__teben214:
;libs/keypad_Atmega32.mbas,268 :: 		oldstate_men_ok = 0
	LDI        R27, 0
	STD        Y+3, R27
;libs/keypad_Atmega32.mbas,269 :: 		while_state_import=0   while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,270 :: 		k_set=k_set+1
	LDS        R16, _k_set+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _k_set+0, R17
;libs/keypad_Atmega32.mbas,271 :: 		if k_set=K_set_max then
	LDS        R16, _K_set_max+0
	CP         R17, R16
	BREQ       L_libs/keypad_Atmega32_Keypad__teben215
	JMP        L_libs/keypad_Atmega32_Keypad__teben68
L_libs/keypad_Atmega32_Keypad__teben215:
;libs/keypad_Atmega32.mbas,272 :: 		k_set=1
	LDI        R27, 1
	STS        _k_set+0, R27
L_libs/keypad_Atmega32_Keypad__teben68:
;libs/keypad_Atmega32.mbas,274 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	STD        Y+28, R16
	STD        Y+29, R17
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	STD        Y+20, R16
	STD        Y+21, R17
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+4
	SUBI       R20, 1
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	STD        Y+26, R16
	STD        Y+27, R17
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+24, R18
	STD        Y+25, R19
;libs/keypad_Atmega32.mbas,275 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+28
	LDD        R23, Y+29
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+20
	LDD        R21, Y+21
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+22, R18
	STD        Y+23, R19
;libs/keypad_Atmega32.mbas,276 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][2],
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R18, R22
	ADC        R19, R23
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 222
	SBCI       R17, 255
	STD        Y+20, R16
	STD        Y+21, R17
;libs/keypad_Atmega32.mbas,277 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+18, R16
	STD        Y+19, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+18
	LDD        R19, Y+19
	ADD        R18, R16
	ADC        R19, R17
	LDD        R22, Y+26
	LDD        R23, Y+27
	MOV        R7, R22
	MOV        R8, R23
	ADD        R7, R18
	ADC        R8, R19
;libs/keypad_Atmega32.mbas,278 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R20, Y+28
	LDD        R21, Y+29
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R22
	ADC        R19, R23
	MOV        R25, R18
	MOV        R26, R19
	SUBI       R25, 239
	SBCI       R26, 255
;libs/keypad_Atmega32.mbas,279 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][2],num_)
	LDS        R18, _lcd_line+0
	MOV        R24, R18
	SUBI       R24, 255
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R18, R20
	ADC        R19, R21
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R22
	ADC        R17, R23
	MOVW       R22, R16
	SUBI       R22, 222
	SBCI       R23, 255
	LDD        R20, Y+24
	LDD        R21, Y+25
	LDD        R18, Y+22
	LDD        R19, Y+23
	LDD        R16, Y+20
	LDD        R17, Y+21
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R16, Y+5
	PUSH       R16
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R8
	PUSH       R7
	MOV        R7, R16
	MOV        R8, R17
	LDS        R6, _lcd_line+0
	MOVW       R4, R18
	MOVW       R2, R20
	CALL       libs/keypad_Atmega32_Show_text+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 8
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,281 :: 		if case_is_selceted_show[lcd_line-1][0]<> 0  then
	LDS        R16, _lcd_line+0
	SUBI       R16, 1
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben216
	JMP        L_libs/keypad_Atmega32_Keypad__teben71
L_libs/keypad_Atmega32_Keypad__teben216:
;libs/keypad_Atmega32.mbas,282 :: 		Bytetostr(var_in,txt)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,283 :: 		LCD_Out(lcd_line,case_is_selceted_show[lcd_line-1][0], txt)
	LDS        R16, _lcd_line+0
	SUBI       R16, 1
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R3, R16
	LDS        R2, _lcd_line+0
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
L_libs/keypad_Atmega32_Keypad__teben71:
;libs/keypad_Atmega32.mbas,285 :: 		if case_is_selceted_show[lcd_line][0]<> 0  then
	LDS        R16, _lcd_line+0
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben217
	JMP        L_libs/keypad_Atmega32_Keypad__teben74
L_libs/keypad_Atmega32_Keypad__teben217:
;libs/keypad_Atmega32.mbas,286 :: 		Bytetostr(var_in,txt)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,287 :: 		LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][0], txt)
	LDS        R16, _lcd_line+0
	MOV        R20, R16
	SUBI       R20, 255
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R3, R16
	MOV        R2, R20
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
L_libs/keypad_Atmega32_Keypad__teben74:
;libs/keypad_Atmega32.mbas,288 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben65:
;libs/keypad_Atmega32.mbas,290 :: 		delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben76:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben76
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben76
;libs/keypad_Atmega32.mbas,291 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben33
L_libs/keypad_Atmega32_Keypad__teben34:
;libs/keypad_Atmega32.mbas,292 :: 		var_in_global= var_in
	STS        _var_in_global+0, R2
;libs/keypad_Atmega32.mbas,293 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben10
L_libs/keypad_Atmega32_Keypad__teben11:
;libs/keypad_Atmega32.mbas,294 :: 		result=var_in_global
	LDS        R16, _var_in_global+0
	STD        Y+0, R16
;libs/keypad_Atmega32.mbas,295 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_libs/keypad_Atmega32_Keypad__teben78:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben78
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben78
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben78
	NOP
;libs/keypad_Atmega32.mbas,296 :: 		end sub
	LDD        R16, Y+0
L_end_Keypad__teben:
	POP        R8
	POP        R7
	ADIW       R28, 29
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Keypad__teben

libs/keypad_Atmega32_key_rest_all:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,302 :: 		dim First_second_comand,var_in,lcd_line as byte
;libs/keypad_Atmega32.mbas,303 :: 		for First_second_comand =1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L_libs/keypad_Atmega32_key_rest_all82:
;libs/keypad_Atmega32.mbas,304 :: 		for lcd_line =1 to 2
	LDI        R27, 1
	STD        Y+2, R27
L_libs/keypad_Atmega32_key_rest_all87:
;libs/keypad_Atmega32.mbas,305 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	STD        Y+1, R27
L_libs/keypad_Atmega32_key_rest_all91:
	LDD        R16, Y+1
	CP         R2, R16
	BRSH       L_libs/keypad_Atmega32_key_rest_all219
	JMP        L_libs/keypad_Atmega32_key_rest_all95
L_libs/keypad_Atmega32_key_rest_all219:
;libs/keypad_Atmega32.mbas,306 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "                "
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+5
	LDD        R19, Y+6
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+5
	LDD        R19, Y+6
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
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
;libs/keypad_Atmega32.mbas,307 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "                "
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+5
	LDD        R19, Y+6
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+5
	LDD        R19, Y+6
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 17
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
;libs/keypad_Atmega32.mbas,308 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][2]= "1"
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+5
	LDD        R19, Y+6
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+1
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+5
	LDD        R19, Y+6
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 34
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,309 :: 		case_is_selceted_show[lcd_line-1][0]=0
	LDD        R16, Y+2
	SUBI       R16, 1
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LDI        R27, 0
	ST         Z, R27
;libs/keypad_Atmega32.mbas,310 :: 		case_is_selceted_show[lcd_line-1][1]=0
	LDD        R16, Y+2
	SUBI       R16, 1
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LDI        R27, 0
	ST         Z, R27
;libs/keypad_Atmega32.mbas,311 :: 		next var_in
	LDD        R16, Y+1
	CP         R16, R2
	BRNE       L_libs/keypad_Atmega32_key_rest_all220
	JMP        L_libs/keypad_Atmega32_key_rest_all95
L_libs/keypad_Atmega32_key_rest_all220:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all91
L_libs/keypad_Atmega32_key_rest_all95:
;libs/keypad_Atmega32.mbas,312 :: 		next lcd_line
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L_libs/keypad_Atmega32_key_rest_all221
	JMP        L_libs/keypad_Atmega32_key_rest_all90
L_libs/keypad_Atmega32_key_rest_all221:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all87
L_libs/keypad_Atmega32_key_rest_all90:
;libs/keypad_Atmega32.mbas,313 :: 		next First_second_comand
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L_libs/keypad_Atmega32_key_rest_all222
	JMP        L_libs/keypad_Atmega32_key_rest_all85
L_libs/keypad_Atmega32_key_rest_all222:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all82
L_libs/keypad_Atmega32_key_rest_all85:
;libs/keypad_Atmega32.mbas,315 :: 		end sub
L_end_key_rest_all:
	ADIW       R28, 6
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_key_rest_all

libs/keypad_Atmega32_key_choice_select:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 19
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,320 :: 		dim byref one_,two_ as string[5],dim byref three_ as string[4],)
;libs/keypad_Atmega32.mbas,323 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,324 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,328 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,329 :: 		key_rest_all(Choice_number)
	PUSH       R2
	MOV        R2, R3
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,330 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_choice_select97:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_choice_select224
	JMP        L_libs/keypad_Atmega32_key_choice_select101
L_libs/keypad_Atmega32_key_choice_select224:
;libs/keypad_Atmega32.mbas,331 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= one_+" "+two_+" "+three_ ''"Auto Manul <Ex>"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R18, R16
	MOV        R26, R28
	MOV        R27, R29
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	MOVW       R30, R8
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,332 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= one_+" "+two_+" "+three_ ''"Auto Manul <Ex>"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R18, R16
	SUBI       R18, 239
	SBCI       R19, 255
	MOV        R26, R28
	MOV        R27, R29
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	MOVW       R30, R8
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,336 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_choice_select225
	JMP        L_libs/keypad_Atmega32_key_choice_select101
L_libs/keypad_Atmega32_key_choice_select225:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_choice_select97
L_libs/keypad_Atmega32_key_choice_select101:
;libs/keypad_Atmega32.mbas,341 :: 		lcd_line=2
	LDI        R27, 2
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,342 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "^^^^            "
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 155
	SBCI       R17, 254
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
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
;libs/keypad_Atmega32.mbas,343 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "     ^^^^       "
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 205
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
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
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,344 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "           ^^^^ "
	LDI        R27, 3
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 154
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
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
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,347 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,348 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_choice_select102:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_choice_select226
	JMP        L_libs/keypad_Atmega32_key_choice_select106
L_libs/keypad_Atmega32_key_choice_select226:
;libs/keypad_Atmega32.mbas,349 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]=" is selcted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,353 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_choice_select227
	JMP        L_libs/keypad_Atmega32_key_choice_select106
L_libs/keypad_Atmega32_key_choice_select227:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_choice_select102
L_libs/keypad_Atmega32_key_choice_select106:
;libs/keypad_Atmega32.mbas,354 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= one_+"  setting    "
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	MOV        R26, R16
	MOV        R27, R17
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 115
	ST         X+, R16
	LDI        R16, 101
	ST         X+, R16
	LDI        R16, 116
	ST         X+, R16
	LDI        R16, 116
	ST         X+, R16
	LDI        R16, 105
	ST         X+, R16
	LDI        R16, 110
	ST         X+, R16
	LDI        R16, 103
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,355 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= two_+" setting    "
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 205
	SBCI       R17, 255
	MOV        R26, R16
	MOV        R27, R17
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 115
	ST         X+, R16
	LDI        R16, 101
	ST         X+, R16
	LDI        R16, 116
	ST         X+, R16
	LDI        R16, 116
	ST         X+, R16
	LDI        R16, 105
	ST         X+, R16
	LDI        R16, 110
	ST         X+, R16
	LDI        R16, 103
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,356 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Exiting          "
	LDI        R27, 3
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+17
	LDD        R19, Y+18
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	SUBI       R30, 154
	SBCI       R31, 255
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,360 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,361 :: 		end sub
L_end_key_choice_select:
	ADIW       R28, 18
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_key_choice_select

libs/keypad_Atmega32_key_Prog_123:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,363 :: 		dim var_in as byte
;libs/keypad_Atmega32.mbas,364 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:  2 3 4 5 6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 53
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 54
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 55
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,365 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1   3 4 5 6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 205
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 53
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 54
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 55
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,366 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2   4 5 6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 154
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 53
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 54
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 55
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,367 :: 		var_in=4     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3   5 6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 103
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 53
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 54
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 55
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,368 :: 		var_in=5     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4   6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 52
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 54
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 55
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,369 :: 		var_in=6     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4 5   7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 1
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 53
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 55
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,370 :: 		var_in=7     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4 5 6  "
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 206
	SBCI       R17, 254
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 53
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 54
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,371 :: 		end sub
L_end_key_Prog_123:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_key_Prog_123

libs/keypad_Atmega32_key_Prog_select:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,375 :: 		sub procedure key_Prog_select(dim var_in,Choice_number as byte)
;libs/keypad_Atmega32.mbas,378 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,379 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,383 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,384 :: 		key_rest_all(Choice_number)
	PUSH       R2
	MOV        R2, R3
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,385 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_Prog_select109:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_Prog_select230
	JMP        L_libs/keypad_Atmega32_key_Prog_select113
L_libs/keypad_Atmega32_key_Prog_select230:
;libs/keypad_Atmega32.mbas,386 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Pls Chs Prg Num"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,387 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pls Chs Prg Num"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,388 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "Pr:1 2 3 4 5 6 7"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 53
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 54
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 55
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,391 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_Prog_select231
	JMP        L_libs/keypad_Atmega32_key_Prog_select113
L_libs/keypad_Atmega32_key_Prog_select231:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_Prog_select109
L_libs/keypad_Atmega32_key_Prog_select113:
;libs/keypad_Atmega32.mbas,392 :: 		lcd_line=2   key_Prog_123( First_second_comand,lcd_line)
	LDI        R27, 2
	STS        _lcd_line+0, R27
	PUSH       R3
	PUSH       R2
	LDI        R27, 2
	MOV        R3, R27
	LDS        R2, _First_second_comand+0
	CALL       libs/keypad_Atmega32_key_Prog_123+0
	POP        R2
	POP        R3
;libs/keypad_Atmega32.mbas,401 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,402 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_Prog_select114:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_Prog_select232
	JMP        L_libs/keypad_Atmega32_key_Prog_select118
L_libs/keypad_Atmega32_key_Prog_select232:
;libs/keypad_Atmega32.mbas,403 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Program     is selcted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 109
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,405 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Going to It's Setting"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 71
	ST         Z+, R27
	LDI        R27, 111
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
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 39
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,409 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_Prog_select233
	JMP        L_libs/keypad_Atmega32_key_Prog_select118
L_libs/keypad_Atmega32_key_Prog_select233:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_Prog_select114
L_libs/keypad_Atmega32_key_Prog_select118:
;libs/keypad_Atmega32.mbas,411 :: 		case_is_selceted_show[lcd_line-1][0]=10
	LDS        R16, _lcd_line+0
	SUBI       R16, 1
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LDI        R27, 10
	ST         Z, R27
;libs/keypad_Atmega32.mbas,413 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,414 :: 		end sub
L_end_key_Prog_select:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_key_Prog_select

libs/keypad_Atmega32_Key_Time_Select:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,419 :: 		sub procedure Key_Time_Select(dim var_in,Choice_number as byte)
;libs/keypad_Atmega32.mbas,422 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,423 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,427 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,428 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,429 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Time_Select120:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Time_Select235
	JMP        L_libs/keypad_Atmega32_Key_Time_Select124
L_libs/keypad_Atmega32_Key_Time_Select235:
;libs/keypad_Atmega32.mbas,430 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Time:Heatr Motor"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 114
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
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,431 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "Pr:1 2 3 4 5 6 7"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 53
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 54
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 55
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,435 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Time_Select236
	JMP        L_libs/keypad_Atmega32_Key_Time_Select124
L_libs/keypad_Atmega32_Key_Time_Select236:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Time_Select120
L_libs/keypad_Atmega32_Key_Time_Select124:
;libs/keypad_Atmega32.mbas,436 :: 		lcd_line=1
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,437 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Time:      Motor"
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
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
;libs/keypad_Atmega32.mbas,438 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Time:Heatr      "
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 205
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 114
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
;libs/keypad_Atmega32.mbas,445 :: 		lcd_line=2   key_Prog_123( First_second_comand,lcd_line)
	LDI        R27, 2
	STS        _lcd_line+0, R27
	PUSH       R3
	PUSH       R2
	LDI        R27, 2
	MOV        R3, R27
	LDS        R2, _First_second_comand+0
	CALL       libs/keypad_Atmega32_key_Prog_123+0
	POP        R2
	POP        R3
;libs/keypad_Atmega32.mbas,454 :: 		First_second_comand=2 lcd_line=1 var_in =1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,456 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Heater Timer Sett"
	LDI        R18, 202
	LDI        R19, 2
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
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
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,458 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is selcted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,460 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in][0]="Motor Timer Sett"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	MOV        R20, R2
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
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
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,462 :: 		Options_array[First_second_comand-1][lcd_line][var_in][0]="ing is selcted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	MOV        R20, R2
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,471 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,472 :: 		end sub
L_end_Key_Time_Select:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Key_Time_Select

libs/keypad_Atmega32_Key_Heat_mot_Time:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 18
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,477 :: 		sub procedure Key_Heat_mot_Time(dim var_in,Choice_number as byte,dim byref ht_or_mt as string[5],dim byref min_sec as string[3])
;libs/keypad_Atmega32.mbas,480 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,481 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,485 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,486 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,487 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Heat_mot_Time126:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Heat_mot_Time238
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time130
L_libs/keypad_Atmega32_Key_Heat_mot_Time238:
;libs/keypad_Atmega32.mbas,489 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= ht_or_mt+":>>>"+min_sec+"<<<"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R18, R16
	MOV        R26, R28
	MOV        R27, R29
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 58
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,490 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= ht_or_mt+":>>>"+min_sec+"<<<"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R18, R16
	SUBI       R18, 239
	SBCI       R19, 255
	MOV        R26, R28
	MOV        R27, R29
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 58
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,491 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "                "
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
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
;libs/keypad_Atmega32.mbas,495 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Heat_mot_Time239
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time130
L_libs/keypad_Atmega32_Key_Heat_mot_Time239:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time126
L_libs/keypad_Atmega32_Key_Heat_mot_Time130:
;libs/keypad_Atmega32.mbas,507 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,508 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Heat_mot_Time131:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Heat_mot_Time240
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time135
L_libs/keypad_Atmega32_Key_Heat_mot_Time240:
;libs/keypad_Atmega32.mbas,510 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]=ht_or_mt+" Timer Sett"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R26, R16
	MOV        R27, R17
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 84
	ST         X+, R16
	LDI        R16, 105
	ST         X+, R16
	LDI        R16, 109
	ST         X+, R16
	LDI        R16, 101
	ST         X+, R16
	LDI        R16, 114
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 83
	ST         X+, R16
	LDI        R16, 101
	ST         X+, R16
	LDI        R16, 116
	ST         X+, R16
	LDI        R16, 116
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,512 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is seted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+16
	LDD        R19, Y+17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,514 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Heat_mot_Time241
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time135
L_libs/keypad_Atmega32_Key_Heat_mot_Time241:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time131
L_libs/keypad_Atmega32_Key_Heat_mot_Time135:
;libs/keypad_Atmega32.mbas,517 :: 		case_is_selceted_show[lcd_line][0]=1
	LDS        R16, _lcd_line+0
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LDI        R27, 1
	ST         Z, R27
;libs/keypad_Atmega32.mbas,518 :: 		case_is_selceted_show[lcd_line][1]=9
	LDS        R16, _lcd_line+0
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LDI        R27, 9
	ST         Z, R27
;libs/keypad_Atmega32.mbas,519 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,520 :: 		end sub
L_end_Key_Heat_mot_Time:
	ADIW       R28, 17
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Key_Heat_mot_Time

libs/keypad_Atmega32_Key_exit_back:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 16
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,525 :: 		sub procedure Key_exit_back(dim var_in,Choice_number as byte,dim byref Back_ as string[5],dim byref Save_ as string[3])
;libs/keypad_Atmega32.mbas,528 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,529 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,533 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,534 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,535 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_exit_back137:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_exit_back243
	JMP        L_libs/keypad_Atmega32_Key_exit_back141
L_libs/keypad_Atmega32_Key_exit_back243:
;libs/keypad_Atmega32.mbas,537 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "<"+Back_+">"+"<"+Save_+">"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R18, R16
	MOV        R26, R28
	MOV        R27, R29
	LDI        R16, 60
	ST         X+, R16
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,538 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "<"+Back_+">"+"<"+Save_+">"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R18, R16
	SUBI       R18, 239
	SBCI       R19, 255
	MOV        R26, R28
	MOV        R27, R29
	LDI        R16, 60
	ST         X+, R16
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,542 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_exit_back244
	JMP        L_libs/keypad_Atmega32_Key_exit_back141
L_libs/keypad_Atmega32_Key_exit_back244:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_exit_back137
L_libs/keypad_Atmega32_Key_exit_back141:
;libs/keypad_Atmega32.mbas,544 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "<"+Back_+">"''+"<"+min_sec+">"
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R18, R16
	SUBI       R18, 239
	SBCI       R19, 255
	MOV        R26, R28
	MOV        R27, R29
	LDI        R16, 60
	ST         X+, R16
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,545 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "        "+"<"+Save_+">"
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 205
	SBCI       R17, 255
	MOVW       R18, R16
	SUBI       R18, 239
	SBCI       R19, 255
	MOV        R26, R28
	MOV        R27, R29
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,547 :: 		lcd_line=2
	LDI        R27, 2
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,548 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "  ^^^^          "
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 155
	SBCI       R17, 254
	MOVW       R30, R16
	ADIW       R30, 17
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
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
;libs/keypad_Atmega32.mbas,549 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "          ^^^^  "
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 205
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 17
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 94
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,560 :: 		First_second_comand=2 lcd_line=1 var_in=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,563 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]=Back_+"is"
	LDI        R18, 202
	LDI        R19, 2
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R26, R16
	MOV        R27, R17
	MOVW       R30, R4
	CALL       ___CS2S+0
	LDI        R16, 105
	ST         X+, R16
	LDI        R16, 115
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,564 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in][0]=Save_+"is"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 51
	LDI        R17, 0
	MOV        R20, R2
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	MOV        R26, R16
	MOV        R27, R17
	MOVW       R30, R6
	CALL       ___CS2S+0
	LDI        R16, 105
	ST         X+, R16
	LDI        R16, 115
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,566 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is seted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R2
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+14
	LDD        R19, Y+15
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,571 :: 		case_is_selceted_show[lcd_line][0]=1
	LDS        R16, _lcd_line+0
	MOV        R18, R16
	LDI        R19, 0
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_case_is_selceted_show+0)
	LDI        R17, hi_addr(_case_is_selceted_show+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LDI        R27, 1
	ST         Z, R27
;libs/keypad_Atmega32.mbas,573 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,574 :: 		end sub
L_end_Key_exit_back:
	ADIW       R28, 15
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Key_exit_back

_Keypad_start:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 31
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,580 :: 		dim var_main as byte[level_Number]
;libs/keypad_Atmega32.mbas,581 :: 		Choice_number=3      ''first level
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 3
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,582 :: 		Heater_motor_index=1 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,583 :: 		key_choice_select(1,Choice_number,"Prog","Setng","<Ex>")
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R20, R28
	SUBI       R20, 249
	SBCI       R21, 255
	MOVW       R30, R28
	ADIW       R30, 12
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R18, R28
	SUBI       R18, 244
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 18
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 238
	SBCI       R17, 255
	PUSH       R2
	MOVW       R8, R20
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_choice_select+0
;libs/keypad_Atmega32.mbas,584 :: 		var_main[0]=Keypad__teben(2,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
	CLR        R6
	LDS        R5, _Choice_number+0
	LDI        R27, 1
	MOV        R4, R27
	LDS        R3, _Choice_number+0
	LDI        R27, 2
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+0, R16
;libs/keypad_Atmega32.mbas,586 :: 		while_state_2=1
	LDS        R27, _while_state_2+0
	SBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,587 :: 		while  (while_state_2 )
L__Keypad_start144:
	LDS        R27, _while_state_2+0
	SBRS       R27, BitPos(_while_state_2+0)
	JMP        L__Keypad_start145
;libs/keypad_Atmega32.mbas,589 :: 		case 1
	LDD        R16, Y+0
	CPI        R16, 1
	BREQ       L__Keypad_start246
	JMP        L__Keypad_start151
L__Keypad_start246:
;libs/keypad_Atmega32.mbas,590 :: 		Choice_number=7 while_state_2=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,591 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,592 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,593 :: 		ByteToStr(chanel_, txt_byte_min)
	PUSH       R2
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,594 :: 		Lcd_0()Lcd_Out(1,1,"Prog is:") Lcd_Out(2,1,txt_byte_min) delay_ms(2000)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 7
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L__Keypad_start152:
	DEC        R16
	BRNE       L__Keypad_start152
	DEC        R17
	BRNE       L__Keypad_start152
	DEC        R18
	BRNE       L__Keypad_start152
	NOP
	NOP
	NOP
	NOP
;libs/keypad_Atmega32.mbas,595 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R6
	LDS        R5, _Choice_number+0
	LDI        R27, 1
	MOV        R4, R27
	LDS        R3, _Choice_number+0
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,596 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 12
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+144)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+144)
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
	LDD        R16, Y+2
	ST         Z, R16
;libs/keypad_Atmega32.mbas,597 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	JMP        L__Keypad_start148
L__Keypad_start151:
;libs/keypad_Atmega32.mbas,599 :: 		case 2
	LDD        R16, Y+0
	CPI        R16, 2
	BREQ       L__Keypad_start247
	JMP        L__Keypad_start156
L__Keypad_start247:
;libs/keypad_Atmega32.mbas,600 :: 		Choice_number=3    while_state_2=0  ''first level
	LDI        R27, 3
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,601 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,602 :: 		key_choice_select(1,Choice_number,"Auto","Manul","<Ex>")
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R20, R28
	SUBI       R20, 249
	SBCI       R21, 255
	MOVW       R30, R28
	ADIW       R30, 12
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R18, R28
	SUBI       R18, 244
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 18
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 238
	SBCI       R17, 255
	PUSH       R2
	MOVW       R8, R20
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_choice_select+0
;libs/keypad_Atmega32.mbas,603 :: 		var_main[1]=Keypad__teben(2,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
	CLR        R6
	LDS        R5, _Choice_number+0
	LDI        R27, 1
	MOV        R4, R27
	LDS        R3, _Choice_number+0
	LDI        R27, 2
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+1, R16
;libs/keypad_Atmega32.mbas,605 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,606 :: 		while  (while_state_import )
L__Keypad_start158:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Keypad_start159
;libs/keypad_Atmega32.mbas,609 :: 		case 1
	LDD        R16, Y+1
	CPI        R16, 1
	BREQ       L__Keypad_start248
	JMP        L__Keypad_start165
L__Keypad_start248:
;libs/keypad_Atmega32.mbas,610 :: 		Choice_number=7 while_state_import=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,611 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,612 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,613 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R6
	LDS        R5, _Choice_number+0
	LDI        R27, 1
	MOV        R4, R27
	LDS        R3, _Choice_number+0
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,615 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 12
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+144)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+144)
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
	LDD        R16, Y+2
	ST         Z, R16
;libs/keypad_Atmega32.mbas,619 :: 		Lcd_0()Lcd_Out(1,1,"Pls Do normal Wo") Lcd_Out(2,1,"rk we save times!!!") delay_ms(200)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Keypad_start166:
	DEC        R16
	BRNE       L__Keypad_start166
	DEC        R17
	BRNE       L__Keypad_start166
	DEC        R18
	BRNE       L__Keypad_start166
	NOP
;libs/keypad_Atmega32.mbas,621 :: 		Easy_vacuum_95_10_4_simple_working(var_main[2],0,1)
	LDI        R27, 1
	MOV        R4, R27
	CLR        R3
	LDD        R2, Y+2
	CALL       _Easy_vacuum_95_10_4_simple_working+0
;libs/keypad_Atmega32.mbas,622 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"EEPROM") delay_ms(200)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 7
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 7
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
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Keypad_start168:
	DEC        R16
	BRNE       L__Keypad_start168
	DEC        R17
	BRNE       L__Keypad_start168
	DEC        R18
	BRNE       L__Keypad_start168
	NOP
;libs/keypad_Atmega32.mbas,623 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	JMP        L__Keypad_start162
L__Keypad_start165:
;libs/keypad_Atmega32.mbas,626 :: 		case 2
	LDD        R16, Y+1
	CPI        R16, 2
	BREQ       L__Keypad_start249
	JMP        L__Keypad_start172
L__Keypad_start249:
;libs/keypad_Atmega32.mbas,627 :: 		Choice_number=7 ''while_state_import=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,628 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,629 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R6
	LDS        R5, _Choice_number+0
	LDI        R27, 1
	MOV        R4, R27
	LDS        R3, _Choice_number+0
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,630 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,631 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
	LDI        R18, 12
	LDI        R19, 0
	LDI        R16, #lo_addr(_Mot_heater_On_mSec+144)
	LDI        R17, hi_addr(_Mot_heater_On_mSec+144)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 8
	LDD        R16, Y+2
	ST         Z, R16
;libs/keypad_Atmega32.mbas,632 :: 		Choice_number=2
	LDI        R27, 2
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,636 :: 		Heater_motor_index=2 Pwm_chanel_main=1 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,637 :: 		Key_Heat_mot_Time(1,Choice_number,"Heater","Min")
	LDI        R27, 77
	STD        Y+7, R27
	LDI        R27, 105
	STD        Y+8, R27
	LDI        R27, 110
	STD        Y+9, R27
	LDI        R27, 0
	STD        Y+10, R27
	MOVW       R18, R28
	SUBI       R18, 249
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 11
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
	SUBI       R16, 245
	SBCI       R17, 255
	PUSH       R2
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,640 :: 		var_main[3]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	CLR        R6
	LDS        R5, _Choice_number+0
	CLR        R4
	LDI        R27, 59
	MOV        R3, R27
	MOV        R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+3, R16
;libs/keypad_Atmega32.mbas,641 :: 		Key_Heat_mot_Time(1,Choice_number,"Heater","Sec")
	LDI        R27, 83
	STD        Y+7, R27
	LDI        R27, 101
	STD        Y+8, R27
	LDI        R27, 99
	STD        Y+9, R27
	LDI        R27, 0
	STD        Y+10, R27
	MOVW       R18, R28
	SUBI       R18, 249
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 11
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
	SUBI       R16, 245
	SBCI       R17, 255
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,642 :: 		var_main[4]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	CLR        R6
	LDS        R5, _Choice_number+0
	CLR        R4
	LDI        R27, 59
	MOV        R3, R27
	MOV        R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+4, R16
;libs/keypad_Atmega32.mbas,646 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[3]
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDD        R16, Y+3
	ST         Z, R16
;libs/keypad_Atmega32.mbas,647 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[4]
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDD        R16, Y+4
	ST         Z, R16
;libs/keypad_Atmega32.mbas,649 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[1]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+1
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,650 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","Min")
	LDI        R27, 77
	STD        Y+7, R27
	LDI        R27, 105
	STD        Y+8, R27
	LDI        R27, 110
	STD        Y+9, R27
	LDI        R27, 0
	STD        Y+10, R27
	MOVW       R18, R28
	SUBI       R18, 249
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 11
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
	SUBI       R16, 245
	SBCI       R17, 255
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,651 :: 		var_main[5]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main][1],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	CLR        R6
	LDS        R5, _Choice_number+0
	CLR        R4
	LDI        R27, 59
	MOV        R3, R27
	MOV        R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+5, R16
;libs/keypad_Atmega32.mbas,652 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","Sec")
	LDI        R27, 83
	STD        Y+7, R27
	LDI        R27, 101
	STD        Y+8, R27
	LDI        R27, 99
	STD        Y+9, R27
	LDI        R27, 0
	STD        Y+10, R27
	MOVW       R18, R28
	SUBI       R18, 249
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 11
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
	SUBI       R16, 245
	SBCI       R17, 255
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,653 :: 		var_main[6]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main][2],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
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
	CLR        R6
	LDS        R5, _Choice_number+0
	CLR        R4
	LDI        R27, 59
	MOV        R3, R27
	MOV        R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+6, R16
;libs/keypad_Atmega32.mbas,657 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main][1]=var_main[5]
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LDD        R16, Y+5
	ST         Z, R16
;libs/keypad_Atmega32.mbas,658 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main][2]=var_main[6]
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel_main+0
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	LDD        R16, Y+6
	ST         Z, R16
;libs/keypad_Atmega32.mbas,660 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"EEPROM") delay_ms(200)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 7
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 7
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
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Keypad_start173:
	DEC        R16
	BRNE       L__Keypad_start173
	DEC        R17
	BRNE       L__Keypad_start173
	DEC        R18
	BRNE       L__Keypad_start173
	NOP
;libs/keypad_Atmega32.mbas,661 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
;libs/keypad_Atmega32.mbas,662 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L__Keypad_start162
L__Keypad_start172:
;libs/keypad_Atmega32.mbas,663 :: 		case 3
	LDD        R16, Y+1
	CPI        R16, 3
	BREQ       L__Keypad_start250
	JMP        L__Keypad_start177
L__Keypad_start250:
;libs/keypad_Atmega32.mbas,664 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,665 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 70
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
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
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 116
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
	SUBI       R16, 249
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
L__Keypad_start178:
	DEC        R16
	BRNE       L__Keypad_start178
	DEC        R17
	BRNE       L__Keypad_start178
	DEC        R18
	BRNE       L__Keypad_start178
	NOP
	JMP        L__Keypad_start162
L__Keypad_start177:
L__Keypad_start162:
;libs/keypad_Atmega32.mbas,667 :: 		wend
	JMP        L__Keypad_start158
L__Keypad_start159:
;libs/keypad_Atmega32.mbas,668 :: 		Lcd_0()Lcd_Out(1,1,"END keypad") Lcd_Out(2,1,"EEPROM") delay_ms(1000)
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 7
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
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__Keypad_start180:
	DEC        R16
	BRNE       L__Keypad_start180
	DEC        R17
	BRNE       L__Keypad_start180
	DEC        R18
	BRNE       L__Keypad_start180
	JMP        L__Keypad_start148
L__Keypad_start156:
;libs/keypad_Atmega32.mbas,669 :: 		case 3
	LDD        R16, Y+0
	CPI        R16, 3
	BREQ       L__Keypad_start251
	JMP        L__Keypad_start184
L__Keypad_start251:
;libs/keypad_Atmega32.mbas,670 :: 		while_state_2=0
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,671 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 70
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
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
	SUBI       R16, 249
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 7
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 116
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
	SUBI       R16, 249
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
L__Keypad_start185:
	DEC        R16
	BRNE       L__Keypad_start185
	DEC        R17
	BRNE       L__Keypad_start185
	DEC        R18
	BRNE       L__Keypad_start185
	NOP
	JMP        L__Keypad_start148
L__Keypad_start184:
L__Keypad_start148:
;libs/keypad_Atmega32.mbas,673 :: 		wend
	JMP        L__Keypad_start144
L__Keypad_start145:
;libs/keypad_Atmega32.mbas,674 :: 		end sub
L_end_Keypad_start:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	ADIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_start

_libs/keypad_Atmega32_?main:

;libs/keypad_Atmega32.mbas,675 :: 		end.
L_end_libs/keypad_Atmega32_?main:
	RET
; end of _libs/keypad_Atmega32_?main
