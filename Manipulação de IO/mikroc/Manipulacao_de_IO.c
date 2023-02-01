//RB0-->Ligar os LEDS
//RB1-->Desligar os LEDS

//Variáveis
unsigned char ControleRB0;
unsigned char ControleRB1;
unsigned char ControleLEDS;

void main() {
    //Variáveis
   ControleRB0 = 0;
   ControleRB1 = 0;
   ControleLEDS = 1;
   
   //Registradores
   ADCON1 = 0b00001111;   //Configura os pinos como digitais
   
   TRISB.RB0 = 1;   //Define RB0 como entrada
   TRISB.RB1 = 1;   //Define RB1 como entrada
   
   TRISD = 0;   //Define a porta D como saída
   PORTD = 0;   //Inicializa os LEDS da porta D desligados
   
   while(1){
      //Botão RB0
      if(PORTB.RB0 == 1 && ControleRB0 == 0){
         ControleRB0 = 1;   //Impede nova entrada na condicional
         ControleLEDS++;   //Adiciona 1 unidade ao valor da variável
         Delay_ms(100);   //Intervalo de tempo
      }
      if(PORTB.RB0 == 0 && ControleRB0 == 1){
         ControleRB0 = 0;   //Permite entrada na condicional
         Delay_ms(100);   //Intervalo de tempo
      }
      
      //Botão RB1
      if(PORTB.RB1 == 1 && ControleRB1 == 0){
         ControleRB1 = 1;   //Impede nova entrada na condicional
         ControleLEDS--;   //Subtrai 1 unidade do valor da variável
         Delay_ms(100);   //Intervalo de tempo
      }
      if(PORTB.RB1 == 0 && ControleRB1 == 1){
         ControleRB1 = 0;   //Permite entrada na condicional
         Delay_ms(100);   //Intervalo de tempo
      }
      
      //LEDS
      if(ControleLEDS == 1){
         PORTD = 0b00000000;   //Todos os LEDS desligados
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 2){
         PORTD = 0b00000001;   //LED Azul Iigado
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 3){
         PORTD = 0b00000011;   //LEDS Azul e Verde Iigados
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 4){
         PORTD = 0b00000111;   //LEDS Azul, Verde e Laranja Iigados
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 5){
         PORTD = 0b00001111;   //LEDS Azul, Verde, Laranja e Rosa Iigados
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 6){
         PORTD = 0b00011111;   //LEDS Azul, Verde, Laranja, Rosa e Roxo Iigados
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 7){
         PORTD = 0b00111111;   //LEDS Azul, Verde, Laranja, Rosa, Roxo e Vermelho Iigados
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 8){
         PORTD = 0b01111111;   //LEDS Azul, Verde, Laranja, Rosa, Roxo, Vermelho e Branco Iigados
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 9){
         PORTD = 0b11111111;   //Todos os LEDS ligados
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 0){
         ControleLEDS = 1;
         Delay_ms(100);   //Intervalo de tempo
      }
      if(ControleLEDS == 10){
         ControleLEDS = 9;
         Delay_ms(100);   //Intervalo de tempo
      }
   
   }

}