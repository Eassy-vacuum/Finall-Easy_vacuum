
_Key_Port_Init:

;libs/keypad_Atmega32.mbas,119 :: 		sub procedure Key_Port_Init()
;libs/keypad_Atmega32.mbas,130 :: 		DDB0_bit = 0 DDB1_bit = 0   DDB2_bit = 0 DDB4_bit = 0                ' Set PORTE pin 7 as input pin for the Heater switches
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
;libs/keypad_Atmega32.mbas,131 :: 		DDD2_bit = 0 DDD3_bit = 0     DDD6_bit = 0     '' DDD5_bit = 0
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
	IN         R27, DDD6_bit+0
	CBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;libs/keypad_Atmega32.mbas,134 :: 		end sub
L_end_Key_Port_Init:
	RET
; end of _Key_Port_Init

libs/keypad_Atmega32_Show_text:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	ADIW       R28, 5

;libs/keypad_Atmega32.mbas,141 :: 		,dim byref text_main_2,text_new_2 as string[16],dim lcd_line_2 as byte,dim byref location_my_2 as string[1],dim num_ as byte )
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
;libs/keypad_Atmega32.mbas,150 :: 		if num_ = 1 then
	CPI        R16, 1
	BREQ       L_libs/keypad_Atmega32_Show_text231
	JMP        L_libs/keypad_Atmega32_Show_text3
L_libs/keypad_Atmega32_Show_text231:
; num_ end address is: 16 (R16)
;libs/keypad_Atmega32.mbas,151 :: 		LCD_Out(lcd_line_1,1,text_main_1)  ''Show on LCD
	MOVW       R4, R2
	LDI        R27, 1
	MOV        R3, R27
	MOV        R2, R6
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,152 :: 		LCD_Out(lcd_line_2,1,text_main_2)  ''Show on LCD
	LDD        R4, Y+0
	LDD        R5, Y+1
	LDI        R27, 1
	MOV        R3, R27
	LDD        R2, Y+4
	CALL       _Lcd_Out+0
	JMP        L_libs/keypad_Atmega32_Show_text4
;libs/keypad_Atmega32.mbas,153 :: 		else
L_libs/keypad_Atmega32_Show_text3:
;libs/keypad_Atmega32.mbas,154 :: 		LCD_Out(lcd_line_1,1,text_new_1)  ''Show on LCD
	LDI        R27, 1
	MOV        R3, R27
	MOV        R2, R6
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,155 :: 		LCD_Out(lcd_line_2,1,text_new_2)  ''Show on LCD
	LDD        R4, Y+2
	LDD        R5, Y+3
	LDI        R27, 1
	MOV        R3, R27
	LDD        R2, Y+4
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,156 :: 		end if
L_libs/keypad_Atmega32_Show_text4:
;libs/keypad_Atmega32.mbas,159 :: 		end sub
L_end_Show_text:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Show_text

libs/keypad_Atmega32_show_in_button:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 12
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,163 :: 		sub procedure show_in_button(DIM var_in_old_on_off_2 as byte,dim var_in_2,var_in_lcd_2 as integer,dim num_2 as byte )
;libs/keypad_Atmega32.mbas,165 :: 		if   var_in_old_on_off_2<>0 then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	LDI        R27, 0
	CP         R2, R27
	BRNE       L_libs/keypad_Atmega32_show_in_button233
	JMP        L_libs/keypad_Atmega32_show_in_button7
L_libs/keypad_Atmega32_show_in_button233:
;libs/keypad_Atmega32.mbas,166 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	STD        Y+10, R16
	STD        Y+11, R17
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
	STD        Y+2, R16
	STD        Y+3, R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R5
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+8, R18
	STD        Y+9, R19
;libs/keypad_Atmega32.mbas,167 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+10
	LDD        R23, Y+11
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+2
	LDD        R21, Y+3
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+6, R18
	STD        Y+7, R19
;libs/keypad_Atmega32.mbas,168 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][2],
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
	STD        Y+4, R16
	STD        Y+5, R17
;libs/keypad_Atmega32.mbas,169 :: 		Options_array[First_second_comand-1][lcd_line][var_in_old_on_off_2-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	STD        Y+2, R16
	STD        Y+3, R17
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
	MOVW       R8, R16
	ADD        R8, R18
	ADC        R9, R19
;libs/keypad_Atmega32.mbas,170 :: 		Options_array[First_second_comand-1][lcd_line][var_in_old_on_off_2-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+10
	LDD        R23, Y+11
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+2
	LDD        R21, Y+3
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	MOV        R25, R18
	MOV        R26, R19
	SUBI       R25, 239
	SBCI       R26, 255
;libs/keypad_Atmega32.mbas,171 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_old_on_off_2-1][2],num_2)
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
	LDD        R20, Y+8
	LDD        R21, Y+9
	LDD        R18, Y+6
	LDD        R19, Y+7
	LDD        R16, Y+4
	LDD        R17, Y+5
	PUSH       R7
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R9
	PUSH       R8
	LDS        R6, _lcd_line+0
	MOVW       R4, R18
	MOVW       R2, R20
	MOV        R7, R16
	MOV        R8, R17
	CALL       libs/keypad_Atmega32_Show_text+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 8
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	JMP        L_libs/keypad_Atmega32_show_in_button8
;libs/keypad_Atmega32.mbas,172 :: 		else
L_libs/keypad_Atmega32_show_in_button7:
;libs/keypad_Atmega32.mbas,173 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	STD        Y+10, R16
	STD        Y+11, R17
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
	STD        Y+2, R16
	STD        Y+3, R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R5
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	STD        Y+8, R16
	STD        Y+9, R17
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+6, R18
	STD        Y+7, R19
;libs/keypad_Atmega32.mbas,174 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+10
	LDD        R23, Y+11
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+2
	LDD        R21, Y+3
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+4, R18
	STD        Y+5, R19
;libs/keypad_Atmega32.mbas,175 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][2],
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
	STD        Y+2, R16
	STD        Y+3, R17
;libs/keypad_Atmega32.mbas,176 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd_2-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R18, R16
	ADC        R19, R17
	LDD        R22, Y+8
	LDD        R23, Y+9
	MOVW       R8, R22
	ADD        R8, R18
	ADC        R9, R19
;libs/keypad_Atmega32.mbas,177 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd_2-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R20, Y+10
	LDD        R21, Y+11
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
;libs/keypad_Atmega32.mbas,178 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_lcd_2-1][2],num_2)
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
	LDD        R20, Y+6
	LDD        R21, Y+7
	LDD        R18, Y+4
	LDD        R19, Y+5
	LDD        R16, Y+2
	LDD        R17, Y+3
	PUSH       R4
	PUSH       R3
	PUSH       R7
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R9
	PUSH       R8
	LDS        R6, _lcd_line+0
	MOVW       R4, R18
	MOVW       R2, R20
	MOV        R7, R16
	MOV        R8, R17
	CALL       libs/keypad_Atmega32_Show_text+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 8
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R3
	POP        R4
;libs/keypad_Atmega32.mbas,179 :: 		Bytetostr(var_in_2,txt)
	MOV        R2, R3
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,180 :: 		if case_is_selceted_show[lcd_line-1][1]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_show_in_button234
	JMP        L_libs/keypad_Atmega32_show_in_button10
L_libs/keypad_Atmega32_show_in_button234:
;libs/keypad_Atmega32.mbas,182 :: 		LCD_Out(lcd_line,case_is_selceted_show[lcd_line-1][1], txt)
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
L_libs/keypad_Atmega32_show_in_button10:
;libs/keypad_Atmega32.mbas,184 :: 		if case_is_selceted_show[lcd_line][1]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_show_in_button235
	JMP        L_libs/keypad_Atmega32_show_in_button13
L_libs/keypad_Atmega32_show_in_button235:
;libs/keypad_Atmega32.mbas,186 :: 		LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][1], txt)
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
L_libs/keypad_Atmega32_show_in_button13:
;libs/keypad_Atmega32.mbas,188 :: 		end if
L_libs/keypad_Atmega32_show_in_button8:
;libs/keypad_Atmega32.mbas,189 :: 		end sub
L_end_show_in_button:
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 11
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_show_in_button

libs/keypad_Atmega32_Keypad__teben:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 37
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,198 :: 		dim oldstate_up,oldstate_down,oldstate_men_ok,num_ as byte
;libs/keypad_Atmega32.mbas,214 :: 		First_second_comand=1 lcd_line=1
	PUSH       R8
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,215 :: 		Lcd_0()
	PUSH       R7
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
	POP        R7
;libs/keypad_Atmega32.mbas,218 :: 		if var_in=0 then
	LDI        R27, 0
	CP         R3, R27
	BRNE       L_libs/keypad_Atmega32_Keypad__teben237
	LDI        R27, 0
	CP         R2, R27
L_libs/keypad_Atmega32_Keypad__teben237:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben238
	JMP        L_libs/keypad_Atmega32_Keypad__teben17
L_libs/keypad_Atmega32_Keypad__teben238:
;libs/keypad_Atmega32.mbas,219 :: 		var_in_lcd=var_in+1
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+7, R16
	STD        Y+8, R17
	JMP        L_libs/keypad_Atmega32_Keypad__teben18
;libs/keypad_Atmega32.mbas,220 :: 		else
L_libs/keypad_Atmega32_Keypad__teben17:
;libs/keypad_Atmega32.mbas,221 :: 		var_in_lcd=var_in
	STD        Y+7, R2
	STD        Y+8, R3
;libs/keypad_Atmega32.mbas,222 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben18:
;libs/keypad_Atmega32.mbas,223 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,224 :: 		oldstate_up=0 oldstate_down=0    num_=0  k=0
	LDI        R27, 0
	STD        Y+12, R27
;libs/keypad_Atmega32.mbas,225 :: 		oldstate_men_ok=0  oldstate_2=0
	LDI        R27, 0
	STD        Y+11, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,226 :: 		while  (while_state_import )
L_libs/keypad_Atmega32_Keypad__teben20:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/keypad_Atmega32_Keypad__teben21
;libs/keypad_Atmega32.mbas,227 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,229 :: 		if var_in>Choice_number then   var_in_lcd=(var_in mod Choice_number) end if
	MOV        R16, R6
	LDI        R17, 0
	CP         R16, R2
	CPC        R17, R3
	BRLT       L_libs/keypad_Atmega32_Keypad__teben239
	JMP        L_libs/keypad_Atmega32_Keypad__teben25
L_libs/keypad_Atmega32_Keypad__teben239:
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R20, R6
	LDI        R21, 0
	MOVW       R16, R2
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	STD        Y+7, R16
	STD        Y+8, R17
L_libs/keypad_Atmega32_Keypad__teben25:
;libs/keypad_Atmega32.mbas,230 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+7
	LDD        R17, Y+8
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben240
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben240:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben241
	JMP        L_libs/keypad_Atmega32_Keypad__teben28
L_libs/keypad_Atmega32_Keypad__teben241:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben28:
;libs/keypad_Atmega32.mbas,231 :: 		if num_=2 then num_=0 end if
	LDD        R16, Y+12
	CPI        R16, 2
	BREQ       L_libs/keypad_Atmega32_Keypad__teben242
	JMP        L_libs/keypad_Atmega32_Keypad__teben31
L_libs/keypad_Atmega32_Keypad__teben242:
	LDI        R27, 0
	STD        Y+12, R27
L_libs/keypad_Atmega32_Keypad__teben31:
;libs/keypad_Atmega32.mbas,232 :: 		num_=num_+1
	LDD        R16, Y+12
	SUBI       R16, 255
	STD        Y+12, R16
;libs/keypad_Atmega32.mbas,233 :: 		if   var_in_old_on_off<>0 then
	LDI        R27, 0
	CP         R7, R27
	BRNE       L_libs/keypad_Atmega32_Keypad__teben243
	JMP        L_libs/keypad_Atmega32_Keypad__teben34
L_libs/keypad_Atmega32_Keypad__teben243:
;libs/keypad_Atmega32.mbas,234 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	STD        Y+27, R16
	STD        Y+28, R17
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+7
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+33, R18
	STD        Y+34, R19
;libs/keypad_Atmega32.mbas,235 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+35
	LDD        R23, Y+36
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+27
	LDD        R21, Y+28
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+31, R18
	STD        Y+32, R19
;libs/keypad_Atmega32.mbas,236 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][2],
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
	STD        Y+29, R16
	STD        Y+30, R17
;libs/keypad_Atmega32.mbas,237 :: 		Options_array[First_second_comand-1][lcd_line][var_in_old_on_off-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	STD        Y+27, R16
	STD        Y+28, R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R7
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	MOVW       R8, R16
	ADD        R8, R18
	ADC        R9, R19
;libs/keypad_Atmega32.mbas,238 :: 		Options_array[First_second_comand-1][lcd_line][var_in_old_on_off-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+35
	LDD        R23, Y+36
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+27
	LDD        R21, Y+28
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	MOV        R25, R18
	MOV        R26, R19
	SUBI       R25, 239
	SBCI       R26, 255
;libs/keypad_Atmega32.mbas,239 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_old_on_off-1][2],num_)
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
	LDD        R20, Y+33
	LDD        R21, Y+34
	LDD        R18, Y+31
	LDD        R19, Y+32
	LDD        R16, Y+29
	LDD        R17, Y+30
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R16, Y+12
	PUSH       R16
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R9
	PUSH       R8
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
	POP        R7
	JMP        L_libs/keypad_Atmega32_Keypad__teben35
;libs/keypad_Atmega32.mbas,240 :: 		else
L_libs/keypad_Atmega32_Keypad__teben34:
;libs/keypad_Atmega32.mbas,241 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	STD        Y+27, R16
	STD        Y+28, R17
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+7
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	STD        Y+33, R16
	STD        Y+34, R17
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+31, R18
	STD        Y+32, R19
;libs/keypad_Atmega32.mbas,242 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+35
	LDD        R23, Y+36
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+27
	LDD        R21, Y+28
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+29, R18
	STD        Y+30, R19
;libs/keypad_Atmega32.mbas,243 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][2],
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
	STD        Y+27, R16
	STD        Y+28, R17
;libs/keypad_Atmega32.mbas,244 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R22, Y+33
	LDD        R23, Y+34
	MOVW       R8, R22
	ADD        R8, R18
	ADC        R9, R19
;libs/keypad_Atmega32.mbas,245 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R20, Y+35
	LDD        R21, Y+36
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
;libs/keypad_Atmega32.mbas,246 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][2],num_)
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
	LDD        R20, Y+31
	LDD        R21, Y+32
	LDD        R18, Y+29
	LDD        R19, Y+30
	LDD        R16, Y+27
	LDD        R17, Y+28
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R16, Y+12
	PUSH       R16
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R9
	PUSH       R8
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
	POP        R7
;libs/keypad_Atmega32.mbas,247 :: 		if case_is_selceted_show[lcd_line-1][1]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben244
	JMP        L_libs/keypad_Atmega32_Keypad__teben37
L_libs/keypad_Atmega32_Keypad__teben244:
;libs/keypad_Atmega32.mbas,248 :: 		Bytetostr(var_in,txt)
	PUSH       R7
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
;libs/keypad_Atmega32.mbas,249 :: 		LCD_Out(lcd_line,case_is_selceted_show[lcd_line-1][1], txt)
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
	POP        R7
L_libs/keypad_Atmega32_Keypad__teben37:
;libs/keypad_Atmega32.mbas,251 :: 		if case_is_selceted_show[lcd_line][1]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben245
	JMP        L_libs/keypad_Atmega32_Keypad__teben40
L_libs/keypad_Atmega32_Keypad__teben245:
;libs/keypad_Atmega32.mbas,252 :: 		Bytetostr(var_in,txt)
	PUSH       R7
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
;libs/keypad_Atmega32.mbas,253 :: 		LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][1], txt)
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
	POP        R7
L_libs/keypad_Atmega32_Keypad__teben40:
;libs/keypad_Atmega32.mbas,255 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben35:
;libs/keypad_Atmega32.mbas,256 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,257 :: 		while (while_state_2_2<=5 )
L_libs/keypad_Atmega32_Keypad__teben43:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L_libs/keypad_Atmega32_Keypad__teben246
	JMP        L_libs/keypad_Atmega32_Keypad__teben44
L_libs/keypad_Atmega32_Keypad__teben246:
;libs/keypad_Atmega32.mbas,258 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;libs/keypad_Atmega32.mbas,259 :: 		if (Button(Up_SW_Port, Up_SW_bit,swich_time,On_state)) then    ' Detect logical one up key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
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
	POP        R7
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben247
	JMP        L_libs/keypad_Atmega32_Keypad__teben48
L_libs/keypad_Atmega32_Keypad__teben247:
;libs/keypad_Atmega32.mbas,260 :: 		oldstate_up = 1  Buzzer_on_off(1)    while_state_2_2=6  k=1  j=0 k_for=0                 ' Update flag
	LDI        R27, 1
	STD        Y+9, R27
	PUSH       R7
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
	POP        R7
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDI        R27, 0
	STD        Y+5, R27
	STD        Y+6, R27
	LDI        R27, 0
	STD        Y+1, R27
	STD        Y+2, R27
;libs/keypad_Atmega32.mbas,261 :: 		while (k_for=0)
L_libs/keypad_Atmega32_Keypad__teben51:
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben248
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben248:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben249
	JMP        L_libs/keypad_Atmega32_Keypad__teben52
L_libs/keypad_Atmega32_Keypad__teben249:
;libs/keypad_Atmega32.mbas,262 :: 		j=j+1
	LDD        R16, Y+5
	LDD        R17, Y+6
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+5, R16
	STD        Y+6, R17
;libs/keypad_Atmega32.mbas,263 :: 		if (Button(Up_SW_Port, Up_SW_bit,20,On_state)) then
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 20
	MOV        R5, R27
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
	POP        R7
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben250
	JMP        L_libs/keypad_Atmega32_Keypad__teben56
L_libs/keypad_Atmega32_Keypad__teben250:
;libs/keypad_Atmega32.mbas,264 :: 		k= (j mod p_max)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R20, R4
	LDI        R21, 0
	LDD        R16, Y+5
	LDD        R17, Y+6
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	STD        Y+3, R16
	STD        Y+4, R17
L_libs/keypad_Atmega32_Keypad__teben56:
;libs/keypad_Atmega32.mbas,266 :: 		var_in=var_in+k
	LDD        R16, Y+3
	LDD        R17, Y+4
	ADD        R16, R2
	ADC        R17, R3
	MOVW       R2, R16
;libs/keypad_Atmega32.mbas,267 :: 		if (var_in>=p_max) then
	CP         R16, R4
	LDI        R27, 0
	CPC        R17, R27
	BRGE       L_libs/keypad_Atmega32_Keypad__teben251
	JMP        L_libs/keypad_Atmega32_Keypad__teben59
L_libs/keypad_Atmega32_Keypad__teben251:
;libs/keypad_Atmega32.mbas,268 :: 		var_in=p_min
	MOV        R2, R5
	LDI        R27, 0
	MOV        R3, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben60
;libs/keypad_Atmega32.mbas,269 :: 		else
L_libs/keypad_Atmega32_Keypad__teben59:
;libs/keypad_Atmega32.mbas,273 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben60:
;libs/keypad_Atmega32.mbas,274 :: 		var_in_lcd=var_in_lcd+k
	LDD        R18, Y+7
	LDD        R19, Y+8
	LDD        R16, Y+3
	LDD        R17, Y+4
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+7, R18
	STD        Y+8, R19
;libs/keypad_Atmega32.mbas,275 :: 		if (var_in_lcd>Choice_number) then
	MOV        R16, R6
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben252
	JMP        L_libs/keypad_Atmega32_Keypad__teben62
L_libs/keypad_Atmega32_Keypad__teben252:
;libs/keypad_Atmega32.mbas,276 :: 		var_in_lcd=1
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben63
;libs/keypad_Atmega32.mbas,277 :: 		else
L_libs/keypad_Atmega32_Keypad__teben62:
;libs/keypad_Atmega32.mbas,279 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben63:
;libs/keypad_Atmega32.mbas,281 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+7
	LDD        R17, Y+8
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben253
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben253:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben254
	JMP        L_libs/keypad_Atmega32_Keypad__teben65
L_libs/keypad_Atmega32_Keypad__teben254:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben65:
;libs/keypad_Atmega32.mbas,282 :: 		if num_>=2 then num_=0 end if
	LDD        R16, Y+12
	CPI        R16, 2
	BRSH       L_libs/keypad_Atmega32_Keypad__teben255
	JMP        L_libs/keypad_Atmega32_Keypad__teben68
L_libs/keypad_Atmega32_Keypad__teben255:
	LDI        R27, 0
	STD        Y+12, R27
L_libs/keypad_Atmega32_Keypad__teben68:
;libs/keypad_Atmega32.mbas,283 :: 		num_=num_+1
	LDD        R16, Y+12
	SUBI       R16, 255
	STD        Y+12, R16
;libs/keypad_Atmega32.mbas,284 :: 		show_in_button(var_in_old_on_off,var_in,var_in_lcd,num_)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R5, Y+7
	LDD        R6, Y+8
	MOV        R4, R3
	MOV        R3, R2
	MOV        R2, R7
	MOV        R7, R16
	CALL       libs/keypad_Atmega32_show_in_button+0
;libs/keypad_Atmega32.mbas,287 :: 		if (oldstate_Up and Button(Up_SW_Port, Up_SW_bit,swich_time_off,Off_state)) then
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
	POP        R7
	LDD        R17, Y+9
	AND        R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben256
	JMP        L_libs/keypad_Atmega32_Keypad__teben71
L_libs/keypad_Atmega32_Keypad__teben256:
;libs/keypad_Atmega32.mbas,288 :: 		oldstate_up = 0  while_state_2_2=6 k_for=1
	LDI        R27, 0
	STD        Y+9, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
L_libs/keypad_Atmega32_Keypad__teben71:
;libs/keypad_Atmega32.mbas,290 :: 		delay_ms(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben73:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben73
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben73
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben73
	NOP
;libs/keypad_Atmega32.mbas,291 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben51
L_libs/keypad_Atmega32_Keypad__teben52:
L_libs/keypad_Atmega32_Keypad__teben48:
;libs/keypad_Atmega32.mbas,309 :: 		if (Button(Down_SW_Port, Down_SW_bit,swich_time,On_state)) then    ' Detect logical one Down key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 5
	MOV        R5, R27
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
	POP        R7
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben257
	JMP        L_libs/keypad_Atmega32_Keypad__teben76
L_libs/keypad_Atmega32_Keypad__teben257:
;libs/keypad_Atmega32.mbas,310 :: 		oldstate_down = 1    Buzzer_on_off(1)  while_state_2_2=6    k=1  j=0  k_for=0         ' Update flag
	LDI        R27, 1
	STD        Y+10, R27
	PUSH       R7
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
	POP        R7
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDI        R27, 0
	STD        Y+5, R27
	STD        Y+6, R27
	LDI        R27, 0
	STD        Y+1, R27
	STD        Y+2, R27
;libs/keypad_Atmega32.mbas,311 :: 		while (k_for=0)
L_libs/keypad_Atmega32_Keypad__teben79:
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben258
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben258:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben259
	JMP        L_libs/keypad_Atmega32_Keypad__teben80
L_libs/keypad_Atmega32_Keypad__teben259:
;libs/keypad_Atmega32.mbas,312 :: 		j=j+1
	LDD        R16, Y+5
	LDD        R17, Y+6
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+5, R16
	STD        Y+6, R17
;libs/keypad_Atmega32.mbas,313 :: 		if (Button(Down_SW_Port, Down_SW_bit,20,On_state)) then
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 20
	MOV        R5, R27
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
	POP        R7
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben260
	JMP        L_libs/keypad_Atmega32_Keypad__teben84
L_libs/keypad_Atmega32_Keypad__teben260:
;libs/keypad_Atmega32.mbas,314 :: 		k= (j mod p_max)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R20, R4
	LDI        R21, 0
	LDD        R16, Y+5
	LDD        R17, Y+6
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	STD        Y+3, R16
	STD        Y+4, R17
L_libs/keypad_Atmega32_Keypad__teben84:
;libs/keypad_Atmega32.mbas,319 :: 		var_in=var_in-k
	LDD        R0, Y+3
	LDD        R1, Y+4
	MOVW       R18, R2
	SUB        R18, R0
	SBC        R19, R1
	MOVW       R2, R18
;libs/keypad_Atmega32.mbas,320 :: 		if (var_in<=p_min) then
	MOV        R16, R5
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L_libs/keypad_Atmega32_Keypad__teben261
	JMP        L_libs/keypad_Atmega32_Keypad__teben87
L_libs/keypad_Atmega32_Keypad__teben261:
;libs/keypad_Atmega32.mbas,321 :: 		var_in=p_max
	MOV        R2, R4
	LDI        R27, 0
	MOV        R3, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben88
;libs/keypad_Atmega32.mbas,322 :: 		else
L_libs/keypad_Atmega32_Keypad__teben87:
;libs/keypad_Atmega32.mbas,326 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben88:
;libs/keypad_Atmega32.mbas,327 :: 		var_in_lcd=var_in_lcd-k
	LDD        R0, Y+3
	LDD        R1, Y+4
	LDD        R18, Y+7
	LDD        R19, Y+8
	SUB        R18, R0
	SBC        R19, R1
	STD        Y+7, R18
	STD        Y+8, R19
;libs/keypad_Atmega32.mbas,328 :: 		if (var_in_lcd<1) then
	LDI        R16, 1
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L_libs/keypad_Atmega32_Keypad__teben262
	JMP        L_libs/keypad_Atmega32_Keypad__teben90
L_libs/keypad_Atmega32_Keypad__teben262:
;libs/keypad_Atmega32.mbas,329 :: 		var_in_lcd=Choice_number
	STD        Y+7, R6
	LDI        R27, 0
	STD        Y+8, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben91
;libs/keypad_Atmega32.mbas,330 :: 		else
L_libs/keypad_Atmega32_Keypad__teben90:
;libs/keypad_Atmega32.mbas,332 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben91:
;libs/keypad_Atmega32.mbas,334 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+7
	LDD        R17, Y+8
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben263
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben263:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben264
	JMP        L_libs/keypad_Atmega32_Keypad__teben93
L_libs/keypad_Atmega32_Keypad__teben264:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben93:
;libs/keypad_Atmega32.mbas,335 :: 		if num_>=2 then num_=0 end if
	LDD        R16, Y+12
	CPI        R16, 2
	BRSH       L_libs/keypad_Atmega32_Keypad__teben265
	JMP        L_libs/keypad_Atmega32_Keypad__teben96
L_libs/keypad_Atmega32_Keypad__teben265:
	LDI        R27, 0
	STD        Y+12, R27
L_libs/keypad_Atmega32_Keypad__teben96:
;libs/keypad_Atmega32.mbas,336 :: 		num_=num_+1
	LDD        R16, Y+12
	SUBI       R16, 255
	STD        Y+12, R16
;libs/keypad_Atmega32.mbas,337 :: 		show_in_button(var_in_old_on_off,var_in,var_in_lcd,num_)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R5, Y+7
	LDD        R6, Y+8
	MOV        R4, R3
	MOV        R3, R2
	MOV        R2, R7
	MOV        R7, R16
	CALL       libs/keypad_Atmega32_show_in_button+0
;libs/keypad_Atmega32.mbas,361 :: 		if (oldstate_down and Button(Down_SW_Port, Down_SW_bit,swich_time_off,Off_state)) then
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
	POP        R7
	LDD        R17, Y+10
	AND        R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben266
	JMP        L_libs/keypad_Atmega32_Keypad__teben99
L_libs/keypad_Atmega32_Keypad__teben266:
;libs/keypad_Atmega32.mbas,363 :: 		oldstate_down=0  while_state_2_2=6  k_for=1
	LDI        R27, 0
	STD        Y+10, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
L_libs/keypad_Atmega32_Keypad__teben99:
;libs/keypad_Atmega32.mbas,366 :: 		delay_ms(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben101:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben101
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben101
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben101
	NOP
;libs/keypad_Atmega32.mbas,367 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben79
L_libs/keypad_Atmega32_Keypad__teben80:
L_libs/keypad_Atmega32_Keypad__teben76:
;libs/keypad_Atmega32.mbas,386 :: 		var_in_global=var_in
	STS        _var_in_global+0, R2
;libs/keypad_Atmega32.mbas,387 :: 		First_second_comand=2  oldstate_2 = 0
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,388 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,swich_time,Off_state)<> 0)
	PUSH       R7
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
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	LDI        R27, 0
	BREQ       L_libs/keypad_Atmega32_Keypad__teben267
	LDI        R27, 255
L_libs/keypad_Atmega32_Keypad__teben267:
	MOV        R16, R27
	STD        Y+25, R16
;libs/keypad_Atmega32.mbas,389 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,swich_time,Off_state)<> 0)then    ' Detect logical one setting key
	CLR        R6
	LDI        R27, 5
	MOV        R5, R27
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
	POP        R7
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L_libs/keypad_Atmega32_Keypad__teben268
	LDI        R17, 255
L_libs/keypad_Atmega32_Keypad__teben268:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben269
	JMP        L_libs/keypad_Atmega32_Keypad__teben104
L_libs/keypad_Atmega32_Keypad__teben269:
;libs/keypad_Atmega32.mbas,390 :: 		oldstate_men_ok = 1   Buzzer_on_off(1)    while_state_2_2=6                ' Update flag
	LDI        R27, 1
	STD        Y+11, R27
	PUSH       R7
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
	POP        R7
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
L_libs/keypad_Atmega32_Keypad__teben104:
;libs/keypad_Atmega32.mbas,392 :: 		if (oldstate_men_ok and Button(Menu_SW_Port,Menu_SW_bit,swich_time,On_state))
	PUSH       R7
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
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDD        R17, Y+11
	AND        R16, R17
	STD        Y+25, R16
;libs/keypad_Atmega32.mbas,393 :: 		or (while_state_import and oldstate_3 and Button(Ok_SW_Port,Ok_SW_bit,swich_time,On_state))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CLT
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L_libs/keypad_Atmega32_Keypad__teben273
	SET
L_libs/keypad_Atmega32_Keypad__teben273:
	BLD        R4, 0
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	CLR        R17
	SBRC       R4, 0
	INC        R17
	AND        R17, R16
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben274
	JMP        L_libs/keypad_Atmega32_Keypad__teben107
L_libs/keypad_Atmega32_Keypad__teben274:
;libs/keypad_Atmega32.mbas,394 :: 		oldstate_men_ok = 0
	LDI        R27, 0
	STD        Y+11, R27
;libs/keypad_Atmega32.mbas,395 :: 		while_state_import=0   while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,396 :: 		k_set=k_set+1
	LDS        R16, _k_set+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _k_set+0, R17
;libs/keypad_Atmega32.mbas,397 :: 		if k_set=K_set_max then
	LDS        R16, _K_set_max+0
	CP         R17, R16
	BREQ       L_libs/keypad_Atmega32_Keypad__teben275
	JMP        L_libs/keypad_Atmega32_Keypad__teben110
L_libs/keypad_Atmega32_Keypad__teben275:
;libs/keypad_Atmega32.mbas,398 :: 		k_set=1
	LDI        R27, 1
	STS        _k_set+0, R27
L_libs/keypad_Atmega32_Keypad__teben110:
;libs/keypad_Atmega32.mbas,400 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 202
	LDI        R21, 2
	CALL       _HWMul_16x16+0
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 101
	LDI        R17, 1
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	STD        Y+27, R16
	STD        Y+28, R17
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+7
	SUBI       R20, 1
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	STD        Y+33, R16
	STD        Y+34, R17
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+31, R18
	STD        Y+32, R19
;libs/keypad_Atmega32.mbas,401 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+35
	LDD        R23, Y+36
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+27
	LDD        R21, Y+28
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+29, R18
	STD        Y+30, R19
;libs/keypad_Atmega32.mbas,402 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][2],
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
	STD        Y+27, R16
	STD        Y+28, R17
;libs/keypad_Atmega32.mbas,403 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+25, R16
	STD        Y+26, R17
	LDI        R16, 101
	LDI        R17, 1
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+25
	LDD        R19, Y+26
	ADD        R18, R16
	ADC        R19, R17
	LDD        R22, Y+33
	LDD        R23, Y+34
	MOVW       R8, R22
	ADD        R8, R18
	ADC        R9, R19
;libs/keypad_Atmega32.mbas,404 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R20, Y+35
	LDD        R21, Y+36
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
;libs/keypad_Atmega32.mbas,405 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][2],num_)
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
	LDD        R20, Y+31
	LDD        R21, Y+32
	LDD        R18, Y+29
	LDD        R19, Y+30
	LDD        R16, Y+27
	LDD        R17, Y+28
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R16, Y+12
	PUSH       R16
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R9
	PUSH       R8
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
	POP        R7
;libs/keypad_Atmega32.mbas,407 :: 		if case_is_selceted_show[lcd_line-1][0]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben276
	JMP        L_libs/keypad_Atmega32_Keypad__teben113
L_libs/keypad_Atmega32_Keypad__teben276:
;libs/keypad_Atmega32.mbas,408 :: 		Bytetostr(var_in,txt)
	PUSH       R7
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
;libs/keypad_Atmega32.mbas,409 :: 		LCD_Out(lcd_line,case_is_selceted_show[lcd_line-1][0], txt)
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
	POP        R7
L_libs/keypad_Atmega32_Keypad__teben113:
;libs/keypad_Atmega32.mbas,411 :: 		if case_is_selceted_show[lcd_line][0]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben277
	JMP        L_libs/keypad_Atmega32_Keypad__teben116
L_libs/keypad_Atmega32_Keypad__teben277:
;libs/keypad_Atmega32.mbas,412 :: 		Bytetostr(var_in,txt)
	PUSH       R7
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
;libs/keypad_Atmega32.mbas,413 :: 		LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][0], txt)
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
	POP        R7
L_libs/keypad_Atmega32_Keypad__teben116:
;libs/keypad_Atmega32.mbas,414 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben107:
;libs/keypad_Atmega32.mbas,416 :: 		delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben118:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben118
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben118
;libs/keypad_Atmega32.mbas,417 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben43
L_libs/keypad_Atmega32_Keypad__teben44:
;libs/keypad_Atmega32.mbas,418 :: 		var_in_global= var_in
	STS        _var_in_global+0, R2
;libs/keypad_Atmega32.mbas,419 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben20
L_libs/keypad_Atmega32_Keypad__teben21:
;libs/keypad_Atmega32.mbas,420 :: 		result=var_in_global
	LDS        R16, _var_in_global+0
	STD        Y+0, R16
;libs/keypad_Atmega32.mbas,421 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_libs/keypad_Atmega32_Keypad__teben120:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben120
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben120
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben120
	NOP
;libs/keypad_Atmega32.mbas,422 :: 		end sub
	LDD        R16, Y+0
L_end_Keypad__teben:
	POP        R8
	ADIW       R28, 36
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

;libs/keypad_Atmega32.mbas,428 :: 		dim First_second_comand,var_in,lcd_line as byte
;libs/keypad_Atmega32.mbas,429 :: 		for First_second_comand =1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L_libs/keypad_Atmega32_key_rest_all124:
;libs/keypad_Atmega32.mbas,430 :: 		for lcd_line =1 to 2
	LDI        R27, 1
	STD        Y+2, R27
L_libs/keypad_Atmega32_key_rest_all129:
;libs/keypad_Atmega32.mbas,431 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	STD        Y+1, R27
L_libs/keypad_Atmega32_key_rest_all133:
	LDD        R16, Y+1
	CP         R2, R16
	BRSH       L_libs/keypad_Atmega32_key_rest_all279
	JMP        L_libs/keypad_Atmega32_key_rest_all137
L_libs/keypad_Atmega32_key_rest_all279:
;libs/keypad_Atmega32.mbas,432 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "                "
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
;libs/keypad_Atmega32.mbas,433 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "                "
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
;libs/keypad_Atmega32.mbas,434 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][2]= "1"
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
;libs/keypad_Atmega32.mbas,435 :: 		case_is_selceted_show[lcd_line-1][0]=0
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
;libs/keypad_Atmega32.mbas,436 :: 		case_is_selceted_show[lcd_line-1][1]=0
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
;libs/keypad_Atmega32.mbas,437 :: 		next var_in
	LDD        R16, Y+1
	CP         R16, R2
	BRNE       L_libs/keypad_Atmega32_key_rest_all280
	JMP        L_libs/keypad_Atmega32_key_rest_all137
L_libs/keypad_Atmega32_key_rest_all280:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all133
L_libs/keypad_Atmega32_key_rest_all137:
;libs/keypad_Atmega32.mbas,438 :: 		next lcd_line
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L_libs/keypad_Atmega32_key_rest_all281
	JMP        L_libs/keypad_Atmega32_key_rest_all132
L_libs/keypad_Atmega32_key_rest_all281:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all129
L_libs/keypad_Atmega32_key_rest_all132:
;libs/keypad_Atmega32.mbas,439 :: 		next First_second_comand
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L_libs/keypad_Atmega32_key_rest_all282
	JMP        L_libs/keypad_Atmega32_key_rest_all127
L_libs/keypad_Atmega32_key_rest_all282:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all124
L_libs/keypad_Atmega32_key_rest_all127:
;libs/keypad_Atmega32.mbas,441 :: 		end sub
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

;libs/keypad_Atmega32.mbas,446 :: 		dim byref one_,two_ as string[5],dim byref three_ as string[4],)
;libs/keypad_Atmega32.mbas,449 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,450 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,454 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,455 :: 		key_rest_all(Choice_number)
	PUSH       R2
	MOV        R2, R3
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,456 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_choice_select139:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_choice_select284
	JMP        L_libs/keypad_Atmega32_key_choice_select143
L_libs/keypad_Atmega32_key_choice_select284:
;libs/keypad_Atmega32.mbas,457 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= one_+" "+two_+" "+three_ ''"Auto Manul <Ex>"
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
;libs/keypad_Atmega32.mbas,458 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= one_+" "+two_+" "+three_ ''"Auto Manul <Ex>"
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
;libs/keypad_Atmega32.mbas,462 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_choice_select285
	JMP        L_libs/keypad_Atmega32_key_choice_select143
L_libs/keypad_Atmega32_key_choice_select285:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_choice_select139
L_libs/keypad_Atmega32_key_choice_select143:
;libs/keypad_Atmega32.mbas,467 :: 		lcd_line=2
	LDI        R27, 2
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,468 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "^^^^            "
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
;libs/keypad_Atmega32.mbas,469 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "     ^^^^       "
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
;libs/keypad_Atmega32.mbas,470 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "           ^^^^ "
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
;libs/keypad_Atmega32.mbas,473 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,474 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_choice_select144:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_choice_select286
	JMP        L_libs/keypad_Atmega32_key_choice_select148
L_libs/keypad_Atmega32_key_choice_select286:
;libs/keypad_Atmega32.mbas,475 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]=" is selcted"
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
;libs/keypad_Atmega32.mbas,479 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_choice_select287
	JMP        L_libs/keypad_Atmega32_key_choice_select148
L_libs/keypad_Atmega32_key_choice_select287:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_choice_select144
L_libs/keypad_Atmega32_key_choice_select148:
;libs/keypad_Atmega32.mbas,480 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= one_+"  setting    "
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
;libs/keypad_Atmega32.mbas,481 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= two_+" setting    "
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
;libs/keypad_Atmega32.mbas,482 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Exiting          "
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
;libs/keypad_Atmega32.mbas,486 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,487 :: 		end sub
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

;libs/keypad_Atmega32.mbas,489 :: 		dim var_in as byte
;libs/keypad_Atmega32.mbas,490 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:  2 3 4 5 6 7"
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
;libs/keypad_Atmega32.mbas,491 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1   3 4 5 6 7"
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
;libs/keypad_Atmega32.mbas,492 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2   4 5 6 7"
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
;libs/keypad_Atmega32.mbas,493 :: 		var_in=4     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3   5 6 7"
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
;libs/keypad_Atmega32.mbas,494 :: 		var_in=5     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4   6 7"
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
;libs/keypad_Atmega32.mbas,495 :: 		var_in=6     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4 5   7"
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
;libs/keypad_Atmega32.mbas,496 :: 		var_in=7     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4 5 6  "
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
;libs/keypad_Atmega32.mbas,497 :: 		end sub
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

;libs/keypad_Atmega32.mbas,501 :: 		sub procedure key_Prog_select(dim var_in,Choice_number as byte)
;libs/keypad_Atmega32.mbas,504 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,505 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,509 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,510 :: 		key_rest_all(Choice_number)
	PUSH       R2
	MOV        R2, R3
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,511 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_Prog_select151:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_Prog_select290
	JMP        L_libs/keypad_Atmega32_key_Prog_select155
L_libs/keypad_Atmega32_key_Prog_select290:
;libs/keypad_Atmega32.mbas,512 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Pls Chs Prg Num"
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
;libs/keypad_Atmega32.mbas,513 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pls Chs Prg Num"
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
;libs/keypad_Atmega32.mbas,514 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "Pr:1 2 3 4 5 6 7"
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
;libs/keypad_Atmega32.mbas,517 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_Prog_select291
	JMP        L_libs/keypad_Atmega32_key_Prog_select155
L_libs/keypad_Atmega32_key_Prog_select291:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_Prog_select151
L_libs/keypad_Atmega32_key_Prog_select155:
;libs/keypad_Atmega32.mbas,518 :: 		lcd_line=2   key_Prog_123( First_second_comand,lcd_line)
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
;libs/keypad_Atmega32.mbas,527 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,528 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_Prog_select156:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_Prog_select292
	JMP        L_libs/keypad_Atmega32_key_Prog_select160
L_libs/keypad_Atmega32_key_Prog_select292:
;libs/keypad_Atmega32.mbas,529 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Program     is selcted"
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
;libs/keypad_Atmega32.mbas,531 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Going to It's Setting"
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
;libs/keypad_Atmega32.mbas,535 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_Prog_select293
	JMP        L_libs/keypad_Atmega32_key_Prog_select160
L_libs/keypad_Atmega32_key_Prog_select293:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_Prog_select156
L_libs/keypad_Atmega32_key_Prog_select160:
;libs/keypad_Atmega32.mbas,537 :: 		case_is_selceted_show[lcd_line-1][0]=10
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
;libs/keypad_Atmega32.mbas,539 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,540 :: 		end sub
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

;libs/keypad_Atmega32.mbas,545 :: 		sub procedure Key_Time_Select(dim var_in,Choice_number as byte)
;libs/keypad_Atmega32.mbas,548 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,549 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,553 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,554 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,555 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Time_Select162:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Time_Select295
	JMP        L_libs/keypad_Atmega32_Key_Time_Select166
L_libs/keypad_Atmega32_Key_Time_Select295:
;libs/keypad_Atmega32.mbas,556 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Time:Heatr Motor"
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
;libs/keypad_Atmega32.mbas,557 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "Pr:1 2 3 4 5 6 7"
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
;libs/keypad_Atmega32.mbas,561 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Time_Select296
	JMP        L_libs/keypad_Atmega32_Key_Time_Select166
L_libs/keypad_Atmega32_Key_Time_Select296:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Time_Select162
L_libs/keypad_Atmega32_Key_Time_Select166:
;libs/keypad_Atmega32.mbas,562 :: 		lcd_line=1
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,563 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Time:      Motor"
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
;libs/keypad_Atmega32.mbas,564 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Time:Heatr      "
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
;libs/keypad_Atmega32.mbas,571 :: 		lcd_line=2   key_Prog_123( First_second_comand,lcd_line)
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
;libs/keypad_Atmega32.mbas,580 :: 		First_second_comand=2 lcd_line=1 var_in =1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,582 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Heater Timer Sett"
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
;libs/keypad_Atmega32.mbas,584 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is selcted"
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
;libs/keypad_Atmega32.mbas,586 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in][0]="Motor Timer Sett"
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
;libs/keypad_Atmega32.mbas,588 :: 		Options_array[First_second_comand-1][lcd_line][var_in][0]="ing is selcted"
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
;libs/keypad_Atmega32.mbas,597 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,598 :: 		end sub
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

;libs/keypad_Atmega32.mbas,603 :: 		sub procedure Key_Heat_mot_Time(dim var_in,Choice_number as byte,dim byref ht_or_mt as string[5],dim byref min_sec as string[3])
;libs/keypad_Atmega32.mbas,606 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,607 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,611 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,612 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,613 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Heat_mot_Time168:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Heat_mot_Time298
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time172
L_libs/keypad_Atmega32_Key_Heat_mot_Time298:
;libs/keypad_Atmega32.mbas,615 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= ht_or_mt+":>>>"+min_sec+"<<<"
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
;libs/keypad_Atmega32.mbas,616 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= ht_or_mt+":>>>"+min_sec+"<<<"
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
;libs/keypad_Atmega32.mbas,617 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "                "
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
;libs/keypad_Atmega32.mbas,621 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Heat_mot_Time299
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time172
L_libs/keypad_Atmega32_Key_Heat_mot_Time299:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time168
L_libs/keypad_Atmega32_Key_Heat_mot_Time172:
;libs/keypad_Atmega32.mbas,633 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,634 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Heat_mot_Time173:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Heat_mot_Time300
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time177
L_libs/keypad_Atmega32_Key_Heat_mot_Time300:
;libs/keypad_Atmega32.mbas,636 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]=ht_or_mt+" Timer Sett"
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
;libs/keypad_Atmega32.mbas,638 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is seted"
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
;libs/keypad_Atmega32.mbas,640 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Heat_mot_Time301
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time177
L_libs/keypad_Atmega32_Key_Heat_mot_Time301:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time173
L_libs/keypad_Atmega32_Key_Heat_mot_Time177:
;libs/keypad_Atmega32.mbas,643 :: 		case_is_selceted_show[lcd_line][0]=1
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
;libs/keypad_Atmega32.mbas,644 :: 		case_is_selceted_show[lcd_line][1]=9
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
;libs/keypad_Atmega32.mbas,645 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,646 :: 		end sub
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

;libs/keypad_Atmega32.mbas,651 :: 		sub procedure Key_exit_back(dim var_in,Choice_number as byte,dim byref Back_ as string[5],dim byref Save_ as string[3])
;libs/keypad_Atmega32.mbas,654 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,655 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,659 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,660 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,661 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_exit_back179:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_exit_back303
	JMP        L_libs/keypad_Atmega32_Key_exit_back183
L_libs/keypad_Atmega32_Key_exit_back303:
;libs/keypad_Atmega32.mbas,663 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "<"+Back_+">"+"<"+Save_+">"
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
;libs/keypad_Atmega32.mbas,664 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "<"+Back_+">"+"<"+Save_+">"
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
;libs/keypad_Atmega32.mbas,668 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_exit_back304
	JMP        L_libs/keypad_Atmega32_Key_exit_back183
L_libs/keypad_Atmega32_Key_exit_back304:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_exit_back179
L_libs/keypad_Atmega32_Key_exit_back183:
;libs/keypad_Atmega32.mbas,670 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "<"+Back_+">"''+"<"+min_sec+">"
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
;libs/keypad_Atmega32.mbas,671 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "        "+"<"+Save_+">"
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
;libs/keypad_Atmega32.mbas,673 :: 		lcd_line=2
	LDI        R27, 2
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,674 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "  ^^^^          "
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
;libs/keypad_Atmega32.mbas,675 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "          ^^^^  "
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
;libs/keypad_Atmega32.mbas,686 :: 		First_second_comand=2 lcd_line=1 var_in=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,689 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]=Back_+"is"
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
;libs/keypad_Atmega32.mbas,690 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in][0]=Save_+"is"
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
;libs/keypad_Atmega32.mbas,692 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is seted"
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
;libs/keypad_Atmega32.mbas,697 :: 		case_is_selceted_show[lcd_line][0]=1
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
;libs/keypad_Atmega32.mbas,699 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,700 :: 		end sub
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
	SBIW       R28, 32
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,706 :: 		dim var_main as byte[8]
;libs/keypad_Atmega32.mbas,707 :: 		Choice_number=3      ''first level
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 3
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,708 :: 		Heater_motor_index=1 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,709 :: 		key_choice_select(1,Choice_number,"Prog","Setng","<Ex>")
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R20, 248
	SBCI       R21, 255
	MOVW       R30, R28
	ADIW       R30, 13
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
	SUBI       R18, 243
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 19
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
	SUBI       R16, 237
	SBCI       R17, 255
	PUSH       R2
	MOVW       R8, R20
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_choice_select+0
;libs/keypad_Atmega32.mbas,710 :: 		var_main[0]=Keypad__teben(2,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
	CLR        R7
	LDS        R6, _Choice_number+0
	LDI        R27, 1
	MOV        R5, R27
	LDS        R4, _Choice_number+0
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+0, R16
;libs/keypad_Atmega32.mbas,712 :: 		while_state_2=1
	LDS        R27, _while_state_2+0
	SBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,713 :: 		while  (while_state_2 )
L__Keypad_start186:
	LDS        R27, _while_state_2+0
	SBRS       R27, BitPos(_while_state_2+0)
	JMP        L__Keypad_start187
;libs/keypad_Atmega32.mbas,715 :: 		case 1
	LDD        R16, Y+0
	CPI        R16, 1
	BREQ       L__Keypad_start306
	JMP        L__Keypad_start193
L__Keypad_start306:
;libs/keypad_Atmega32.mbas,716 :: 		Choice_number=7 while_state_2=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,717 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,718 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,719 :: 		ByteToStr(chanel_, txt_byte_min)
	PUSH       R2
	LDI        R27, #lo_addr(_txt_byte_min+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt_byte_min+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,720 :: 		Lcd_0()Lcd_Out(1,1,"Prog is:") Lcd_Out(2,1,txt_byte_min) delay_ms(2000)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
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
L__Keypad_start194:
	DEC        R16
	BRNE       L__Keypad_start194
	DEC        R17
	BRNE       L__Keypad_start194
	DEC        R18
	BRNE       L__Keypad_start194
	NOP
	NOP
	NOP
	NOP
;libs/keypad_Atmega32.mbas,721 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R7
	LDS        R6, _Choice_number+0
	LDI        R27, 1
	MOV        R5, R27
	LDS        R4, _Choice_number+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,722 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
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
;libs/keypad_Atmega32.mbas,723 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	JMP        L__Keypad_start190
L__Keypad_start193:
;libs/keypad_Atmega32.mbas,725 :: 		case 2
	LDD        R16, Y+0
	CPI        R16, 2
	BREQ       L__Keypad_start307
	JMP        L__Keypad_start198
L__Keypad_start307:
;libs/keypad_Atmega32.mbas,726 :: 		Choice_number=3    while_state_2=0  ''first level
	LDI        R27, 3
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,727 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,728 :: 		key_choice_select(1,Choice_number,"Auto","Manul","<Ex>")
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R20, 248
	SBCI       R21, 255
	MOVW       R30, R28
	ADIW       R30, 13
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
	SUBI       R18, 243
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 19
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
	SUBI       R16, 237
	SBCI       R17, 255
	PUSH       R2
	MOVW       R8, R20
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_choice_select+0
;libs/keypad_Atmega32.mbas,729 :: 		var_main[1]=Keypad__teben(2,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
	CLR        R7
	LDS        R6, _Choice_number+0
	LDI        R27, 1
	MOV        R5, R27
	LDS        R4, _Choice_number+0
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+1, R16
;libs/keypad_Atmega32.mbas,731 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,732 :: 		while  (while_state_import )
L__Keypad_start200:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Keypad_start201
;libs/keypad_Atmega32.mbas,735 :: 		case 1
	LDD        R16, Y+1
	CPI        R16, 1
	BREQ       L__Keypad_start308
	JMP        L__Keypad_start207
L__Keypad_start308:
;libs/keypad_Atmega32.mbas,736 :: 		Choice_number=7 while_state_import=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,737 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,738 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,739 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R7
	LDS        R6, _Choice_number+0
	LDI        R27, 1
	MOV        R5, R27
	LDS        R4, _Choice_number+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,741 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
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
;libs/keypad_Atmega32.mbas,742 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,743 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","PWR")
	LDI        R27, 80
	STD        Y+8, R27
	LDI        R27, 87
	STD        Y+9, R27
	LDI        R27, 82
	STD        Y+10, R27
	LDI        R27, 0
	STD        Y+11, R27
	MOVW       R18, R28
	SUBI       R18, 248
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 12
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
	SUBI       R16, 244
	SBCI       R17, 255
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,744 :: 		var_main[7]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],100,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDI        R17, 0
	CLR        R7
	LDS        R6, _Choice_number+0
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 100
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+7, R16
;libs/keypad_Atmega32.mbas,745 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]=var_main[7]
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDD        R16, Y+7
	ST         Z, R16
;libs/keypad_Atmega32.mbas,749 :: 		Lcd_0()Lcd_Out(1,1,"Pls Do normal Wo") Lcd_Out(2,1,"rk we save times!!!") delay_ms(200)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
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
L__Keypad_start208:
	DEC        R16
	BRNE       L__Keypad_start208
	DEC        R17
	BRNE       L__Keypad_start208
	DEC        R18
	BRNE       L__Keypad_start208
	NOP
;libs/keypad_Atmega32.mbas,751 :: 		Easy_vacuum_95_10_4_simple_working(var_main[2],0,1)
	LDI        R27, 1
	MOV        R4, R27
	CLR        R3
	LDD        R2, Y+2
	CALL       _Easy_vacuum_95_10_4_simple_working+0
;libs/keypad_Atmega32.mbas,752 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"EEPROM") delay_ms(200)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
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
L__Keypad_start210:
	DEC        R16
	BRNE       L__Keypad_start210
	DEC        R17
	BRNE       L__Keypad_start210
	DEC        R18
	BRNE       L__Keypad_start210
	NOP
;libs/keypad_Atmega32.mbas,753 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	JMP        L__Keypad_start204
L__Keypad_start207:
;libs/keypad_Atmega32.mbas,756 :: 		case 2
	LDD        R16, Y+1
	CPI        R16, 2
	BREQ       L__Keypad_start309
	JMP        L__Keypad_start214
L__Keypad_start309:
;libs/keypad_Atmega32.mbas,757 :: 		Choice_number=7 ''while_state_import=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,758 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,759 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R7
	LDS        R6, _Choice_number+0
	LDI        R27, 1
	MOV        R5, R27
	LDS        R4, _Choice_number+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,760 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,761 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
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
;libs/keypad_Atmega32.mbas,762 :: 		Choice_number=2
	LDI        R27, 2
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,766 :: 		Heater_motor_index=2 Pwm_chanel_main=1 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,767 :: 		Key_Heat_mot_Time(1,Choice_number,"Heater","Min")
	LDI        R27, 77
	STD        Y+8, R27
	LDI        R27, 105
	STD        Y+9, R27
	LDI        R27, 110
	STD        Y+10, R27
	LDI        R27, 0
	STD        Y+11, R27
	MOVW       R18, R28
	SUBI       R18, 248
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 12
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
	SUBI       R16, 244
	SBCI       R17, 255
	PUSH       R2
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,770 :: 		var_main[3]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDI        R17, 0
	CLR        R7
	LDS        R6, _Choice_number+0
	CLR        R5
	LDI        R27, 59
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+3, R16
;libs/keypad_Atmega32.mbas,771 :: 		Key_Heat_mot_Time(1,Choice_number,"Heater","Sec")
	LDI        R27, 83
	STD        Y+8, R27
	LDI        R27, 101
	STD        Y+9, R27
	LDI        R27, 99
	STD        Y+10, R27
	LDI        R27, 0
	STD        Y+11, R27
	MOVW       R18, R28
	SUBI       R18, 248
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 12
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
	SUBI       R16, 244
	SBCI       R17, 255
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,772 :: 		var_main[4]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDI        R17, 0
	CLR        R7
	LDS        R6, _Choice_number+0
	CLR        R5
	LDI        R27, 59
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+4, R16
;libs/keypad_Atmega32.mbas,776 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[3]
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
;libs/keypad_Atmega32.mbas,777 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[4]
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
;libs/keypad_Atmega32.mbas,779 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[1]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+1
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,780 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","Min")
	LDI        R27, 77
	STD        Y+8, R27
	LDI        R27, 105
	STD        Y+9, R27
	LDI        R27, 110
	STD        Y+10, R27
	LDI        R27, 0
	STD        Y+11, R27
	MOVW       R18, R28
	SUBI       R18, 248
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 12
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
	SUBI       R16, 244
	SBCI       R17, 255
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,781 :: 		var_main[5]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDI        R17, 0
	CLR        R7
	LDS        R6, _Choice_number+0
	CLR        R5
	LDI        R27, 59
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+5, R16
;libs/keypad_Atmega32.mbas,782 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","Sec")
	LDI        R27, 83
	STD        Y+8, R27
	LDI        R27, 101
	STD        Y+9, R27
	LDI        R27, 99
	STD        Y+10, R27
	LDI        R27, 0
	STD        Y+11, R27
	MOVW       R18, R28
	SUBI       R18, 248
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 12
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
	SUBI       R16, 244
	SBCI       R17, 255
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,783 :: 		var_main[6]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDI        R17, 0
	CLR        R7
	LDS        R6, _Choice_number+0
	CLR        R5
	LDI        R27, 59
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+6, R16
;libs/keypad_Atmega32.mbas,785 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","PWR")
	LDI        R27, 80
	STD        Y+8, R27
	LDI        R27, 87
	STD        Y+9, R27
	LDI        R27, 82
	STD        Y+10, R27
	LDI        R27, 0
	STD        Y+11, R27
	MOVW       R18, R28
	SUBI       R18, 248
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 12
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
	SUBI       R16, 244
	SBCI       R17, 255
	MOVW       R6, R18
	MOVW       R4, R16
	LDS        R3, _Choice_number+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
;libs/keypad_Atmega32.mbas,786 :: 		var_main[7]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],100,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDI        R17, 0
	CLR        R7
	LDS        R6, _Choice_number+0
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 100
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+7, R16
;libs/keypad_Atmega32.mbas,790 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[5]
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDD        R16, Y+5
	ST         Z, R16
;libs/keypad_Atmega32.mbas,791 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[6]
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDD        R16, Y+6
	ST         Z, R16
;libs/keypad_Atmega32.mbas,792 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]=var_main[7]
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
	STD        Y+30, R16
	STD        Y+31, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+30
	LDD        R19, Y+31
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
	LDD        R16, Y+7
	ST         Z, R16
;libs/keypad_Atmega32.mbas,794 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"EEPROM") delay_ms(200)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
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
L__Keypad_start215:
	DEC        R16
	BRNE       L__Keypad_start215
	DEC        R17
	BRNE       L__Keypad_start215
	DEC        R18
	BRNE       L__Keypad_start215
	NOP
;libs/keypad_Atmega32.mbas,795 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
;libs/keypad_Atmega32.mbas,796 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L__Keypad_start204
L__Keypad_start214:
;libs/keypad_Atmega32.mbas,797 :: 		case 3
	LDD        R16, Y+1
	CPI        R16, 3
	BREQ       L__Keypad_start310
	JMP        L__Keypad_start219
L__Keypad_start310:
;libs/keypad_Atmega32.mbas,798 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,799 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
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
L__Keypad_start220:
	DEC        R16
	BRNE       L__Keypad_start220
	DEC        R17
	BRNE       L__Keypad_start220
	DEC        R18
	BRNE       L__Keypad_start220
	NOP
	JMP        L__Keypad_start204
L__Keypad_start219:
L__Keypad_start204:
;libs/keypad_Atmega32.mbas,801 :: 		wend
	JMP        L__Keypad_start200
L__Keypad_start201:
;libs/keypad_Atmega32.mbas,802 :: 		Lcd_0()Lcd_Out(1,1,"END keypad") Lcd_Out(2,1,"EEPROM") delay_ms(1000)
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
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
L__Keypad_start222:
	DEC        R16
	BRNE       L__Keypad_start222
	DEC        R17
	BRNE       L__Keypad_start222
	DEC        R18
	BRNE       L__Keypad_start222
	JMP        L__Keypad_start190
L__Keypad_start198:
;libs/keypad_Atmega32.mbas,803 :: 		case 3
	LDD        R16, Y+0
	CPI        R16, 3
	BREQ       L__Keypad_start311
	JMP        L__Keypad_start226
L__Keypad_start311:
;libs/keypad_Atmega32.mbas,804 :: 		while_state_2=0
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,805 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
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
L__Keypad_start227:
	DEC        R16
	BRNE       L__Keypad_start227
	DEC        R17
	BRNE       L__Keypad_start227
	DEC        R18
	BRNE       L__Keypad_start227
	NOP
	JMP        L__Keypad_start190
L__Keypad_start226:
L__Keypad_start190:
;libs/keypad_Atmega32.mbas,807 :: 		wend
	JMP        L__Keypad_start186
L__Keypad_start187:
;libs/keypad_Atmega32.mbas,808 :: 		end sub
L_end_Keypad_start:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	ADIW       R28, 31
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_start

_libs/keypad_Atmega32_?main:

;libs/keypad_Atmega32.mbas,809 :: 		end.
L_end_libs/keypad_Atmega32_?main:
	RET
; end of _libs/keypad_Atmega32_?main
