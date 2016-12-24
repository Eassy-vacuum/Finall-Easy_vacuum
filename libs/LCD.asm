
_Lcd_0:

;libs/LCD.mbas,31 :: 		sub procedure Lcd_0()
;libs/LCD.mbas,32 :: 		Lcd_Init()
	PUSH       R2
	CALL       _Lcd_Init+0
;libs/LCD.mbas,33 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;libs/LCD.mbas,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;libs/LCD.mbas,36 :: 		end sub
L_end_Lcd_0:
	POP        R2
	RET
; end of _Lcd_0

_LCD_Load:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/LCD.mbas,40 :: 		dim i, dchar as byte
;libs/LCD.mbas,41 :: 		for dchar = 0 to 4
	PUSH       R2
	LDI        R27, 0
	STD        Y+1, R27
L__LCD_Load3:
;libs/LCD.mbas,42 :: 		LCD_Cmd(64 + (dchar * 8))               ' Select 2x16 memory location for custom character
	LDD        R16, Y+1
	LSL        R16
	LSL        R16
	LSL        R16
	SUBI       R16, 192
	MOV        R2, R16
	CALL       _Lcd_Cmd+0
;libs/LCD.mbas,43 :: 		for i = 0 to 7
	LDI        R27, 0
	STD        Y+0, R27
L__LCD_Load8:
;libs/LCD.mbas,45 :: 		case 0
	LDD        R16, Y+1
	CPI        R16, 0
	BREQ       L__LCD_Load36
	JMP        L__LCD_Load15
L__LCD_Load36:
;libs/LCD.mbas,46 :: 		LCD_Chr_Cp(heart[i])
	LDI        R17, #lo_addr(_heart+0)
	LDI        R18, hi_addr(_heart+0)
	LDD        R16, Y+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	JMP        L__LCD_Load12
L__LCD_Load15:
;libs/LCD.mbas,47 :: 		case 1
	LDD        R16, Y+1
	CPI        R16, 1
	BREQ       L__LCD_Load37
	JMP        L__LCD_Load18
L__LCD_Load37:
;libs/LCD.mbas,48 :: 		LCD_Chr_Cp(co[i])
	LDI        R17, #lo_addr(_co+0)
	LDI        R18, hi_addr(_co+0)
	LDD        R16, Y+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	JMP        L__LCD_Load12
L__LCD_Load18:
;libs/LCD.mbas,49 :: 		case 2
	LDD        R16, Y+1
	CPI        R16, 2
	BREQ       L__LCD_Load38
	JMP        L__LCD_Load21
L__LCD_Load38:
;libs/LCD.mbas,50 :: 		LCD_Chr_Cp(cn[i])
	LDI        R17, #lo_addr(_cn+0)
	LDI        R18, hi_addr(_cn+0)
	LDD        R16, Y+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	JMP        L__LCD_Load12
L__LCD_Load21:
;libs/LCD.mbas,51 :: 		case 3
	LDD        R16, Y+1
	CPI        R16, 3
	BREQ       L__LCD_Load39
	JMP        L__LCD_Load24
L__LCD_Load39:
;libs/LCD.mbas,52 :: 		LCD_Chr_Cp(cf[i])
	LDI        R17, #lo_addr(_cf+0)
	LDI        R18, hi_addr(_cf+0)
	LDD        R16, Y+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	JMP        L__LCD_Load12
L__LCD_Load24:
;libs/LCD.mbas,53 :: 		case 4
	LDD        R16, Y+1
	CPI        R16, 4
	BREQ       L__LCD_Load40
	JMP        L__LCD_Load27
L__LCD_Load40:
;libs/LCD.mbas,54 :: 		LCD_Chr_Cp(character_b[i])
	LDI        R17, #lo_addr(_character_b+0)
	LDI        R18, hi_addr(_character_b+0)
	LDD        R16, Y+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	JMP        L__LCD_Load12
L__LCD_Load27:
L__LCD_Load12:
;libs/LCD.mbas,56 :: 		next i
	LDD        R16, Y+0
	CPI        R16, 7
	BRNE       L__LCD_Load41
	JMP        L__LCD_Load11
L__LCD_Load41:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__LCD_Load8
L__LCD_Load11:
;libs/LCD.mbas,57 :: 		next dchar
	LDD        R16, Y+1
	CPI        R16, 4
	BRNE       L__LCD_Load42
	JMP        L__LCD_Load6
L__LCD_Load42:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__LCD_Load3
L__LCD_Load6:
;libs/LCD.mbas,58 :: 		end sub
L_end_LCD_Load:
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _LCD_Load

_CustomChar:

;libs/LCD.mbas,61 :: 		dim i as byte
;libs/LCD.mbas,62 :: 		Lcd_Cmd(120)
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 120
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
	POP        R2
	POP        R3
;libs/LCD.mbas,63 :: 		for i = 0 to 7
; i start address is: 18 (R18)
	LDI        R18, 0
; i end address is: 18 (R18)
L__CustomChar30:
;libs/LCD.mbas,64 :: 		Lcd_Chr_CP(character[i])
; i start address is: 18 (R18)
	LDI        R16, #lo_addr(_character+0)
	LDI        R17, hi_addr(_character+0)
	MOV        R30, R18
	LDI        R31, 0
	ADD        R30, R16
	ADC        R31, R17
	LPM        R16, Z
	PUSH       R18
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	POP        R2
	POP        R3
	POP        R18
;libs/LCD.mbas,65 :: 		next i
	CPI        R18, 7
	BRNE       L__CustomChar44
	JMP        L__CustomChar33
L__CustomChar44:
	MOV        R16, R18
	SUBI       R16, 255
	MOV        R18, R16
; i end address is: 18 (R18)
	JMP        L__CustomChar30
L__CustomChar33:
;libs/LCD.mbas,66 :: 		Lcd_Cmd(_LCD_RETURN_HOME)
	PUSH       R3
	PUSH       R2
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
	POP        R2
	POP        R3
;libs/LCD.mbas,67 :: 		Lcd_Chr(pos_row, pos_char, 7)
	PUSH       R3
	PUSH       R2
	LDI        R27, 7
	MOV        R4, R27
	CALL       _Lcd_Chr+0
	POP        R2
	POP        R3
;libs/LCD.mbas,68 :: 		end sub
L_end_CustomChar:
	POP        R4
	RET
; end of _CustomChar

_libs/LCD_?main:

;libs/LCD.mbas,71 :: 		end.
L_end_libs/LCD_?main:
	RET
; end of _libs/LCD_?main
