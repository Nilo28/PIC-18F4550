 //LCD
sbit LCD_RS at RB5_bit;   //Pino B5 relacionado ao pino RS
sbit LCD_EN at RB4_bit;   //Pino B4 relacionado ao pino EN
sbit LCD_D4 at RB3_bit;   //Pino B3 relacionado ao pino D4
sbit LCD_D5 at RB2_bit;   //Pino B2 relacionado ao pino D5
sbit LCD_D6 at RB1_bit;   //Pino B1 relacionado ao pino D6
sbit LCD_D7 at RB0_bit;   //Pino B0 relacionado ao pino D7

sbit LCD_RS_Direction at TRISB5_bit;   //Pino B5 envia informação para o pino RS
sbit LCD_EN_Direction at TRISB4_bit;   //Pino B4 envia informação para o pino EN
sbit LCD_D4_Direction at TRISB3_bit;   //Pino B3 envia informação para o pino D4
sbit LCD_D5_Direction at TRISB2_bit;   //Pino B2 envia informação para o pino D5
sbit LCD_D6_Direction at TRISB1_bit;   //Pino B1 envia informação para o pino D6
sbit LCD_D7_Direction at TRISB0_bit;   //Pino B0 envia informação para o pino D7



void main() {
   
   //VARIÁVEIS
   unsigned char b1;    //Variável de controle botão 1
   unsigned char b2;    //Variável de controle botão 1
   char Display;   //Variável a ser escrita
   int var;
   var = 0;
   b1 = 0;
   b2 = 0;
   


   ADCON1 |=0X0F;

   //Botões--------------------
   TRISB.RB6 = 1;   //Configura RB6 como entrada(Botão B1)
   TRISB.RB7 = 1;   //Configura RB7 como entrada(Botão B2)

   //CONFIGURAÇÕES LCD
   Lcd_Init();   //Inicializa o módulo LCD
   Lcd_Cmd(_LCD_Clear);   //Limpa o display LCD
   Lcd_Cmd(_LCD_Cursor_off);
   Lcd_Out(1,1, "Testando");

   //LOOP INFINITO
   while(1){
      Delay_ms(5000);
      //Botão B1(Incremento)
      if(PORTB.RB6 == 1 && b1 == 0){
         var++;
         b1 = 1;
         Delay_ms(100);
      }
      if(PORTB.RB6 == 0 && b1 == 1){
         b1 = 0;
         Delay_ms(100);
      }
      //Botão B2(Decremento)
      if(PORTB.RB7 == 1 && b2 == 0){
         var--;
         b2 = 1;
         Delay_ms(100);
      }
      if(PORTB.RB7 == 0 && b2 == 1){
         b2 = 0;
         Delay_ms(100);
      }
      var = Display;
      Lcd_Cmd(_LCD_Clear);   //Limpa o display LCD
      Lcd_Out(1,4, Display);   //Escreve o valor de var no display
      Delay_ms(100);


   }
   


}