
_main:

;TeclaLED.c,2 :: 		void main() {
;TeclaLED.c,5 :: 		controle = 1;
	MOVLW       1
	MOVWF       R1 
;TeclaLED.c,9 :: 		ADCON1 = 0b00001111;  //Configura todos os pinos como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;TeclaLED.c,11 :: 		TRISB.RB0 = 1;  //Configura RB0 como entrada
	BSF         TRISB+0, 0 
;TeclaLED.c,13 :: 		TRISD.RD0 = 0;  //Configura RD0 como saída
	BCF         TRISD+0, 0 
;TeclaLED.c,14 :: 		PORTD.RD0 = 0;  //Inicializa o LED desligado
	BCF         PORTD+0, 0 
;TeclaLED.c,16 :: 		while(1){
L_main0:
;TeclaLED.c,18 :: 		if(PORTB.RB0 == 1 && controle == 1){
	BTFSS       PORTB+0, 0 
	GOTO        L_main4
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main19:
;TeclaLED.c,20 :: 		if(PORTD.RD0 == 1 && controle == 1){
	BTFSS       PORTD+0, 0 
	GOTO        L_main7
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
L__main18:
;TeclaLED.c,21 :: 		PORTD.RD0 = 0;  //Desliga o LED
	BCF         PORTD+0, 0 
;TeclaLED.c,22 :: 		controle = 0;  //Impede entrada na condição(Botão pressionado)
	CLRF        R1 
;TeclaLED.c,23 :: 		Delay_ms(100);  //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;TeclaLED.c,24 :: 		}
L_main7:
;TeclaLED.c,26 :: 		if(PORTD.RD0 == 0 && controle == 1){
	BTFSC       PORTD+0, 0 
	GOTO        L_main11
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
L__main17:
;TeclaLED.c,27 :: 		PORTD.RD0 = 1;  //Liga o LED
	BSF         PORTD+0, 0 
;TeclaLED.c,28 :: 		controle = 0;  //Impede entrada na condição(Botão pressionado)
	CLRF        R1 
;TeclaLED.c,29 :: 		Delay_ms(100);  //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
;TeclaLED.c,30 :: 		}
L_main11:
;TeclaLED.c,31 :: 		}
L_main4:
;TeclaLED.c,34 :: 		if(PORTB.RB0 == 0 && controle == 0)
	BTFSC       PORTB+0, 0 
	GOTO        L_main15
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
L__main16:
;TeclaLED.c,35 :: 		controle = 1;  //Possibilita entrada na condição(Botão pressionado)
	MOVLW       1
	MOVWF       R1 
L_main15:
;TeclaLED.c,36 :: 		}
	GOTO        L_main0
;TeclaLED.c,38 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
