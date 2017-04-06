
_Key_Port_Init:

;libs/keypad_Atmega32.mbas,156 :: 		sub procedure Key_Port_Init()
;libs/keypad_Atmega32.mbas,173 :: 		DDB0_bit = 0 DDB1_bit = 0   DDB2_bit = 0 DDB4_bit = 0                ' Set PORTE pin 7 as input pin for the Heater switches
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
;libs/keypad_Atmega32.mbas,174 :: 		DDD2_bit = 0 DDD3_bit = 0     DDD6_bit = 0     '' DDD5_bit = 0
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
	IN         R27, DDD3_bit+0
	CBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
	IN         R27, DDD6_bit+0
	CBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;libs/keypad_Atmega32.mbas,177 :: 		end sub
L_end_Key_Port_Init:
	RET
; end of _Key_Port_Init

libs/keypad_Atmega32_Show_text:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	ADIW       R28, 5

;libs/keypad_Atmega32.mbas,184 :: 		,dim byref text_main_2,text_new_2 as string[16],dim lcd_line_2 as byte,dim byref location_my_2 as string[1],dim num_ as byte )
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
;libs/keypad_Atmega32.mbas,193 :: 		if num_ = 1 then
	CPI        R16, 1
	BREQ       L_libs/keypad_Atmega32_Show_text460
	JMP        L_libs/keypad_Atmega32_Show_text3
L_libs/keypad_Atmega32_Show_text460:
; num_ end address is: 16 (R16)
;libs/keypad_Atmega32.mbas,194 :: 		LCD_Out(lcd_line_1,1,text_main_1)  ''Show on LCD
	MOVW       R4, R2
	LDI        R27, 1
	MOV        R3, R27
	MOV        R2, R6
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,195 :: 		LCD_Out(lcd_line_2,1,text_main_2)  ''Show on LCD
	LDD        R4, Y+0
	LDD        R5, Y+1
	LDI        R27, 1
	MOV        R3, R27
	LDD        R2, Y+4
	CALL       _Lcd_Out+0
	JMP        L_libs/keypad_Atmega32_Show_text4
;libs/keypad_Atmega32.mbas,196 :: 		else
L_libs/keypad_Atmega32_Show_text3:
;libs/keypad_Atmega32.mbas,197 :: 		LCD_Out(lcd_line_1,1,text_new_1)  ''Show on LCD
	LDI        R27, 1
	MOV        R3, R27
	MOV        R2, R6
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,198 :: 		LCD_Out(lcd_line_2,1,text_new_2)  ''Show on LCD
	LDD        R4, Y+2
	LDD        R5, Y+3
	LDI        R27, 1
	MOV        R3, R27
	LDD        R2, Y+4
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,199 :: 		end if
L_libs/keypad_Atmega32_Show_text4:
;libs/keypad_Atmega32.mbas,202 :: 		end sub
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

;libs/keypad_Atmega32.mbas,206 :: 		sub procedure show_in_button(DIM var_in_old_on_off_2 as byte,dim var_in_2 as byte ,dim var_in_lcd_2 as integer,dim num_2 as byte )
;libs/keypad_Atmega32.mbas,210 :: 		if   var_in_old_on_off_2<>0 then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	LDI        R27, 0
	CP         R2, R27
	BRNE       L_libs/keypad_Atmega32_show_in_button462
	JMP        L_libs/keypad_Atmega32_show_in_button7
L_libs/keypad_Atmega32_show_in_button462:
;libs/keypad_Atmega32.mbas,211 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
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
	LDI        R16, 153
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	STD        Y+2, R16
	STD        Y+3, R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R4
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
;libs/keypad_Atmega32.mbas,212 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][1]
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
;libs/keypad_Atmega32.mbas,213 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][2],
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
;libs/keypad_Atmega32.mbas,214 :: 		Options_array[First_second_comand-1][lcd_line][var_in_old_on_off_2-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
	MOV        R7, R16
	MOV        R8, R17
	ADD        R7, R18
	ADC        R8, R19
;libs/keypad_Atmega32.mbas,215 :: 		Options_array[First_second_comand-1][lcd_line][var_in_old_on_off_2-1][1]
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
;libs/keypad_Atmega32.mbas,216 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_old_on_off_2-1][2],num_2)
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
	PUSH       R6
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R8
	PUSH       R7
	MOV        R7, R16
	MOV        R8, R17
	MOVW       R4, R18
	MOVW       R2, R20
	LDS        R6, _lcd_line+0
	CALL       libs/keypad_Atmega32_Show_text+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 8
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	JMP        L_libs/keypad_Atmega32_show_in_button8
;libs/keypad_Atmega32.mbas,217 :: 		else
L_libs/keypad_Atmega32_show_in_button7:
;libs/keypad_Atmega32.mbas,218 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
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
	LDI        R16, 153
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	STD        Y+2, R16
	STD        Y+3, R17
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R4
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
;libs/keypad_Atmega32.mbas,219 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][1]
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
;libs/keypad_Atmega32.mbas,220 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd_2-1][2],
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
;libs/keypad_Atmega32.mbas,221 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd_2-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R18, R16
	ADC        R19, R17
	LDD        R22, Y+8
	LDD        R23, Y+9
	MOV        R7, R22
	MOV        R8, R23
	ADD        R7, R18
	ADC        R8, R19
;libs/keypad_Atmega32.mbas,222 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd_2-1][1]
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
;libs/keypad_Atmega32.mbas,223 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_lcd_2-1][2],num_2)
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
	PUSH       R3
	PUSH       R6
	PUSH       R23
	PUSH       R22
	PUSH       R24
	PUSH       R26
	PUSH       R25
	PUSH       R8
	PUSH       R7
	MOV        R7, R16
	MOV        R8, R17
	MOVW       R4, R18
	MOVW       R2, R20
	LDS        R6, _lcd_line+0
	CALL       libs/keypad_Atmega32_Show_text+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 8
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	POP        R3
;libs/keypad_Atmega32.mbas,224 :: 		Bytetostr(var_in_2,txt)  ''LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][1], txt)
	MOV        R2, R3
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,225 :: 		if case_is_selceted_show[lcd_line-1][1]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_show_in_button463
	JMP        L_libs/keypad_Atmega32_show_in_button10
L_libs/keypad_Atmega32_show_in_button463:
;libs/keypad_Atmega32.mbas,227 :: 		LCD_Out(lcd_line,case_is_selceted_show[lcd_line-1][1], txt)
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
;libs/keypad_Atmega32.mbas,229 :: 		if case_is_selceted_show[lcd_line][1]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_show_in_button464
	JMP        L_libs/keypad_Atmega32_show_in_button13
L_libs/keypad_Atmega32_show_in_button464:
;libs/keypad_Atmega32.mbas,231 :: 		LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][1], txt)
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
;libs/keypad_Atmega32.mbas,233 :: 		end if
L_libs/keypad_Atmega32_show_in_button8:
;libs/keypad_Atmega32.mbas,234 :: 		end sub
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

libs/keypad_Atmega32_show_in_button_new_button:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 24
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,235 :: 		sub procedure show_in_button_new_button(dim var_in_min,var_in_sec as byte,dim byref heat_or_motor as string[6])
;libs/keypad_Atmega32.mbas,237 :: 		lcd_out(1,1,"<"+heat_or_motor+" Timing>")
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOV        R26, R28
	MOV        R27, R29
	LDI        R16, 60
	ST         X+, R16
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
	LDI        R16, 105
	ST         X+, R16
	LDI        R16, 110
	ST         X+, R16
	LDI        R16, 103
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOVW       R16, R28
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;libs/keypad_Atmega32.mbas,238 :: 		bytetostr(var_in_min,txt)lcd_out(2,1,"Min:"+txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
	POP        R3
	MOV        R26, R28
	MOV        R27, R29
	LDI        R16, 77
	ST         X+, R16
	LDI        R16, 105
	ST         X+, R16
	LDI        R16, 110
	ST         X+, R16
	LDI        R16, 58
	ST         X+, R16
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
	MOVW       R16, R28
	PUSH       R3
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R3
;libs/keypad_Atmega32.mbas,239 :: 		bytetostr(var_in_sec,txt)  lcd_out(2,9,"Sec:"+txt)
	MOV        R2, R3
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	CALL       _ByteToStr+0
	MOV        R26, R28
	MOV        R27, R29
	LDI        R16, 83
	ST         X+, R16
	LDI        R16, 101
	ST         X+, R16
	LDI        R16, 99
	ST         X+, R16
	LDI        R16, 58
	ST         X+, R16
	LDI        R30, #lo_addr(_txt+0)
	LDI        R31, hi_addr(_txt+0)
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,241 :: 		end sub
L_end_show_in_button_new_button:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 23
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_show_in_button_new_button

libs/keypad_Atmega32_Keypad__teben:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 34
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,250 :: 		dim num_ as  byte
;libs/keypad_Atmega32.mbas,267 :: 		First_second_comand=1 lcd_line=1
	PUSH       R8
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,268 :: 		Lcd_0()
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
;libs/keypad_Atmega32.mbas,271 :: 		if var_in=0 then
	LDI        R27, 0
	CP         R3, R27
	BRNE       L_libs/keypad_Atmega32_Keypad__teben467
	LDI        R27, 0
	CP         R2, R27
L_libs/keypad_Atmega32_Keypad__teben467:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben468
	JMP        L_libs/keypad_Atmega32_Keypad__teben18
L_libs/keypad_Atmega32_Keypad__teben468:
;libs/keypad_Atmega32.mbas,272 :: 		var_in_lcd=var_in+1
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+7, R16
	STD        Y+8, R17
	JMP        L_libs/keypad_Atmega32_Keypad__teben19
;libs/keypad_Atmega32.mbas,273 :: 		else
L_libs/keypad_Atmega32_Keypad__teben18:
;libs/keypad_Atmega32.mbas,274 :: 		var_in_lcd=var_in
	STD        Y+7, R2
	STD        Y+8, R3
;libs/keypad_Atmega32.mbas,275 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben19:
;libs/keypad_Atmega32.mbas,276 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,277 :: 		oldstate_up=0 oldstate_down=0    num_=0  k=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	LDI        R27, 0
	STD        Y+9, R27
;libs/keypad_Atmega32.mbas,278 :: 		oldstate_men_ok=0  oldstate_2=0
	LDS        R27, _oldstate_men_ok+0
	CBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,280 :: 		while  (while_state_import )
L_libs/keypad_Atmega32_Keypad__teben21:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/keypad_Atmega32_Keypad__teben22
;libs/keypad_Atmega32.mbas,281 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,283 :: 		if var_in>Choice_number then   var_in_lcd=(var_in mod Choice_number) end if
	MOV        R16, R6
	LDI        R17, 0
	CP         R16, R2
	CPC        R17, R3
	BRLT       L_libs/keypad_Atmega32_Keypad__teben469
	JMP        L_libs/keypad_Atmega32_Keypad__teben26
L_libs/keypad_Atmega32_Keypad__teben469:
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
L_libs/keypad_Atmega32_Keypad__teben26:
;libs/keypad_Atmega32.mbas,284 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+7
	LDD        R17, Y+8
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben470
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben470:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben471
	JMP        L_libs/keypad_Atmega32_Keypad__teben29
L_libs/keypad_Atmega32_Keypad__teben471:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben29:
;libs/keypad_Atmega32.mbas,285 :: 		if num_=2 then num_=0 end if
	LDD        R16, Y+9
	CPI        R16, 2
	BREQ       L_libs/keypad_Atmega32_Keypad__teben472
	JMP        L_libs/keypad_Atmega32_Keypad__teben32
L_libs/keypad_Atmega32_Keypad__teben472:
	LDI        R27, 0
	STD        Y+9, R27
L_libs/keypad_Atmega32_Keypad__teben32:
;libs/keypad_Atmega32.mbas,286 :: 		num_=num_+1
	LDD        R16, Y+9
	SUBI       R16, 255
	STD        Y+9, R16
;libs/keypad_Atmega32.mbas,287 :: 		show_in_button(var_in_old_on_off,var_in,var_in_lcd,num_)     ''delay_ms(1000)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R6, R16
	LDD        R4, Y+7
	LDD        R5, Y+8
	MOV        R3, R2
	MOV        R2, R7
	CALL       libs/keypad_Atmega32_show_in_button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;libs/keypad_Atmega32.mbas,317 :: 		while_state_2_2=1
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,318 :: 		while (while_state_2_2<=245 )
L_libs/keypad_Atmega32_Keypad__teben35:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 245
	CP         R16, R17
	BRSH       L_libs/keypad_Atmega32_Keypad__teben473
	JMP        L_libs/keypad_Atmega32_Keypad__teben36
L_libs/keypad_Atmega32_Keypad__teben473:
;libs/keypad_Atmega32.mbas,319 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;libs/keypad_Atmega32.mbas,320 :: 		if (Button(Up_SW_Port, Up_SW_bit,swich_time,On_state)) then    ' Detect logical one up key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben474
	JMP        L_libs/keypad_Atmega32_Keypad__teben40
L_libs/keypad_Atmega32_Keypad__teben474:
;libs/keypad_Atmega32.mbas,321 :: 		oldstate_up = 1  Buzzer_on_off(1)    while_state_2_2=246  k=1  j=0 k_for=0                 ' Update flag
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	LDI        R27, 246
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
;libs/keypad_Atmega32.mbas,322 :: 		delay_ms(100)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben42:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben42
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben42
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben42
	NOP
;libs/keypad_Atmega32.mbas,323 :: 		while (k_for=0)
L_libs/keypad_Atmega32_Keypad__teben45:
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben475
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben475:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben476
	JMP        L_libs/keypad_Atmega32_Keypad__teben46
L_libs/keypad_Atmega32_Keypad__teben476:
;libs/keypad_Atmega32.mbas,324 :: 		j=j+1
	LDD        R16, Y+5
	LDD        R17, Y+6
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+5, R16
	STD        Y+6, R17
;libs/keypad_Atmega32.mbas,325 :: 		if (Button(Up_SW_Port, Up_SW_bit,100,On_state)) then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben477
	JMP        L_libs/keypad_Atmega32_Keypad__teben50
L_libs/keypad_Atmega32_Keypad__teben477:
;libs/keypad_Atmega32.mbas,326 :: 		k= (j mod p_max)
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
L_libs/keypad_Atmega32_Keypad__teben50:
;libs/keypad_Atmega32.mbas,328 :: 		var_in=var_in+k
	LDD        R16, Y+3
	LDD        R17, Y+4
	MOVW       R18, R16
	ADD        R18, R2
	ADC        R19, R3
	MOVW       R2, R18
;libs/keypad_Atmega32.mbas,329 :: 		if (var_in>p_max) then
	MOV        R16, R4
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben478
	JMP        L_libs/keypad_Atmega32_Keypad__teben53
L_libs/keypad_Atmega32_Keypad__teben478:
;libs/keypad_Atmega32.mbas,330 :: 		var_in=p_min
	MOV        R2, R5
	LDI        R27, 0
	MOV        R3, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben54
;libs/keypad_Atmega32.mbas,331 :: 		else
L_libs/keypad_Atmega32_Keypad__teben53:
;libs/keypad_Atmega32.mbas,335 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben54:
;libs/keypad_Atmega32.mbas,336 :: 		var_in_lcd=var_in_lcd+k
	LDD        R18, Y+7
	LDD        R19, Y+8
	LDD        R16, Y+3
	LDD        R17, Y+4
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+7, R18
	STD        Y+8, R19
;libs/keypad_Atmega32.mbas,337 :: 		if (var_in_lcd>Choice_number) then
	MOV        R16, R6
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben479
	JMP        L_libs/keypad_Atmega32_Keypad__teben56
L_libs/keypad_Atmega32_Keypad__teben479:
;libs/keypad_Atmega32.mbas,338 :: 		var_in_lcd=1
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben57
;libs/keypad_Atmega32.mbas,339 :: 		else
L_libs/keypad_Atmega32_Keypad__teben56:
;libs/keypad_Atmega32.mbas,341 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben57:
;libs/keypad_Atmega32.mbas,343 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+7
	LDD        R17, Y+8
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben480
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben480:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben481
	JMP        L_libs/keypad_Atmega32_Keypad__teben59
L_libs/keypad_Atmega32_Keypad__teben481:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben59:
;libs/keypad_Atmega32.mbas,344 :: 		if num_>=2 then num_=0 end if
	LDD        R16, Y+9
	CPI        R16, 2
	BRSH       L_libs/keypad_Atmega32_Keypad__teben482
	JMP        L_libs/keypad_Atmega32_Keypad__teben62
L_libs/keypad_Atmega32_Keypad__teben482:
	LDI        R27, 0
	STD        Y+9, R27
L_libs/keypad_Atmega32_Keypad__teben62:
;libs/keypad_Atmega32.mbas,345 :: 		num_=num_+1
	LDD        R16, Y+9
	SUBI       R16, 255
	STD        Y+9, R16
;libs/keypad_Atmega32.mbas,346 :: 		show_in_button(var_in_old_on_off,var_in,var_in_lcd,num_)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R6, R16
	LDD        R4, Y+7
	LDD        R5, Y+8
	MOV        R3, R2
	MOV        R2, R7
	CALL       libs/keypad_Atmega32_show_in_button+0
;libs/keypad_Atmega32.mbas,349 :: 		if (oldstate_Up and Button(Up_SW_Port, Up_SW_bit,swich_time_off,Off_state)) then
	CLR        R6
	LDI        R27, 1
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
	LDS        R0, _oldstate_up+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_up+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben483
	JMP        L_libs/keypad_Atmega32_Keypad__teben65
L_libs/keypad_Atmega32_Keypad__teben483:
;libs/keypad_Atmega32.mbas,350 :: 		oldstate_up = 0  while_state_2_2=56 k_for=1
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDI        R27, 56
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
L_libs/keypad_Atmega32_Keypad__teben65:
;libs/keypad_Atmega32.mbas,353 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben45
L_libs/keypad_Atmega32_Keypad__teben46:
L_libs/keypad_Atmega32_Keypad__teben40:
;libs/keypad_Atmega32.mbas,371 :: 		if (Button(Down_SW_Port, Down_SW_bit,swich_time,On_state)) then    ' Detect logical one Down key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben484
	JMP        L_libs/keypad_Atmega32_Keypad__teben68
L_libs/keypad_Atmega32_Keypad__teben484:
;libs/keypad_Atmega32.mbas,372 :: 		oldstate_down = 1    Buzzer_on_off(1)  while_state_2_2=246    k=1  j=0  k_for=0         ' Update flag
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	LDI        R27, 246
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
;libs/keypad_Atmega32.mbas,373 :: 		delay_ms(100)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben70:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben70
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben70
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben70
	NOP
;libs/keypad_Atmega32.mbas,374 :: 		while (k_for=0)
L_libs/keypad_Atmega32_Keypad__teben73:
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben485
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben485:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben486
	JMP        L_libs/keypad_Atmega32_Keypad__teben74
L_libs/keypad_Atmega32_Keypad__teben486:
;libs/keypad_Atmega32.mbas,375 :: 		j=j+1
	LDD        R16, Y+5
	LDD        R17, Y+6
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+5, R16
	STD        Y+6, R17
;libs/keypad_Atmega32.mbas,376 :: 		if (Button(Down_SW_Port, Down_SW_bit,100,On_state)) then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben487
	JMP        L_libs/keypad_Atmega32_Keypad__teben78
L_libs/keypad_Atmega32_Keypad__teben487:
;libs/keypad_Atmega32.mbas,377 :: 		k= (j mod p_max)
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
L_libs/keypad_Atmega32_Keypad__teben78:
;libs/keypad_Atmega32.mbas,382 :: 		var_in=var_in-k
	LDD        R0, Y+3
	LDD        R1, Y+4
	MOVW       R16, R2
	SUB        R16, R0
	SBC        R17, R1
	MOVW       R2, R16
;libs/keypad_Atmega32.mbas,383 :: 		if (var_in<p_min) then
	CP         R16, R5
	LDI        R27, 0
	CPC        R17, R27
	BRLT       L_libs/keypad_Atmega32_Keypad__teben488
	JMP        L_libs/keypad_Atmega32_Keypad__teben81
L_libs/keypad_Atmega32_Keypad__teben488:
;libs/keypad_Atmega32.mbas,384 :: 		var_in=p_max
	MOV        R2, R4
	LDI        R27, 0
	MOV        R3, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben82
;libs/keypad_Atmega32.mbas,385 :: 		else
L_libs/keypad_Atmega32_Keypad__teben81:
;libs/keypad_Atmega32.mbas,389 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben82:
;libs/keypad_Atmega32.mbas,390 :: 		var_in_lcd=var_in_lcd-k
	LDD        R0, Y+3
	LDD        R1, Y+4
	LDD        R18, Y+7
	LDD        R19, Y+8
	SUB        R18, R0
	SBC        R19, R1
	STD        Y+7, R18
	STD        Y+8, R19
;libs/keypad_Atmega32.mbas,391 :: 		if (var_in_lcd<1) then
	LDI        R16, 1
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L_libs/keypad_Atmega32_Keypad__teben489
	JMP        L_libs/keypad_Atmega32_Keypad__teben84
L_libs/keypad_Atmega32_Keypad__teben489:
;libs/keypad_Atmega32.mbas,392 :: 		var_in_lcd=Choice_number
	STD        Y+7, R6
	LDI        R27, 0
	STD        Y+8, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben85
;libs/keypad_Atmega32.mbas,393 :: 		else
L_libs/keypad_Atmega32_Keypad__teben84:
;libs/keypad_Atmega32.mbas,395 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben85:
;libs/keypad_Atmega32.mbas,397 :: 		if var_in_lcd=0 then   var_in_lcd=1 end if
	LDD        R16, Y+7
	LDD        R17, Y+8
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben490
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben490:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben491
	JMP        L_libs/keypad_Atmega32_Keypad__teben87
L_libs/keypad_Atmega32_Keypad__teben491:
	LDI        R27, 1
	STD        Y+7, R27
	LDI        R27, 0
	STD        Y+8, R27
L_libs/keypad_Atmega32_Keypad__teben87:
;libs/keypad_Atmega32.mbas,398 :: 		if num_>=2 then num_=0 end if
	LDD        R16, Y+9
	CPI        R16, 2
	BRSH       L_libs/keypad_Atmega32_Keypad__teben492
	JMP        L_libs/keypad_Atmega32_Keypad__teben90
L_libs/keypad_Atmega32_Keypad__teben492:
	LDI        R27, 0
	STD        Y+9, R27
L_libs/keypad_Atmega32_Keypad__teben90:
;libs/keypad_Atmega32.mbas,399 :: 		num_=num_+1
	LDD        R16, Y+9
	SUBI       R16, 255
	STD        Y+9, R16
;libs/keypad_Atmega32.mbas,400 :: 		show_in_button(var_in_old_on_off,var_in,var_in_lcd,num_)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R6, R16
	LDD        R4, Y+7
	LDD        R5, Y+8
	MOV        R3, R2
	MOV        R2, R7
	CALL       libs/keypad_Atmega32_show_in_button+0
;libs/keypad_Atmega32.mbas,424 :: 		if (oldstate_down and Button(Down_SW_Port, Down_SW_bit,swich_time_off,Off_state)) then
	CLR        R6
	LDI        R27, 1
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
	LDS        R0, _oldstate_down+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_down+0)
	INC        R17
	AND        R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben493
	JMP        L_libs/keypad_Atmega32_Keypad__teben93
L_libs/keypad_Atmega32_Keypad__teben493:
;libs/keypad_Atmega32.mbas,426 :: 		oldstate_down=0  while_state_2_2=246  k_for=1
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
L_libs/keypad_Atmega32_Keypad__teben93:
;libs/keypad_Atmega32.mbas,430 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben73
L_libs/keypad_Atmega32_Keypad__teben74:
L_libs/keypad_Atmega32_Keypad__teben68:
;libs/keypad_Atmega32.mbas,449 :: 		var_in_global=var_in
	STS        _var_in_global+0, R2
;libs/keypad_Atmega32.mbas,450 :: 		First_second_comand=2  oldstate_2 = 0
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,451 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,swich_time,Off_state)<> 0)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 1
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben494
	LDI        R27, 255
L_libs/keypad_Atmega32_Keypad__teben494:
	MOV        R16, R27
	STD        Y+22, R16
;libs/keypad_Atmega32.mbas,452 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,swich_time,Off_state)<> 0)then    ' Detect logical one setting key
	CLR        R6
	LDI        R27, 1
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben495
	LDI        R17, 255
L_libs/keypad_Atmega32_Keypad__teben495:
	LDD        R16, Y+22
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben496
	JMP        L_libs/keypad_Atmega32_Keypad__teben96
L_libs/keypad_Atmega32_Keypad__teben496:
;libs/keypad_Atmega32.mbas,453 :: 		oldstate_men_ok = 1   Buzzer_on_off(1)    while_state_2_2=246                ' Update flag
	LDS        R27, _oldstate_men_ok+0
	SBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	POP        R3
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
L_libs/keypad_Atmega32_Keypad__teben96:
;libs/keypad_Atmega32.mbas,455 :: 		if (oldstate_men_ok and Button(Menu_SW_Port,Menu_SW_bit,swich_time,On_state))
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_men_ok+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_men_ok+0)
	INC        R17
	AND        R16, R17
	STD        Y+22, R16
;libs/keypad_Atmega32.mbas,456 :: 		or (while_state_import and oldstate_3 and Button(Ok_SW_Port,Ok_SW_bit,swich_time,On_state))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CLT
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L_libs/keypad_Atmega32_Keypad__teben500
	SET
L_libs/keypad_Atmega32_Keypad__teben500:
	BLD        R4, 0
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	LDD        R16, Y+22
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben501
	JMP        L_libs/keypad_Atmega32_Keypad__teben99
L_libs/keypad_Atmega32_Keypad__teben501:
;libs/keypad_Atmega32.mbas,457 :: 		oldstate_men_ok = 0
	LDS        R27, _oldstate_men_ok+0
	CBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
;libs/keypad_Atmega32.mbas,458 :: 		while_state_import=0   while_state_2_2=246
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,459 :: 		k_set=k_set+1
	LDS        R16, _k_set+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _k_set+0, R17
;libs/keypad_Atmega32.mbas,460 :: 		if k_set=K_set_max then
	LDS        R16, _K_set_max+0
	CP         R17, R16
	BREQ       L_libs/keypad_Atmega32_Keypad__teben502
	JMP        L_libs/keypad_Atmega32_Keypad__teben102
L_libs/keypad_Atmega32_Keypad__teben502:
;libs/keypad_Atmega32.mbas,461 :: 		k_set=1
	LDI        R27, 1
	STS        _k_set+0, R27
L_libs/keypad_Atmega32_Keypad__teben102:
;libs/keypad_Atmega32.mbas,463 :: 		Show_text(Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][0],
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	STD        Y+32, R16
	STD        Y+33, R17
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R16, 153
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+22
	LDD        R19, Y+23
	STD        Y+24, R16
	STD        Y+25, R17
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+7
	SUBI       R20, 1
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R16, 51
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+22
	LDD        R19, Y+23
	STD        Y+30, R16
	STD        Y+31, R17
	ADD        R18, R16
	ADC        R19, R17
	STD        Y+28, R18
	STD        Y+29, R19
;libs/keypad_Atmega32.mbas,464 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R22, Y+32
	LDD        R23, Y+33
	ADD        R18, R22
	ADC        R19, R23
	LDD        R20, Y+24
	LDD        R21, Y+25
	ADD        R18, R20
	ADC        R19, R21
	ADD        R18, R16
	ADC        R19, R17
	SUBI       R18, 239
	SBCI       R19, 255
	STD        Y+26, R18
	STD        Y+27, R19
;libs/keypad_Atmega32.mbas,465 :: 		,lcd_line,Options_array[First_second_comand-1][lcd_line-1][var_in_lcd-1][2],
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
	STD        Y+24, R16
	STD        Y+25, R17
;libs/keypad_Atmega32.mbas,466 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][0],
	LDI        R16, #lo_addr(_Options_array+0)
	LDI        R17, hi_addr(_Options_array+0)
	ADD        R16, R22
	ADC        R17, R23
	STD        Y+22, R16
	STD        Y+23, R17
	LDI        R16, 153
	LDI        R17, 0
	LDS        R20, _lcd_line+0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+22
	LDD        R19, Y+23
	ADD        R18, R16
	ADC        R19, R17
	LDD        R22, Y+30
	LDD        R23, Y+31
	MOVW       R8, R22
	ADD        R8, R18
	ADC        R9, R19
;libs/keypad_Atmega32.mbas,467 :: 		Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][1]
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	LDD        R20, Y+32
	LDD        R21, Y+33
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
;libs/keypad_Atmega32.mbas,468 :: 		,lcd_line+1,Options_array[First_second_comand-1][lcd_line][var_in_lcd-1][2],num_)
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
	LDD        R20, Y+28
	LDD        R21, Y+29
	LDD        R18, Y+26
	LDD        R19, Y+27
	LDD        R16, Y+24
	LDD        R17, Y+25
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDD        R16, Y+9
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
;libs/keypad_Atmega32.mbas,470 :: 		if case_is_selceted_show[lcd_line-1][0]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben503
	JMP        L_libs/keypad_Atmega32_Keypad__teben105
L_libs/keypad_Atmega32_Keypad__teben503:
;libs/keypad_Atmega32.mbas,471 :: 		Bytetostr(var_in,txt)
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
;libs/keypad_Atmega32.mbas,472 :: 		LCD_Out(lcd_line,case_is_selceted_show[lcd_line-1][0], txt)
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
L_libs/keypad_Atmega32_Keypad__teben105:
;libs/keypad_Atmega32.mbas,474 :: 		if case_is_selceted_show[lcd_line][0]<> 0  then
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
	BRNE       L_libs/keypad_Atmega32_Keypad__teben504
	JMP        L_libs/keypad_Atmega32_Keypad__teben108
L_libs/keypad_Atmega32_Keypad__teben504:
;libs/keypad_Atmega32.mbas,475 :: 		Bytetostr(var_in,txt)
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
;libs/keypad_Atmega32.mbas,476 :: 		LCD_Out(lcd_line+1,case_is_selceted_show[lcd_line][0], txt)
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
L_libs/keypad_Atmega32_Keypad__teben108:
;libs/keypad_Atmega32.mbas,477 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben99:
;libs/keypad_Atmega32.mbas,480 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben35
L_libs/keypad_Atmega32_Keypad__teben36:
;libs/keypad_Atmega32.mbas,481 :: 		var_in_global= var_in
	STS        _var_in_global+0, R2
;libs/keypad_Atmega32.mbas,482 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben21
L_libs/keypad_Atmega32_Keypad__teben22:
;libs/keypad_Atmega32.mbas,483 :: 		result=var_in_global
	LDS        R16, _var_in_global+0
	STD        Y+0, R16
;libs/keypad_Atmega32.mbas,484 :: 		Delay_mS(500)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_libs/keypad_Atmega32_Keypad__teben110:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben110
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben110
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben110
;libs/keypad_Atmega32.mbas,485 :: 		end sub
	LDD        R16, Y+0
L_end_Keypad__teben:
	POP        R8
	ADIW       R28, 33
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Keypad__teben

libs/keypad_Atmega32_Keypad__teben_saeed_new_button:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 40
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,498 :: 		dim k2 as byte
	STD        Y+0, R16
	STD        Y+1, R17
;libs/keypad_Atmega32.mbas,516 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,528 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,529 :: 		oldstate_up=0 oldstate_down=0     k=0  k_for=0  j=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	LDI        R27, 0
	STD        Y+3, R27
	STD        Y+4, R27
;libs/keypad_Atmega32.mbas,530 :: 		oldstate_men_ok=0  oldstate_2=0
	LDS        R27, _oldstate_men_ok+0
	CBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,532 :: 		while  (while_state_import )
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button114:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button115
;libs/keypad_Atmega32.mbas,540 :: 		show_in_button_new_button(var_in_min,var_in_sec,ht_or_mot)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R4, R5
	MOV        R5, R6
	LDS        R3, _var_in_sec+0
	LDS        R2, _var_in_min+0
	CALL       libs/keypad_Atmega32_show_in_button_new_button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,565 :: 		while_state_2_2=1   j=0
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
	LDI        R27, 0
	STD        Y+5, R27
	STD        Y+6, R27
;libs/keypad_Atmega32.mbas,566 :: 		while (while_state_2_2<=245 )
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button119:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 245
	CP         R16, R17
	BRSH       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button506
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button120
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button506:
;libs/keypad_Atmega32.mbas,567 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;libs/keypad_Atmega32.mbas,570 :: 		oldstate_up=0 oldstate_down=0  k_for=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;libs/keypad_Atmega32.mbas,572 :: 		if strcmp(ht_or_mot,"heater")=0 then
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button507
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button507:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button508
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button124
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button508:
;libs/keypad_Atmega32.mbas,573 :: 		oldstate_up = 1  Buzzer_on_off(1)    while_state_2_2=246  k=1  j=0 k_for=1  '' lcd_out(1,1,"strcmp on!") delay_ms(1000)
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDI        R27, 0
	STD        Y+5, R27
	STD        Y+6, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button124:
;libs/keypad_Atmega32.mbas,577 :: 		if   strcmp(ht_or_mot,"motor")=0  then
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button509
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button509:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button510
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button127
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button510:
;libs/keypad_Atmega32.mbas,578 :: 		oldstate_down = 1  Buzzer_on_off(1)    while_state_2_2=246  k=1  j=0 k_for=1 '' lcd_out(1,1,"strcmp 2 on!") delay_ms(1000)
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDI        R27, 0
	STD        Y+5, R27
	STD        Y+6, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button127:
;libs/keypad_Atmega32.mbas,581 :: 		show_in_button_new_button(var_in_min,var_in_sec,ht_or_mot)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R4, R5
	MOV        R5, R6
	LDS        R3, _var_in_sec+0
	LDS        R2, _var_in_min+0
	CALL       libs/keypad_Atmega32_show_in_button_new_button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,585 :: 		if  ((oldstate_up = 1) or  (oldstate_down = 1)) then
	LDS        R27, _oldstate_up+0
	BST        R27, BitPos(_oldstate_up+0)
	BLD        R21, 1
	LDS        R27, _oldstate_down+0
	BST        R27, BitPos(_oldstate_down+0)
	BLD        R21, 0
	SET
	SBRS       R21, 1
	SBRC       R21, 0
	RJMP       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button514
	CLT
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button514:
	BLD        R21, 0
	SBRS       R21, 0
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button130
;libs/keypad_Atmega32.mbas,586 :: 		delay_ms(100) k_for=1  k2=0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button132:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button132
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button132
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button132
	NOP
	LDI        R27, 1
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+7, R27
;libs/keypad_Atmega32.mbas,587 :: 		oldstate_up = 0 oldstate_down = 0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;libs/keypad_Atmega32.mbas,588 :: 		while (k_for)
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button135:
	LDD        R16, Y+2
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button515
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button136
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button515:
;libs/keypad_Atmega32.mbas,589 :: 		j=j+1
	LDD        R16, Y+5
	LDD        R17, Y+6
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+5, R16
	STD        Y+6, R17
;libs/keypad_Atmega32.mbas,605 :: 		if strcmp(ht_or_mot,"heater")=0 then
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button516
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button516:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button517
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button140
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button517:
;libs/keypad_Atmega32.mbas,607 :: 		if (Button(Down_SW_Port, Down_SW_bit,swich_time,On_state)<> 0) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button518
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button143
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button518:
;libs/keypad_Atmega32.mbas,608 :: 		k_for=0 while_state_import=0 while_state_2_2=250 result="motor"
	LDI        R27, 0
	STD        Y+2, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
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
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button144
;libs/keypad_Atmega32.mbas,612 :: 		else if ((Button(Up_SW_Port, Up_SW_bit,100,On_state)<> 0))  then ''motor mode
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button143:
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
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button519
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button146
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button519:
;libs/keypad_Atmega32.mbas,613 :: 		k= 1   oldstate_up = 1   k2=3
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDI        R27, 3
	STD        Y+7, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button146:
;libs/keypad_Atmega32.mbas,616 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button144:
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button141
;libs/keypad_Atmega32.mbas,618 :: 		else
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button140:
;libs/keypad_Atmega32.mbas,619 :: 		if (Button(Up_SW_Port, Up_SW_bit,swich_time,On_state)<> 0) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button520
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button149
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button520:
;libs/keypad_Atmega32.mbas,620 :: 		k_for=0 while_state_import=0 while_state_2_2=250 result="heater"
	LDI        R27, 0
	STD        Y+2, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
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
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button150
;libs/keypad_Atmega32.mbas,624 :: 		else if ((Button(Down_SW_Port, Down_SW_bit,100,On_state)<> 0))  then ''motor mode
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button149:
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
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button521
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button152
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button521:
;libs/keypad_Atmega32.mbas,625 :: 		k= 1   oldstate_down = 1   k2=3
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	LDI        R27, 3
	STD        Y+7, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button152:
;libs/keypad_Atmega32.mbas,628 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button150:
;libs/keypad_Atmega32.mbas,629 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button141:
;libs/keypad_Atmega32.mbas,630 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,swich_time,On_state)<> 0)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button522
	LDI        R27, 255
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button522:
	MOV        R16, R27
	STD        Y+39, R16
;libs/keypad_Atmega32.mbas,631 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,swich_time,On_state)<> 0)then
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button523
	LDI        R17, 255
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button523:
	LDD        R16, Y+39
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button524
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button155
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button524:
;libs/keypad_Atmega32.mbas,632 :: 		oldstate_men_ok = 1 k_for=0 while_state_import=0 while_state_2_2=250    result="finish"
	LDS        R27, _oldstate_men_ok+0
	SBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
	LDI        R27, 0
	STD        Y+2, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button155:
;libs/keypad_Atmega32.mbas,635 :: 		if (k2=3) then
	LDD        R16, Y+7
	CPI        R16, 3
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button525
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button158
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button525:
;libs/keypad_Atmega32.mbas,636 :: 		if j<> 1 then  var_in_sec=var_in_sec+k  end if
	LDD        R16, Y+5
	LDD        R17, Y+6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button526
	CPI        R16, 1
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button526:
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button527
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button161
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button527:
	LDS        R18, _var_in_sec+0
	LDS        R19, _var_in_sec+1
	LDD        R16, Y+3
	LDD        R17, Y+4
	ADD        R16, R18
	ADC        R17, R19
	STS        _var_in_sec+0, R16
	STS        _var_in_sec+1, R17
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button161:
;libs/keypad_Atmega32.mbas,638 :: 		if (var_in_sec>p_max) then
	LDS        R18, _var_in_sec+0
	LDS        R19, _var_in_sec+1
	MOV        R16, R2
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button528
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button164
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button528:
;libs/keypad_Atmega32.mbas,639 :: 		var_in_min=var_in_min+1   var_in_sec= p_min
	LDS        R16, _var_in_min+0
	LDS        R17, _var_in_min+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _var_in_min+0, R16
	STS        _var_in_min+1, R17
	STS        _var_in_sec+0, R3
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button164:
;libs/keypad_Atmega32.mbas,645 :: 		if strcmp(ht_or_mot,"heater")=0 then
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button529
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button529:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button530
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button167
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button530:
;libs/keypad_Atmega32.mbas,646 :: 		if (var_in_min>max_min_heater) then  var_in_min=p_min var_in_sec=p_min end if
	LDS        R18, _var_in_min+0
	LDS        R19, _var_in_min+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button531
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button170
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button531:
	STS        _var_in_min+0, R3
	LDI        R27, 0
	STS        _var_in_min+1, R27
	STS        _var_in_sec+0, R3
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button170:
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button168
;libs/keypad_Atmega32.mbas,647 :: 		else
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button167:
;libs/keypad_Atmega32.mbas,648 :: 		if (var_in_min>max_min_motor) then  var_in_min=p_min var_in_sec=p_min end if
	LDS        R18, _var_in_min+0
	LDS        R19, _var_in_min+1
	LDI        R16, 1
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button532
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button173
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button532:
	STS        _var_in_min+0, R3
	LDI        R27, 0
	STS        _var_in_min+1, R27
	STS        _var_in_sec+0, R3
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button173:
;libs/keypad_Atmega32.mbas,649 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button168:
;libs/keypad_Atmega32.mbas,663 :: 		k2=0
	LDI        R27, 0
	STD        Y+7, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button158:
;libs/keypad_Atmega32.mbas,665 :: 		show_in_button_new_button(var_in_min,var_in_sec,ht_or_mot)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R4, R5
	MOV        R5, R6
	LDS        R3, _var_in_sec+0
	LDS        R2, _var_in_min+0
	CALL       libs/keypad_Atmega32_show_in_button_new_button+0
;libs/keypad_Atmega32.mbas,669 :: 		if (((oldstate_Up) and (Button(Up_SW_Port, Up_SW_bit,swich_time_off,Off_state))) )  ''heater mode
	CLR        R6
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_up+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_up+0)
	INC        R17
	AND        R16, R17
	STD        Y+39, R16
;libs/keypad_Atmega32.mbas,670 :: 		or ((oldstate_down and Button(Down_SW_Port, Down_SW_bit,swich_time_off,Off_state))  ) then ''motor mode
	CLR        R6
	LDI        R27, 1
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
	LDS        R0, _oldstate_down+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_down+0)
	INC        R17
	AND        R17, R16
	LDD        R16, Y+39
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button533
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button176
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button533:
;libs/keypad_Atmega32.mbas,671 :: 		oldstate_up = 0 oldstate_down = 0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;libs/keypad_Atmega32.mbas,673 :: 		k_for=0  k2=0
	LDI        R27, 0
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+7, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button176:
;libs/keypad_Atmega32.mbas,676 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button135
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button136:
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button130:
;libs/keypad_Atmega32.mbas,696 :: 		First_second_comand=2  oldstate_2 = 0
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,698 :: 		if (Button(Up_SW_Port, Up_SW_bit,swich_time,On_state)<> 0) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button534
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button179
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button534:
;libs/keypad_Atmega32.mbas,699 :: 		if  strcmp(ht_or_mot,"motor")=0  then
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button535
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button535:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button536
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button182
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button536:
;libs/keypad_Atmega32.mbas,700 :: 		while_state_2_2=250 result="heater" '' oldstate_up=2
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
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
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button182:
;libs/keypad_Atmega32.mbas,702 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button179:
;libs/keypad_Atmega32.mbas,705 :: 		if (Button(Down_SW_Port, Down_SW_bit,swich_time,On_state)<> 0) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button537
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button185
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button537:
;libs/keypad_Atmega32.mbas,706 :: 		if   strcmp(ht_or_mot,"heater")=0  then
	MOVW       R30, R28
	ADIW       R30, 8
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
	SUBI       R16, 248
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button538
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button538:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button539
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button188
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button539:
;libs/keypad_Atmega32.mbas,707 :: 		while_state_2_2=250 result="motor"      '' oldstate_up=2
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
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
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button188:
;libs/keypad_Atmega32.mbas,709 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button185:
;libs/keypad_Atmega32.mbas,712 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,swich_time,On_state)<> 0)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button540
	LDI        R27, 255
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button540:
	MOV        R16, R27
	STD        Y+39, R16
;libs/keypad_Atmega32.mbas,713 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,swich_time,On_state)<> 0)then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button541
	LDI        R17, 255
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button541:
	LDD        R16, Y+39
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button542
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button191
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button542:
;libs/keypad_Atmega32.mbas,714 :: 		oldstate_men_ok = 1               ' Update flag
	LDS        R27, _oldstate_men_ok+0
	SBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button191:
;libs/keypad_Atmega32.mbas,719 :: 		if (oldstate_men_ok and Button(Menu_SW_Port,Menu_SW_bit,swich_time,Off_state))
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_men_ok+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_men_ok+0)
	INC        R17
	AND        R16, R17
	STD        Y+39, R16
;libs/keypad_Atmega32.mbas,720 :: 		or (while_state_import and oldstate_3 and Button(Ok_SW_Port,Ok_SW_bit,swich_time,Off_state))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CBR        R21, 1
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button546
	SBR        R21, 1
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button546:
	CLR        R6
	LDI        R27, 1
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
	CLR        R17
	SBRC       R21, 0
	INC        R17
	AND        R17, R16
	LDD        R16, Y+39
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button547
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button194
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button547:
;libs/keypad_Atmega32.mbas,721 :: 		oldstate_men_ok = 0 while_state_2_2=250   result="finish"
	LDS        R27, _oldstate_men_ok+0
	CBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button194:
;libs/keypad_Atmega32.mbas,726 :: 		if (while_state_2_2=250) then''and ((oldstate_up=2) or (oldstate_up=2) or (oldstate_men_ok = )) then
	LDS        R16, _while_state_2_2+0
	CPI        R16, 250
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button548
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button197
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button548:
;libs/keypad_Atmega32.mbas,728 :: 		Buzzer_on_off(1)    while_state_2_2=246
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,729 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button197:
;libs/keypad_Atmega32.mbas,751 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button119
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button120:
;libs/keypad_Atmega32.mbas,753 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button114
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button115:
;libs/keypad_Atmega32.mbas,755 :: 		lcd_0() lcd_out(1,1,"Value set for:") lcd_out(2,1,">>> "+ht_or_mot+" <<<" )
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 8
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	MOV        R26, R28
	MOV        R27, R29
	SUBI       R26, 233
	SBCI       R27, 255
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	MOV        R30, R5
	MOV        R31, R6
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOVW       R16, R28
	SUBI       R16, 233
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
;libs/keypad_Atmega32.mbas,757 :: 		end sub
L_end_Keypad__teben_saeed_new_button:
	ADIW       R28, 39
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Keypad__teben_saeed_new_button

libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 38
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,768 :: 		dim k2 as byte
	STD        Y+0, R16
	STD        Y+1, R17
;libs/keypad_Atmega32.mbas,786 :: 		Lcd_0()
	PUSH       R6
	PUSH       R5
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,798 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,799 :: 		oldstate_up=0 oldstate_down=0     k=0  k_for=0  j=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	LDI        R27, 0
	STD        Y+3, R27
	STD        Y+4, R27
;libs/keypad_Atmega32.mbas,800 :: 		oldstate_men_ok=0  oldstate_2=0
	LDS        R27, _oldstate_men_ok+0
	CBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,802 :: 		while  (while_state_import )
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down201:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down202
;libs/keypad_Atmega32.mbas,810 :: 		show_in_button_new_button(var_in_min,var_in_sec,ht_or_mot)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R4, R5
	MOV        R5, R6
	LDS        R3, _var_in_sec+0
	LDS        R2, _var_in_min+0
	CALL       libs/keypad_Atmega32_show_in_button_new_button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,835 :: 		while_state_2_2=1   j=0
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,836 :: 		while (while_state_2_2<=245 )
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down206:
	LDS        R17, _while_state_2_2+0
	LDI        R16, 245
	CP         R16, R17
	BRSH       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down550
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down207
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down550:
;libs/keypad_Atmega32.mbas,837 :: 		while_state_2_2=while_state_2_2+1
	LDS        R16, _while_state_2_2+0
	SUBI       R16, 255
	STS        _while_state_2_2+0, R16
;libs/keypad_Atmega32.mbas,840 :: 		oldstate_up=0 oldstate_down=0  k_for=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;libs/keypad_Atmega32.mbas,842 :: 		if strcmp(ht_or_mot,"heater")=0 then
	MOVW       R30, R28
	ADIW       R30, 6
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
	SUBI       R16, 250
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down551
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down551:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down552
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down211
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down552:
;libs/keypad_Atmega32.mbas,843 :: 		oldstate_up = 1  Buzzer_on_off(1)    while_state_2_2=246  k=1  j=0 k_for=1  '' lcd_out(1,1,"strcmp on!") delay_ms(1000)
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down211:
;libs/keypad_Atmega32.mbas,847 :: 		if   strcmp(ht_or_mot,"motor")=0  then
	MOVW       R30, R28
	ADIW       R30, 6
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
	SUBI       R16, 250
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down553
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down553:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down554
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down214
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down554:
;libs/keypad_Atmega32.mbas,848 :: 		oldstate_down = 1  Buzzer_on_off(1)    while_state_2_2=246  k=1  j=0 k_for=1 '' lcd_out(1,1,"strcmp 2 on!") delay_ms(1000)
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down214:
;libs/keypad_Atmega32.mbas,851 :: 		show_in_button_new_button(var_in_min,var_in_sec,ht_or_mot)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R4, R5
	MOV        R5, R6
	LDS        R3, _var_in_sec+0
	LDS        R2, _var_in_min+0
	CALL       libs/keypad_Atmega32_show_in_button_new_button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
;libs/keypad_Atmega32.mbas,855 :: 		if  ((oldstate_up = 1) or  (oldstate_down = 1)) then
	LDS        R27, _oldstate_up+0
	BST        R27, BitPos(_oldstate_up+0)
	BLD        R21, 1
	LDS        R27, _oldstate_down+0
	BST        R27, BitPos(_oldstate_down+0)
	BLD        R21, 0
	SET
	SBRS       R21, 1
	SBRC       R21, 0
	RJMP       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down558
	CLT
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down558:
	BLD        R21, 0
	SBRS       R21, 0
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down217
;libs/keypad_Atmega32.mbas,856 :: 		delay_ms(100) k_for=1  k2=0
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down219:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down219
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down219
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down219
	NOP
	LDI        R27, 1
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+5, R27
;libs/keypad_Atmega32.mbas,857 :: 		oldstate_up = 0 oldstate_down = 0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;libs/keypad_Atmega32.mbas,858 :: 		while (k_for)
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down222:
	LDD        R16, Y+2
	TST        R16
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down559
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down223
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down559:
;libs/keypad_Atmega32.mbas,875 :: 		if strcmp(ht_or_mot,"heater")=0 then
	MOVW       R30, R28
	ADIW       R30, 6
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
	SUBI       R16, 250
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down560
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down560:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down561
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down227
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down561:
;libs/keypad_Atmega32.mbas,881 :: 		if  ((Button(Down_SW_Port, Down_SW_bit,100,On_state)<> 0)) then
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
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down562
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down230
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down562:
;libs/keypad_Atmega32.mbas,882 :: 		k=-1 oldstate_down = 1  k2=3 ''k= (j mod p_max)  oldstate_up = 1  k2=3
	LDI        R27, 255
	STD        Y+3, R27
	STD        Y+4, R27
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	LDI        R27, 3
	STD        Y+5, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down231
;libs/keypad_Atmega32.mbas,884 :: 		else if ((Button(Up_SW_Port, Up_SW_bit,100,On_state)<> 0))  then ''motor mode
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down230:
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
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down563
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down233
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down563:
;libs/keypad_Atmega32.mbas,885 :: 		k= 1   oldstate_up = 1   k2=3
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDI        R27, 3
	STD        Y+5, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down233:
;libs/keypad_Atmega32.mbas,888 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down231:
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down228
;libs/keypad_Atmega32.mbas,890 :: 		else
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down227:
;libs/keypad_Atmega32.mbas,895 :: 		if  ((Button(Up_SW_Port, Up_SW_bit,100,On_state)<> 0)) then
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
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down564
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down236
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down564:
;libs/keypad_Atmega32.mbas,896 :: 		k=1 oldstate_up = 1  k2=3 ''k= (j mod p_max)  oldstate_up = 1  k2=3
	LDI        R27, 1
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDI        R27, 3
	STD        Y+5, R27
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down237
;libs/keypad_Atmega32.mbas,900 :: 		else if ((Button(Down_SW_Port, Down_SW_bit,100,On_state)<> 0))  then ''motor mode
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down236:
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
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down565
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down239
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down565:
;libs/keypad_Atmega32.mbas,901 :: 		k= -1   oldstate_down = 1   k2=3
	LDI        R27, 255
	STD        Y+3, R27
	STD        Y+4, R27
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	LDI        R27, 3
	STD        Y+5, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down239:
;libs/keypad_Atmega32.mbas,903 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down237:
;libs/keypad_Atmega32.mbas,905 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down228:
;libs/keypad_Atmega32.mbas,906 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,swich_time,On_state)<> 0)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down566
	LDI        R27, 255
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down566:
	MOV        R16, R27
	STD        Y+37, R16
;libs/keypad_Atmega32.mbas,907 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,swich_time,On_state)<> 0)then
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down567
	LDI        R17, 255
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down567:
	LDD        R16, Y+37
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down568
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down242
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down568:
;libs/keypad_Atmega32.mbas,908 :: 		oldstate_men_ok = 1 k_for=0 while_state_import=0 while_state_2_2=250    result="finish"
	LDS        R27, _oldstate_men_ok+0
	SBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
	LDI        R27, 0
	STD        Y+2, R27
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down242:
;libs/keypad_Atmega32.mbas,911 :: 		if (k2=3) then
	LDD        R16, Y+5
	CPI        R16, 3
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down569
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down245
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down569:
;libs/keypad_Atmega32.mbas,913 :: 		if 1 then  var_in_sec=var_in_sec+k  end if
	LDS        R18, _var_in_sec+0
	LDS        R19, _var_in_sec+1
	LDD        R16, Y+3
	LDD        R17, Y+4
	ADD        R18, R16
	ADC        R19, R17
	STS        _var_in_sec+0, R18
	STS        _var_in_sec+1, R19
;libs/keypad_Atmega32.mbas,915 :: 		if (var_in_sec>p_max) then
	MOV        R16, R2
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down570
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down251
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down570:
;libs/keypad_Atmega32.mbas,916 :: 		var_in_min=var_in_min+1   var_in_sec= p_min
	LDS        R16, _var_in_min+0
	LDS        R17, _var_in_min+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _var_in_min+0, R16
	STS        _var_in_min+1, R17
	STS        _var_in_sec+0, R3
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down251:
;libs/keypad_Atmega32.mbas,922 :: 		if (var_in_sec<p_min) then
	LDS        R16, _var_in_sec+0
	LDS        R17, _var_in_sec+1
	CP         R16, R3
	LDI        R27, 0
	CPC        R17, R27
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down571
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down254
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down571:
;libs/keypad_Atmega32.mbas,923 :: 		var_in_min=var_in_min-1   var_in_sec= p_max
	LDS        R16, _var_in_min+0
	LDS        R17, _var_in_min+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _var_in_min+0, R16
	STS        _var_in_min+1, R17
	STS        _var_in_sec+0, R2
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down254:
;libs/keypad_Atmega32.mbas,925 :: 		if strcmp(ht_or_mot,"heater")=0 then
	MOVW       R30, R28
	ADIW       R30, 6
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
	SUBI       R16, 250
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down572
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down572:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down573
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down257
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down573:
;libs/keypad_Atmega32.mbas,926 :: 		if (var_in_min>max_min_heater) then  var_in_min=p_min var_in_sec=p_min end if
	LDS        R18, _var_in_min+0
	LDS        R19, _var_in_min+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down574
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down260
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down574:
	STS        _var_in_min+0, R3
	LDI        R27, 0
	STS        _var_in_min+1, R27
	STS        _var_in_sec+0, R3
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down260:
;libs/keypad_Atmega32.mbas,927 :: 		if (var_in_min<p_min) then  var_in_min=max_min_heater var_in_sec=p_min end if
	LDS        R16, _var_in_min+0
	LDS        R17, _var_in_min+1
	CP         R16, R3
	LDI        R27, 0
	CPC        R17, R27
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down575
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down263
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down575:
	LDI        R27, 10
	STS        _var_in_min+0, R27
	LDI        R27, 0
	STS        _var_in_min+1, R27
	STS        _var_in_sec+0, R3
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down263:
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down258
;libs/keypad_Atmega32.mbas,928 :: 		else
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down257:
;libs/keypad_Atmega32.mbas,929 :: 		if (var_in_min>max_min_motor) then  var_in_min=p_min var_in_sec=p_min end if
	LDS        R18, _var_in_min+0
	LDS        R19, _var_in_min+1
	LDI        R16, 1
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down576
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down266
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down576:
	STS        _var_in_min+0, R3
	LDI        R27, 0
	STS        _var_in_min+1, R27
	STS        _var_in_sec+0, R3
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down266:
;libs/keypad_Atmega32.mbas,930 :: 		if (var_in_min<p_min) then  var_in_min=max_min_motor var_in_sec=p_min end if
	LDS        R16, _var_in_min+0
	LDS        R17, _var_in_min+1
	CP         R16, R3
	LDI        R27, 0
	CPC        R17, R27
	BRLT       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down577
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down269
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down577:
	LDI        R27, 1
	STS        _var_in_min+0, R27
	LDI        R27, 0
	STS        _var_in_min+1, R27
	STS        _var_in_sec+0, R3
	LDI        R27, 0
	STS        _var_in_sec+1, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down269:
;libs/keypad_Atmega32.mbas,931 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down258:
;libs/keypad_Atmega32.mbas,945 :: 		k2=0
	LDI        R27, 0
	STD        Y+5, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down245:
;libs/keypad_Atmega32.mbas,947 :: 		show_in_button_new_button(var_in_min,var_in_sec,ht_or_mot)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R4, R5
	MOV        R5, R6
	LDS        R3, _var_in_sec+0
	LDS        R2, _var_in_min+0
	CALL       libs/keypad_Atmega32_show_in_button_new_button+0
;libs/keypad_Atmega32.mbas,951 :: 		if (((oldstate_Up) and (Button(Up_SW_Port, Up_SW_bit,swich_time_off,Off_state))) )  ''heater mode
	CLR        R6
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_up+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_up+0)
	INC        R17
	AND        R16, R17
	STD        Y+37, R16
;libs/keypad_Atmega32.mbas,952 :: 		or ((oldstate_down and Button(Down_SW_Port, Down_SW_bit,swich_time_off,Off_state))  ) then ''motor mode
	CLR        R6
	LDI        R27, 1
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
	LDS        R0, _oldstate_down+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_down+0)
	INC        R17
	AND        R17, R16
	LDD        R16, Y+37
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down578
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down272
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down578:
;libs/keypad_Atmega32.mbas,953 :: 		oldstate_up = 0 oldstate_down = 0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;libs/keypad_Atmega32.mbas,955 :: 		k_for=0  k2=0
	LDI        R27, 0
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+5, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down272:
;libs/keypad_Atmega32.mbas,958 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down222
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down223:
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down217:
;libs/keypad_Atmega32.mbas,978 :: 		First_second_comand=2  oldstate_2 = 0
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,980 :: 		if (Button(Up_SW_Port, Up_SW_bit,swich_time,On_state)<> 0) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down579
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down275
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down579:
;libs/keypad_Atmega32.mbas,981 :: 		if  strcmp(ht_or_mot,"motor")=0  then
	MOVW       R30, R28
	ADIW       R30, 6
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
	SUBI       R16, 250
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down580
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down580:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down581
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down278
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down581:
;libs/keypad_Atmega32.mbas,982 :: 		while_state_2_2=250 result="heater" '' oldstate_up=2
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
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
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down278:
;libs/keypad_Atmega32.mbas,984 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down275:
;libs/keypad_Atmega32.mbas,987 :: 		if (Button(Down_SW_Port, Down_SW_bit,swich_time,On_state)<> 0) then
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R16, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down582
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down281
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down582:
;libs/keypad_Atmega32.mbas,988 :: 		if   strcmp(ht_or_mot,"heater")=0  then
	MOVW       R30, R28
	ADIW       R30, 6
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
	SUBI       R16, 250
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R5
	MOV        R3, R6
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	CPI        R17, 0
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down583
	CPI        R16, 0
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down583:
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down584
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down284
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down584:
;libs/keypad_Atmega32.mbas,989 :: 		while_state_2_2=250 result="motor"      '' oldstate_up=2
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
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
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down284:
;libs/keypad_Atmega32.mbas,991 :: 		end if
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down281:
;libs/keypad_Atmega32.mbas,994 :: 		if (Button(Menu_SW_Port,Menu_SW_bit,swich_time,On_state)<> 0)
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down585
	LDI        R27, 255
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down585:
	MOV        R16, R27
	STD        Y+37, R16
;libs/keypad_Atmega32.mbas,995 :: 		or (Button(Ok_SW_Port,Ok_SW_bit,swich_time,On_state)<> 0)then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
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
	CPI        R16, 0
	LDI        R17, 0
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down586
	LDI        R17, 255
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down586:
	LDD        R16, Y+37
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down587
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down287
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down587:
;libs/keypad_Atmega32.mbas,996 :: 		oldstate_men_ok = 1               ' Update flag
	LDS        R27, _oldstate_men_ok+0
	SBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down287:
;libs/keypad_Atmega32.mbas,1001 :: 		if (oldstate_men_ok and Button(Menu_SW_Port,Menu_SW_bit,swich_time,Off_state))
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_men_ok+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_men_ok+0)
	INC        R17
	AND        R16, R17
	STD        Y+37, R16
;libs/keypad_Atmega32.mbas,1002 :: 		or (while_state_import and oldstate_3 and Button(Ok_SW_Port,Ok_SW_bit,swich_time,Off_state))  then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CBR        R21, 1
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down591
	SBR        R21, 1
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down591:
	CLR        R6
	LDI        R27, 1
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
	CLR        R17
	SBRC       R21, 0
	INC        R17
	AND        R17, R16
	LDD        R16, Y+37
	OR         R16, R17
	BRNE       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down592
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down290
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down592:
;libs/keypad_Atmega32.mbas,1003 :: 		oldstate_men_ok = 0 while_state_2_2=250   result="finish"
	LDS        R27, _oldstate_men_ok+0
	CBR        R27, BitMask(_oldstate_men_ok+0)
	STS        _oldstate_men_ok+0, R27
	LDI        R27, 250
	STS        _while_state_2_2+0, R27
	LDD        R30, Y+0
	LDD        R31, Y+1
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down290:
;libs/keypad_Atmega32.mbas,1008 :: 		if (while_state_2_2=250) then''and ((oldstate_up=2) or (oldstate_up=2) or (oldstate_men_ok = )) then
	LDS        R16, _while_state_2_2+0
	CPI        R16, 250
	BREQ       L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down593
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down293
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down593:
;libs/keypad_Atmega32.mbas,1010 :: 		Buzzer_on_off(1)    while_state_2_2=246
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Buzzer_on_off+0
	POP        R2
	LDI        R27, 246
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,1011 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down293:
;libs/keypad_Atmega32.mbas,1033 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down206
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down207:
;libs/keypad_Atmega32.mbas,1035 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down201
L_libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down202:
;libs/keypad_Atmega32.mbas,1037 :: 		lcd_0() lcd_out(1,1,"Value set for:") lcd_out(2,1,">>> "+ht_or_mot+" <<<" )
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 6
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 250
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
	POP        R5
	POP        R6
	MOV        R26, R28
	MOV        R27, R29
	SUBI       R26, 235
	SBCI       R27, 255
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 62
	ST         X+, R16
	LDI        R16, 32
	ST         X+, R16
	MOV        R30, R5
	MOV        R31, R6
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 60
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOVW       R16, R28
	SUBI       R16, 235
	SBCI       R17, 255
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
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
;libs/keypad_Atmega32.mbas,1039 :: 		end sub
L_end_Keypad__teben_saeed_new_button_up_down:
	ADIW       R28, 37
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down

libs/keypad_Atmega32_key_rest_all:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,1048 :: 		dim First_second_comand,var_in,lcd_line as byte
;libs/keypad_Atmega32.mbas,1049 :: 		for First_second_comand =1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L_libs/keypad_Atmega32_key_rest_all297:
;libs/keypad_Atmega32.mbas,1050 :: 		for lcd_line =1 to 2
	LDI        R27, 1
	STD        Y+2, R27
L_libs/keypad_Atmega32_key_rest_all302:
;libs/keypad_Atmega32.mbas,1051 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	STD        Y+1, R27
L_libs/keypad_Atmega32_key_rest_all306:
	LDD        R16, Y+1
	CP         R2, R16
	BRSH       L_libs/keypad_Atmega32_key_rest_all595
	JMP        L_libs/keypad_Atmega32_key_rest_all310
L_libs/keypad_Atmega32_key_rest_all595:
;libs/keypad_Atmega32.mbas,1052 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "                "
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1053 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "                "
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1054 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][2]= "1"
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDD        R20, Y+2
	SUBI       R20, 1
	STD        Y+5, R16
	STD        Y+6, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1055 :: 		case_is_selceted_show[lcd_line-1][0]=0
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
;libs/keypad_Atmega32.mbas,1056 :: 		case_is_selceted_show[lcd_line-1][1]=0
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
;libs/keypad_Atmega32.mbas,1057 :: 		next var_in
	LDD        R16, Y+1
	CP         R16, R2
	BRNE       L_libs/keypad_Atmega32_key_rest_all596
	JMP        L_libs/keypad_Atmega32_key_rest_all310
L_libs/keypad_Atmega32_key_rest_all596:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all306
L_libs/keypad_Atmega32_key_rest_all310:
;libs/keypad_Atmega32.mbas,1058 :: 		next lcd_line
	LDD        R16, Y+2
	CPI        R16, 2
	BRNE       L_libs/keypad_Atmega32_key_rest_all597
	JMP        L_libs/keypad_Atmega32_key_rest_all305
L_libs/keypad_Atmega32_key_rest_all597:
	LDD        R16, Y+2
	SUBI       R16, 255
	STD        Y+2, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all302
L_libs/keypad_Atmega32_key_rest_all305:
;libs/keypad_Atmega32.mbas,1059 :: 		next First_second_comand
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L_libs/keypad_Atmega32_key_rest_all598
	JMP        L_libs/keypad_Atmega32_key_rest_all300
L_libs/keypad_Atmega32_key_rest_all598:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/keypad_Atmega32_key_rest_all297
L_libs/keypad_Atmega32_key_rest_all300:
;libs/keypad_Atmega32.mbas,1061 :: 		end sub
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

;libs/keypad_Atmega32.mbas,1066 :: 		dim byref one_,two_ as string[5],dim byref three_ as string[4],)
;libs/keypad_Atmega32.mbas,1069 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1070 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,1074 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1075 :: 		key_rest_all(Choice_number)
	PUSH       R2
	MOV        R2, R3
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,1076 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_choice_select312:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_choice_select600
	JMP        L_libs/keypad_Atmega32_key_choice_select316
L_libs/keypad_Atmega32_key_choice_select600:
;libs/keypad_Atmega32.mbas,1077 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= one_+" "+two_+" "+three_ ''"Auto Manul <Ex>"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1078 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= one_+" "+two_+" "+three_ ''"Auto Manul <Ex>"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1082 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_choice_select601
	JMP        L_libs/keypad_Atmega32_key_choice_select316
L_libs/keypad_Atmega32_key_choice_select601:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_choice_select312
L_libs/keypad_Atmega32_key_choice_select316:
;libs/keypad_Atmega32.mbas,1087 :: 		lcd_line=2
	LDI        R27, 2
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1088 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "^^^^            "
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 103
	SBCI       R17, 255
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
;libs/keypad_Atmega32.mbas,1089 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "      ^^^^       "
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1090 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "           ^^^^ "
	LDI        R27, 3
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1093 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1094 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_choice_select317:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_choice_select602
	JMP        L_libs/keypad_Atmega32_key_choice_select321
L_libs/keypad_Atmega32_key_choice_select602:
;libs/keypad_Atmega32.mbas,1095 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]=" is selcted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1099 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_choice_select603
	JMP        L_libs/keypad_Atmega32_key_choice_select321
L_libs/keypad_Atmega32_key_choice_select603:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_choice_select317
L_libs/keypad_Atmega32_key_choice_select321:
;libs/keypad_Atmega32.mbas,1100 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= one_+"  setting    "
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1101 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= two_+" setting    "
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1102 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Exiting          "
	LDI        R27, 3
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+17, R16
	STD        Y+18, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1106 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,1107 :: 		end sub
L_end_key_choice_select:
	ADIW       R28, 18
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_key_choice_select

libs/keypad_Atmega32_key_Prog_123_old:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,1109 :: 		dim var_in as byte
;libs/keypad_Atmega32.mbas,1110 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:  2 3 4 5 6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
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
;libs/keypad_Atmega32.mbas,1111 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1   3 4 5 6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1112 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2   4 5 6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1113 :: 		var_in=4     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3   5 6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1114 :: 		var_in=5     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4   6 7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1115 :: 		var_in=6     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4 5   7"
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1116 :: 		var_in=7     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:1 2 3 4 5 6  "
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1117 :: 		end sub
L_end_key_Prog_123_old:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_key_Prog_123_old

libs/keypad_Atmega32_key_Prog_123:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,1120 :: 		dim var_in as byte
;libs/keypad_Atmega32.mbas,1121 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr:      2   3  "
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
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
	LDI        R27, 114
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
	LDI        R27, 50
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,1122 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr: 1        3  "
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 49
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
	LDI        R27, 51
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,1123 :: 		var_in=3     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pr: 1    2      "
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	MOV        R20, R3
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,1128 :: 		end sub
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

;libs/keypad_Atmega32.mbas,1132 :: 		sub procedure key_Prog_select(dim var_in,Choice_number as byte)
;libs/keypad_Atmega32.mbas,1135 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1136 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,1140 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1141 :: 		key_rest_all(Choice_number)
	PUSH       R2
	MOV        R2, R3
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,1142 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_Prog_select325:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_Prog_select607
	JMP        L_libs/keypad_Atmega32_key_Prog_select329
L_libs/keypad_Atmega32_key_Prog_select607:
;libs/keypad_Atmega32.mbas,1143 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Pls Chs Prg Num"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1144 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Pls Chs Prg Num"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1146 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "Pr:      2   3  "
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
	LDI        R27, 50
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,1149 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_Prog_select608
	JMP        L_libs/keypad_Atmega32_key_Prog_select329
L_libs/keypad_Atmega32_key_Prog_select608:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_Prog_select325
L_libs/keypad_Atmega32_key_Prog_select329:
;libs/keypad_Atmega32.mbas,1150 :: 		lcd_line=2   key_Prog_123( First_second_comand,lcd_line)
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
;libs/keypad_Atmega32.mbas,1159 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1160 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_key_Prog_select330:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_key_Prog_select609
	JMP        L_libs/keypad_Atmega32_key_Prog_select334
L_libs/keypad_Atmega32_key_Prog_select609:
;libs/keypad_Atmega32.mbas,1161 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Going to It's Setting"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1163 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Program     is selcted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1167 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_key_Prog_select610
	JMP        L_libs/keypad_Atmega32_key_Prog_select334
L_libs/keypad_Atmega32_key_Prog_select610:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_key_Prog_select330
L_libs/keypad_Atmega32_key_Prog_select334:
;libs/keypad_Atmega32.mbas,1169 :: 		case_is_selceted_show[lcd_line-1][0]=10
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
;libs/keypad_Atmega32.mbas,1171 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,1172 :: 		end sub
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

;libs/keypad_Atmega32.mbas,1177 :: 		sub procedure Key_Time_Select(dim var_in,Choice_number as byte)
;libs/keypad_Atmega32.mbas,1180 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1181 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,1185 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1186 :: 		key_rest_all(Choice_number_sym)
	PUSH       R2
	LDI        R27, 3
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,1187 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Time_Select336:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Time_Select612
	JMP        L_libs/keypad_Atmega32_Key_Time_Select340
L_libs/keypad_Atmega32_Key_Time_Select612:
;libs/keypad_Atmega32.mbas,1188 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "Time:Heatr Motor"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1190 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "Pr:      2   3  "
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
	LDI        R27, 50
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;libs/keypad_Atmega32.mbas,1194 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Time_Select613
	JMP        L_libs/keypad_Atmega32_Key_Time_Select340
L_libs/keypad_Atmega32_Key_Time_Select613:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Time_Select336
L_libs/keypad_Atmega32_Key_Time_Select340:
;libs/keypad_Atmega32.mbas,1195 :: 		lcd_line=1
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1196 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Time:      Motor"
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
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
;libs/keypad_Atmega32.mbas,1197 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "Time:Heatr      "
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1204 :: 		lcd_line=2   key_Prog_123( First_second_comand,lcd_line)
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
;libs/keypad_Atmega32.mbas,1213 :: 		First_second_comand=2 lcd_line=1 var_in =1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,1215 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]="Heater Timer Sett"
	LDI        R18, 50
	LDI        R19, 1
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
;libs/keypad_Atmega32.mbas,1217 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is selcted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1219 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in][0]="Motor Timer Sett"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1221 :: 		Options_array[First_second_comand-1][lcd_line][var_in][0]="ing is selcted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1230 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,1231 :: 		end sub
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

;libs/keypad_Atmega32.mbas,1236 :: 		sub procedure Key_Heat_mot_Time(dim var_in,Choice_number as byte,dim byref ht_or_mt as string[5],dim byref min_sec as string[3])
;libs/keypad_Atmega32.mbas,1239 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1240 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,1244 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1245 :: 		key_rest_all(Choice_number_sym)
	PUSH       R2
	LDI        R27, 3
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,1246 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Heat_mot_Time342:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Heat_mot_Time615
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time346
L_libs/keypad_Atmega32_Key_Heat_mot_Time615:
;libs/keypad_Atmega32.mbas,1248 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= ht_or_mt+":>>>"+min_sec+"<<<"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1249 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= ht_or_mt+":>>>"+min_sec+"<<<"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1250 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]= "                "
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1254 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Heat_mot_Time616
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time346
L_libs/keypad_Atmega32_Key_Heat_mot_Time616:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time342
L_libs/keypad_Atmega32_Key_Heat_mot_Time346:
;libs/keypad_Atmega32.mbas,1266 :: 		First_second_comand=2 lcd_line=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1267 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_Heat_mot_Time347:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_Heat_mot_Time617
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time351
L_libs/keypad_Atmega32_Key_Heat_mot_Time617:
;libs/keypad_Atmega32.mbas,1269 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]=ht_or_mt+" Timer Sett"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1271 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is seted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+16, R16
	STD        Y+17, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1273 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_Heat_mot_Time618
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time351
L_libs/keypad_Atmega32_Key_Heat_mot_Time618:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_Heat_mot_Time347
L_libs/keypad_Atmega32_Key_Heat_mot_Time351:
;libs/keypad_Atmega32.mbas,1276 :: 		case_is_selceted_show[lcd_line][1]=10
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
	LDI        R27, 10
	ST         Z, R27
;libs/keypad_Atmega32.mbas,1278 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,1279 :: 		end sub
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

;libs/keypad_Atmega32.mbas,1284 :: 		sub procedure Key_exit_back(dim var_in,Choice_number as byte,dim byref Back_ as string[5],dim byref Save_ as string[3])
;libs/keypad_Atmega32.mbas,1287 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1288 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;libs/keypad_Atmega32.mbas,1292 :: 		First_second_comand=1 lcd_line=1
	LDI        R27, 1
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1293 :: 		key_rest_all(7)
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_rest_all+0
	POP        R2
;libs/keypad_Atmega32.mbas,1294 :: 		for var_in =1 to Choice_number
	LDI        R27, 1
	MOV        R2, R27
L_libs/keypad_Atmega32_Key_exit_back353:
	CP         R3, R2
	BRSH       L_libs/keypad_Atmega32_Key_exit_back620
	JMP        L_libs/keypad_Atmega32_Key_exit_back357
L_libs/keypad_Atmega32_Key_exit_back620:
;libs/keypad_Atmega32.mbas,1296 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]= "<"+Back_+">"+"<"+Save_+">"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1297 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "<"+Back_+">"+"<"+Save_+">"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1301 :: 		next var_in
	CP         R2, R3
	BRNE       L_libs/keypad_Atmega32_Key_exit_back621
	JMP        L_libs/keypad_Atmega32_Key_exit_back357
L_libs/keypad_Atmega32_Key_exit_back621:
	MOV        R16, R2
	SUBI       R16, 255
	MOV        R2, R16
	JMP        L_libs/keypad_Atmega32_Key_exit_back353
L_libs/keypad_Atmega32_Key_exit_back357:
;libs/keypad_Atmega32.mbas,1303 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "<"+Back_+">"''+"<"+min_sec+">"
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 153
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
	LDI        R16, 0
	ST         X+, R16
	MOV        R26, R18
	MOV        R27, R19
	MOVW       R30, R28
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,1304 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "        "+"<"+Save_+">"
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1306 :: 		lcd_line=2
	LDI        R27, 2
	STS        _lcd_line+0, R27
;libs/keypad_Atmega32.mbas,1307 :: 		var_in=1     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "  ^^^^          "
	LDI        R27, 1
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	SUBI       R16, 103
	SBCI       R17, 255
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
;libs/keypad_Atmega32.mbas,1308 :: 		var_in=2     Options_array[First_second_comand-1][lcd_line-1][var_in-1][1]= "          ^^^^  "
	LDI        R27, 2
	MOV        R2, R27
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1319 :: 		First_second_comand=2 lcd_line=1 var_in=1
	LDI        R27, 2
	STS        _First_second_comand+0, R27
	LDI        R27, 1
	STS        _lcd_line+0, R27
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,1322 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in-1][0]=Back_+"is"
	LDI        R18, 50
	LDI        R19, 1
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
;libs/keypad_Atmega32.mbas,1323 :: 		Options_array[First_second_comand-1][lcd_line-1][var_in][0]=Save_+"is"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _lcd_line+0
	SUBI       R20, 1
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1325 :: 		Options_array[First_second_comand-1][lcd_line][var_in-1][0]="ing is seted"
	LDS        R16, _First_second_comand+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 50
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Options_array+0)
	LDI        R19, hi_addr(_Options_array+0)
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+14, R16
	STD        Y+15, R17
	LDI        R16, 153
	LDI        R17, 0
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
;libs/keypad_Atmega32.mbas,1330 :: 		case_is_selceted_show[lcd_line][0]=1
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
;libs/keypad_Atmega32.mbas,1332 :: 		var_in=1
	LDI        R27, 1
	MOV        R2, R27
;libs/keypad_Atmega32.mbas,1333 :: 		end sub
L_end_Key_exit_back:
	ADIW       R28, 15
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/keypad_Atmega32_Key_exit_back

libs/keypad_Atmega32_Keypad_start_old:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 32
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,1340 :: 		dim    Choice_number as byte
;libs/keypad_Atmega32.mbas,1341 :: 		Choice_number=3      ''first level
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
; Choice_number start address is: 22 (R22)
	LDI        R22, 3
;libs/keypad_Atmega32.mbas,1342 :: 		Heater_motor_index=1 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1343 :: 		key_choice_select(1,Choice_number,"Setng","Prog","<Ex>")
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
	MOVW       R18, R28
	SUBI       R18, 243
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 18
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
	MOVW       R16, R28
	SUBI       R16, 238
	SBCI       R17, 255
	PUSH       R2
	MOVW       R8, R20
	MOVW       R6, R18
	MOVW       R4, R16
	MOV        R3, R22
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_choice_select+0
;libs/keypad_Atmega32.mbas,1344 :: 		var_main[0]=Keypad__teben(1,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
	CLR        R7
	MOV        R6, R22
	LDI        R27, 1
	MOV        R5, R27
	MOV        R4, R22
; Choice_number end address is: 22 (R22)
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+0, R16
;libs/keypad_Atmega32.mbas,1348 :: 		while_state_2=1
	LDS        R27, _while_state_2+0
	SBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,1349 :: 		while  (while_state_2 )
L_libs/keypad_Atmega32_Keypad_start_old360:
	LDS        R27, _while_state_2+0
	SBRS       R27, BitPos(_while_state_2+0)
	JMP        L_libs/keypad_Atmega32_Keypad_start_old361
;libs/keypad_Atmega32.mbas,1351 :: 		case 2
	LDD        R16, Y+0
	CPI        R16, 2
	BREQ       L_libs/keypad_Atmega32_Keypad_start_old623
	JMP        L_libs/keypad_Atmega32_Keypad_start_old367
L_libs/keypad_Atmega32_Keypad_start_old623:
;libs/keypad_Atmega32.mbas,1352 :: 		Choice_number=Choice_number_sym while_state_2=0
; Choice_number start address is: 16 (R16)
	LDI        R16, 3
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,1353 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1354 :: 		key_Prog_select(1,Choice_number)
	PUSH       R16
	PUSH       R2
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
	POP        R16
;libs/keypad_Atmega32.mbas,1357 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R7
	MOV        R6, R16
	LDI        R27, 1
	MOV        R5, R27
	MOV        R4, R16
; Choice_number end address is: 16 (R16)
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,1358 :: 		Mot_heater_On_mSec [Choice_number_sym-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 12
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+48)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+48)
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
;libs/keypad_Atmega32.mbas,1359 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	JMP        L_libs/keypad_Atmega32_Keypad_start_old364
L_libs/keypad_Atmega32_Keypad_start_old367:
;libs/keypad_Atmega32.mbas,1361 :: 		case 1
	LDD        R16, Y+0
	CPI        R16, 1
	BREQ       L_libs/keypad_Atmega32_Keypad_start_old624
	JMP        L_libs/keypad_Atmega32_Keypad_start_old370
L_libs/keypad_Atmega32_Keypad_start_old624:
;libs/keypad_Atmega32.mbas,1362 :: 		Choice_number=3    while_state_2=0  ''first level
; Choice_number start address is: 22 (R22)
	LDI        R22, 3
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,1363 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1364 :: 		key_choice_select(1,Choice_number,"Manul","Auto","<Ex>")
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
	MOVW       R18, R28
	SUBI       R18, 243
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 18
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
	MOVW       R16, R28
	SUBI       R16, 238
	SBCI       R17, 255
	PUSH       R2
	MOVW       R8, R20
	MOVW       R6, R18
	MOVW       R4, R16
	MOV        R3, R22
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_choice_select+0
;libs/keypad_Atmega32.mbas,1365 :: 		var_main[1]=Keypad__teben(1,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
	CLR        R7
	MOV        R6, R22
	LDI        R27, 1
	MOV        R5, R27
	MOV        R4, R22
; Choice_number end address is: 22 (R22)
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+1, R16
;libs/keypad_Atmega32.mbas,1370 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1371 :: 		while  (while_state_import )
L_libs/keypad_Atmega32_Keypad_start_old372:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L_libs/keypad_Atmega32_Keypad_start_old373
;libs/keypad_Atmega32.mbas,1374 :: 		case 2
	LDD        R16, Y+1
	CPI        R16, 2
	BREQ       L_libs/keypad_Atmega32_Keypad_start_old625
	JMP        L_libs/keypad_Atmega32_Keypad_start_old379
L_libs/keypad_Atmega32_Keypad_start_old625:
;libs/keypad_Atmega32.mbas,1375 :: 		Choice_number=Choice_number_sym while_state_import=0
; Choice_number start address is: 16 (R16)
	LDI        R16, 3
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1376 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1377 :: 		key_Prog_select(1,Choice_number)
	PUSH       R16
	PUSH       R2
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
	POP        R16
;libs/keypad_Atmega32.mbas,1378 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R7
	MOV        R6, R16
	LDI        R27, 1
	MOV        R5, R27
	MOV        R4, R16
; Choice_number end address is: 16 (R16)
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,1380 :: 		Mot_heater_On_mSec [Choice_number_sym-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 12
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_Mot_heater_On_mSec+48)
	LDI        R19, hi_addr(_Mot_heater_On_mSec+48)
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
;libs/keypad_Atmega32.mbas,1381 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,1390 :: 		Lcd_0()Lcd_Out(1,1,"Pls Do normal Wo") Lcd_Out(2,1,"rk we save times!!!") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/keypad_Atmega32_Keypad_start_old380:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old380
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old380
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old380
;libs/keypad_Atmega32.mbas,1392 :: 		Easy_vacuum_95_10_4_simple_working(var_main[2],0,1)
	LDI        R27, 1
	MOV        R4, R27
	CLR        R3
	LDD        R2, Y+2
	CALL       _Easy_vacuum_95_10_4_simple_working+0
;libs/keypad_Atmega32.mbas,1393 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"Memory") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/keypad_Atmega32_Keypad_start_old382:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old382
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old382
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old382
;libs/keypad_Atmega32.mbas,1394 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	JMP        L_libs/keypad_Atmega32_Keypad_start_old376
L_libs/keypad_Atmega32_Keypad_start_old379:
;libs/keypad_Atmega32.mbas,1397 :: 		case 1
	LDD        R16, Y+1
	CPI        R16, 1
	BREQ       L_libs/keypad_Atmega32_Keypad_start_old626
	JMP        L_libs/keypad_Atmega32_Keypad_start_old386
L_libs/keypad_Atmega32_Keypad_start_old626:
;libs/keypad_Atmega32.mbas,1398 :: 		Choice_number=Choice_number_sym ''while_state_import=0
; Choice_number start address is: 16 (R16)
	LDI        R16, 3
;libs/keypad_Atmega32.mbas,1399 :: 		key_Prog_select(1,Choice_number)
	PUSH       R16
	PUSH       R2
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
	POP        R16
;libs/keypad_Atmega32.mbas,1400 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R7
	MOV        R6, R16
	LDI        R27, 1
	MOV        R5, R27
	MOV        R4, R16
; Choice_number end address is: 16 (R16)
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,1401 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1402 :: 		Mot_heater_On_mSec [Choice_number_sym-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
	LDI        R18, 12
	LDI        R19, 0
	LDI        R16, #lo_addr(_Mot_heater_On_mSec+48)
	LDI        R17, hi_addr(_Mot_heater_On_mSec+48)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 8
	LDD        R16, Y+2
	ST         Z, R16
;libs/keypad_Atmega32.mbas,1403 :: 		Choice_number=2
; Choice_number start address is: 21 (R21)
	LDI        R21, 2
;libs/keypad_Atmega32.mbas,1407 :: 		Heater_motor_index=2 Pwm_chanel_main=1 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,1408 :: 		Key_Heat_mot_Time(1,Choice_number,"Heater","Min")
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
	PUSH       R21
	PUSH       R2
	MOVW       R6, R18
	MOVW       R4, R16
	MOV        R3, R21
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
	POP        R2
;libs/keypad_Atmega32.mbas,1411 :: 		var_main[3]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	POP        R21
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
	PUSH       R21
	PUSH       R2
	CLR        R7
	MOV        R6, R21
	CLR        R5
	LDI        R27, 59
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	POP        R21
	STD        Y+3, R16
;libs/keypad_Atmega32.mbas,1412 :: 		Key_Heat_mot_Time(1,Choice_number,"Heater","Sec")
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
	PUSH       R21
	PUSH       R2
	MOVW       R6, R18
	MOVW       R4, R16
	MOV        R3, R21
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
	POP        R2
;libs/keypad_Atmega32.mbas,1413 :: 		var_main[4]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	POP        R21
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
	PUSH       R21
	PUSH       R2
	CLR        R7
	MOV        R6, R21
	CLR        R5
	LDI        R27, 59
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	STD        Y+4, R16
;libs/keypad_Atmega32.mbas,1417 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[3]
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
;libs/keypad_Atmega32.mbas,1418 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[4]
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
	POP        R21
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
;libs/keypad_Atmega32.mbas,1420 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,1421 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","Min")
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
	PUSH       R21
	PUSH       R2
	MOVW       R6, R18
	MOVW       R4, R16
	MOV        R3, R21
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
	POP        R2
;libs/keypad_Atmega32.mbas,1422 :: 		var_main[5]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	POP        R21
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
	PUSH       R21
	PUSH       R2
	CLR        R7
	MOV        R6, R21
	CLR        R5
	LDI        R27, 59
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	POP        R21
	STD        Y+5, R16
;libs/keypad_Atmega32.mbas,1423 :: 		Key_Heat_mot_Time(1,Choice_number,"Motor","Sec")
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
	PUSH       R21
	PUSH       R2
	MOVW       R6, R18
	MOVW       R4, R16
	MOV        R3, R21
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_Key_Heat_mot_Time+0
	POP        R2
;libs/keypad_Atmega32.mbas,1424 :: 		var_main[6]=Keypad__teben(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2],59,0,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
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
	POP        R21
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
	PUSH       R2
	CLR        R7
	MOV        R6, R21
; Choice_number end address is: 21 (R21)
	CLR        R5
	LDI        R27, 59
	MOV        R4, R27
	MOVW       R2, R16
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+6, R16
;libs/keypad_Atmega32.mbas,1430 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[5]
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
;libs/keypad_Atmega32.mbas,1431 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[6]
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
;libs/keypad_Atmega32.mbas,1440 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"Memory") delay_ms(200)
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/keypad_Atmega32_Keypad_start_old387:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old387
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old387
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old387
;libs/keypad_Atmega32.mbas,1441 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
;libs/keypad_Atmega32.mbas,1442 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
	JMP        L_libs/keypad_Atmega32_Keypad_start_old376
L_libs/keypad_Atmega32_Keypad_start_old386:
;libs/keypad_Atmega32.mbas,1443 :: 		case 3
	LDD        R16, Y+1
	CPI        R16, 3
	BREQ       L_libs/keypad_Atmega32_Keypad_start_old627
	JMP        L_libs/keypad_Atmega32_Keypad_start_old391
L_libs/keypad_Atmega32_Keypad_start_old627:
;libs/keypad_Atmega32.mbas,1444 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1445 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/keypad_Atmega32_Keypad_start_old392:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old392
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old392
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old392
	JMP        L_libs/keypad_Atmega32_Keypad_start_old376
L_libs/keypad_Atmega32_Keypad_start_old391:
L_libs/keypad_Atmega32_Keypad_start_old376:
;libs/keypad_Atmega32.mbas,1447 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad_start_old372
L_libs/keypad_Atmega32_Keypad_start_old373:
	JMP        L_libs/keypad_Atmega32_Keypad_start_old364
L_libs/keypad_Atmega32_Keypad_start_old370:
;libs/keypad_Atmega32.mbas,1449 :: 		case 3
	LDD        R16, Y+0
	CPI        R16, 3
	BREQ       L_libs/keypad_Atmega32_Keypad_start_old628
	JMP        L_libs/keypad_Atmega32_Keypad_start_old396
L_libs/keypad_Atmega32_Keypad_start_old628:
;libs/keypad_Atmega32.mbas,1450 :: 		while_state_2=0
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,1451 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L_libs/keypad_Atmega32_Keypad_start_old397:
	DEC        R16
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old397
	DEC        R17
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old397
	DEC        R18
	BRNE       L_libs/keypad_Atmega32_Keypad_start_old397
	JMP        L_libs/keypad_Atmega32_Keypad_start_old364
L_libs/keypad_Atmega32_Keypad_start_old396:
L_libs/keypad_Atmega32_Keypad_start_old364:
;libs/keypad_Atmega32.mbas,1453 :: 		wend
	JMP        L_libs/keypad_Atmega32_Keypad_start_old360
L_libs/keypad_Atmega32_Keypad_start_old361:
;libs/keypad_Atmega32.mbas,1454 :: 		end sub
L_end_Keypad_start_old:
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
; end of libs/keypad_Atmega32_Keypad_start_old

_Keypad_start:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 40
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/keypad_Atmega32.mbas,1462 :: 		dim    Choice_number as byte
;libs/keypad_Atmega32.mbas,1463 :: 		Choice_number=3      ''first level
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 3
	STD        Y+8, R27
;libs/keypad_Atmega32.mbas,1464 :: 		Heater_motor_index=1 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1466 :: 		Heater_motor_index=2 Pwm_chanel_main=1
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
;libs/keypad_Atmega32.mbas,1467 :: 		bytetostr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1] ,txt)
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
	ADIW       R30, 1
	LD         R16, Z
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/keypad_Atmega32.mbas,1477 :: 		key_choice_select(1,Choice_number,"Setng","Prog","<Ex>")
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R20, 247
	SBCI       R21, 255
	MOVW       R30, R28
	ADIW       R30, 14
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
	MOVW       R18, R28
	SUBI       R18, 242
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 19
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
	MOVW       R16, R28
	SUBI       R16, 237
	SBCI       R17, 255
	MOVW       R8, R20
	MOVW       R6, R18
	MOVW       R4, R16
	LDD        R3, Y+8
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_choice_select+0
	POP        R2
	POP        R3
	POP        R4
;libs/keypad_Atmega32.mbas,1478 :: 		if strcmp(saeed_new_mode,"advance")=0 then
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R3
	MOV        R3, R4
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	CPI        R17, 0
	BRNE       L__Keypad_start630
	CPI        R16, 0
L__Keypad_start630:
	BREQ       L__Keypad_start631
	JMP        L__Keypad_start401
L__Keypad_start631:
;libs/keypad_Atmega32.mbas,1479 :: 		var_main[0]=Keypad__teben(1,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R7
	LDD        R6, Y+8
	LDI        R27, 1
	MOV        R5, R27
	LDD        R4, Y+8
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	POP        R3
	POP        R4
	STD        Y+0, R16
	JMP        L__Keypad_start402
;libs/keypad_Atmega32.mbas,1480 :: 		else if (strcmp(saeed_new_mode,"heater")=0) or
L__Keypad_start401:
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R3
	MOV        R3, R4
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	CPI        R17, 0
	BRNE       L__Keypad_start632
	CPI        R16, 0
L__Keypad_start632:
	LDI        R27, 0
	BRNE       L__Keypad_start633
	LDI        R27, 255
L__Keypad_start633:
	MOV        R16, R27
	STD        Y+38, R16
;libs/keypad_Atmega32.mbas,1481 :: 		(strcmp(saeed_new_mode,"motor")=0)   then
	MOVW       R30, R28
	ADIW       R30, 16
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
	SUBI       R16, 240
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R2, R3
	MOV        R3, R4
	MOVW       R4, R16
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	CPI        R17, 0
	BRNE       L__Keypad_start634
	CPI        R16, 0
L__Keypad_start634:
	LDI        R17, 0
	BRNE       L__Keypad_start635
	LDI        R17, 255
L__Keypad_start635:
	LDD        R16, Y+38
	OR         R16, R17
	BRNE       L__Keypad_start636
	JMP        L__Keypad_start404
L__Keypad_start636:
;libs/keypad_Atmega32.mbas,1482 :: 		var_main[0]=4 end if
	LDI        R27, 4
	STD        Y+0, R27
L__Keypad_start404:
;libs/keypad_Atmega32.mbas,1483 :: 		end if
L__Keypad_start402:
;libs/keypad_Atmega32.mbas,1488 :: 		while_state_2=1
	LDS        R27, _while_state_2+0
	SBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,1489 :: 		while  (while_state_2 )
L__Keypad_start407:
	LDS        R27, _while_state_2+0
	SBRS       R27, BitPos(_while_state_2+0)
	JMP        L__Keypad_start408
;libs/keypad_Atmega32.mbas,1491 :: 		case 4
	LDD        R16, Y+0
	CPI        R16, 4
	BREQ       L__Keypad_start637
	JMP        L__Keypad_start414
L__Keypad_start637:
;libs/keypad_Atmega32.mbas,1492 :: 		var_main[2]=chanel_
	STD        Y+2, R2
;libs/keypad_Atmega32.mbas,1493 :: 		txt=saeed_new_mode  while_state_2_2=1
	LDI        R26, #lo_addr(_txt+0)
	LDI        R27, hi_addr(_txt+0)
	MOV        R30, R3
	MOV        R31, R4
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
	LDI        R27, 1
	STS        _while_state_2_2+0, R27
;libs/keypad_Atmega32.mbas,1494 :: 		while  while_state_2_2 ''((strcmp(txt,"finish")=0)<>1)
L__Keypad_start416:
	LDS        R16, _while_state_2_2+0
	TST        R16
	BRNE       L__Keypad_start638
	JMP        L__Keypad_start417
L__Keypad_start638:
;libs/keypad_Atmega32.mbas,1495 :: 		if strcmp(txt,"motor")=0 then
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, #lo_addr(_txt+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R3, R27
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	CPI        R17, 0
	BRNE       L__Keypad_start639
	CPI        R16, 0
L__Keypad_start639:
	BREQ       L__Keypad_start640
	JMP        L__Keypad_start421
L__Keypad_start640:
;libs/keypad_Atmega32.mbas,1496 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,1497 :: 		var_in_min=Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]
	LDD        R16, Y+2
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
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R16, Z
	STS        _var_in_min+0, R16
	LDI        R27, 0
	STS        _var_in_min+1, R27
;libs/keypad_Atmega32.mbas,1498 :: 		var_in_sec=Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]
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
	SUBI       R16, 244
	SBCI       R17, 255
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R16, Z
	STS        _var_in_sec+0, R16
	LDI        R27, 0
	STS        _var_in_sec+1, R27
;libs/keypad_Atmega32.mbas,1499 :: 		txt=Keypad__teben_saeed_new_button_up_down(59,0,Choice_number,"motor")
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R5, R16
	MOV        R6, R17
	LDD        R4, Y+8
	CLR        R3
	LDI        R27, 59
	MOV        R2, R27
	MOVW       R16, R28
	SUBI       R16, 225
	SBCI       R17, 255
	CALL       libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R26, #lo_addr(_txt+0)
	LDI        R27, hi_addr(_txt+0)
	MOVW       R30, R28
	ADIW       R30, 31
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,1500 :: 		var_main[5]= var_in_min
	LDS        R16, _var_in_min+0
	STD        Y+5, R16
;libs/keypad_Atmega32.mbas,1501 :: 		var_main[6]=var_in_sec
	LDS        R16, _var_in_sec+0
	STD        Y+6, R16
;libs/keypad_Atmega32.mbas,1502 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[5]
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
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
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
;libs/keypad_Atmega32.mbas,1503 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[6]
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
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
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
	JMP        L__Keypad_start422
;libs/keypad_Atmega32.mbas,1504 :: 		else if  strcmp(txt,"heater")=0 then
L__Keypad_start421:
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, #lo_addr(_txt+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R3, R27
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	CPI        R17, 0
	BRNE       L__Keypad_start641
	CPI        R16, 0
L__Keypad_start641:
	BREQ       L__Keypad_start642
	JMP        L__Keypad_start424
L__Keypad_start642:
;libs/keypad_Atmega32.mbas,1505 :: 		Heater_motor_index=2 Pwm_chanel_main=1 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,1506 :: 		var_in_min=Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]
	LDD        R16, Y+2
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
	ADIW       R30, 1
	LD         R16, Z
	STS        _var_in_min+0, R16
	LDI        R27, 0
	STS        _var_in_min+1, R27
;libs/keypad_Atmega32.mbas,1507 :: 		var_in_sec=Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]
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
	SUBI       R16, 244
	SBCI       R17, 255
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R16, Z
	STS        _var_in_sec+0, R16
	LDI        R27, 0
	STS        _var_in_sec+1, R27
;libs/keypad_Atmega32.mbas,1508 :: 		txt=Keypad__teben_saeed_new_button_up_down(59,0,Choice_number,"heater")
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOV        R5, R16
	MOV        R6, R17
	LDD        R4, Y+8
	CLR        R3
	LDI        R27, 59
	MOV        R2, R27
	MOVW       R16, R28
	SUBI       R16, 225
	SBCI       R17, 255
	CALL       libs/keypad_Atmega32_Keypad__teben_saeed_new_button_up_down+0
	POP        R2
	POP        R3
	POP        R4
	LDI        R26, #lo_addr(_txt+0)
	LDI        R27, hi_addr(_txt+0)
	MOVW       R30, R28
	ADIW       R30, 31
	CALL       ___CS2S+0
	LDI        R16, 0
	ST         X+, R16
;libs/keypad_Atmega32.mbas,1509 :: 		var_main[3]=var_in_min
	LDS        R16, _var_in_min+0
	STD        Y+3, R16
;libs/keypad_Atmega32.mbas,1510 :: 		var_main[4]=var_in_sec
	LDS        R16, _var_in_sec+0
	STD        Y+4, R16
;libs/keypad_Atmega32.mbas,1511 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=var_main[3]
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
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
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
;libs/keypad_Atmega32.mbas,1512 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=var_main[4]
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
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
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
L__Keypad_start424:
;libs/keypad_Atmega32.mbas,1514 :: 		end if
L__Keypad_start422:
;libs/keypad_Atmega32.mbas,1515 :: 		if (strcmp(txt,"finish")=0)  then while_state_2_2=0 end if
	MOVW       R30, R28
	ADIW       R30, 9
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 247
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, #lo_addr(_txt+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R3, R27
	CALL       _strcmp+0
	POP        R2
	POP        R3
	POP        R4
	CPI        R17, 0
	BRNE       L__Keypad_start643
	CPI        R16, 0
L__Keypad_start643:
	BREQ       L__Keypad_start644
	JMP        L__Keypad_start427
L__Keypad_start644:
	LDI        R27, 0
	STS        _while_state_2_2+0, R27
L__Keypad_start427:
;libs/keypad_Atmega32.mbas,1516 :: 		wend
	JMP        L__Keypad_start416
L__Keypad_start417:
;libs/keypad_Atmega32.mbas,1517 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"Memory") ''delay_ms(200)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/keypad_Atmega32.mbas,1518 :: 		eeprom_save() while_state_2=0
	CALL       _eeprom_save+0
	POP        R2
	POP        R3
	POP        R4
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
	JMP        L__Keypad_start411
L__Keypad_start414:
;libs/keypad_Atmega32.mbas,1519 :: 		case 2
	LDD        R16, Y+0
	CPI        R16, 2
	BREQ       L__Keypad_start645
	JMP        L__Keypad_start431
L__Keypad_start645:
;libs/keypad_Atmega32.mbas,1520 :: 		Choice_number=Choice_number_sym while_state_2=0
	LDI        R27, 3
	STD        Y+8, R27
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,1521 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1522 :: 		key_Prog_select(1,Choice_number)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,1525 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R7
	LDD        R6, Y+8
	LDI        R27, 1
	MOV        R5, R27
	LDD        R4, Y+8
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,1526 :: 		Mot_heater_On_mSec [Choice_number-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
	LDD        R16, Y+8
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
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
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
;libs/keypad_Atmega32.mbas,1527 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	POP        R3
	POP        R4
	JMP        L__Keypad_start411
L__Keypad_start431:
;libs/keypad_Atmega32.mbas,1529 :: 		case 1
	LDD        R16, Y+0
	CPI        R16, 1
	BREQ       L__Keypad_start646
	JMP        L__Keypad_start434
L__Keypad_start646:
;libs/keypad_Atmega32.mbas,1530 :: 		Choice_number=3    while_state_2=0  ''first level
	LDI        R27, 3
	STD        Y+8, R27
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,1531 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1532 :: 		key_choice_select(1,Choice_number,"Manul","Auto","<Ex>")
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R20, 247
	SBCI       R21, 255
	MOVW       R30, R28
	ADIW       R30, 14
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
	MOVW       R18, R28
	SUBI       R18, 242
	SBCI       R19, 255
	MOVW       R30, R28
	ADIW       R30, 19
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
	MOVW       R16, R28
	SUBI       R16, 237
	SBCI       R17, 255
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R8, R20
	MOVW       R6, R18
	MOVW       R4, R16
	LDD        R3, Y+8
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_choice_select+0
;libs/keypad_Atmega32.mbas,1533 :: 		var_main[1]=Keypad__teben(1,Choice_number,1,Choice_number,0)''Keypad__teben(dim var_in,p_max,p_min,Choice_number,var_in_old_on_off as byte )
	CLR        R7
	LDD        R6, Y+8
	LDI        R27, 1
	MOV        R5, R27
	LDD        R4, Y+8
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	POP        R2
	POP        R3
	POP        R4
	STD        Y+1, R16
;libs/keypad_Atmega32.mbas,1538 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1539 :: 		while  (while_state_import )
L__Keypad_start436:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Keypad_start437
;libs/keypad_Atmega32.mbas,1542 :: 		case 2
	LDD        R16, Y+1
	CPI        R16, 2
	BREQ       L__Keypad_start647
	JMP        L__Keypad_start443
L__Keypad_start647:
;libs/keypad_Atmega32.mbas,1543 :: 		Choice_number=Choice_number_sym ''while_state_import=0
	LDI        R27, 3
	STD        Y+8, R27
;libs/keypad_Atmega32.mbas,1544 :: 		Heater_motor_index=2 Pwm_chanel_main=3 chanel=chanel_
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 3
	STS        _Pwm_chanel_main+0, R27
	STS        _chanel+0, R2
;libs/keypad_Atmega32.mbas,1545 :: 		key_Prog_select(1,Choice_number)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       libs/keypad_Atmega32_key_Prog_select+0
	POP        R2
;libs/keypad_Atmega32.mbas,1546 :: 		var_main[2]=Keypad__teben(chanel_,Choice_number,1,Choice_number,0)''dim var_in as byte, dim p_max as  byte, dim p_min as  byte,dim Choice_number,var_in_old_on_off as byte )
	PUSH       R2
	CLR        R7
	LDD        R6, Y+8
	LDI        R27, 1
	MOV        R5, R27
	LDD        R4, Y+8
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/keypad_Atmega32_Keypad__teben+0
	STD        Y+2, R16
;libs/keypad_Atmega32.mbas,1548 :: 		Mot_heater_On_mSec [Choice_number-1][Heater_motor_index-1][Pwm_chanel_main-1][0]= var_main[2]
	LDD        R16, Y+8
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
	STD        Y+38, R16
	STD        Y+39, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+38
	LDD        R19, Y+39
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
;libs/keypad_Atmega32.mbas,1549 :: 		Heater_motor_index=2 Pwm_chanel_main=2 chanel=var_main[2]
	LDI        R27, 2
	STS        _Heater_motor_index+0, R27
	LDI        R27, 2
	STS        _Pwm_chanel_main+0, R27
	LDD        R16, Y+2
	STS        _chanel+0, R16
;libs/keypad_Atmega32.mbas,1558 :: 		Lcd_0()Lcd_Out(1,1,"Pls Do normal Wo") Lcd_Out(2,1,"rk we save times!!!") delay_ms(200)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Keypad_start444:
	DEC        R16
	BRNE       L__Keypad_start444
	DEC        R17
	BRNE       L__Keypad_start444
	DEC        R18
	BRNE       L__Keypad_start444
;libs/keypad_Atmega32.mbas,1560 :: 		Easy_vacuum_95_10_4_simple_working(var_main[2],0,1)
	LDI        R27, 1
	MOV        R4, R27
	CLR        R3
	LDD        R2, Y+2
	CALL       _Easy_vacuum_95_10_4_simple_working+0
;libs/keypad_Atmega32.mbas,1561 :: 		Lcd_0()Lcd_Out(1,1,"Saving in") Lcd_Out(2,1,"Memory") delay_ms(200)
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Keypad_start446:
	DEC        R16
	BRNE       L__Keypad_start446
	DEC        R17
	BRNE       L__Keypad_start446
	DEC        R18
	BRNE       L__Keypad_start446
;libs/keypad_Atmega32.mbas,1562 :: 		eeprom_save()
	CALL       _eeprom_save+0
	POP        R2
	POP        R3
	POP        R4
	JMP        L__Keypad_start440
L__Keypad_start443:
;libs/keypad_Atmega32.mbas,1616 :: 		case 3
	LDD        R16, Y+1
	CPI        R16, 3
	BREQ       L__Keypad_start648
	JMP        L__Keypad_start450
L__Keypad_start648:
;libs/keypad_Atmega32.mbas,1617 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;libs/keypad_Atmega32.mbas,1618 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Keypad_start451:
	DEC        R16
	BRNE       L__Keypad_start451
	DEC        R17
	BRNE       L__Keypad_start451
	DEC        R18
	BRNE       L__Keypad_start451
	JMP        L__Keypad_start440
L__Keypad_start450:
L__Keypad_start440:
;libs/keypad_Atmega32.mbas,1620 :: 		wend
	JMP        L__Keypad_start436
L__Keypad_start437:
	JMP        L__Keypad_start411
L__Keypad_start434:
;libs/keypad_Atmega32.mbas,1622 :: 		case 3
	LDD        R16, Y+0
	CPI        R16, 3
	BREQ       L__Keypad_start649
	JMP        L__Keypad_start455
L__Keypad_start649:
;libs/keypad_Atmega32.mbas,1623 :: 		while_state_2=0
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;libs/keypad_Atmega32.mbas,1624 :: 		Lcd_0()Lcd_Out(1,1,"Exit From Setting") Lcd_Out(2,1,"Pls Press Ht micro SW") delay_ms(200) '' DDD7_bit =0
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	ADIW       R30, 9
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
	SUBI       R16, 247
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
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Keypad_start456:
	DEC        R16
	BRNE       L__Keypad_start456
	DEC        R17
	BRNE       L__Keypad_start456
	DEC        R18
	BRNE       L__Keypad_start456
	JMP        L__Keypad_start411
L__Keypad_start455:
L__Keypad_start411:
;libs/keypad_Atmega32.mbas,1626 :: 		wend
	JMP        L__Keypad_start407
L__Keypad_start408:
;libs/keypad_Atmega32.mbas,1627 :: 		end sub
L_end_Keypad_start:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	ADIW       R28, 39
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_start

_libs/keypad_Atmega32_?main:

;libs/keypad_Atmega32.mbas,1628 :: 		end.
L_end_libs/keypad_Atmega32_?main:
	RET
; end of _libs/keypad_Atmega32_?main
