
_main:

;IHM.c,16 :: 		void main() {
;IHM.c,35 :: 		tela = 1;
	MOVLW       1
	MOVWF       main_Tela_L0+0 
;IHM.c,36 :: 		controleC0 = 0;
	CLRF        main_controleC0_L0+0 
;IHM.c,37 :: 		controleC1 = 0;
	CLRF        main_controleC1_L0+0 
;IHM.c,38 :: 		controleD0 = 0;
	CLRF        main_controleD0_L0+0 
;IHM.c,39 :: 		Alterna = 0;
	CLRF        main_Alterna_L0+0 
;IHM.c,40 :: 		T1 = 0;
	CLRF        main_T1_L0+0 
;IHM.c,41 :: 		T2 = 0;
	CLRF        main_T2_L0+0 
;IHM.c,42 :: 		T3 = 0;
	CLRF        main_T3_L0+0 
;IHM.c,46 :: 		ADCON1 = 0b00001111;  //Configura todos os pinos como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;IHM.c,48 :: 		TRISC.RC0 = 1;     //Configura RC0 como entrada
	BSF         TRISC+0, 0 
;IHM.c,49 :: 		TRISC.RC1 = 1;     //Configura RC1 como entrada
	BSF         TRISC+0, 1 
;IHM.c,50 :: 		TRISD.RD0 = 1;     //Configura RD0 como entrada
	BSF         TRISD+0, 0 
;IHM.c,51 :: 		TRISA.RA0 = 0;     //Configura RA0 como saída
	BCF         TRISA+0, 0 
;IHM.c,52 :: 		TRISA.RA1 = 0;     //Configura RA1 como saída
	BCF         TRISA+0, 1 
;IHM.c,54 :: 		PORTA.RA0 = 0;     //Inicializa RA0 com nível baixo
	BCF         PORTA+0, 0 
;IHM.c,55 :: 		PORTA.RA1 = 0;     //Inicializa RA1 com nível baixo
	BCF         PORTA+0, 1 
;IHM.c,58 :: 		Lcd_Init();                            //Inicializa o módulo LCD
	CALL        _Lcd_Init+0, 0
;IHM.c,59 :: 		Lcd_Cmd(_LCD_Clear);                   //Limpa o display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,60 :: 		Lcd_Cmd(_LCD_Cursor_off);              //Desabilita cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,61 :: 		Lcd_Out(1,1, "Inicializando...");      //Mensagem inicial
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,62 :: 		Delay_ms(3000);                        //Intervalo de tempo
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;IHM.c,63 :: 		Lcd_cmd(_LCD_Clear);                   //Limpa o display LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,64 :: 		Lcd_Out(1,2, "Liga");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,65 :: 		Lcd_Out(2,2, "Desliga");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,68 :: 		while(1){
L_main1:
;IHM.c,72 :: 		if(tela == 1){
	MOVF        main_Tela_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;IHM.c,73 :: 		Lcd_Out(1,2, "Liga");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,74 :: 		Lcd_Out(2,2, "Desliga");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,75 :: 		if(PORTC.RC0 == 1 && controleC0 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_main6
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
L__main137:
;IHM.c,76 :: 		if(Alterna == 0 && controleC0 == 0){
	MOVF        main_Alterna_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
L__main136:
;IHM.c,77 :: 		Lcd_Out(1,1, ">Liga    [ENTER]");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,78 :: 		Lcd_Out(2,1, " Desliga        ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,79 :: 		Alterna = 1;
	MOVLW       1
	MOVWF       main_Alterna_L0+0 
;IHM.c,80 :: 		controleC0 = 1;
	MOVLW       1
	MOVWF       main_controleC0_L0+0 
;IHM.c,81 :: 		T1 = 1;
	MOVLW       1
	MOVWF       main_T1_L0+0 
;IHM.c,82 :: 		}
L_main9:
;IHM.c,83 :: 		if(Alterna == 1 && controleC0 == 0){
	MOVF        main_Alterna_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
L__main135:
;IHM.c,84 :: 		Lcd_Out(1,1, " Liga           ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,85 :: 		Lcd_Out(2,1, ">Desliga [ENTER]");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,86 :: 		Alterna = 0;
	CLRF        main_Alterna_L0+0 
;IHM.c,87 :: 		controleC0 = 1;
	MOVLW       1
	MOVWF       main_controleC0_L0+0 
;IHM.c,88 :: 		T1 = 2;
	MOVLW       2
	MOVWF       main_T1_L0+0 
;IHM.c,89 :: 		}
L_main12:
;IHM.c,90 :: 		}
L_main6:
;IHM.c,91 :: 		if(PORTC.RC0 == 0 && controleC0 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_main15
	MOVF        main_controleC0_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
L__main134:
;IHM.c,92 :: 		controleC0 = 0;
	CLRF        main_controleC0_L0+0 
;IHM.c,93 :: 		}
L_main15:
;IHM.c,94 :: 		}
L_main3:
;IHM.c,96 :: 		if(tela == 2){
	MOVF        main_Tela_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
;IHM.c,97 :: 		Lcd_Out(1,11, "LED 1 ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,98 :: 		Lcd_Out(2,11, "LED 2 ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,99 :: 		if(PORTC.RC0 == 1 && controleC0 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_main19
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
L__main133:
;IHM.c,100 :: 		if(Alterna == 0 && controleC0 == 0){
	MOVF        main_Alterna_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
L__main132:
;IHM.c,101 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,102 :: 		Lcd_Out(1,1, " Liga    >LED 1 ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,103 :: 		Lcd_Out(2,1, "          LED 2 ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,104 :: 		Alterna = 1;
	MOVLW       1
	MOVWF       main_Alterna_L0+0 
;IHM.c,105 :: 		controleC0 = 1;
	MOVLW       1
	MOVWF       main_controleC0_L0+0 
;IHM.c,106 :: 		T2 = 1;
	MOVLW       1
	MOVWF       main_T2_L0+0 
;IHM.c,107 :: 		}
L_main22:
;IHM.c,108 :: 		if(Alterna == 1 && controleC0 == 0){
	MOVF        main_Alterna_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
L__main131:
;IHM.c,109 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,110 :: 		Lcd_Out(1,1, "          LED 1 ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,111 :: 		Lcd_Out(2,1, " Liga    >LED 2 ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,112 :: 		Alterna = 0;
	CLRF        main_Alterna_L0+0 
;IHM.c,113 :: 		controleC0 = 1;
	MOVLW       1
	MOVWF       main_controleC0_L0+0 
;IHM.c,114 :: 		T2 = 2;
	MOVLW       2
	MOVWF       main_T2_L0+0 
;IHM.c,115 :: 		}
L_main25:
;IHM.c,116 :: 		}
L_main19:
;IHM.c,117 :: 		if(PORTC.RC0 == 0 && controleC0 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_main28
	MOVF        main_controleC0_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
L__main130:
;IHM.c,118 :: 		controleC0 = 0;
	CLRF        main_controleC0_L0+0 
;IHM.c,119 :: 		}
L_main28:
;IHM.c,120 :: 		}
L_main16:
;IHM.c,122 :: 		if(tela == 3){
	MOVF        main_Tela_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
;IHM.c,123 :: 		Lcd_Out(1,11, "LED 1 ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,124 :: 		Lcd_Out(2,11, "LED 2 ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr17_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,125 :: 		if(PORTC.RC0 == 1 && controleC0 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_main32
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
L__main129:
;IHM.c,126 :: 		if(Alterna == 0 && controleC0 == 0){
	MOVF        main_Alterna_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main35
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main35
L__main128:
;IHM.c,127 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,128 :: 		Lcd_Out(1,1, " Desliga >LED 1 ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,129 :: 		Lcd_Out(2,1, "          LED 2 ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,130 :: 		Alterna = 1;
	MOVLW       1
	MOVWF       main_Alterna_L0+0 
;IHM.c,131 :: 		controleC0 = 1;
	MOVLW       1
	MOVWF       main_controleC0_L0+0 
;IHM.c,132 :: 		T3 = 1;
	MOVLW       1
	MOVWF       main_T3_L0+0 
;IHM.c,133 :: 		}
L_main35:
;IHM.c,134 :: 		if(Alterna == 1 && controleC0 == 0){
	MOVF        main_Alterna_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
	MOVF        main_controleC0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
L__main127:
;IHM.c,135 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,136 :: 		Lcd_Out(1,1, "          LED 1 ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr20_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr20_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,137 :: 		Lcd_Out(2,1, " Desliga >LED 2 ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,138 :: 		Alterna = 0;
	CLRF        main_Alterna_L0+0 
;IHM.c,139 :: 		controleC0 = 1;
	MOVLW       1
	MOVWF       main_controleC0_L0+0 
;IHM.c,140 :: 		T3 = 2;
	MOVLW       2
	MOVWF       main_T3_L0+0 
;IHM.c,141 :: 		}
L_main38:
;IHM.c,142 :: 		}
L_main32:
;IHM.c,143 :: 		if(PORTC.RC0 == 0 && controleC0 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_main41
	MOVF        main_controleC0_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main41
L__main126:
;IHM.c,144 :: 		controleC0 = 0;
	CLRF        main_controleC0_L0+0 
;IHM.c,145 :: 		}
L_main41:
;IHM.c,146 :: 		}
L_main29:
;IHM.c,149 :: 		if(tela == 1){
	MOVF        main_Tela_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
;IHM.c,150 :: 		if(PORTC.RC1 == 1 && controleC1 == 0){
	BTFSS       PORTC+0, 1 
	GOTO        L_main45
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main45
L__main125:
;IHM.c,151 :: 		if(T1 == 1 && controleC1 == 0){
	MOVF        main_T1_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main48
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main48
L__main124:
;IHM.c,152 :: 		Tela = 2;
	MOVLW       2
	MOVWF       main_Tela_L0+0 
;IHM.c,153 :: 		Alterna = 0;
	CLRF        main_Alterna_L0+0 
;IHM.c,154 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,155 :: 		controleC1 = 1;
	MOVLW       1
	MOVWF       main_controleC1_L0+0 
;IHM.c,156 :: 		}
L_main48:
;IHM.c,157 :: 		if(T1 == 2 && controleC1 == 0){
	MOVF        main_T1_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main51
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main51
L__main123:
;IHM.c,158 :: 		Tela = 3;
	MOVLW       3
	MOVWF       main_Tela_L0+0 
;IHM.c,159 :: 		Alterna = 0;
	CLRF        main_Alterna_L0+0 
;IHM.c,160 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,161 :: 		controleC1 = 1;
	MOVLW       1
	MOVWF       main_controleC1_L0+0 
;IHM.c,162 :: 		}
L_main51:
;IHM.c,163 :: 		}
L_main45:
;IHM.c,164 :: 		if(PORTC.RC1 == 0 && controleC1 == 1){
	BTFSC       PORTC+0, 1 
	GOTO        L_main54
	MOVF        main_controleC1_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main54
L__main122:
;IHM.c,165 :: 		controleC1 = 0;
	CLRF        main_controleC1_L0+0 
;IHM.c,166 :: 		}
L_main54:
;IHM.c,167 :: 		}
L_main42:
;IHM.c,169 :: 		if(tela == 2){
	MOVF        main_Tela_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main55
;IHM.c,170 :: 		if(PORTC.RC1 == 1 && controleC1 == 0){
	BTFSS       PORTC+0, 1 
	GOTO        L_main58
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main58
L__main121:
;IHM.c,171 :: 		if(T2 == 1 && controleC1 == 0){
	MOVF        main_T2_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main61
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main61
L__main120:
;IHM.c,172 :: 		PORTA.RA0 = 1;
	BSF         PORTA+0, 0 
;IHM.c,173 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,174 :: 		Lcd_Out(1,1, "   Led Ligado   ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,175 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main62:
	DECFSZ      R13, 1, 1
	BRA         L_main62
	DECFSZ      R12, 1, 1
	BRA         L_main62
	DECFSZ      R11, 1, 1
	BRA         L_main62
	NOP
	NOP
;IHM.c,176 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,177 :: 		controleC1 = 1;
	MOVLW       1
	MOVWF       main_controleC1_L0+0 
;IHM.c,178 :: 		}
L_main61:
;IHM.c,179 :: 		if(T2 == 2 && controleC1 == 0){
	MOVF        main_T2_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main65
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main65
L__main119:
;IHM.c,180 :: 		PORTA.RA1 = 1;
	BSF         PORTA+0, 1 
;IHM.c,181 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,182 :: 		Lcd_Out(1,1, "   Led Ligado   ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr23_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr23_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,183 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main66:
	DECFSZ      R13, 1, 1
	BRA         L_main66
	DECFSZ      R12, 1, 1
	BRA         L_main66
	DECFSZ      R11, 1, 1
	BRA         L_main66
	NOP
	NOP
;IHM.c,184 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,185 :: 		controleC1 = 1;
	MOVLW       1
	MOVWF       main_controleC1_L0+0 
;IHM.c,186 :: 		}
L_main65:
;IHM.c,187 :: 		}
L_main58:
;IHM.c,188 :: 		if(PORTC.RC1 == 0 && controleC1 == 1){
	BTFSC       PORTC+0, 1 
	GOTO        L_main69
	MOVF        main_controleC1_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main69
L__main118:
;IHM.c,189 :: 		controleC1 = 0;
	CLRF        main_controleC1_L0+0 
;IHM.c,190 :: 		}
L_main69:
;IHM.c,191 :: 		}
L_main55:
;IHM.c,193 :: 		if(tela == 3){
	MOVF        main_Tela_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main70
;IHM.c,194 :: 		if(PORTC.RC1 == 1 && controleC1 == 0){
	BTFSS       PORTC+0, 1 
	GOTO        L_main73
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main73
L__main117:
;IHM.c,195 :: 		if(T3 == 1 && controleC1 == 0){
	MOVF        main_T3_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main76
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main76
L__main116:
;IHM.c,196 :: 		PORTA.RA0 = 0;
	BCF         PORTA+0, 0 
;IHM.c,197 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,198 :: 		Lcd_Out(1,1, "  Led Desligado ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr24_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr24_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,199 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main77:
	DECFSZ      R13, 1, 1
	BRA         L_main77
	DECFSZ      R12, 1, 1
	BRA         L_main77
	DECFSZ      R11, 1, 1
	BRA         L_main77
	NOP
	NOP
;IHM.c,200 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,201 :: 		controleC1 = 1;
	MOVLW       1
	MOVWF       main_controleC1_L0+0 
;IHM.c,202 :: 		}
L_main76:
;IHM.c,203 :: 		if(T3 == 2 && controleC1 == 0){
	MOVF        main_T3_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main80
	MOVF        main_controleC1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main80
L__main115:
;IHM.c,204 :: 		PORTA.RA1 = 0;
	BCF         PORTA+0, 1 
;IHM.c,205 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,206 :: 		Lcd_Out(1,1, "  Led Desligado ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr25_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr25_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,207 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main81:
	DECFSZ      R13, 1, 1
	BRA         L_main81
	DECFSZ      R12, 1, 1
	BRA         L_main81
	DECFSZ      R11, 1, 1
	BRA         L_main81
	NOP
	NOP
;IHM.c,208 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,209 :: 		controleC1 = 1;
	MOVLW       1
	MOVWF       main_controleC1_L0+0 
;IHM.c,210 :: 		}
L_main80:
;IHM.c,211 :: 		}
L_main73:
;IHM.c,212 :: 		if(PORTC.RC1 == 0 && controleC1 == 1){
	BTFSC       PORTC+0, 1 
	GOTO        L_main84
	MOVF        main_controleC1_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main84
L__main114:
;IHM.c,213 :: 		controleC1 = 0;
	CLRF        main_controleC1_L0+0 
;IHM.c,214 :: 		}
L_main84:
;IHM.c,215 :: 		}
L_main70:
;IHM.c,218 :: 		if(tela == 1){
	MOVF        main_Tela_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main85
;IHM.c,219 :: 		if(PORTD.RD0 == 1 && controleD0 == 0){
	BTFSS       PORTD+0, 0 
	GOTO        L_main88
	MOVF        main_controleD0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main88
L__main113:
;IHM.c,220 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,221 :: 		Lcd_Out(1,1, "***ERROR  404***");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr26_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr26_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,222 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main89:
	DECFSZ      R13, 1, 1
	BRA         L_main89
	DECFSZ      R12, 1, 1
	BRA         L_main89
	DECFSZ      R11, 1, 1
	BRA         L_main89
	NOP
	NOP
;IHM.c,223 :: 		Lcd_Out(2,1, "***Resolvendo***");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr27_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr27_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,224 :: 		Delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main90:
	DECFSZ      R13, 1, 1
	BRA         L_main90
	DECFSZ      R12, 1, 1
	BRA         L_main90
	DECFSZ      R11, 1, 1
	BRA         L_main90
	NOP
;IHM.c,225 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,226 :: 		Lcd_Out(1,2, "Liga");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr28_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr28_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,227 :: 		Lcd_Out(2,2, "Desliga");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr29_IHM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_IHM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IHM.c,228 :: 		controleD0 = 1;
	MOVLW       1
	MOVWF       main_controleD0_L0+0 
;IHM.c,229 :: 		}
L_main88:
;IHM.c,230 :: 		if(PORTD.RD0 == 0 && controleD0 == 1){
	BTFSC       PORTD+0, 0 
	GOTO        L_main93
	MOVF        main_controleD0_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main93
L__main112:
;IHM.c,231 :: 		controleD0 = 0;
	CLRF        main_controleD0_L0+0 
;IHM.c,232 :: 		}
L_main93:
;IHM.c,233 :: 		}
L_main85:
;IHM.c,235 :: 		if(tela == 2){
	MOVF        main_Tela_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main94
;IHM.c,236 :: 		if(PORTD.RD0 == 1 && controleD0 == 0){
	BTFSS       PORTD+0, 0 
	GOTO        L_main97
	MOVF        main_controleD0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main97
L__main111:
;IHM.c,237 :: 		tela = 1;
	MOVLW       1
	MOVWF       main_Tela_L0+0 
;IHM.c,238 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,239 :: 		Alterna = 0;
	CLRF        main_Alterna_L0+0 
;IHM.c,240 :: 		controleD0 = 1;
	MOVLW       1
	MOVWF       main_controleD0_L0+0 
;IHM.c,241 :: 		}
L_main97:
;IHM.c,242 :: 		if(PORTD.RD0 == 0 && controleD0 == 1){
	BTFSC       PORTD+0, 0 
	GOTO        L_main100
	MOVF        main_controleD0_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main100
L__main110:
;IHM.c,243 :: 		controleD0 = 0;
	CLRF        main_controleD0_L0+0 
;IHM.c,244 :: 		}
L_main100:
;IHM.c,245 :: 		}
L_main94:
;IHM.c,247 :: 		if(tela == 3){
	MOVF        main_Tela_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main101
;IHM.c,248 :: 		if(PORTD.RD0 == 1 && controleD0 == 0){
	BTFSS       PORTD+0, 0 
	GOTO        L_main104
	MOVF        main_controleD0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main104
L__main109:
;IHM.c,249 :: 		tela = 1;
	MOVLW       1
	MOVWF       main_Tela_L0+0 
;IHM.c,250 :: 		Lcd_cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IHM.c,251 :: 		Alterna = 0;
	CLRF        main_Alterna_L0+0 
;IHM.c,252 :: 		controleD0 = 1;
	MOVLW       1
	MOVWF       main_controleD0_L0+0 
;IHM.c,253 :: 		}
L_main104:
;IHM.c,254 :: 		if(PORTD.RD0 == 0 && controleD0 == 1){
	BTFSC       PORTD+0, 0 
	GOTO        L_main107
	MOVF        main_controleD0_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main107
L__main108:
;IHM.c,255 :: 		controleD0 = 0;
	CLRF        main_controleD0_L0+0 
;IHM.c,256 :: 		}
L_main107:
;IHM.c,257 :: 		}
L_main101:
;IHM.c,258 :: 		}
	GOTO        L_main1
;IHM.c,259 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
