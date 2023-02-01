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

char i;   //Variável de controle

void main() {
   ADCON1 |=0X0F;
   
   Lcd_Init();   //Inicializa o módulo LCD
   Lcd_Cmd(_LCD_Clear);   //Limpa o display LCD
   Lcd_Out(1,7, "LCD");   //Escreve "LCD" no display
   
   while(1){
      for(i=0; i<7; i++){    //Repete 6 vezes
      Lcd_Cmd(_LCD_SHIFT_RIGHT);   //Move o texto para a direita
      Delay_ms(500);   //Intervalo de tempo
      }
      for(i=0; i<13; i++){    //Repete 12 vezes
      Lcd_Cmd(_LCD_SHIFT_LEFT);   //Move o texto para a esquerda
      Delay_ms(500);   //Intervalo de tempo
      }
      for(i=0; i<6; i++){    //Repete 5 vezes
      Lcd_Cmd(_LCD_SHIFT_RIGHT);   //Move o texto para a direita
      Delay_ms(500);   //Intervalo de tempo
      }
   
   }

}