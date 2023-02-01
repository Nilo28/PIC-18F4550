
_main:

;Display_LCD_Button.c,18 :: 		void main() {
;Display_LCD_Button.c,26 :: 		b1 = 0;
	CLRF        main_b1_L0+0 
;Display_LCD_Button.c,27 :: 		b2 = 0;
	CLRF        main_b2_L0+0 
;Display_LCD_Button.c,31 :: 		ADCON1 |=0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Display_LCD_Button.c,34 :: 		TRISB.RB6 = 1;   //Configura RB6 como entrada(Botão B1)
	BSF         TRISB+0, 6 
;Display_LCD_Button.c,35 :: 		TRISB.RB7 = 1;   //Configura RB7 como entrada(Botão B2)
	BSF         TRISB+0, 7 
;Display_LCD_Button.c,38 :: 		Lcd_Init();   //Inicializa o módulo LCD
	CALL        _Lcd_Init+0, 0
;Display_LCD_Button.c,39 :: 		Lcd_Cmd(_LCD_Clear);   //Limpa o display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Display_LCD_Button.c,40 :: 		Lcd_Cmd(_LCD_Cursor_off);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Display_LCD_Button.c,41 :: 		Lcd_Out(1,1, "Testando");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Display_LCD_Button+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Display_LCD_Button+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Display_LCD_Button.c,44 :: 		while(1){
L_main0:
;Display_LCD_Button.c,45 :: 		Delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;Display_LCD_Button.c,47 :: 		if(PORTB.RB6 == 1 && b1 == 0){
	BTFSS       PORTB+0, 6 
	GOTO        L_main5
	MOVF        main_b1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
L__main23:
;Display_LCD_Button.c,49 :: 		b1 = 1;
	MOVLW       1
	MOVWF       main_b1_L0+0 
;Display_LCD_Button.c,50 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;Display_LCD_Button.c,51 :: 		}
L_main5:
;Display_LCD_Button.c,52 :: 		if(PORTB.RB6 == 0 && b1 == 1){
	BTFSC       PORTB+0, 6 
	GOTO        L_main9
	MOVF        main_b1_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
L__main22:
;Display_LCD_Button.c,53 :: 		b1 = 0;
	CLRF        main_b1_L0+0 
;Display_LCD_Button.c,54 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;Display_LCD_Button.c,55 :: 		}
L_main9:
;Display_LCD_Button.c,57 :: 		if(PORTB.RB7 == 1 && b2 == 0){
	BTFSS       PORTB+0, 7 
	GOTO        L_main13
	MOVF        main_b2_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
L__main21:
;Display_LCD_Button.c,59 :: 		b2 = 1;
	MOVLW       1
	MOVWF       main_b2_L0+0 
;Display_LCD_Button.c,60 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
;Display_LCD_Button.c,61 :: 		}
L_main13:
;Display_LCD_Button.c,62 :: 		if(PORTB.RB7 == 0 && b2 == 1){
	BTFSC       PORTB+0, 7 
	GOTO        L_main17
	MOVF        main_b2_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
L__main20:
;Display_LCD_Button.c,63 :: 		b2 = 0;
	CLRF        main_b2_L0+0 
;Display_LCD_Button.c,64 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
	NOP
;Display_LCD_Button.c,65 :: 		}
L_main17:
;Display_LCD_Button.c,67 :: 		Lcd_Cmd(_LCD_Clear);   //Limpa o display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Display_LCD_Button.c,68 :: 		Lcd_Out(1,4, Display);   //Escreve o valor de var no display
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_Display_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       0
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Display_LCD_Button.c,69 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
;Display_LCD_Button.c,72 :: 		}
	GOTO        L_main0
;Display_LCD_Button.c,76 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
