
_main:

;PiscaLED.c,1 :: 		void main() {
;PiscaLED.c,2 :: 		ADCON1 = 0b00001111;  //Configura todos os pinos como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;PiscaLED.c,4 :: 		TRISD.RD0 = 0;  //Configura RD0 como saída
	BCF         TRISD+0, 0 
;PiscaLED.c,5 :: 		PORTD.RD0 = 0;  //Inicializa o LED verde desligado
	BCF         PORTD+0, 0 
;PiscaLED.c,7 :: 		TRISD.RD1 = 0;  //Configura RD1 como saída
	BCF         TRISD+0, 1 
;PiscaLED.c,8 :: 		PORTD.RD1 = 0;  //Inicializa o LED azul desligado
	BCF         PORTD+0, 1 
;PiscaLED.c,10 :: 		while(1){
L_main0:
;PiscaLED.c,11 :: 		PORTD.RD0 = 0;  //LED verde desligado
	BCF         PORTD+0, 0 
;PiscaLED.c,12 :: 		PORTD.RD1 = 1;  //LED azul ligado
	BSF         PORTD+0, 1 
;PiscaLED.c,13 :: 		Delay_ms(1000);  //Intervalo de 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
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
;PiscaLED.c,14 :: 		PORTD.RD0 = 1;  //LED verde ligado
	BSF         PORTD+0, 0 
;PiscaLED.c,15 :: 		PORTD.RD1 = 0;  //LED azul desligado
	BCF         PORTD+0, 1 
;PiscaLED.c,16 :: 		Delay_ms(1000);  //Intervalo de 1 segundo
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
;PiscaLED.c,18 :: 		}
	GOTO        L_main0
;PiscaLED.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
