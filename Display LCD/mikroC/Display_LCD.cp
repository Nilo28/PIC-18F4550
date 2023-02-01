#line 1 "C:/Users/nilof/OneDrive/Documentos/IFPI/Sistemas Embarcados/Projetos/Display LCD/Display_LCD.c"

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

char i;

void main() {
 ADCON1 |=0X0F;

 Lcd_Init();
 Lcd_Cmd(_LCD_Clear);
 Lcd_Out(1,7, "LCD");

 while(1){
 for(i=0; i<7; i++){
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(500);
 }
 for(i=0; i<13; i++){
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 Delay_ms(500);
 }
 for(i=0; i<6; i++){
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(500);
 }

 }

}
