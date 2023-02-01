
_main:

;Leitura_do_sensor_de_temperatura.c,19 :: 		void main() {
;Leitura_do_sensor_de_temperatura.c,26 :: 		TRISA.RA0 = 1;   //Configura RA0 como entrada
	BSF         TRISA+0, 0 
;Leitura_do_sensor_de_temperatura.c,28 :: 		ADCON0 = 0b00000001;   //Habilita ADC, Configura como AN0
	MOVLW       1
	MOVWF       ADCON0+0 
;Leitura_do_sensor_de_temperatura.c,29 :: 		ADCON1 = 0b00001110;   //Habilita tensão de referência interna, Configura apenas AN0 como analógico
	MOVLW       14
	MOVWF       ADCON1+0 
;Leitura_do_sensor_de_temperatura.c,30 :: 		ADCON2 = 0b10101010;   //Justifica à direita, Fosc/32
	MOVLW       170
	MOVWF       ADCON2+0 
;Leitura_do_sensor_de_temperatura.c,33 :: 		Lcd_init();                     //Inicializa o módulo LCD
	CALL        _Lcd_Init+0, 0
;Leitura_do_sensor_de_temperatura.c,34 :: 		Lcd_cmd(_lcd_clear);            //Limpa o Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Leitura_do_sensor_de_temperatura.c,35 :: 		Lcd_cmd(_lcd_cursor_off);       //Desliga o cursor do Display LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Leitura_do_sensor_de_temperatura.c,36 :: 		Lcd_out(1,1,"Iniciando");       //Mensagem inicial do Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Leitura_do_sensor_de_temperatura+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Leitura_do_sensor_de_temperatura+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_do_sensor_de_temperatura.c,37 :: 		Delay_ms(500);                  //Intervalo de tempo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;Leitura_do_sensor_de_temperatura.c,38 :: 		Lcd_out(1,1,"Iniciando.");      //Mensagem inicial do Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Leitura_do_sensor_de_temperatura+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Leitura_do_sensor_de_temperatura+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_do_sensor_de_temperatura.c,39 :: 		Delay_ms(500);                  //Intervalo de tempo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
	NOP
;Leitura_do_sensor_de_temperatura.c,40 :: 		Lcd_out(1,1,"Iniciando..");     //Mensagem inicial do Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Leitura_do_sensor_de_temperatura+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Leitura_do_sensor_de_temperatura+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_do_sensor_de_temperatura.c,41 :: 		Delay_ms(500);                  //Intervalo de tempo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;Leitura_do_sensor_de_temperatura.c,42 :: 		Lcd_out(1,1,"Iniciando...");    //Mensagem inicial do Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Leitura_do_sensor_de_temperatura+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Leitura_do_sensor_de_temperatura+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_do_sensor_de_temperatura.c,43 :: 		Delay_ms(500);                  //Intervalo de tempo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;Leitura_do_sensor_de_temperatura.c,44 :: 		Lcd_cmd(_lcd_clear);            //Limpa o Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Leitura_do_sensor_de_temperatura.c,46 :: 		while(1){
L_main4:
;Leitura_do_sensor_de_temperatura.c,47 :: 		ADC_init();                                //Inicializa o módulo ADC
	CALL        _ADC_Init+0, 0
;Leitura_do_sensor_de_temperatura.c,48 :: 		ValorAN0 = ADC_Read(0);                    //Escreve na váriável o valor da leitura
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;Leitura_do_sensor_de_temperatura.c,49 :: 		ValorTemp = ValorAN0*500.0/1024.0;         //Valor temperaura
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;Leitura_do_sensor_de_temperatura.c,50 :: 		FloatToStr(ValorTemp, ValorTemp_STR);      //Transforma o valor da variável de 'int' para 'char'
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       main_ValorTemp_STR_L0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(main_ValorTemp_STR_L0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Leitura_do_sensor_de_temperatura.c,51 :: 		ValorTemp_STR[4] = 0;
	CLRF        main_ValorTemp_STR_L0+4 
;Leitura_do_sensor_de_temperatura.c,52 :: 		Lcd_out(1,1,"Temperatura:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Leitura_do_sensor_de_temperatura+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Leitura_do_sensor_de_temperatura+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_do_sensor_de_temperatura.c,53 :: 		Lcd_out(2,7, ValorTemp_STR);               //Escreve o valor da variável 'char' no Display LC
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_ValorTemp_STR_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_ValorTemp_STR_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_do_sensor_de_temperatura.c,54 :: 		Lcd_chr(2,12,223);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       223
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Leitura_do_sensor_de_temperatura.c,55 :: 		Lcd_out(2,13,"C");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Leitura_do_sensor_de_temperatura+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Leitura_do_sensor_de_temperatura+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_do_sensor_de_temperatura.c,56 :: 		Delay_ms(100);
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
;Leitura_do_sensor_de_temperatura.c,58 :: 		}
	GOTO        L_main4
;Leitura_do_sensor_de_temperatura.c,60 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
