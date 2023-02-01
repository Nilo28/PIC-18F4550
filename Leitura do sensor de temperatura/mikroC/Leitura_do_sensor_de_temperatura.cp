#line 1 "C:/Users/nilof/OneDrive/Documentos/IFPI/Sistemas Embarcados/Projetos/Leitura do sensor de temperatura/mikroC/Leitura_do_sensor_de_temperatura.c"
#line 5 "C:/Users/nilof/OneDrive/Documentos/IFPI/Sistemas Embarcados/Projetos/Leitura do sensor de temperatura/mikroC/Leitura_do_sensor_de_temperatura.c"
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

 unsigned int ValorAN0;
 unsigned char ValorTemp_STR[10];
 float ValorTemp;


 TRISA.RA0 = 1;

 ADCON0 = 0b00000001;
 ADCON1 = 0b00001110;
 ADCON2 = 0b10101010;


 Lcd_init();
 Lcd_cmd(_lcd_clear);
 Lcd_cmd(_lcd_cursor_off);
 Lcd_out(1,1,"Iniciando");
 Delay_ms(500);
 Lcd_out(1,1,"Iniciando.");
 Delay_ms(500);
 Lcd_out(1,1,"Iniciando..");
 Delay_ms(500);
 Lcd_out(1,1,"Iniciando...");
 Delay_ms(500);
 Lcd_cmd(_lcd_clear);

 while(1){
 ADC_init();
 ValorAN0 = ADC_Read(0);
 ValorTemp = ValorAN0*500.0/1024.0;
 FloatToStr(ValorTemp, ValorTemp_STR);
 ValorTemp_STR[4] = 0;
 Lcd_out(1,1,"Temperatura:");
 Lcd_out(2,7, ValorTemp_STR);
 Lcd_chr(2,12,223);
 Lcd_out(2,13,"C");
 Delay_ms(100);

 }

}
