
void main() {
   //VARIAVEL DE CONTROLE
   unsigned char controle;
   controle = 1;

   //REGISTRADORES

   ADCON1 = 0b00001111;  //Configura todos os pinos como digitais

   TRISB.RB0 = 1;  //Configura RB0 como entrada

   TRISD.RD0 = 0;  //Configura RD0 como sa�da
   PORTD.RD0 = 0;  //Inicializa o LED desligado

   while(1){
      //Bot�o pressionado
      if(PORTB.RB0 == 1 && controle == 1){
         //LED ligado
         if(PORTD.RD0 == 1 && controle == 1){
            PORTD.RD0 = 0;  //Desliga o LED
            controle = 0;  //Impede entrada na condi��o(Bot�o pressionado)
            Delay_ms(100);  //Intervalo de tempo
         }
         //LED desligado
         if(PORTD.RD0 == 0 && controle == 1){
            PORTD.RD0 = 1;  //Liga o LED
            controle = 0;  //Impede entrada na condi��o(Bot�o pressionado)
            Delay_ms(100);  //Intervalo de tempo
         }
      }
      
      //Bot�o n�o-pressionado
      if(PORTB.RB0 == 0 && controle == 0)
         controle = 1;  //Possibilita entrada na condi��o(Bot�o pressionado)
      }

   }