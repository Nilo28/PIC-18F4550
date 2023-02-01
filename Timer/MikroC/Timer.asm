
_main:

;Timer.c,2 :: 		void main()
;Timer.c,5 :: 		T0CON = 0b01101000;          //Deslig.; 8 bits; clock ext.; borda desc.; Presc. Desabilitado
	MOVLW       104
	MOVWF       T0CON+0 
;Timer.c,6 :: 		TMR0L = 0x00;                //Inicia carga inicial 0
	CLRF        TMR0L+0 
;Timer.c,7 :: 		T0CON.TMR0ON = 1;            //Inicia o Timer
	BSF         T0CON+0, 7 
;Timer.c,10 :: 		ADCON1 = 0b00001111;         //Define todos os pinos como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;Timer.c,11 :: 		TRISA.RA4 = 1;               //Define RA4 como entrada
	BSF         TRISA+0, 4 
;Timer.c,12 :: 		TRISD.RD0 = 0;               //Define como RD0 como saída
	BCF         TRISD+0, 0 
;Timer.c,13 :: 		PORTD.RD0 = 0;               //Inicializa desligado o LED
	BCF         PORTD+0, 0 
;Timer.c,16 :: 		while(1)
L_main0:
;Timer.c,18 :: 		if(TMR0L == 0x0A)
	MOVF        TMR0L+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Timer.c,20 :: 		PORTD.RD0 = 1;       //Liga o LED
	BSF         PORTD+0, 0 
;Timer.c,21 :: 		TMR0L = 0x00;        //Limpa o valor armazenado
	CLRF        TMR0L+0 
;Timer.c,22 :: 		Delay_ms(1000);      //Espera 1s
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
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
;Timer.c,23 :: 		PORTD.RD0 = 0;       //Desliga o LED
	BCF         PORTD+0, 0 
;Timer.c,24 :: 		}
L_main2:
;Timer.c,26 :: 		}
	GOTO        L_main0
;Timer.c,28 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
