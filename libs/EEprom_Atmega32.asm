
libs/EEprom_Atmega32_Write_EEprom:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,48 :: 		error as byte
;libs/EEprom_Atmega32.mbas,50 :: 		hi_=hi(address)
	PUSH       R2
	PUSH       R3
	STD        Y+0, R3
;libs/EEprom_Atmega32.mbas,51 :: 		lo_=lo(address)
	STD        Y+1, R2
;libs/EEprom_Atmega32.mbas,52 :: 		Soft_I2C_Start()                         ' issue start signal
	PUSH       R4
	CALL       _Soft_I2C_Start+0
;libs/EEprom_Atmega32.mbas,53 :: 		Soft_I2C_Write(write_address_bus)                 ' address 160
	LDI        R27, 160
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,54 :: 		Soft_I2C_Write(hi_)                        ' start from word at address (REG0)
	LDD        R2, Y+0
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,55 :: 		Soft_I2C_Write(lo_)                     ' write $80 to REG0. (pause counter + 0 sec)   ?? ??????? ????? ????? ?????
	LDD        R2, Y+1
	CALL       _Soft_I2C_Write+0
	POP        R4
;libs/EEprom_Atmega32.mbas,57 :: 		error=Soft_I2C_Write(data1)                ' write 0 to minutes word to (REG1)
	MOV        R2, R4
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,67 :: 		Soft_I2C_Stop()                          ' issue stop signal
	CALL       _Soft_I2C_Stop+0
;libs/EEprom_Atmega32.mbas,68 :: 		delay_ms(15)
	LDI        R17, 156
	LDI        R16, 215
L_libs/EEprom_Atmega32_Write_EEprom1:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_Write_EEprom1
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_Write_EEprom1
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,69 :: 		end sub
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

;libs/EEprom_Atmega32.mbas,76 :: 		dim  device_address as char
;libs/EEprom_Atmega32.mbas,78 :: 		Soft_I2C_Start()                    ' Issue start signal
	PUSH       R2
	PUSH       R3
	PUSH       R3
	PUSH       R2
	CALL       _Soft_I2C_Start+0
;libs/EEprom_Atmega32.mbas,79 :: 		Soft_I2C_Write(write_address_bus)            ' Address DS1307, see 160 datasheet
	LDI        R27, 160
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
	POP        R2
	POP        R3
;libs/EEprom_Atmega32.mbas,82 :: 		lo_=lo(address_1)
; Lo_ start address is: 16 (R16)
	MOV        R16, R2
;libs/EEprom_Atmega32.mbas,83 :: 		Soft_I2C_Write(hi_)                   ' Start from address 0
	PUSH       R16
	MOV        R2, R3
	CALL       _Soft_I2C_Write+0
	POP        R16
;libs/EEprom_Atmega32.mbas,84 :: 		Soft_I2C_Write(lo_)                   ' Start from address 0
	MOV        R2, R16
; Lo_ end address is: 16 (R16)
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,85 :: 		Soft_I2C_Start()                    ' Issue repeated start signal
	CALL       _Soft_I2C_Start+0
;libs/EEprom_Atmega32.mbas,86 :: 		Soft_I2C_Write(read_address_bus)        ' Address 161 for reading R/W=1
	LDI        R27, 161
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;libs/EEprom_Atmega32.mbas,88 :: 		EEprom_data_read = Soft_I2C_Read(0)      ' Read seconds byte
	CLR        R2
	CLR        R3
	CALL       _Soft_I2C_Read+0
	STS        _EEprom_data_read+0, R16
;libs/EEprom_Atmega32.mbas,91 :: 		Soft_I2C_Stop()   ' Issue stop signal
	CALL       _Soft_I2C_Stop+0
;libs/EEprom_Atmega32.mbas,92 :: 		delay_ms(15)
	LDI        R17, 156
	LDI        R16, 215
L_libs/EEprom_Atmega32_Read_EEprom4:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_Read_EEprom4
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_Read_EEprom4
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,93 :: 		end sub
L_end_Read_EEprom:
	POP        R3
	POP        R2
	RET
; end of libs/EEprom_Atmega32_Read_EEprom

libs/EEprom_Atmega32_eeprom_call_back_ext:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,97 :: 		dim on_off22 as integer
;libs/EEprom_Atmega32.mbas,102 :: 		counter_ex=0
	PUSH       R2
	PUSH       R3
	LDI        R27, 0
	STS        _counter_ex+0, R27
	STS        _counter_ex+1, R27
;libs/EEprom_Atmega32.mbas,104 :: 		for chanel =1 to 7
	LDI        R27, 1
	STS        _chanel+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back_ext8:
;libs/EEprom_Atmega32.mbas,105 :: 		for Heater_motor_index =1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back_ext13:
;libs/EEprom_Atmega32.mbas,106 :: 		for Pwm_chanel_main =1 to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back_ext18:
;libs/EEprom_Atmega32.mbas,108 :: 		Read_EEprom(1+counter_ex)
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       libs/EEprom_Atmega32_Read_EEprom+0
;libs/EEprom_Atmega32.mbas,109 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]=  EEprom_data_read
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
	LDS        R16, _EEprom_data_read+0
	ST         Z, R16
;libs/EEprom_Atmega32.mbas,110 :: 		Read_EEprom(2 + counter_ex)
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       libs/EEprom_Atmega32_Read_EEprom+0
;libs/EEprom_Atmega32.mbas,111 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=  EEprom_data_read
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
	LDS        R16, _EEprom_data_read+0
	ST         Z, R16
;libs/EEprom_Atmega32.mbas,112 :: 		Read_EEprom(3 + counter_ex)
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 253
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       libs/EEprom_Atmega32_Read_EEprom+0
;libs/EEprom_Atmega32.mbas,113 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=  EEprom_data_read
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
	LDS        R16, _EEprom_data_read+0
	ST         Z, R16
;libs/EEprom_Atmega32.mbas,114 :: 		Read_EEprom(4 + counter_ex)
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       libs/EEprom_Atmega32_Read_EEprom+0
;libs/EEprom_Atmega32.mbas,115 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]=  EEprom_data_read
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
	LDS        R16, _EEprom_data_read+0
	ST         Z, R16
;libs/EEprom_Atmega32.mbas,117 :: 		counter_ex=counter_ex+4
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _counter_ex+0, R16
	STS        _counter_ex+1, R17
;libs/EEprom_Atmega32.mbas,118 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back_ext164
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back_ext21
L_libs/EEprom_Atmega32_eeprom_call_back_ext164:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back_ext18
L_libs/EEprom_Atmega32_eeprom_call_back_ext21:
;libs/EEprom_Atmega32.mbas,119 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back_ext165
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back_ext16
L_libs/EEprom_Atmega32_eeprom_call_back_ext165:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back_ext13
L_libs/EEprom_Atmega32_eeprom_call_back_ext16:
;libs/EEprom_Atmega32.mbas,120 :: 		next Heater_motor_index
	LDS        R16, _chanel+0
	CPI        R16, 7
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back_ext166
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back_ext11
L_libs/EEprom_Atmega32_eeprom_call_back_ext166:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back_ext8
L_libs/EEprom_Atmega32_eeprom_call_back_ext11:
;libs/EEprom_Atmega32.mbas,125 :: 		end sub
L_end_eeprom_call_back_ext:
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of libs/EEprom_Atmega32_eeprom_call_back_ext

_eeprom_save_ext:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,129 :: 		dim on_off22 as byte
;libs/EEprom_Atmega32.mbas,134 :: 		counter_ex=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 0
	STS        _counter_ex+0, R27
	STS        _counter_ex+1, R27
;libs/EEprom_Atmega32.mbas,136 :: 		for chanel =1 to 7
	LDI        R27, 1
	STS        _chanel+0, R27
L__eeprom_save_ext24:
;libs/EEprom_Atmega32.mbas,137 :: 		for Heater_motor_index =1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L__eeprom_save_ext29:
;libs/EEprom_Atmega32.mbas,138 :: 		for Pwm_chanel_main =1 to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__eeprom_save_ext34:
;libs/EEprom_Atmega32.mbas,139 :: 		Write_EEprom(1 + counter_ex,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0] )
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
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
	CALL       libs/EEprom_Atmega32_Write_EEprom+0
;libs/EEprom_Atmega32.mbas,140 :: 		Write_EEprom(1 + counter_ex+1,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1] )
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 255
	SBCI       R17, 255
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
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R18, Z
	LDD        R16, Y+2
	LDD        R17, Y+3
	MOV        R4, R18
	MOVW       R2, R16
	CALL       libs/EEprom_Atmega32_Write_EEprom+0
;libs/EEprom_Atmega32.mbas,141 :: 		Write_EEprom(1 + counter_ex+2,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2] )
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 255
	SBCI       R17, 255
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
	ADIW       R30, 2
	LD         R18, Z
	LDD        R16, Y+2
	LDD        R17, Y+3
	MOV        R4, R18
	MOVW       R2, R16
	CALL       libs/EEprom_Atmega32_Write_EEprom+0
;libs/EEprom_Atmega32.mbas,142 :: 		Write_EEprom(1 + counter_ex+3,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3] )
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 255
	SBCI       R17, 255
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
	ADIW       R30, 3
	LD         R18, Z
	LDD        R16, Y+2
	LDD        R17, Y+3
	MOV        R4, R18
	MOVW       R2, R16
	CALL       libs/EEprom_Atmega32_Write_EEprom+0
;libs/EEprom_Atmega32.mbas,143 :: 		counter_ex=counter_ex+4
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _counter_ex+0, R16
	STS        _counter_ex+1, R17
;libs/EEprom_Atmega32.mbas,144 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L__eeprom_save_ext168
	JMP        L__eeprom_save_ext37
L__eeprom_save_ext168:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__eeprom_save_ext34
L__eeprom_save_ext37:
;libs/EEprom_Atmega32.mbas,145 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L__eeprom_save_ext169
	JMP        L__eeprom_save_ext32
L__eeprom_save_ext169:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L__eeprom_save_ext29
L__eeprom_save_ext32:
;libs/EEprom_Atmega32.mbas,146 :: 		next Heater_motor_index
	LDS        R16, _chanel+0
	CPI        R16, 7
	BRNE       L__eeprom_save_ext170
	JMP        L__eeprom_save_ext27
L__eeprom_save_ext170:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__eeprom_save_ext24
L__eeprom_save_ext27:
;libs/EEprom_Atmega32.mbas,151 :: 		end sub
L_end_eeprom_save_ext:
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_save_ext

libs/EEprom_Atmega32_eeprom_call_back:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,155 :: 		sub procedure eeprom_call_back()
;libs/EEprom_Atmega32.mbas,156 :: 		counter=0
	PUSH       R2
	PUSH       R3
	LDI        R27, 0
	STS        _counter+0, R27
	STS        _counter+1, R27
;libs/EEprom_Atmega32.mbas,158 :: 		for chanel =1 to 7
	LDI        R27, 1
	STS        _chanel+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back40:
;libs/EEprom_Atmega32.mbas,159 :: 		for Heater_motor_index =1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back45:
;libs/EEprom_Atmega32.mbas,160 :: 		for Pwm_chanel_main =1 to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L_libs/EEprom_Atmega32_eeprom_call_back50:
;libs/EEprom_Atmega32.mbas,161 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0]=EEPROM_read(0x01 + counter)
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
;libs/EEprom_Atmega32.mbas,162 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1]=EEPROM_read(0x02 + counter)
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
;libs/EEprom_Atmega32.mbas,163 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2]=EEPROM_read(0x03 + counter)
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
;libs/EEprom_Atmega32.mbas,164 :: 		Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3]=EEPROM_read(0x04 + counter)
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
;libs/EEprom_Atmega32.mbas,165 :: 		counter=counter+4
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
;libs/EEprom_Atmega32.mbas,166 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back172
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back53
L_libs/EEprom_Atmega32_eeprom_call_back172:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back50
L_libs/EEprom_Atmega32_eeprom_call_back53:
;libs/EEprom_Atmega32.mbas,167 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back173
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back48
L_libs/EEprom_Atmega32_eeprom_call_back173:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back45
L_libs/EEprom_Atmega32_eeprom_call_back48:
;libs/EEprom_Atmega32.mbas,168 :: 		next Heater_motor_index
	LDS        R16, _chanel+0
	CPI        R16, 7
	BRNE       L_libs/EEprom_Atmega32_eeprom_call_back174
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back43
L_libs/EEprom_Atmega32_eeprom_call_back174:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom_call_back40
L_libs/EEprom_Atmega32_eeprom_call_back43:
;libs/EEprom_Atmega32.mbas,169 :: 		end sub
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

;libs/EEprom_Atmega32.mbas,172 :: 		sub procedure eeprom_save()
;libs/EEprom_Atmega32.mbas,173 :: 		counter=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 0
	STS        _counter+0, R27
	STS        _counter+1, R27
;libs/EEprom_Atmega32.mbas,175 :: 		for chanel =1 to 7
	LDI        R27, 1
	STS        _chanel+0, R27
L__eeprom_save56:
;libs/EEprom_Atmega32.mbas,176 :: 		for Heater_motor_index =1 to 2
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
L__eeprom_save61:
;libs/EEprom_Atmega32.mbas,177 :: 		for Pwm_chanel_main =1 to 3
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
L__eeprom_save66:
;libs/EEprom_Atmega32.mbas,178 :: 		EEPROM_Write(0x01 + counter,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0])
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
;libs/EEprom_Atmega32.mbas,179 :: 		EEPROM_Write(0x02 + counter,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][1])
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
;libs/EEprom_Atmega32.mbas,180 :: 		EEPROM_Write(0x03 + counter,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][2])
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
;libs/EEprom_Atmega32.mbas,181 :: 		EEPROM_Write(0x04 + counter,Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3])
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
;libs/EEprom_Atmega32.mbas,182 :: 		counter=counter+4
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
;libs/EEprom_Atmega32.mbas,183 :: 		next Pwm_chanel_main
	LDS        R16, _Pwm_chanel_main+0
	CPI        R16, 3
	BRNE       L__eeprom_save176
	JMP        L__eeprom_save69
L__eeprom_save176:
	LDS        R16, _Pwm_chanel_main+0
	SUBI       R16, 255
	STS        _Pwm_chanel_main+0, R16
	JMP        L__eeprom_save66
L__eeprom_save69:
;libs/EEprom_Atmega32.mbas,184 :: 		next Heater_motor_index
	LDS        R16, _Heater_motor_index+0
	CPI        R16, 2
	BRNE       L__eeprom_save177
	JMP        L__eeprom_save64
L__eeprom_save177:
	LDS        R16, _Heater_motor_index+0
	SUBI       R16, 255
	STS        _Heater_motor_index+0, R16
	JMP        L__eeprom_save61
L__eeprom_save64:
;libs/EEprom_Atmega32.mbas,185 :: 		next Heater_motor_index
	LDS        R16, _chanel+0
	CPI        R16, 7
	BRNE       L__eeprom_save178
	JMP        L__eeprom_save59
L__eeprom_save178:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L__eeprom_save56
L__eeprom_save59:
;libs/EEprom_Atmega32.mbas,186 :: 		end sub
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

;libs/EEprom_Atmega32.mbas,191 :: 		txt_sub as string[4]
;libs/EEprom_Atmega32.mbas,192 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,195 :: 		ByteToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,197 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,198 :: 		Delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_libs/EEprom_Atmega32_eeprom71:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_eeprom71
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_eeprom71
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_eeprom71
;libs/EEprom_Atmega32.mbas,199 :: 		if  (EEPROM_Read(0x00)=122)   then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	CPI        R16, 122
	BREQ       L_libs/EEprom_Atmega32_eeprom180
	JMP        L_libs/EEprom_Atmega32_eeprom74
L_libs/EEprom_Atmega32_eeprom180:
;libs/EEprom_Atmega32.mbas,200 :: 		Lcd_Out(1,1,"EEprom  writed befor" )
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
;libs/EEprom_Atmega32.mbas,201 :: 		ByteToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,203 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L_libs/EEprom_Atmega32_eeprom75
;libs/EEprom_Atmega32.mbas,204 :: 		else
L_libs/EEprom_Atmega32_eeprom74:
;libs/EEprom_Atmega32.mbas,207 :: 		Lcd_Out(1,1,"not writed" )
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
;libs/EEprom_Atmega32.mbas,209 :: 		end if
L_libs/EEprom_Atmega32_eeprom75:
;libs/EEprom_Atmega32.mbas,210 :: 		Delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_libs/EEprom_Atmega32_eeprom76:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_eeprom76
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_eeprom76
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_eeprom76
;libs/EEprom_Atmega32.mbas,214 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
L_libs/EEprom_Atmega32_eeprom79:
;libs/EEprom_Atmega32.mbas,215 :: 		for counter = 1 to 4                          ' Fill data buffer
	LDI        R27, 1
	STD        Y+0, R27
L_libs/EEprom_Atmega32_eeprom84:
;libs/EEprom_Atmega32.mbas,216 :: 		EEPROM_Write(0x00 + counter,tt )        ' Write data to address 0x100+counter
	LDD        R16, Y+0
	LDI        R17, 0
	LDD        R4, Y+1
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;libs/EEprom_Atmega32.mbas,217 :: 		next counter
	LDD        R16, Y+0
	CPI        R16, 4
	BRNE       L_libs/EEprom_Atmega32_eeprom181
	JMP        L_libs/EEprom_Atmega32_eeprom87
L_libs/EEprom_Atmega32_eeprom181:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom84
L_libs/EEprom_Atmega32_eeprom87:
;libs/EEprom_Atmega32.mbas,218 :: 		Delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_libs/EEprom_Atmega32_eeprom88:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_eeprom88
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_eeprom88
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_eeprom88
;libs/EEprom_Atmega32.mbas,221 :: 		if (EEPROM_Read(0x00) ) then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	TST        R16
	BRNE       L_libs/EEprom_Atmega32_eeprom182
	JMP        L_libs/EEprom_Atmega32_eeprom91
L_libs/EEprom_Atmega32_eeprom182:
;libs/EEprom_Atmega32.mbas,223 :: 		for counter = 1 to  4
	LDI        R27, 1
	STD        Y+0, R27
L_libs/EEprom_Atmega32_eeprom94:
;libs/EEprom_Atmega32.mbas,225 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,226 :: 		ByteToStr(EEPROM_Read(0x100+counter), txt)
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
;libs/EEprom_Atmega32.mbas,227 :: 		Lcd_Out(1,1,"EEprom" )
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
;libs/EEprom_Atmega32.mbas,228 :: 		Lcd_Out(2,1,txt )                 ' Write text in first row
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,229 :: 		next counter
	LDD        R16, Y+0
	CPI        R16, 4
	BRNE       L_libs/EEprom_Atmega32_eeprom183
	JMP        L_libs/EEprom_Atmega32_eeprom97
L_libs/EEprom_Atmega32_eeprom183:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom94
L_libs/EEprom_Atmega32_eeprom97:
L_libs/EEprom_Atmega32_eeprom91:
;libs/EEprom_Atmega32.mbas,231 :: 		next  chanel
	LDS        R16, _chanel+0
	CPI        R16, 4
	BRNE       L_libs/EEprom_Atmega32_eeprom184
	JMP        L_libs/EEprom_Atmega32_eeprom82
L_libs/EEprom_Atmega32_eeprom184:
	LDS        R16, _chanel+0
	SUBI       R16, 255
	STS        _chanel+0, R16
	JMP        L_libs/EEprom_Atmega32_eeprom79
L_libs/EEprom_Atmega32_eeprom82:
;libs/EEprom_Atmega32.mbas,233 :: 		end sub
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

_ext_twi_eeprom_ini:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,238 :: 		sub procedure ext_twi_eeprom_ini()
;libs/EEprom_Atmega32.mbas,241 :: 		EEprom_data_read=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;libs/EEprom_Atmega32.mbas,242 :: 		Read_eeprom_ext_TWI(1)
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Read_eeprom_ext_TWI+0
;libs/EEprom_Atmega32.mbas,245 :: 		if  (EEprom_data_read=10)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 10
	BREQ       L__ext_twi_eeprom_ini186
	JMP        L__ext_twi_eeprom_ini100
L__ext_twi_eeprom_ini186:
;libs/EEprom_Atmega32.mbas,246 :: 		Lcd_0() Lcd_Out(1,1,"TWI EEPROM" ) Lcd_Out(2,1,"is working" )
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,247 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini102:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini102
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini102
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini102
	NOP
;libs/EEprom_Atmega32.mbas,248 :: 		ByteToStr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,249 :: 		Lcd_Out(1,1,"EEprommmmmmmmmm" )
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
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
;libs/EEprom_Atmega32.mbas,250 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__ext_twi_eeprom_ini101
;libs/EEprom_Atmega32.mbas,251 :: 		else
L__ext_twi_eeprom_ini100:
;libs/EEprom_Atmega32.mbas,252 :: 		Lcd_0() Lcd_Out(1,1,"TWI EEPROM" ) Lcd_Out(2,1,"is Not working")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,253 :: 		bytetostr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,254 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,255 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini104:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini104
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini104
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini104
	NOP
;libs/EEprom_Atmega32.mbas,256 :: 		Lcd_Out(1,1,"0 EEPROM is:" )Lcd_Out(2,1,txt )
	MOVW       R30, R28
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,257 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini106:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini106
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini106
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini106
	NOP
;libs/EEprom_Atmega32.mbas,258 :: 		end if
L__ext_twi_eeprom_ini101:
;libs/EEprom_Atmega32.mbas,259 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,261 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;libs/EEprom_Atmega32.mbas,262 :: 		Read_eeprom_ext_TWI(1)
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Read_eeprom_ext_TWI+0
;libs/EEprom_Atmega32.mbas,265 :: 		if  (EEprom_data_read =10)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 10
	BREQ       L__ext_twi_eeprom_ini187
	JMP        L__ext_twi_eeprom_ini109
L__ext_twi_eeprom_ini187:
;libs/EEprom_Atmega32.mbas,266 :: 		Lcd_Out(1,1,"ext EEp writed befor" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
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
;libs/EEprom_Atmega32.mbas,267 :: 		ByteToStr(EEprom_data_read, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,269 :: 		Lcd_Out(2,1,txt )   delay_ms(500)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini111:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini111
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini111
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini111
	NOP
;libs/EEprom_Atmega32.mbas,270 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,271 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,272 :: 		Lcd_Out(1,1,"Reading EEPROM " )
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
;libs/EEprom_Atmega32.mbas,273 :: 		Lcd_Out(2,1," ..." )
	MOVW       R30, R28
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
;libs/EEprom_Atmega32.mbas,274 :: 		eeprom_call_back_ext_twi()
	CALL       _eeprom_call_back_ext_twi+0
;libs/EEprom_Atmega32.mbas,283 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini113:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini113
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini113
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini113
	NOP
	JMP        L__ext_twi_eeprom_ini110
;libs/EEprom_Atmega32.mbas,286 :: 		else
L__ext_twi_eeprom_ini109:
;libs/EEprom_Atmega32.mbas,288 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,289 :: 		Lcd_Out(1,1,"ext not writed111111111" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
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
;libs/EEprom_Atmega32.mbas,290 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini115:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini115
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini115
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini115
	NOP
;libs/EEprom_Atmega32.mbas,291 :: 		On_mSec_initial_Heater (1,0,10,18)  '' On mode Heater initial (dim en,mint,sec,prc as integer)
	LDI        R27, 18
	MOV        R5, R27
	LDI        R27, 10
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_heater+0
;libs/EEprom_Atmega32.mbas,292 :: 		On_mSec_initial_Motor (1,0,10,18)    '''mode
	LDI        R27, 18
	MOV        R5, R27
	LDI        R27, 10
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_Motor+0
;libs/EEprom_Atmega32.mbas,294 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,295 :: 		Lcd_Out(1,1,"Wrting to EEPROM ..." )
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 114
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
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,297 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,298 :: 		Lcd_Out(1,1,"Wrting to EEPROM " ) Lcd_Out(2,1,"..." )
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 114
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
	LDI        R27, 46
	STD        Y+0, R27
	LDI        R27, 46
	STD        Y+1, R27
	LDI        R27, 46
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,301 :: 		write_eeprom_ext_TWI(1 ,10 )
	LDI        R27, 10
	MOV        R4, R27
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _write_eeprom_ext_TWI+0
;libs/EEprom_Atmega32.mbas,302 :: 		eeprom_save_ext_twi()
	CALL       _eeprom_save_ext_twi+0
;libs/EEprom_Atmega32.mbas,305 :: 		Lcd_Out(1,1,"writing ext eeprom" )
	MOVW       R30, R28
	LDI        R27, 119
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
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 101
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,306 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,307 :: 		Pwm_chanel_main=1   chanel=1        Heater_motor_index=1
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
;libs/EEprom_Atmega32.mbas,308 :: 		week=7
	LDI        R27, 7
	STS        _week+0, R27
;libs/EEprom_Atmega32.mbas,309 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],txt)
	LDI        R18, 0
	LDI        R19, 0
	LDI        R16, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R17, hi_addr(_Mot_heater_On_mSec+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,310 :: 		Lcd_Out(1,1,"on_a_0" )
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 48
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
;libs/EEprom_Atmega32.mbas,311 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,312 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini117:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini117
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini117
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini117
	NOP
;libs/EEprom_Atmega32.mbas,314 :: 		end if
L__ext_twi_eeprom_ini110:
;libs/EEprom_Atmega32.mbas,315 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini119:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini119
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini119
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini119
	NOP
;libs/EEprom_Atmega32.mbas,316 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,317 :: 		Pwm_chanel_main=1   chanel=1        Heater_motor_index=1
	LDI        R27, 1
	STS        _Pwm_chanel_main+0, R27
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 1
	STS        _Heater_motor_index+0, R27
;libs/EEprom_Atmega32.mbas,318 :: 		week=7
	LDI        R27, 7
	STS        _week+0, R27
;libs/EEprom_Atmega32.mbas,319 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][0],txt)
	LDI        R18, 0
	LDI        R19, 0
	LDI        R16, #lo_addr(_Mot_heater_On_mSec+0)
	LDI        R17, hi_addr(_Mot_heater_On_mSec+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,320 :: 		Lcd_Out(1,1,"on_a_0" )
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 48
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
;libs/EEprom_Atmega32.mbas,321 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,322 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini121:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini121
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini121
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini121
	NOP
;libs/EEprom_Atmega32.mbas,323 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,325 :: 		ByteToStr(Mot_heater_On_mSec [chanel-1][Heater_motor_index-1][Pwm_chanel_main-1][3],txt)
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
	STD        Y+24, R16
	STD        Y+25, R17
	LDI        R16, 12
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+24
	LDD        R19, Y+25
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,326 :: 		Lcd_Out(1,1,"precrntage" )
	MOVW       R30, R28
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 101
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
;libs/EEprom_Atmega32.mbas,327 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,328 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini123:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini123
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini123
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini123
	NOP
;libs/EEprom_Atmega32.mbas,329 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;libs/EEprom_Atmega32.mbas,330 :: 		Read_eeprom_ext_TWI(1)
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Read_eeprom_ext_TWI+0
;libs/EEprom_Atmega32.mbas,333 :: 		if  (EEprom_data_read=10)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 10
	BREQ       L__ext_twi_eeprom_ini188
	JMP        L__ext_twi_eeprom_ini126
L__ext_twi_eeprom_ini188:
;libs/EEprom_Atmega32.mbas,334 :: 		Lcd_0() Lcd_Out(1,1,"TWI EEPROM" ) Lcd_Out(2,1,"is working" )
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,335 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini128:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini128
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini128
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini128
	NOP
;libs/EEprom_Atmega32.mbas,336 :: 		ByteToStr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,337 :: 		Lcd_Out(1,1,"EEprommmmmmmmmm" )
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
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
;libs/EEprom_Atmega32.mbas,338 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__ext_twi_eeprom_ini127
;libs/EEprom_Atmega32.mbas,339 :: 		else
L__ext_twi_eeprom_ini126:
;libs/EEprom_Atmega32.mbas,340 :: 		Lcd_0() Lcd_Out(1,1,"TWI EEPROM" ) Lcd_Out(2,1,"is Not working")
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,341 :: 		bytetostr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,342 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,343 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini130:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini130
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini130
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini130
	NOP
;libs/EEprom_Atmega32.mbas,344 :: 		Lcd_Out(1,1,"0 EEPROM is:" )Lcd_Out(2,1,txt )
	MOVW       R30, R28
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,345 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini132:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini132
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini132
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini132
	NOP
;libs/EEprom_Atmega32.mbas,347 :: 		end if
L__ext_twi_eeprom_ini127:
;libs/EEprom_Atmega32.mbas,348 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini134:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini134
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini134
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini134
	NOP
;libs/EEprom_Atmega32.mbas,349 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,350 :: 		end sub
L_end_ext_twi_eeprom_ini:
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
; end of _ext_twi_eeprom_ini

_int_eeprom_ini:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 21
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,355 :: 		sub procedure int_eeprom_ini()     ''internal eeprm of avr
;libs/EEprom_Atmega32.mbas,357 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,362 :: 		if  (EEPROM_Read(0x00)=12)   then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	CPI        R16, 12
	BREQ       L__int_eeprom_ini190
	JMP        L__int_eeprom_ini138
L__int_eeprom_ini190:
;libs/EEprom_Atmega32.mbas,363 :: 		Lcd_0() Lcd_Out(1,1,"Reading from " ) Lcd_Out(2,1,"EEprom ..." )
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
;libs/EEprom_Atmega32.mbas,364 :: 		eeprom_call_back()
	CALL       libs/EEprom_Atmega32_eeprom_call_back+0
;libs/EEprom_Atmega32.mbas,367 :: 		Lcd_Out(1,1,"EEprom  writed befor" )
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
;libs/EEprom_Atmega32.mbas,368 :: 		ByteToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,370 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__int_eeprom_ini139
;libs/EEprom_Atmega32.mbas,371 :: 		else
L__int_eeprom_ini138:
;libs/EEprom_Atmega32.mbas,372 :: 		EEPROM_Write(0x00 ,12 )
	LDI        R27, 12
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Write+0
;libs/EEprom_Atmega32.mbas,375 :: 		Lcd_0() Lcd_Out(1,1,"Writing to  " ) Lcd_Out(2,1,"EEprom ..." )
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
;libs/EEprom_Atmega32.mbas,376 :: 		hours=0x05  minutes=0x54   seconds=0x00 day= 0x31 week=2   month=0x12  year=0x15
	LDI        R27, 5
	STS        _hours+0, R27
	LDI        R27, 84
	STS        _minutes+0, R27
	LDI        R27, 0
	STS        _seconds+0, R27
	LDI        R27, 49
	STS        _day+0, R27
	LDI        R27, 2
	STS        _week+0, R27
	LDI        R27, 18
	STS        _month+0, R27
	LDI        R27, 21
	STS        _year+0, R27
;libs/EEprom_Atmega32.mbas,379 :: 		Write_Time(hours, minutes, seconds, 0x31, 0x01,   0x12,year)'
	LDI        R27, 21
	MOV        R8, R27
	LDI        R27, 18
	MOV        R7, R27
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 49
	MOV        R5, R27
	CLR        R4
	LDI        R27, 84
	MOV        R3, R27
	LDI        R27, 5
	MOV        R2, R27
	CALL       _Write_Time+0
;libs/EEprom_Atmega32.mbas,381 :: 		On_mSec_initial_Heater (1,0,20,100) 'On_mSec_initial_Heater(dim en,mint,sec,prc as byte)'On_mSec_initial_Heater[chanel_ini-1][Heater_Motor_Time_ini-1][Pwm_chanel_ini-1][0]
	LDI        R27, 100
	MOV        R5, R27
	LDI        R27, 20
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_heater+0
;libs/EEprom_Atmega32.mbas,382 :: 		On_mSec_initial_Motor (1,0,12,100)
	LDI        R27, 100
	MOV        R5, R27
	LDI        R27, 12
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_Motor+0
;libs/EEprom_Atmega32.mbas,383 :: 		eeprom_save()
	CALL       _eeprom_save+0
;libs/EEprom_Atmega32.mbas,385 :: 		Lcd_Out(1,1,"not writed" )
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
;libs/EEprom_Atmega32.mbas,388 :: 		end if
L__int_eeprom_ini139:
;libs/EEprom_Atmega32.mbas,389 :: 		Delay_mS(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__int_eeprom_ini140:
	DEC        R16
	BRNE       L__int_eeprom_ini140
	DEC        R17
	BRNE       L__int_eeprom_ini140
	DEC        R18
	BRNE       L__int_eeprom_ini140
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,390 :: 		end sub
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

libs/EEprom_Atmega32_ext_eeprom_ini:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 24
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;libs/EEprom_Atmega32.mbas,393 :: 		sub procedure ext_eeprom_ini()
;libs/EEprom_Atmega32.mbas,396 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,398 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;libs/EEprom_Atmega32.mbas,399 :: 		Read_EEprom(0)
	CLR        R2
	CLR        R3
	CALL       libs/EEprom_Atmega32_Read_EEprom+0
;libs/EEprom_Atmega32.mbas,400 :: 		if  (EEprom_data_read =12)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 12
	BREQ       L_libs/EEprom_Atmega32_ext_eeprom_ini192
	JMP        L_libs/EEprom_Atmega32_ext_eeprom_ini144
L_libs/EEprom_Atmega32_ext_eeprom_ini192:
;libs/EEprom_Atmega32.mbas,401 :: 		Lcd_Out(1,1,"ext EEprom writed befor" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
;libs/EEprom_Atmega32.mbas,402 :: 		ByteToStr(EEprom_data_read, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,404 :: 		Lcd_Out(2,1,txt )   delay_ms(1500)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L_libs/EEprom_Atmega32_ext_eeprom_ini146:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini146
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini146
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini146
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,405 :: 		Lcd_0()    Lcd_Out(1,1,"Reading from " )    Lcd_Out(2,1,"EEPROM ... " )
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
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 32
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
;libs/EEprom_Atmega32.mbas,406 :: 		eeprom_call_back_ext()
	CALL       libs/EEprom_Atmega32_eeprom_call_back_ext+0
;libs/EEprom_Atmega32.mbas,407 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;libs/EEprom_Atmega32.mbas,408 :: 		Read_EEprom(0x04)
	LDI        R27, 4
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       libs/EEprom_Atmega32_Read_EEprom+0
;libs/EEprom_Atmega32.mbas,409 :: 		ByteToStr(EEprom_data_read, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,411 :: 		Lcd_Out(1,1,"EEprom-ext 04" )
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
	LDI        R27, 45
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 52
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
;libs/EEprom_Atmega32.mbas,412 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,413 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L_libs/EEprom_Atmega32_ext_eeprom_ini148:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini148
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini148
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini148
	NOP
	NOP
	JMP        L_libs/EEprom_Atmega32_ext_eeprom_ini145
;libs/EEprom_Atmega32.mbas,415 :: 		else
L_libs/EEprom_Atmega32_ext_eeprom_ini144:
;libs/EEprom_Atmega32.mbas,417 :: 		Lcd_Out(1,1,"ext not writed111111111" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
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
;libs/EEprom_Atmega32.mbas,418 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L_libs/EEprom_Atmega32_ext_eeprom_ini150:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini150
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini150
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini150
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,419 :: 		Write_EEprom(0 ,12 )
	LDI        R27, 12
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       libs/EEprom_Atmega32_Write_EEprom+0
;libs/EEprom_Atmega32.mbas,420 :: 		On_mSec_initial_Heater (1,0,10,18)  '' On mode Heater initial (dim en,mint,sec,prc as integer)
	LDI        R27, 18
	MOV        R5, R27
	LDI        R27, 10
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_heater+0
;libs/EEprom_Atmega32.mbas,421 :: 		On_mSec_initial_Motor (1,0,10,18)    ''' Motor mode
	LDI        R27, 18
	MOV        R5, R27
	LDI        R27, 10
	MOV        R4, R27
	CLR        R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _On_mSec_initial_Motor+0
;libs/EEprom_Atmega32.mbas,422 :: 		Lcd_0()    Lcd_Out(1,1,"Writing to  " )    Lcd_Out(2,1,"EEPROM ... " )
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
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 32
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
;libs/EEprom_Atmega32.mbas,423 :: 		eeprom_save_ext()
	CALL       _eeprom_save_ext+0
;libs/EEprom_Atmega32.mbas,424 :: 		Lcd_Out(1,1,"writing ext eeprom" )
	MOVW       R30, R28
	LDI        R27, 119
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
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 101
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,426 :: 		end if
L_libs/EEprom_Atmega32_ext_eeprom_ini145:
;libs/EEprom_Atmega32.mbas,427 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L_libs/EEprom_Atmega32_ext_eeprom_ini152:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini152
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini152
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini152
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,428 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,429 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;libs/EEprom_Atmega32.mbas,430 :: 		Read_EEprom(0)
	CLR        R2
	CLR        R3
	CALL       libs/EEprom_Atmega32_Read_EEprom+0
;libs/EEprom_Atmega32.mbas,431 :: 		if  (EEprom_data_read=12)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 12
	BREQ       L_libs/EEprom_Atmega32_ext_eeprom_ini193
	JMP        L_libs/EEprom_Atmega32_ext_eeprom_ini155
L_libs/EEprom_Atmega32_ext_eeprom_ini193:
;libs/EEprom_Atmega32.mbas,432 :: 		Lcd_Out(1,1,"12 is good" )
	MOVW       R30, R28
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 111
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
;libs/EEprom_Atmega32.mbas,433 :: 		ByteToStr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;libs/EEprom_Atmega32.mbas,435 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L_libs/EEprom_Atmega32_ext_eeprom_ini156
;libs/EEprom_Atmega32.mbas,436 :: 		else
L_libs/EEprom_Atmega32_ext_eeprom_ini155:
;libs/EEprom_Atmega32.mbas,438 :: 		Lcd_Out(1,1,"ext not working" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
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
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;libs/EEprom_Atmega32.mbas,439 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L_libs/EEprom_Atmega32_ext_eeprom_ini157:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini157
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini157
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini157
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,443 :: 		end if
L_libs/EEprom_Atmega32_ext_eeprom_ini156:
;libs/EEprom_Atmega32.mbas,444 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L_libs/EEprom_Atmega32_ext_eeprom_ini159:
	DEC        R16
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini159
	DEC        R17
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini159
	DEC        R18
	BRNE       L_libs/EEprom_Atmega32_ext_eeprom_ini159
	NOP
	NOP
;libs/EEprom_Atmega32.mbas,445 :: 		Lcd_0()
	CALL       _Lcd_0+0
;libs/EEprom_Atmega32.mbas,446 :: 		end sub
L_end_ext_eeprom_ini:
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
; end of libs/EEprom_Atmega32_ext_eeprom_ini

_libs/EEprom_Atmega32_?main:

;libs/EEprom_Atmega32.mbas,449 :: 		end.
L_end_libs/EEprom_Atmega32_?main:
	RET
; end of _libs/EEprom_Atmega32_?main
