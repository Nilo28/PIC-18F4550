
_main:

;Display_LCD.c,18 :: 		void main() {
;Display_LCD.c,19 :: 		ADCON1 |=0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Display_LCD.c,21 :: 		Lcd_Init();   //Inicializa o módulo LCD
	CALL        _Lcd_Init+0, 0
;Display_LCD.c,22 :: 		Lcd_Cmd(_LCD_Clear);   //Limpa o display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Display_LCD.c,23 :: 		Lcd_Out(1,7, "LCD");   //Escreve "LCD" no display
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Display_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Display_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Display_LCD.c,25 :: 		while(1){
L_main0:
;Display_LCD.c,26 :: 		for(i=0; i<7; i++){    //Repete 6 vezes
	CLRF        _i+0 
L_main2:
	MOVLW       7
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Display_LCD.c,27 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);   //Move o texto para a direita
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Display_LCD.c,28 :: 		Delay_ms(500);   //Intervalo de tempo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;Display_LCD.c,26 :: 		for(i=0; i<7; i++){    //Repete 6 vezes
	INCF        _i+0, 1 
;Display_LCD.c,29 :: 		}
	GOTO        L_main2
L_main3:
;Display_LCD.c,30 :: 		for(i=0; i<13; i++){    //Repete 12 vezes
	CLRF        _i+0 
L_main6:
	MOVLW       13
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;Display_LCD.c,31 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);   //Move o texto para a esquerda
	MOVLW       24
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Display_LCD.c,32 :: 		Delay_ms(500);   //Intervalo de tempo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;Display_LCD.c,30 :: 		for(i=0; i<13; i++){    //Repete 12 vezes
	INCF        _i+0, 1 
;Display_LCD.c,33 :: 		}
	GOTO        L_main6
L_main7:
;Display_LCD.c,34 :: 		for(i=0; i<6; i++){    //Repete 5 vezes
	CLRF        _i+0 
L_main10:
	MOVLW       6
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
;Display_LCD.c,35 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);   //Move o texto para a direita
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Display_LCD.c,36 :: 		Delay_ms(500);   //Intervalo de tempo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
	NOP
;Display_LCD.c,34 :: 		for(i=0; i<6; i++){    //Repete 5 vezes
	INCF        _i+0, 1 
;Display_LCD.c,37 :: 		}
	GOTO        L_main10
L_main11:
;Display_LCD.c,39 :: 		}
	GOTO        L_main0
;Display_LCD.c,41 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
