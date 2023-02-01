
_main:

;Leitura_de_dois_canais.c,21 :: 		void main() {
;Leitura_de_dois_canais.c,31 :: 		TRISA.RA0 = 1;   //Configura RA0/AN0 como entrada
	BSF         TRISA+0, 0 
;Leitura_de_dois_canais.c,32 :: 		TRISA.RA1 = 1;   //Configura RA1/AN1 como entrada
	BSF         TRISA+0, 1 
;Leitura_de_dois_canais.c,34 :: 		ADCON0 = 0b00000001;   //Habilita ADC, Configura como AN0
	MOVLW       1
	MOVWF       ADCON0+0 
;Leitura_de_dois_canais.c,36 :: 		ADCON1 = 0b00001101;   //Habilita tensão de referência interna, Configura apenas AN0 e AN1 como analógicos
	MOVLW       13
	MOVWF       ADCON1+0 
;Leitura_de_dois_canais.c,37 :: 		ADCON2 = 0b10101010;   //Justifica à direita, Fosc/32
	MOVLW       170
	MOVWF       ADCON2+0 
;Leitura_de_dois_canais.c,40 :: 		Lcd_init();                     //Inicializa o Display LCD
	CALL        _Lcd_Init+0, 0
;Leitura_de_dois_canais.c,41 :: 		Lcd_cmd(_lcd_clear);            //Limpa o Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Leitura_de_dois_canais.c,42 :: 		Lcd_cmd(_lcd_cursor_off);       //Desliga o cursor do Display LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Leitura_de_dois_canais.c,43 :: 		Lcd_out(1,1,"Iniciando.");    //Mensagem inicial do Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Leitura_de_dois_canais+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Leitura_de_dois_canais+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_de_dois_canais.c,44 :: 		Delay_ms(500);                 //Intervalo de tempo
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
;Leitura_de_dois_canais.c,45 :: 		Lcd_out(1,1,"Iniciando..");    //Mensagem inicial do Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Leitura_de_dois_canais+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Leitura_de_dois_canais+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_de_dois_canais.c,46 :: 		Delay_ms(500);                 //Intervalo de tempo
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
;Leitura_de_dois_canais.c,47 :: 		Lcd_out(1,1,"Iniciando...");    //Mensagem inicial do Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Leitura_de_dois_canais+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Leitura_de_dois_canais+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_de_dois_canais.c,48 :: 		Delay_ms(500);                 //Intervalo de tempo
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
;Leitura_de_dois_canais.c,49 :: 		Lcd_cmd(_lcd_clear);            //Limpa o Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Leitura_de_dois_canais.c,50 :: 		Lcd_out(1,1,"AN0:");            //Informação inicial da linha 1 do Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Leitura_de_dois_canais+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Leitura_de_dois_canais+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_de_dois_canais.c,51 :: 		Lcd_out(2,1,"AN1:");            //Informação inicial da linha 2 do Display LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Leitura_de_dois_canais+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Leitura_de_dois_canais+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_de_dois_canais.c,54 :: 		while(1){
L_main3:
;Leitura_de_dois_canais.c,56 :: 		ADCON0 = 0b00000011;                        //Inicializa a conversão do pino AN0
	MOVLW       3
	MOVWF       ADCON0+0 
;Leitura_de_dois_canais.c,57 :: 		while(ADCON0.GO_DONE == 1);                 //Espera terminar a conversão
L_main5:
	BTFSS       ADCON0+0, 1 
	GOTO        L_main6
	GOTO        L_main5
L_main6:
;Leitura_de_dois_canais.c,59 :: 		ValorAN0 = ((ADRESH << 8) | (int)ADRESL);   //Escreve o valor digital na variável
	MOVF        ADRESH+0, 0 
	MOVWF       R3 
	CLRF        R2 
	MOVF        ADRESL+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
	IORWF       R0, 1 
	MOVF        R3, 0 
	IORWF       R1, 1 
;Leitura_de_dois_canais.c,60 :: 		TensaoAN0 = ValorAN0*5.5/1023.0;            //Calculo Tensão AN0
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       48
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;Leitura_de_dois_canais.c,61 :: 		FloatToStr(TensaoAN0, TensaoAN0_STR);        //Transforma o valor da variável de 'int' para 'char'
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       main_TensaoAN0_STR_L0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(main_TensaoAN0_STR_L0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Leitura_de_dois_canais.c,62 :: 		TensaoAN0_STR[4] = 0;                       //Limpa casas decimais
	CLRF        main_TensaoAN0_STR_L0+4 
;Leitura_de_dois_canais.c,63 :: 		Lcd_out(1,5, TensaoAN0_STR);                //Escreve o valor da variável 'char' no Display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_TensaoAN0_STR_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_TensaoAN0_STR_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_de_dois_canais.c,64 :: 		Delay_ms(50);                               //Intervalo de tempo
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	NOP
	NOP
;Leitura_de_dois_canais.c,67 :: 		ADCON0 = 0b00000111;                        //Inicializa a conversão do pino AN1
	MOVLW       7
	MOVWF       ADCON0+0 
;Leitura_de_dois_canais.c,68 :: 		while(ADCON0.GO_DONE == 1);                 //Espera terminar a conversão
L_main8:
	BTFSS       ADCON0+0, 1 
	GOTO        L_main9
	GOTO        L_main8
L_main9:
;Leitura_de_dois_canais.c,70 :: 		ValorAN1 = ((ADRESH << 8) | (int)ADRESL);   //Escreve o valor digital na variável
	MOVF        ADRESH+0, 0 
	MOVWF       R3 
	CLRF        R2 
	MOVF        ADRESL+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
	IORWF       R0, 1 
	MOVF        R3, 0 
	IORWF       R1, 1 
;Leitura_de_dois_canais.c,71 :: 		TensaoAN1 = ValorAN1*5.5/1023.0;            //Cálculo Tensão AN1
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       48
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;Leitura_de_dois_canais.c,72 :: 		FloatToStr(TensaoAN1, TensaoAN1_STR);       //Transforma o valor da variável de 'int' para 'char'
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       main_TensaoAN1_STR_L0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(main_TensaoAN1_STR_L0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Leitura_de_dois_canais.c,73 :: 		TensaoAN1_STR[4] = 0;                       //Limpa casas decimais
	CLRF        main_TensaoAN1_STR_L0+4 
;Leitura_de_dois_canais.c,74 :: 		Lcd_out(2,5, TensaoAN1_STR);                //Escreve o valor da variável 'char' no Display LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_TensaoAN1_STR_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_TensaoAN1_STR_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Leitura_de_dois_canais.c,75 :: 		Delay_ms(50);                               //Intervalo de tempo
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	NOP
	NOP
;Leitura_de_dois_canais.c,77 :: 		}
	GOTO        L_main3
;Leitura_de_dois_canais.c,79 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
