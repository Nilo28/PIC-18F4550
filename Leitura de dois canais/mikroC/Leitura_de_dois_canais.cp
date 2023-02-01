#line 1 "C:/Users/nilof/OneDrive/Documentos/IFPI/Sistemas Embarcados/Projetos/Leitura de dois canais/mikroC/Leitura_de_dois_canais.c"
#line 7 "C:/Users/nilof/OneDrive/Documentos/IFPI/Sistemas Embarcados/Projetos/Leitura de dois canais/mikroC/Leitura_de_dois_canais.c"
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
 unsigned int ValorAN1;
 float TensaoAN0;
 float TensaoAN1;
 unsigned char TensaoAN0_STR[10];
 unsigned char TensaoAN1_STR[10];


 TRISA.RA0 = 1;
 TRISA.RA1 = 1;

 ADCON0 = 0b00000001;

 ADCON1 = 0b00001101;
 ADCON2 = 0b10101010;


 Lcd_init();
 Lcd_cmd(_lcd_clear);
 Lcd_cmd(_lcd_cursor_off);
 Lcd_out(1,1,"Iniciando.");
 Delay_ms(500);
 Lcd_out(1,1,"Iniciando..");
 Delay_ms(500);
 Lcd_out(1,1,"Iniciando...");
 Delay_ms(500);
 Lcd_cmd(_lcd_clear);
 Lcd_out(1,1,"AN0:");
 Lcd_out(2,1,"AN1:");


 while(1){

 ADCON0 = 0b00000011;
 while(ADCON0.GO_DONE == 1);

 ValorAN0 = ((ADRESH << 8) | (int)ADRESL);
 TensaoAN0 = ValorAN0*5.5/1023.0;
 FloatToStr(TensaoAN0, TensaoAN0_STR);
 TensaoAN0_STR[4] = 0;
 Lcd_out(1,5, TensaoAN0_STR);
 Delay_ms(50);


 ADCON0 = 0b00000111;
 while(ADCON0.GO_DONE == 1);

 ValorAN1 = ((ADRESH << 8) | (int)ADRESL);
 TensaoAN1 = ValorAN1*5.5/1023.0;
 FloatToStr(TensaoAN1, TensaoAN1_STR);
 TensaoAN1_STR[4] = 0;
 Lcd_out(2,5, TensaoAN1_STR);
 Delay_ms(50);

 }

}
