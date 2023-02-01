#line 1 "C:/Users/nilof/OneDrive/Documentos/IFPI/Sistemas Embarcados/Projetos/Displa/Display_LCD_Button.c"

sbit LCD_RS at RB5_bit;
sbit LCD_EN at RB4_bit;
sbit LCD_D4 at RB3_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D6 at RB1_bit;
sbit LCD_D7 at RB0_bit;

sbit LCD_RS_Direction at TRISB5_bit;
sbit LCD_EN_Direction at TRISB4_bit;
sbit LCD_D4_Direction at TRISB3_bit;
sbit LCD_D5_Direction at TRISB2_bit;
sbit LCD_D6_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB0_bit;



void main() {


 unsigned char b1;
 unsigned char b2;
 char Display;
 int var;
 var = 0;
 b1 = 0;
 b2 = 0;



 ADCON1 |=0X0F;


 TRISB.RB6 = 1;
 TRISB.RB7 = 1;


 Lcd_Init();
 Lcd_Cmd(_LCD_Clear);
 Lcd_Cmd(_LCD_Cursor_off);
 Lcd_Out(1,1, "Testando");


 while(1){
 Delay_ms(5000);

 if(PORTB.RB6 == 1 && b1 == 0){
 var++;
 b1 = 1;
 Delay_ms(100);
 }
 if(PORTB.RB6 == 0 && b1 == 1){
 b1 = 0;
 Delay_ms(100);
 }

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
 Lcd_Cmd(_LCD_Clear);
 Lcd_Out(1,4, Display);
 Delay_ms(100);


 }



}
