void main() {
   //REGISTRADORES
   ADCON1 = 0b00001111;  //Configura todos os pinos como digitais

   TRISD.RD0 = 0;  //Configura RD0 como saída
   PORTD.RD0 = 0;  //Inicializa o LED verde desligado

   TRISD.RD1 = 0;  //Configura RD1 como saída
   PORTD.RD1 = 0;  //Inicializa o LED azul desligado

 while(1){

    PORTD.RD0 = 0;  //LED verde desligado
    PORTD.RD1 = 1;  //LED azul ligado
    Delay_ms(1000);  //Intervalo de 1 segundo
  
    PORTD.RD0 = 1;  //LED verde ligado
    PORTD.RD1 = 0;  //LED azul desligado
    Delay_ms(1000);  //Intervalo de 1 segundo
 
 }

}