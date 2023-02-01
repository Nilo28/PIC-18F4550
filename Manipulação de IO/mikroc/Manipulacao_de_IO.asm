
_main:

;Manipulacao_de_IO.c,9 :: 		void main() {
;Manipulacao_de_IO.c,11 :: 		ControleRB0 = 0;
	CLRF        _ControleRB0+0 
;Manipulacao_de_IO.c,12 :: 		ControleRB1 = 0;
	CLRF        _ControleRB1+0 
;Manipulacao_de_IO.c,13 :: 		ControleLEDS = 1;
	MOVLW       1
	MOVWF       _ControleLEDS+0 
;Manipulacao_de_IO.c,16 :: 		ADCON1 = 0b00001111;   //Configura os pinos como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;Manipulacao_de_IO.c,18 :: 		TRISB.RB0 = 1;   //Define RB0 como entrada
	BSF         TRISB+0, 0 
;Manipulacao_de_IO.c,19 :: 		TRISB.RB1 = 1;   //Define RB1 como entrada
	BSF         TRISB+0, 1 
;Manipulacao_de_IO.c,21 :: 		TRISD = 0;   //Define a porta D como saída
	CLRF        TRISD+0 
;Manipulacao_de_IO.c,22 :: 		PORTD = 0;   //Inicializa os LEDS da porta D desligados
	CLRF        PORTD+0 
;Manipulacao_de_IO.c,24 :: 		while(1){
L_main0:
;Manipulacao_de_IO.c,26 :: 		if(PORTB.RB0 == 1 && ControleRB0 == 0){
	BTFSS       PORTB+0, 0 
	GOTO        L_main4
	MOVF        _ControleRB0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main43:
;Manipulacao_de_IO.c,27 :: 		ControleRB0 = 1;   //Impede nova entrada na condicional
	MOVLW       1
	MOVWF       _ControleRB0+0 
;Manipulacao_de_IO.c,28 :: 		ControleLEDS++;   //Adiciona 1 unidade ao valor da variável
	INCF        _ControleLEDS+0, 1 
;Manipulacao_de_IO.c,29 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;Manipulacao_de_IO.c,30 :: 		}
L_main4:
;Manipulacao_de_IO.c,31 :: 		if(PORTB.RB0 == 0 && ControleRB0 == 1){
	BTFSC       PORTB+0, 0 
	GOTO        L_main8
	MOVF        _ControleRB0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main42:
;Manipulacao_de_IO.c,32 :: 		ControleRB0 = 0;   //Permite entrada na condicional
	CLRF        _ControleRB0+0 
;Manipulacao_de_IO.c,33 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
;Manipulacao_de_IO.c,34 :: 		}
L_main8:
;Manipulacao_de_IO.c,37 :: 		if(PORTB.RB1 == 1 && ControleRB1 == 0){
	BTFSS       PORTB+0, 1 
	GOTO        L_main12
	MOVF        _ControleRB1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
L__main41:
;Manipulacao_de_IO.c,38 :: 		ControleRB1 = 1;   //Impede nova entrada na condicional
	MOVLW       1
	MOVWF       _ControleRB1+0 
;Manipulacao_de_IO.c,39 :: 		ControleLEDS--;   //Subtrai 1 unidade do valor da variável
	DECF        _ControleLEDS+0, 1 
;Manipulacao_de_IO.c,40 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
;Manipulacao_de_IO.c,41 :: 		}
L_main12:
;Manipulacao_de_IO.c,42 :: 		if(PORTB.RB1 == 0 && ControleRB1 == 1){
	BTFSC       PORTB+0, 1 
	GOTO        L_main16
	MOVF        _ControleRB1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
L__main40:
;Manipulacao_de_IO.c,43 :: 		ControleRB1 = 0;   //Permite entrada na condicional
	CLRF        _ControleRB1+0 
;Manipulacao_de_IO.c,44 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
;Manipulacao_de_IO.c,45 :: 		}
L_main16:
;Manipulacao_de_IO.c,48 :: 		if(ControleLEDS == 1){
	MOVF        _ControleLEDS+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
;Manipulacao_de_IO.c,49 :: 		PORTD = 0b00000000;   //Todos os LEDS desligados
	CLRF        PORTD+0 
;Manipulacao_de_IO.c,50 :: 		Delay_ms(100);   //Intervalo de tempo
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
;Manipulacao_de_IO.c,51 :: 		}
L_main18:
;Manipulacao_de_IO.c,52 :: 		if(ControleLEDS == 2){
	MOVF        _ControleLEDS+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
;Manipulacao_de_IO.c,53 :: 		PORTD = 0b00000001;   //LED Azul Iigado
	MOVLW       1
	MOVWF       PORTD+0 
;Manipulacao_de_IO.c,54 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
;Manipulacao_de_IO.c,55 :: 		}
L_main20:
;Manipulacao_de_IO.c,56 :: 		if(ControleLEDS == 3){
	MOVF        _ControleLEDS+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
;Manipulacao_de_IO.c,57 :: 		PORTD = 0b00000011;   //LEDS Azul e Verde Iigados
	MOVLW       3
	MOVWF       PORTD+0 
;Manipulacao_de_IO.c,58 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
	NOP
;Manipulacao_de_IO.c,59 :: 		}
L_main22:
;Manipulacao_de_IO.c,60 :: 		if(ControleLEDS == 4){
	MOVF        _ControleLEDS+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;Manipulacao_de_IO.c,61 :: 		PORTD = 0b00000111;   //LEDS Azul, Verde e Laranja Iigados
	MOVLW       7
	MOVWF       PORTD+0 
;Manipulacao_de_IO.c,62 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
;Manipulacao_de_IO.c,63 :: 		}
L_main24:
;Manipulacao_de_IO.c,64 :: 		if(ControleLEDS == 5){
	MOVF        _ControleLEDS+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main26
;Manipulacao_de_IO.c,65 :: 		PORTD = 0b00001111;   //LEDS Azul, Verde, Laranja e Rosa Iigados
	MOVLW       15
	MOVWF       PORTD+0 
;Manipulacao_de_IO.c,66 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
;Manipulacao_de_IO.c,67 :: 		}
L_main26:
;Manipulacao_de_IO.c,68 :: 		if(ControleLEDS == 6){
	MOVF        _ControleLEDS+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
;Manipulacao_de_IO.c,69 :: 		PORTD = 0b00011111;   //LEDS Azul, Verde, Laranja, Rosa e Roxo Iigados
	MOVLW       31
	MOVWF       PORTD+0 
;Manipulacao_de_IO.c,70 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	NOP
;Manipulacao_de_IO.c,71 :: 		}
L_main28:
;Manipulacao_de_IO.c,72 :: 		if(ControleLEDS == 7){
	MOVF        _ControleLEDS+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
;Manipulacao_de_IO.c,73 :: 		PORTD = 0b00111111;   //LEDS Azul, Verde, Laranja, Rosa, Roxo e Vermelho Iigados
	MOVLW       63
	MOVWF       PORTD+0 
;Manipulacao_de_IO.c,74 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
;Manipulacao_de_IO.c,75 :: 		}
L_main30:
;Manipulacao_de_IO.c,76 :: 		if(ControleLEDS == 8){
	MOVF        _ControleLEDS+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
;Manipulacao_de_IO.c,77 :: 		PORTD = 0b01111111;   //LEDS Azul, Verde, Laranja, Rosa, Roxo, Vermelho e Branco Iigados
	MOVLW       127
	MOVWF       PORTD+0 
;Manipulacao_de_IO.c,78 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	DECFSZ      R11, 1, 1
	BRA         L_main33
	NOP
;Manipulacao_de_IO.c,79 :: 		}
L_main32:
;Manipulacao_de_IO.c,80 :: 		if(ControleLEDS == 9){
	MOVF        _ControleLEDS+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
;Manipulacao_de_IO.c,81 :: 		PORTD = 0b11111111;   //Todos os LEDS ligados
	MOVLW       255
	MOVWF       PORTD+0 
;Manipulacao_de_IO.c,82 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main35:
	DECFSZ      R13, 1, 1
	BRA         L_main35
	DECFSZ      R12, 1, 1
	BRA         L_main35
	DECFSZ      R11, 1, 1
	BRA         L_main35
	NOP
;Manipulacao_de_IO.c,83 :: 		}
L_main34:
;Manipulacao_de_IO.c,84 :: 		if(ControleLEDS == 0){
	MOVF        _ControleLEDS+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main36
;Manipulacao_de_IO.c,85 :: 		ControleLEDS = 1;
	MOVLW       1
	MOVWF       _ControleLEDS+0 
;Manipulacao_de_IO.c,86 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	DECFSZ      R11, 1, 1
	BRA         L_main37
	NOP
;Manipulacao_de_IO.c,87 :: 		}
L_main36:
;Manipulacao_de_IO.c,88 :: 		if(ControleLEDS == 10){
	MOVF        _ControleLEDS+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
;Manipulacao_de_IO.c,89 :: 		ControleLEDS = 9;
	MOVLW       9
	MOVWF       _ControleLEDS+0 
;Manipulacao_de_IO.c,90 :: 		Delay_ms(100);   //Intervalo de tempo
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main39:
	DECFSZ      R13, 1, 1
	BRA         L_main39
	DECFSZ      R12, 1, 1
	BRA         L_main39
	DECFSZ      R11, 1, 1
	BRA         L_main39
	NOP
;Manipulacao_de_IO.c,91 :: 		}
L_main38:
;Manipulacao_de_IO.c,93 :: 		}
	GOTO        L_main0
;Manipulacao_de_IO.c,95 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
