
libs/EEprom_Atmega32_Write_EEprom:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,52 :: 		error as byte
;libs/EEprom_Atmega32.mbas,54 :: 		hi_=hi(address)
	PUSH       R2
	PUSH       R3
	STD        Y+0, R3
;libs/EEprom_Atmega32.mbas,55 :: 		lo_=lo(address)
	STD        Y+1, R2
;libs/EEprom_Atmega32.mbas,56 :: 		Soft_I2C_Start()                         ' issue start signal
	PUSH       R4
	CALL       _Soft_I2C_Start+0
;libs/EEprom_Atmega32.mbas,57 :: 		Soft_I2C_Write(write_address_bus)                 ' address 160
	LDI        R27, 160
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,58 :: 		Soft_I2C_Write(hi_)                        ' start from word at address (REG0)
	LDD        R2, Y+0
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,59 :: 		Soft_I2C_Write(lo_)                     ' write $80 to REG0. (pause counter + 0 sec)   ?? ??????? ????? ????? ?????
	LDD        R2, Y+1
	CALL       _Soft_I2C_Write+0
	POP        R4
;libs/EEprom_Atmega32.mbas,61 :: 		error=Soft_I2C_Write(data1)                ' write 0 to minutes word to (REG1)
	MOV        R2, R4
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,71 :: 		Soft_I2C_Stop()                          ' issue stop signal
	CALL       _Soft_I2C_Stop+0
;libs/EEprom_Atmega32.mbas,72 :: 		delay_ms(15)
	LDI        R18, 2
	LDI        R17, 56
	LDI        R16, 174
L_libs/EEprom_Atmega32_Write_EEprom1:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_Write_EEprom1
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_Write_EEprom1
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_Write_EEprom1
;libs/EEprom_Atmega32.mbas,73 :: 		end sub
L_end_Write_EEprom:
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/EEprom_Atmega32_Write_EEprom

libs/EEprom_Atmega32_Read_EEprom:

;libs/EEprom_Atmega32.mbas,80 :: 		dim  device_address as char
;libs/EEprom_Atmega32.mbas,82 :: 		Soft_I2C_Start()                    ' Issue start signal
	PUSH       R2
	PUSH       R3
	PUSH       R3
	PUSH       R2
	CALL       _Soft_I2C_Start+0
;libs/EEprom_Atmega32.mbas,83 :: 		Soft_I2C_Write(write_address_bus)            ' Address DS1307, see 160 datasheet
	LDI        R27, 160
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
	POP        R2
	POP        R3
;libs/EEprom_Atmega32.mbas,86 :: 		lo_=lo(address_1)
; Lo_ start address is: 16 (R16)
	MOV        R16, R2
;libs/EEprom_Atmega32.mbas,87 :: 		Soft_I2C_Write(hi_)                   ' Start from address 0
	PUSH       R16
	MOV        R2, R3
	CALL       _Soft_I2C_Write+0
	POP        R16
;libs/EEprom_Atmega32.mbas,88 :: 		Soft_I2C_Write(lo_)                   ' Start from address 0
	MOV        R2, R16
; Lo_ end address is: 16 (R16)
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,89 :: 		Soft_I2C_Start()                    ' Issue repeated start signal
	CALL       _Soft_I2C_Start+0
;libs/EEprom_Atmega32.mbas,90 :: 		Soft_I2C_Write(read_address_bus)        ' Address 161 for reading R/W=1
	LDI        R27, 161
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,92 :: 		EEprom_data_read = Soft_I2C_Read(0)      ' Read seconds byte
	CLR        R2
	CLR        R3
	CALL       _Soft_I2C_Read+0
	STS        _EEprom_data_read+0, R16
;libs/EEprom_Atmega32.mbas,95 :: 		Soft_I2C_Stop()   ' Issue stop signal
	CALL       _Soft_I2C_Stop+0
;libs/EEprom_Atmega32.mbas,96 :: 		delay_ms(15)
	LDI        R18, 2
	LDI        R17, 56
	LDI        R16, 174
L_libs/EEprom_Atmega32_Read_EEprom4:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_Read_EEprom4
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_Read_EEprom4
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_Read_EEprom4
;libs/EEprom_Atmega32.mbas,97 :: 		end sub
L_end_Read_EEprom:
	POP        R3
	POP        R2
	RET
; end of libs/EEprom_Atmega32_Read_EEprom

libs/EEprom_Atmega32_eeprom_call_back:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,100 :: 		sub procedure eeprom_call_back()
;libs/EEprom_Atmega32.mbas,101 :: 		counter=0
	PUSH       R2
	PUSH       R3
	LDI        R27, 0
	STS        _counter+0, R27
	STS        _counter+1, R27
;libs/EEprom_Atmega32.mbas,103 :: 		for chanel =1 to Choice_number_sym
	LDI        R27, 1
	STS        _chanel+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back8:
;libs/EEprom_Atmega32.mbas,104 :: 		for Heater_motor_index =1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back13:
;libs/EEprom_Atmega32.mbas,105 :: 		for Pwm_chanel_main =1 to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back18:
;libs/EEprom_Atmega32.mbas,106 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]=EEPROM_read(0x01 + counter)
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R17, Y+0
	LDD        R18, Y+1
	MOV        R30, R17
	MOV        R31, R18
	ST         Z, R16
;libs/EEprom_Atmega32.mbas,107 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=EEPROM_read(0x02 + counter)
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R17, Y+0
	LDD        R18, Y+1
	MOV        R30, R17
	MOV        R31, R18
	ST         Z, R16
;libs/EEprom_Atmega32.mbas,108 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=EEPROM_read(0x03 + counter)
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	SUBI       R16, 254
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 253
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R17, Y+0
	LDD        R18, Y+1
	MOV        R30, R17
	MOV        R31, R18
	ST         Z, R16
;libs/EEprom_Atmega32.mbas,109 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]=EEPROM_read(0x04 + counter)
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	SUBI       R16, 253
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R17, Y+0
	LDD        R18, Y+1
	MOV        R30, R17
	MOV        R31, R18
	ST         Z, R16
;libs/EEprom_Atmega32.mbas,110 :: 		counter=counter+4
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
;libs/EEprom_Atmega32.mbas,111 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back75
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back21
L_libs/EEprom_Atmega32_eeprom_call_back75:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back18
L_libs/EEprom_Atmega32_eeprom_call_back21:
;libs/EEprom_Atmega32.mbas,112 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back76
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back16
L_libs/EEprom_Atmega32_eeprom_call_back76:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back13
L_libs/EEprom_Atmega32_eeprom_call_back16:
;libs/EEprom_Atmega32.mbas,113 :: 		next Heater_motor_index
	LDS        R16, _chanel+0
	CPI        R16, 3
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back77
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back11
L_libs/EEprom_Atmega32_eeprom_call_back77:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back8
L_libs/EEprom_Atmega32_eeprom_call_back11:
;libs/EEprom_Atmega32.mbas,114 :: 		end sub
L_end_eeprom_call_back:
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/EEprom_Atmega32_eeprom_call_back

_eeprom_save:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,117 :: 		sub procedure eeprom_save()
;libs/EEprom_Atmega32.mbas,118 :: 		counter=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 0
	STS        _counter+0, R27
	STS        _counter+1, R27
;libs/EEprom_Atmega32.mbas,120 :: 		for chanel =1 to 7
	LDI        R27, 1
	STS        _chanel+0, R27
L__eeprom_save24:
;libs/EEprom_Atmega32.mbas,121 :: 		for Heater_motor_index =1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L__eeprom_save29:
;libs/EEprom_Atmega32.mbas,122 :: 		for Pwm_chanel_main =1 to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__eeprom_save34:
;libs/EEprom_Atmega32.mbas,123 :: 		EEPROM_Write(0x01 + counter,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0])
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	LD         R18, Z
	LDD        R16, Y+2
	LDD        R17, Y+3
	MOV        R4, R18
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;libs/EEprom_Atmega32.mbas,124 :: 		EEPROM_Write(0x02 + counter,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1])
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 254
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	LD         R18, Z
	LDD        R16, Y+2
	LDD        R17, Y+3
	MOV        R4, R18
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;libs/EEprom_Atmega32.mbas,125 :: 		EEPROM_Write(0x03 + counter,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2])
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 253
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	LD         R18, Z
	LDD        R16, Y+2
	LDD        R17, Y+3
	MOV        R4, R18
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;libs/EEprom_Atmega32.mbas,126 :: 		EEPROM_Write(0x04 + counter,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3])
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 252
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
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
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	LD         R18, Z
	LDD        R16, Y+2
	LDD        R17, Y+3
	MOV        R4, R18
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;libs/EEprom_Atmega32.mbas,127 :: 		counter=counter+4
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
;libs/EEprom_Atmega32.mbas,128 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L__eeprom_save79
	JMP        L__eeprom_save37
L__eeprom_save79:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__eeprom_save34
L__eeprom_save37:
;libs/EEprom_Atmega32.mbas,129 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L__eeprom_save80
	JMP        L__eeprom_save32
L__eeprom_save80:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L__eeprom_save29
L__eeprom_save32:
;libs/EEprom_Atmega32.mbas,130 :: 		next Heater_motor_index
	LDS        R16, _chanel+0
	CPI        R16, 7
	BRNE       L__eeprom_save81
	JMP        L__eeprom_save27
L__eeprom_save81:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__eeprom_save24
L__eeprom_save27:
;libs/EEprom_Atmega32.mbas,131 :: 		end sub
L_end_eeprom_save:
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_save

libs/EEprom_Atmega32_eeprom:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 23
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,136 :: 		txt_sub as string[4]
;libs/EEprom_Atmega32.mbas,137 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,140 :: 		ByteToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,142 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,143 :: 		Delay_ms(1000)
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L_libs/EEprom_Atmega32_eeprom39:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_eeprom39
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_eeprom39
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_eeprom39
	NOP
	NOP
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,144 :: 		if  (EEPROM_Read(0x00)=122)   then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	CPI        R16, 122
	BREQ       L_libs/EEprom_Atmega32_eeprom83
	JMP        L_libs/EEprom_Atmega32_eeprom42
L_libs/EEprom_Atmega32_eeprom83:
;libs/EEprom_Atmega32.mbas,145 :: 		Lcd_Out(1,1,"EEprom  writed befor" )
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 98
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,146 :: 		ByteToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,148 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L_libs/EEprom_Atmega32_eeprom43
;libs/EEprom_Atmega32.mbas,149 :: 		else
L_libs/EEprom_Atmega32_eeprom42:
;libs/EEprom_Atmega32.mbas,152 :: 		Lcd_Out(1,1,"not writed" )
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,154 :: 		end if
L_libs/EEprom_Atmega32_eeprom43:
;libs/EEprom_Atmega32.mbas,155 :: 		Delay_ms(1000)
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L_libs/EEprom_Atmega32_eeprom44:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_eeprom44
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_eeprom44
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_eeprom44
	NOP
	NOP
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,159 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
L_libs/EEprom_Atmega32_eeprom47:
;libs/EEprom_Atmega32.mbas,160 :: 		for counter = 1 to 4                          ' Fill data buffer
	LDI        R27, 1
	STD        Y+0, R27
L_libs/EEprom_Atmega32_eeprom52:
;libs/EEprom_Atmega32.mbas,161 :: 		EEPROM_Write(0x00 + counter,tt )        ' Write data to address 0x100+counter
	LDD        R16, Y+0
	LDI        R17, 0
	LDD        R4, Y+1
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;libs/EEprom_Atmega32.mbas,162 :: 		next counter
	LDD        R16, Y+0
	CPI        R16, 4
	BRNE       L_libs/EEprom_Atmega32_eeprom84
	JMP        L_libs/EEprom_Atmega32_eeprom55
L_libs/EEprom_Atmega32_eeprom84:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom52
L_libs/EEprom_Atmega32_eeprom55:
;libs/EEprom_Atmega32.mbas,163 :: 		Delay_ms(1000)
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L_libs/EEprom_Atmega32_eeprom56:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_eeprom56
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_eeprom56
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_eeprom56
	NOP
	NOP
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,166 :: 		if (EEPROM_Read(0x00) ) then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	TST        R16
	BRNE       L_libs/EEprom_Atmega32_eeprom85
	JMP        L_libs/EEprom_Atmega32_eeprom59
L_libs/EEprom_Atmega32_eeprom85:
;libs/EEprom_Atmega32.mbas,168 :: 		for counter = 1 to  4
	LDI        R27, 1
	STD        Y+0, R27
L_libs/EEprom_Atmega32_eeprom62:
;libs/EEprom_Atmega32.mbas,170 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,171 :: 		ByteToStr(EEPROM_Read(0x100+counter), txt)
	LDD        R16, Y+0
	LDI        R17, 0
	SUBI       R16, 0
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,172 :: 		Lcd_Out(1,1,"EEprom" )
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,173 :: 		Lcd_Out(2,1,txt )                 ' Write text in first row
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,174 :: 		next counter
	LDD        R16, Y+0
	CPI        R16, 4
	BRNE       L_libs/EEprom_Atmega32_eeprom86
	JMP        L_libs/EEprom_Atmega32_eeprom65
L_libs/EEprom_Atmega32_eeprom86:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom62
L_libs/EEprom_Atmega32_eeprom65:
L_libs/EEprom_Atmega32_eeprom59:
;libs/EEprom_Atmega32.mbas,176 :: 		next  chanel
	LDS        R16, _chanel+0
	CPI        R16, 4
	BRNE       L_libs/EEprom_Atmega32_eeprom87
	JMP        L_libs/EEprom_Atmega32_eeprom50
L_libs/EEprom_Atmega32_eeprom87:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom47
L_libs/EEprom_Atmega32_eeprom50:
;libs/EEprom_Atmega32.mbas,178 :: 		end sub
L_end_eeprom:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 22
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/EEprom_Atmega32_eeprom

_int_eeprom_ini:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 21
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,184 :: 		sub procedure int_eeprom_ini()     ''internal eeprm of avr
;libs/EEprom_Atmega32.mbas,186 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,191 :: 		if  (EEPROM_Read(0x00)=12)   then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	CPI        R16, 12
	BREQ       L__int_eeprom_ini89
	JMP        L__int_eeprom_ini68
L__int_eeprom_ini89:
;libs/EEprom_Atmega32.mbas,192 :: 		Lcd_0() Lcd_Out(1,1,"Reading from " ) Lcd_Out(2,1,"EEprom ..." )
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
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
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
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
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
;libs/EEprom_Atmega32.mbas,193 :: 		eeprom_call_back()
	CALL       libs/EEprom_Atmega32_eeprom_call_back+0
;libs/EEprom_Atmega32.mbas,196 :: 		Lcd_Out(1,1,"EEprom  writed befor" )
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 98
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
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
;libs/EEprom_Atmega32.mbas,197 :: 		ByteToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,199 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__int_eeprom_ini69
;libs/EEprom_Atmega32.mbas,200 :: 		else
L__int_eeprom_ini68:
;libs/EEprom_Atmega32.mbas,201 :: 		EEPROM_Write(0x00 ,12 )
	LDI        R27, 12
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Write+0
;libs/EEprom_Atmega32.mbas,204 :: 		Lcd_0() Lcd_Out(1,1,"Writing to  " ) Lcd_Out(2,1,"EEprom ..." )
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 114
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
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
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
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
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
;libs/EEprom_Atmega32.mbas,205 :: 		hours=0x23  minutes=0x59   seconds=0x30 day= 0x11 week=2   month=0x12  year=0x17
	LDI        R27, 35
	STS        _hours+0, R27
	LDI        R27, 89
	STS        _minutes+0, R27
	LDI        R27, 48
	STS        _seconds+0, R27
	LDI        R27, 17
	STS        _day+0, R27
	LDI        R27, 2
	STS        _week+0, R27
	LDI        R27, 18
	STS        _month+0, R27
	LDI        R27, 23
	STS        _year+0, R27
;libs/EEprom_Atmega32.mbas,208 :: 		Write_Time(hours, minutes, seconds, 0x31, 0x01,   0x12,year)'
	LDI        R27, 23
	MOV        R8, R27
	LDI        R27, 18
	MOV        R7, R27
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 49
	MOV        R5, R27
	LDI        R27, 48
	MOV        R4, R27
	LDI        R27, 89
	MOV        R3, R27
	LDI        R27, 35
	MOV        R2, R27
	CALL       _Write_Time+0
;libs/EEprom_Atmega32.mbas,210 :: 		On_mSec_initial_Heater (1,1,0,100) 'On_mSec_initial_Heater(dim en,mint,sec,prc as byte)'On_mSec_initial_Heater[chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0]
	LDI        R27, 100
	MOV        R5, R27
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_heater+0
;libs/EEprom_Atmega32.mbas,211 :: 		On_mSec_initial_Motor (1,0,4,100)
	LDI        R27, 100
	MOV        R5, R27
	LDI        R27, 4
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_Motor+0
;libs/EEprom_Atmega32.mbas,212 :: 		eeprom_save()
	CALL       _eeprom_save+0
;libs/EEprom_Atmega32.mbas,214 :: 		Lcd_Out(1,1,"not writed" )
	MOVW       R30, R28
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
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
;libs/EEprom_Atmega32.mbas,215 :: 		Delay_mS(100)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__int_eeprom_ini70:
	DEC        R16
	BRNE       L__int_eeprom_ini70
	DEC        R17
	BRNE       L__int_eeprom_ini70
	DEC        R18
	BRNE       L__int_eeprom_ini70
	NOP
;libs/EEprom_Atmega32.mbas,217 :: 		end if
L__int_eeprom_ini69:
;libs/EEprom_Atmega32.mbas,219 :: 		end sub
L_end_int_eeprom_ini:
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 20
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _int_eeprom_ini

_libs/EEprom_Atmega32_?main:

;libs/EEprom_Atmega32.mbas,456 :: 		end.
L_end_libs/EEprom_Atmega32_?main:
	RET
; end of _libs/EEprom_Atmega32_?main
