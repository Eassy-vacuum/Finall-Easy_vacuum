
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
	BREQ       L_libs/keypad_Atmega32_Show_text218
	JMP        L_libs/keypad_Atmega32_Show_text3
L_libs/keypad_Atmega32_Show_text218:
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
	BRNE       L_libs/keypad_Atmega32_show_in_button220
	JMP        L_libs/keypad_Atmega32_show_in_button7
L_libs/keypad_Atmega32_show_in_button220:
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
	BRNE       L_libs/keypad_Atmega32_show_in_button221
	JMP        L_libs/keypad_Atmega32_show_in_button10
L_libs/keypad_Atmega32_show_in_button221:
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
	BRNE       L_libs/keypad_Atmega32_show_in_button222
	JMP        L_libs/keypad_Atmega32_show_in_button13
L_libs/keypad_Atmega32_show_in_button222:
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben224
	LDI        R27, 0
	CP         R2, R27
L_libs/keypad_Atmega32_Keypad__teben224:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben225
	JMP        L_libs/keypad_Atmega32_Keypad__teben17
L_libs/keypad_Atmega32_Keypad__teben225:
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
	BRLT       L_libs/keypad_Atmega32_Keypad__teben226
	JMP        L_libs/keypad_Atmega32_Keypad__teben25
L_libs/keypad_Atmega32_Keypad__teben226:
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben227
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben227:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben228
	JMP        L_libs/keypad_Atmega32_Keypad__teben28
L_libs/keypad_Atmega32_Keypad__teben228:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben28:
;libs/keypad_Atmega32.mbas,231 :: 		if num_=2 then num_=0 end if
	LDD        R16, Y+12
	CPI        R16, 2
	BREQ       L_libs/keypad_Atmega32_Keypad__teben229
	JMP        L_libs/keypad_Atmega32_Keypad__teben31
L_libs/keypad_Atmega32_Keypad__teben229:
	LDI        R27, 0
	STD        Y+12, R27
L_libs/keypad_Atmega32_Keypad__teben31:
;libs/keypad_Atmega32.mbas,232 :: 		num_=num_+1
	LDD        R16, Y+12
	SUBI       R16, 255
	STD        Y+12, R16
;libs/keypad_Atmega32.mbas,233 :: 		show_in_button(var_in_old_on_off,var_in,var_in_lcd,num_)
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;libs/keypad_Atmega32.mbas,257 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,258 :: 		while (while_state_2_2<=5 )
L_libs/keypad_Atmega32_Keypad__teben34:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L_libs/keypad_Atmega32_Keypad__teben230
	JMP        L_libs/keypad_Atmega32_Keypad__teben35
L_libs/keypad_Atmega32_Keypad__teben230:
;libs/keypad_Atmega32.mbas,259 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;libs/keypad_Atmega32.mbas,260 :: 		if (Button(Up_SW_Port, Up_SW_bit,swich_time,On_state)) then    ' Detect logical one up key
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben231
	JMP        L_libs/keypad_Atmega32_Keypad__teben39
L_libs/keypad_Atmega32_Keypad__teben231:
;libs/keypad_Atmega32.mbas,261 :: 		oldstate_up = 1  Buzzer_on_off(1)    while_state_2_2=6  k=1  j=0 k_for=0                 ' Update flag
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
;libs/keypad_Atmega32.mbas,262 :: 		while (k_for=0)
L_libs/keypad_Atmega32_Keypad__teben42:
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben232
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben232:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben233
	JMP        L_libs/keypad_Atmega32_Keypad__teben43
L_libs/keypad_Atmega32_Keypad__teben233:
;libs/keypad_Atmega32.mbas,263 :: 		j=j+1
	LDD        R16, Y+5
	LDD        R17, Y+6
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+5, R16
	STD        Y+6, R17
;libs/keypad_Atmega32.mbas,264 :: 		if (Button(Up_SW_Port, Up_SW_bit,100,On_state)) then
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 100
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben234
	JMP        L_libs/keypad_Atmega32_Keypad__teben47
L_libs/keypad_Atmega32_Keypad__teben234:
;libs/keypad_Atmega32.mbas,265 :: 		k= (j mod p_max)
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
L_libs/keypad_Atmega32_Keypad__teben47:
;libs/keypad_Atmega32.mbas,267 :: 		var_in=var_in+k
	LDD        R16, Y+3
	LDD        R17, Y+4
	MOVW       R18, R16
	ADD        R18, R2
	ADC        R19, R3
	MOVW       R2, R18
;libs/keypad_Atmega32.mbas,268 :: 		if (var_in>p_max) then
	MOV        R16, R4
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben235
	JMP        L_libs/keypad_Atmega32_Keypad__teben50
L_libs/keypad_Atmega32_Keypad__teben235:
;libs/keypad_Atmega32.mbas,269 :: 		var_in=p_min
	MOV        R2, R5
	LDI        R27, 0
	MOV        R3, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben51
;libs/keypad_Atmega32.mbas,270 :: 		else
L_libs/keypad_Atmega32_Keypad__teben50:
;libs/keypad_Atmega32.mbas,274 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben51:
;libs/keypad_Atmega32.mbas,275 :: 		var_in_lcd=var_in_lcd+k
	LDD        R18, Y+7
	LDD        R19, Y+8
	LDD        R16, Y+3
	LDD        R17, Y+4
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+7, R18
	STD        Y+8, R19
;libs/keypad_Atmega32.mbas,276 :: 		if (var_in_lcd>Choice_number) then
	MOV        R16, R6
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben236
	JMP        L_libs/keypad_Atmega32_Keypad__teben53
L_libs/keypad_Atmega32_Keypad__teben236:
;libs/keypad_Atmega32.mbas,277 :: 		var_in_lcd=1
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben54
;libs/keypad_Atmega32.mbas,278 :: 		else
L_libs/keypad_Atmega32_Keypad__teben53:
;libs/keypad_Atmega32.mbas,280 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben54:
;libs/keypad_Atmega32.mbas,282 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+7
	LDD        R17, Y+8
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben237
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben237:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben238
	JMP        L_libs/keypad_Atmega32_Keypad__teben56
L_libs/keypad_Atmega32_Keypad__teben238:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben56:
;libs/keypad_Atmega32.mbas,283 :: 		if num_>=2 then num_=0 end if
	LDD        R16, Y+12
	CPI        R16, 2
	BRSH       L_libs/keypad_Atmega32_Keypad__teben239
	JMP        L_libs/keypad_Atmega32_Keypad__teben59
L_libs/keypad_Atmega32_Keypad__teben239:
	LDI        R27, 0
	STD        Y+12, R27
L_libs/keypad_Atmega32_Keypad__teben59:
;libs/keypad_Atmega32.mbas,284 :: 		num_=num_+1
	LDD        R16, Y+12
	SUBI       R16, 255
	STD        Y+12, R16
;libs/keypad_Atmega32.mbas,285 :: 		show_in_button(var_in_old_on_off,var_in,var_in_lcd,num_)
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
;libs/keypad_Atmega32.mbas,288 :: 		if (oldstate_Up and Button(Up_SW_Port, Up_SW_bit,swich_time_off,Off_state)) then
	CLR        R6
	LDI        R27, 3
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
	LDD        R17, Y+9
	AND        R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben240
	JMP        L_libs/keypad_Atmega32_Keypad__teben62
L_libs/keypad_Atmega32_Keypad__teben240:
;libs/keypad_Atmega32.mbas,289 :: 		oldstate_up = 0  while_state_2_2=6 k_for=1
	LDI        R27, 0
	STD        Y+9, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
L_libs/keypad_Atmega32_Keypad__teben62:
;libs/keypad_Atmega32.mbas,291 :: 		delay_ms(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben64:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben64
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben64
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben64
	NOP
;libs/keypad_Atmega32.mbas,292 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben42
L_libs/keypad_Atmega32_Keypad__teben43:
L_libs/keypad_Atmega32_Keypad__teben39:
;libs/keypad_Atmega32.mbas,310 :: 		if (Button(Down_SW_Port, Down_SW_bit,swich_time,On_state)) then    ' Detect logical one Down key
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben241
	JMP        L_libs/keypad_Atmega32_Keypad__teben67
L_libs/keypad_Atmega32_Keypad__teben241:
;libs/keypad_Atmega32.mbas,311 :: 		oldstate_down = 1    Buzzer_on_off(1)  while_state_2_2=6    k=1  j=0  k_for=0         ' Update flag
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
;libs/keypad_Atmega32.mbas,312 :: 		while (k_for=0)
L_libs/keypad_Atmega32_Keypad__teben70:
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben242
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben242:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben243
	JMP        L_libs/keypad_Atmega32_Keypad__teben71
L_libs/keypad_Atmega32_Keypad__teben243:
;libs/keypad_Atmega32.mbas,313 :: 		j=j+1
	LDD        R16, Y+5
	LDD        R17, Y+6
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+5, R16
	STD        Y+6, R17
;libs/keypad_Atmega32.mbas,314 :: 		if (Button(Down_SW_Port, Down_SW_bit,100,On_state)) then
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 100
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben244
	JMP        L_libs/keypad_Atmega32_Keypad__teben75
L_libs/keypad_Atmega32_Keypad__teben244:
;libs/keypad_Atmega32.mbas,315 :: 		k= (j mod p_max)
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
L_libs/keypad_Atmega32_Keypad__teben75:
;libs/keypad_Atmega32.mbas,320 :: 		var_in=var_in-k
	LDD        R0, Y+3
	LDD        R1, Y+4
	MOVW       R16, R2
	SUB        R16, R0
	SBC        R17, R1
	MOVW       R2, R16
;libs/keypad_Atmega32.mbas,321 :: 		if (var_in<p_min) then
	CP         R16, R5
	LDI        R27, 0
	CPC        R17, R27
	BRLT       L_libs/keypad_Atmega32_Keypad__teben245
	JMP        L_libs/keypad_Atmega32_Keypad__teben78
L_libs/keypad_Atmega32_Keypad__teben245:
;libs/keypad_Atmega32.mbas,322 :: 		var_in=p_max
	MOV        R2, R4
	LDI        R27, 0
	MOV        R3, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben79
;libs/keypad_Atmega32.mbas,323 :: 		else
L_libs/keypad_Atmega32_Keypad__teben78:
;libs/keypad_Atmega32.mbas,327 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben79:
;libs/keypad_Atmega32.mbas,328 :: 		var_in_lcd=var_in_lcd-k
	LDD        R0, Y+3
	LDD        R1, Y+4
	LDD        R18, Y+7
	LDD        R19, Y+8
	SUB        R18, R0
	SBC        R19, R1
	STD        Y+7, R18
	STD        Y+8, R19
;libs/keypad_Atmega32.mbas,329 :: 		if (var_in_lcd<1) then
	LDI        R16, 1
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L_libs/keypad_Atmega32_Keypad__teben246
	JMP        L_libs/keypad_Atmega32_Keypad__teben81
L_libs/keypad_Atmega32_Keypad__teben246:
;libs/keypad_Atmega32.mbas,330 :: 		var_in_lcd=Choice_number
	STD        Y+7, R6
	LDI        R27, 0
	STD        Y+8, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben82
;libs/keypad_Atmega32.mbas,331 :: 		else
L_libs/keypad_Atmega32_Keypad__teben81:
;libs/keypad_Atmega32.mbas,333 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben82:
;libs/keypad_Atmega32.mbas,335 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+7
	LDD        R17, Y+8
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben247
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben247:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben248
	JMP        L_libs/keypad_Atmega32_Keypad__teben84
L_libs/keypad_Atmega32_Keypad__teben248:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben84:
;libs/keypad_Atmega32.mbas,336 :: 		if num_>=2 then num_=0 end if
	LDD        R16, Y+12
	CPI        R16, 2
	BRSH       L_libs/keypad_Atmega32_Keypad__teben249
	JMP        L_libs/keypad_Atmega32_Keypad__teben87
L_libs/keypad_Atmega32_Keypad__teben249:
	LDI        R27, 0
	STD        Y+12, R27
L_libs/keypad_Atmega32_Keypad__teben87:
;libs/keypad_Atmega32.mbas,337 :: 		num_=num_+1
	LDD        R16, Y+12
	SUBI       R16, 255
	STD        Y+12, R16
;libs/keypad_Atmega32.mbas,338 :: 		show_in_button(var_in_old_on_off,var_in,var_in_lcd,num_)
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
;libs/keypad_Atmega32.mbas,362 :: 		if (oldstate_down and Button(Down_SW_Port, Down_SW_bit,swich_time_off,Off_state)) then
	CLR        R6
	LDI        R27, 3
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
	LDD        R17, Y+10
	AND        R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben250
	JMP        L_libs/keypad_Atmega32_Keypad__teben90
L_libs/keypad_Atmega32_Keypad__teben250:
;libs/keypad_Atmega32.mbas,364 :: 		oldstate_down=0  while_state_2_2=6  k_for=1
	LDI        R27, 0
	STD        Y+10, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
L_libs/keypad_Atmega32_Keypad__teben90:
;libs/keypad_Atmega32.mbas,367 :: 		delay_ms(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben92:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben92
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben92
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben92
	NOP
;libs/keypad_Atmega32.mbas,368 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben70
L_libs/keypad_Atmega32_Keypad__teben71:
L_libs/keypad_Atmega32_Keypad__teben67:
;libs/keypad_Atmega32.mbas,387 :: 		var_in_global=var_in
	STS        _var_in_global+0, R2
;libs/keypad_Atmega32.mbas,388 :: 		First_second_comand=2  oldstate_2 = 0
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,389 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,swich_time,Off_state)<> 0)
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben251
	LDI        R27, 255
L_libs/keypad_Atmega32_Keypad__teben251:
	MOV        R16, R27
	STD        Y+25, R16
;libs/keypad_Atmega32.mbas,390 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,swich_time,Off_state)<> 0)then    ' Detect logical one setting key
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben252
	LDI        R17, 255
L_libs/keypad_Atmega32_Keypad__teben252:
	LDD        R16, Y+25
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben253
	JMP        L_libs/keypad_Atmega32_Keypad__teben95
L_libs/keypad_Atmega32_Keypad__teben253:
;libs/keypad_Atmega32.mbas,391 :: 		oldstate_men_ok = 1   Buzzer_on_off(1)    while_state_2_2=6                ' Update flag
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
L_libs/keypad_Atmega32_Keypad__teben95:
;libs/keypad_Atmega32.mbas,393 :: 		if (oldstate_men_ok and Button(Menu_SW_Port,Menu_SW_bit,swich_time,On_state))
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
;libs/keypad_Atmega32.mbas,394 :: 		or (while_state_import and oldstate_3 and Button(Ok_SW_Port,Ok_SW_bit,swich_time,On_state))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CLT
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L_libs/keypad_Atmega32_Keypad__teben257
	SET
L_libs/keypad_Atmega32_Keypad__teben257:
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben258
	JMP        L_libs/keypad_Atmega32_Keypad__teben98
L_libs/keypad_Atmega32_Keypad__teben258:
;libs/keypad_Atmega32.mbas,395 :: 		oldstate_men_ok = 0
	LDI        R27, 0
	STD        Y+11, R27
;libs/keypad_Atmega32.mbas,396 :: 		while_state_import=0   while_state_2_2=6
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 6
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,397 :: 		k_set=k_set+1
	LDS        R16, _k_set+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _k_set+0, R17
;libs/keypad_Atmega32.mbas,398 :: 		if k_set=K_set_max then
	LDS        R16, _K_set_max+0
	CP         R17, R16
	BREQ       L_libs/keypad_Atmega32_Keypad__teben259
	JMP        L_libs/keypad_Atmega32_Keypad__teben101
L_libs/keypad_Atmega32_Keypad__teben259:
;libs/keypad_Atmega32.mbas,399 :: 		k_set=1
	LDI        R27, 1
	STS        _k_set+0, R27
L_libs/keypad_Atmega32_Keypad__teben101:
;libs/keypad_Atmega32.mbas,401 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][0],
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
;libs/keypad_Atmega32.mbas,402 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][1]
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
;libs/keypad_Atmega32.mbas,403 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][2],
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
;libs/keypad_Atmega32.mbas,404 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][0],
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
;libs/keypad_Atmega32.mbas,405 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][1]
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
;libs/keypad_Atmega32.mbas,406 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][2],num_)
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
;libs/keypad_Atmega32.mbas,408 :: 		if case_is_selceted_show[lcd_line-1][0]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben260
	JMP        L_libs/keypad_Atmega32_Keypad__teben104
L_libs/keypad_Atmega32_Keypad__teben260:
;libs/keypad_Atmega32.mbas,409 :: 		Bytetostr(var_in,txt)
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
;libs/keypad_Atmega32.mbas,410 :: 		LCD_Out(lcd_line,case_is_selceted_show[lcd_line-1][0], txt)
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
L_libs/keypad_Atmega32_Keypad__teben104:
;libs/keypad_Atmega32.mbas,412 :: 		if case_is_selceted_show[lcd_line][0]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben261
	JMP        L_libs/keypad_Atmega32_Keypad__teben107
L_libs/keypad_Atmega32_Keypad__teben261:
;libs/keypad_Atmega32.mbas,413 :: 		Bytetostr(var_in,txt)
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
;libs/keypad_Atmega32.mbas,414 :: 		LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][0], txt)
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
L_libs/keypad_Atmega32_Keypad__teben107:
;libs/keypad_Atmega32.mbas,415 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben98:
;libs/keypad_Atmega32.mbas,417 :: 		delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben109:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben109
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben109
;libs/keypad_Atmega32.mbas,418 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben34
L_libs/keypad_Atmega32_Keypad__teben35:
;libs/keypad_Atmega32.mbas,419 :: 		var_in_global= var_in
	STS        _var_in_global+0, R2
;libs/keypad_Atmega32.mbas,420 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben20
L_libs/keypad_Atmega32_Keypad__teben21:
;libs/keypad_Atmega32.mbas,421 :: 		result=var_in_global
	LDS        R16, _var_in_global+0
	STD        Y+0, R16
;libs/keypad_Atmega32.mbas,422 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_libs/keypad_Atmega32_Keypad__teben111:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben111
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben111
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben111
	NOP
;libs/keypad_Atmega32.mbas,423 :: 		end sub
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

;libs/keypad_Atmega32.mbas,429 :: 		dim First_second_comand,var_in,lcd_line as byte
;libs/keypad_Atmega32.mbas,430 :: 		for First_second_comand =1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L_libs/keypad_Atmega32_key_rest_all115:
;libs/keypad_Atmega32.mbas,431 :: 		for lcd_line =1 to 2
	LDI        R27, 1
	STD        Y+2, R27
L_libs/keypad_Atmega32_key_rest_all120:
;libs/keypad_Atmega32.mbas,432 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	STD        Y+1, R27
L_libs/keypad_Atmega32_key_rest_all124:
	LDD        R16, Y+1
	CP         R2, R16
	BRSH       L_libs/keypad_Atmega32_key_rest_all263
	JMP        L_libs/keypad_Atmega32_key_rest_all128
L_libs/keypad_Atmega32_key_rest_all263:
;libs/keypad_Atmega32.mbas,433 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "                "
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
;libs/keypad_Atmega32.mbas,434 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "                "
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
;libs/keypad_Atmega32.mbas,435 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][2]= "1"
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
;libs/keypad_Atmega32.mbas,436 :: 		case_is_selceted_show[lcd_line-1][0]=0
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
;libs/keypad_Atmega32.mbas,437 :: 		case_is_selceted_show[lcd_line-1][1]=0
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
;libs/keypad_Atmega32.mbas,438 :: 		next var_in
	LDD        R16, Y+1
	CP         R16, R2
	BRNE       L_libs/keypad_Atmega32_key_rest_all264
	JMP        L_libs/keypad_Atmega32_key_rest_all128
L_libs/keypad_Atmega32_key_rest_all264:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all124
L_libs/keypad_Atmega32_key_rest_all128:
;libs/keypad_Atmega32.mbas,439 :: 		next lcd_line
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L_libs/keypad_Atmega32_key_rest_all265
	JMP        L_libs/keypad_Atmega32_key_rest_all123
L_libs/keypad_Atmega32_key_rest_all265:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all120
L_libs/keypad_Atmega32_key_rest_all123:
;libs/keypad_Atmega32.mbas,440 :: 		next First_second_comand
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L_libs/keypad_Atmega32_key_rest_all266
	JMP        L_libs/keypad_Atmega32_key_rest_all118
L_libs/keypad_Atmega32_key_rest_all266:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all115
L_libs/keypad_Atmega32_key_rest_all118:
;libs/keypad_Atmega32.mbas,442 :: 		end sub
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

;libs/keypad_Atmega32.mbas,447 :: 		dim byref one_,two_ as string[5],dim byref three_ as string[4],)
;libs/keypad_Atmega32.mbas,450 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,451 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,455 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,456 :: 		key_rest_all(Choice_number)
	PUSH       R2
	MOV        R2, R3
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,457 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_choice_select130:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_choice_select268
	JMP        L_libs/keypad_Atmega32_key_choice_select134
L_libs/keypad_Atmega32_key_choice_select268:
;libs/keypad_Atmega32.mbas,458 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= one_+" "+two_+" "+three_ ''"Auto Manul <Ex>"
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
;libs/keypad_Atmega32.mbas,459 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= one_+" "+two_+" "+three_ ''"Auto Manul <Ex>"
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
;libs/keypad_Atmega32.mbas,463 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_choice_select269
	JMP        L_libs/keypad_Atmega32_key_choice_select134
L_libs/keypad_Atmega32_key_choice_select269:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_choice_select130
L_libs/keypad_Atmega32_key_choice_select134:
;libs/keypad_Atmega32.mbas,468 :: 		lcd_line=2
	LDI        R27, 2
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,469 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "^^^^            "
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
;libs/keypad_Atmega32.mbas,470 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "     ^^^^       "
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
;libs/keypad_Atmega32.mbas,471 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "           ^^^^ "
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
;libs/keypad_Atmega32.mbas,474 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,475 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_choice_select135:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_choice_select270
	JMP        L_libs/keypad_Atmega32_key_choice_select139
L_libs/keypad_Atmega32_key_choice_select270:
;libs/keypad_Atmega32.mbas,476 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]=" is selcted"
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
;libs/keypad_Atmega32.mbas,480 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_choice_select271
	JMP        L_libs/keypad_Atmega32_key_choice_select139
L_libs/keypad_Atmega32_key_choice_select271:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_choice_select135
L_libs/keypad_Atmega32_key_choice_select139:
;libs/keypad_Atmega32.mbas,481 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= one_+"  setting    "
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
;libs/keypad_Atmega32.mbas,482 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= two_+" setting    "
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
;libs/keypad_Atmega32.mbas,483 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Exiting          "
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
;libs/keypad_Atmega32.mbas,487 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,488 :: 		end sub
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

;libs/keypad_Atmega32.mbas,490 :: 		dim var_in as byte
;libs/keypad_Atmega32.mbas,491 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:  2 3 4 5 6 7"
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
;libs/keypad_Atmega32.mbas,492 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1   3 4 5 6 7"
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
;libs/keypad_Atmega32.mbas,493 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2   4 5 6 7"
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
;libs/keypad_Atmega32.mbas,494 :: 		var_in=4     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3   5 6 7"
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
;libs/keypad_Atmega32.mbas,495 :: 		var_in=5     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4   6 7"
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
;libs/keypad_Atmega32.mbas,496 :: 		var_in=6     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4 5   7"
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
;libs/keypad_Atmega32.mbas,497 :: 		var_in=7     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4 5 6  "
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
;libs/keypad_Atmega32.mbas,498 :: 		end sub
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

;libs/keypad_Atmega32.mbas,502 :: 		sub procedure key_Prog_select(dim var_in,Choice_number as byte)
;libs/keypad_Atmega32.mbas,505 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,506 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,510 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,511 :: 		key_rest_all(Choice_number)
	PUSH       R2
	MOV        R2, R3
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,512 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_Prog_select142:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_Prog_select274
	JMP        L_libs/keypad_Atmega32_key_Prog_select146
L_libs/keypad_Atmega32_key_Prog_select274:
;libs/keypad_Atmega32.mbas,513 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Pls Chs Prg Num"
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
;libs/keypad_Atmega32.mbas,514 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pls Chs Prg Num"
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
;libs/keypad_Atmega32.mbas,515 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "Pr:1 2 3 4 5 6 7"
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
;libs/keypad_Atmega32.mbas,518 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_Prog_select275
	JMP        L_libs/keypad_Atmega32_key_Prog_select146
L_libs/keypad_Atmega32_key_Prog_select275:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_Prog_select142
L_libs/keypad_Atmega32_key_Prog_select146:
;libs/keypad_Atmega32.mbas,519 :: 		lcd_line=2   key_Prog_123( First_second_comand,lcd_line)
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
;libs/keypad_Atmega32.mbas,528 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,529 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_Prog_select147:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_Prog_select276
	JMP        L_libs/keypad_Atmega32_key_Prog_select151
L_libs/keypad_Atmega32_key_Prog_select276:
;libs/keypad_Atmega32.mbas,530 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Program     is selcted"
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
;libs/keypad_Atmega32.mbas,532 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Going to It's Setting"
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
;libs/keypad_Atmega32.mbas,536 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_Prog_select277
	JMP        L_libs/keypad_Atmega32_key_Prog_select151
L_libs/keypad_Atmega32_key_Prog_select277:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_Prog_select147
L_libs/keypad_Atmega32_key_Prog_select151:
;libs/keypad_Atmega32.mbas,538 :: 		case_is_selceted_show[lcd_line-1][0]=10
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
;libs/keypad_Atmega32.mbas,540 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,541 :: 		end sub
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

;libs/keypad_Atmega32.mbas,546 :: 		sub procedure Key_Time_Select(dim var_in,Choice_number as byte)
;libs/keypad_Atmega32.mbas,549 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,550 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,554 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,555 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,556 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Time_Select153:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Time_Select279
	JMP        L_libs/keypad_Atmega32_Key_Time_Select157
L_libs/keypad_Atmega32_Key_Time_Select279:
;libs/keypad_Atmega32.mbas,557 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Time:Heatr Motor"
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
;libs/keypad_Atmega32.mbas,558 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "Pr:1 2 3 4 5 6 7"
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
;libs/keypad_Atmega32.mbas,562 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Time_Select280
	JMP        L_libs/keypad_Atmega32_Key_Time_Select157
L_libs/keypad_Atmega32_Key_Time_Select280:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Time_Select153
L_libs/keypad_Atmega32_Key_Time_Select157:
;libs/keypad_Atmega32.mbas,563 :: 		lcd_line=1
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,564 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Time:      Motor"
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
;libs/keypad_Atmega32.mbas,565 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Time:Heatr      "
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
;libs/keypad_Atmega32.mbas,572 :: 		lcd_line=2   key_Prog_123( First_second_comand,lcd_line)
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
;libs/keypad_Atmega32.mbas,581 :: 		First_second_comand=2 lcd_line=1 var_in =1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,583 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Heater Timer Sett"
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
;libs/keypad_Atmega32.mbas,585 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is selcted"
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
;libs/keypad_Atmega32.mbas,587 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in][0]="Motor Timer Sett"
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
;libs/keypad_Atmega32.mbas,589 :: 		Options_array[First_second_comand-1][lcd_line][var_in][0]="ing is selcted"
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
;libs/keypad_Atmega32.mbas,598 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,599 :: 		end sub
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

;libs/keypad_Atmega32.mbas,604 :: 		sub procedure Key_Heat_mot_Time(dim var_in,Choice_number as byte,dim byref ht_or_mt as string[5],dim byref min_sec as string[3])
;libs/keypad_Atmega32.mbas,607 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,608 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,612 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,613 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,614 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Heat_mot_Time159:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Heat_mot_Time282
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time163
L_libs/keypad_Atmega32_Key_Heat_mot_Time282:
;libs/keypad_Atmega32.mbas,616 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= ht_or_mt+":>>>"+min_sec+"<<<"
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
;libs/keypad_Atmega32.mbas,617 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= ht_or_mt+":>>>"+min_sec+"<<<"
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
;libs/keypad_Atmega32.mbas,618 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "                "
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
;libs/keypad_Atmega32.mbas,622 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Heat_mot_Time283
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time163
L_libs/keypad_Atmega32_Key_Heat_mot_Time283:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time159
L_libs/keypad_Atmega32_Key_Heat_mot_Time163:
;libs/keypad_Atmega32.mbas,634 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,635 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Heat_mot_Time164:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Heat_mot_Time284
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time168
L_libs/keypad_Atmega32_Key_Heat_mot_Time284:
;libs/keypad_Atmega32.mbas,637 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]=ht_or_mt+" Timer Sett"
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
;libs/keypad_Atmega32.mbas,639 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is seted"
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
;libs/keypad_Atmega32.mbas,641 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Heat_mot_Time285
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time168
L_libs/keypad_Atmega32_Key_Heat_mot_Time285:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time164
L_libs/keypad_Atmega32_Key_Heat_mot_Time168:
;libs/keypad_Atmega32.mbas,644 :: 		case_is_selceted_show[lcd_line][0]=1
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
;libs/keypad_Atmega32.mbas,645 :: 		case_is_selceted_show[lcd_line][1]=9
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
;libs/keypad_Atmega32.mbas,646 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,647 :: 		end sub
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

;libs/keypad_Atmega32.mbas,652 :: 		sub procedure Key_exit_back(dim var_in,Choice_number as byte,dim byref Back_ as string[5],dim byref Save_ as string[3])
;libs/keypad_Atmega32.mbas,655 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,656 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,660 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,661 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,662 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_exit_back170:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_exit_back287
	JMP        L_libs/keypad_Atmega32_Key_exit_back174
L_libs/keypad_Atmega32_Key_exit_back287:
;libs/keypad_Atmega32.mbas,664 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "<"+Back_+">"+"<"+Save_+">"
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
;libs/keypad_Atmega32.mbas,665 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "<"+Back_+">"+"<"+Save_+">"
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
;libs/keypad_Atmega32.mbas,669 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_exit_back288
	JMP        L_libs/keypad_Atmega32_Key_exit_back174
L_libs/keypad_Atmega32_Key_exit_back288:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_exit_back170
L_libs/keypad_Atmega32_Key_exit_back174:
;libs/keypad_Atmega32.mbas,671 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "<"+Back_+">"''+"<"+min_sec+">"
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
;libs/keypad_Atmega32.mbas,672 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "        "+"<"+Save_+">"
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
;libs/keypad_Atmega32.mbas,674 :: 		lcd_line=2
	LDI        R27, 2
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,675 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "  ^^^^          "
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
;libs/keypad_Atmega32.mbas,676 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "          ^^^^  "
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
;libs/keypad_Atmega32.mbas,687 :: 		First_second_comand=2 lcd_line=1 var_in=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,690 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]=Back_+"is"
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
;libs/keypad_Atmega32.mbas,691 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in][0]=Save_+"is"
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
;libs/keypad_Atmega32.mbas,693 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is seted"
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
;libs/keypad_Atmega32.mbas,698 :: 		case_is_selceted_show[lcd_line][0]=1
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
;libs/keypad_Atmega32.mbas,700 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,701 :: 		end sub
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

;libs/keypad_Atmega32.mbas,707 :: 		dim var_main as byte[8]
;libs/keypad_Atmega32.mbas,708 :: 		Choice_number=3      ''first level
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 3
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,709 :: 		Heater_motor_index=1 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,710 :: 		key_choice_select(1,Choice_number,"Prog","Setng","<Ex>")
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
;libs/keypad_Atmega32.mbas,711 :: 		var_main[0]=Keypad__teben(2,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,715 :: 		while_state_2=1
	LDS        R27, _while_state_2+0
	SBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,716 :: 		while  (while_state_2 )
L__Keypad_start177:
	LDS        R27, _while_state_2+0
	SBRS       R27, BitPos(_while_state_2+0)
	JMP        L__Keypad_start178
;libs/keypad_Atmega32.mbas,718 :: 		case 1
	LDD        R16, Y+0
	CPI        R16, 1
	BREQ       L__Keypad_start290
	JMP        L__Keypad_start184
L__Keypad_start290:
;libs/keypad_Atmega32.mbas,719 :: 		Choice_number=7 while_state_2=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,720 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,721 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,724 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,725 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
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
;libs/keypad_Atmega32.mbas,726 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	JMP        L__Keypad_start181
L__Keypad_start184:
;libs/keypad_Atmega32.mbas,728 :: 		case 2
	LDD        R16, Y+0
	CPI        R16, 2
	BREQ       L__Keypad_start291
	JMP        L__Keypad_start187
L__Keypad_start291:
;libs/keypad_Atmega32.mbas,729 :: 		Choice_number=3    while_state_2=0  ''first level
	LDI        R27, 3
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,730 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,731 :: 		key_choice_select(1,Choice_number,"Auto","Manul","<Ex>")
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
;libs/keypad_Atmega32.mbas,732 :: 		var_main[1]=Keypad__teben(2,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,737 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,738 :: 		while  (while_state_import )
L__Keypad_start189:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Keypad_start190
;libs/keypad_Atmega32.mbas,741 :: 		case 1
	LDD        R16, Y+1
	CPI        R16, 1
	BREQ       L__Keypad_start292
	JMP        L__Keypad_start196
L__Keypad_start292:
;libs/keypad_Atmega32.mbas,742 :: 		Choice_number=7 while_state_import=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,743 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,744 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,745 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,747 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
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
;libs/keypad_Atmega32.mbas,748 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,757 :: 		Lcd_0()Lcd_Out(1,1,"Pls Do normal Wo") Lcd_Out(2,1,"rk we save times!!!") delay_ms(200)
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
L__Keypad_start197:
	DEC        R16
	BRNE       L__Keypad_start197
	DEC        R17
	BRNE       L__Keypad_start197
	DEC        R18
	BRNE       L__Keypad_start197
	NOP
;libs/keypad_Atmega32.mbas,759 :: 		Easy_vacuum_95_10_4_simple_working(var_main[2],0,1)
	LDI        R27, 1
	MOV        R4, R27
	CLR        R3
	LDD        R2, Y+2
	CALL       _Easy_vacuum_95_10_4_simple_working+0
;libs/keypad_Atmega32.mbas,760 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"Memory") delay_ms(200)
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
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 121
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
L__Keypad_start199:
	DEC        R16
	BRNE       L__Keypad_start199
	DEC        R17
	BRNE       L__Keypad_start199
	DEC        R18
	BRNE       L__Keypad_start199
	NOP
;libs/keypad_Atmega32.mbas,761 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	JMP        L__Keypad_start193
L__Keypad_start196:
;libs/keypad_Atmega32.mbas,764 :: 		case 2
	LDD        R16, Y+1
	CPI        R16, 2
	BREQ       L__Keypad_start293
	JMP        L__Keypad_start203
L__Keypad_start293:
;libs/keypad_Atmega32.mbas,765 :: 		Choice_number=7 ''while_state_import=0
	LDI        R27, 7
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,766 :: 		key_Prog_select(1,Choice_number)
	PUSH       R2
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,767 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,768 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,769 :: 		Mot_heater_On_mSec [7-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
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
;libs/keypad_Atmega32.mbas,770 :: 		Choice_number=2
	LDI        R27, 2
	STS        _Choice_number+0, R27
;libs/keypad_Atmega32.mbas,774 :: 		Heater_motor_index=2 Pwm_chanel_main=1 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,775 :: 		Key_Heat_mot_Time(1,Choice_number,"Heater","Min")
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
;libs/keypad_Atmega32.mbas,778 :: 		var_main[3]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,779 :: 		Key_Heat_mot_Time(1,Choice_number,"Heater","Sec")
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
;libs/keypad_Atmega32.mbas,780 :: 		var_main[4]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,784 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[3]
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
;libs/keypad_Atmega32.mbas,785 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[4]
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
;libs/keypad_Atmega32.mbas,787 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,788 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","Min")
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
;libs/keypad_Atmega32.mbas,789 :: 		var_main[5]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,790 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","Sec")
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
;libs/keypad_Atmega32.mbas,791 :: 		var_main[6]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
;libs/keypad_Atmega32.mbas,797 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[5]
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
;libs/keypad_Atmega32.mbas,798 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[6]
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
;libs/keypad_Atmega32.mbas,807 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"Memory") delay_ms(200)
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
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 121
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
L__Keypad_start204:
	DEC        R16
	BRNE       L__Keypad_start204
	DEC        R17
	BRNE       L__Keypad_start204
	DEC        R18
	BRNE       L__Keypad_start204
	NOP
;libs/keypad_Atmega32.mbas,808 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
;libs/keypad_Atmega32.mbas,809 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L__Keypad_start193
L__Keypad_start203:
;libs/keypad_Atmega32.mbas,810 :: 		case 3
	LDD        R16, Y+1
	CPI        R16, 3
	BREQ       L__Keypad_start294
	JMP        L__Keypad_start208
L__Keypad_start294:
;libs/keypad_Atmega32.mbas,811 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,812 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
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
L__Keypad_start209:
	DEC        R16
	BRNE       L__Keypad_start209
	DEC        R17
	BRNE       L__Keypad_start209
	DEC        R18
	BRNE       L__Keypad_start209
	NOP
	JMP        L__Keypad_start193
L__Keypad_start208:
L__Keypad_start193:
;libs/keypad_Atmega32.mbas,814 :: 		wend
	JMP        L__Keypad_start189
L__Keypad_start190:
	JMP        L__Keypad_start181
L__Keypad_start187:
;libs/keypad_Atmega32.mbas,816 :: 		case 3
	LDD        R16, Y+0
	CPI        R16, 3
	BREQ       L__Keypad_start295
	JMP        L__Keypad_start213
L__Keypad_start295:
;libs/keypad_Atmega32.mbas,817 :: 		while_state_2=0
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,818 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
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
L__Keypad_start214:
	DEC        R16
	BRNE       L__Keypad_start214
	DEC        R17
	BRNE       L__Keypad_start214
	DEC        R18
	BRNE       L__Keypad_start214
	NOP
	JMP        L__Keypad_start181
L__Keypad_start213:
L__Keypad_start181:
;libs/keypad_Atmega32.mbas,820 :: 		wend
	JMP        L__Keypad_start177
L__Keypad_start178:
;libs/keypad_Atmega32.mbas,821 :: 		end sub
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

;libs/keypad_Atmega32.mbas,822 :: 		end.
L_end_libs/keypad_Atmega32_?main:
	RET
; end of _libs/keypad_Atmega32_?main
