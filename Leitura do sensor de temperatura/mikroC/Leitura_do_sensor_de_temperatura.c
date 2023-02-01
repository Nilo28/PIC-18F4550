/*Informações
  RA0/AN0 -> Sensor de temperatura */

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
  //Variáveis
    unsigned int ValorAN0;
    unsigned char ValorTemp_STR[10];
    float ValorTemp;
  
  //Registradores
    TRISA.RA0 = 1;   //Configura RA0 como entrada

    ADCON0 = 0b00000001;   //Habilita ADC, Configura como AN0
    ADCON1 = 0b00001110;   //Habilita tensão de referência interna, Configura apenas AN0 como analógico
    ADCON2 = 0b10101010;   //Justifica à direita, Fosc/32

  //Configurações Módulo LCD
    Lcd_init();                     //Inicializa o módulo LCD
    Lcd_cmd(_lcd_clear);            //Limpa o Display LCD
    Lcd_cmd(_lcd_cursor_off);       //Desliga o cursor do Display LCD
    Lcd_out(1,1,"Iniciando");       //Mensagem inicial do Display LCD
    Delay_ms(500);                  //Intervalo de tempo
    Lcd_out(1,1,"Iniciando.");      //Mensagem inicial do Display LCD
    Delay_ms(500);                  //Intervalo de tempo
    Lcd_out(1,1,"Iniciando..");     //Mensagem inicial do Display LCD
    Delay_ms(500);                  //Intervalo de tempo
    Lcd_out(1,1,"Iniciando...");    //Mensagem inicial do Display LCD
    Delay_ms(500);                  //Intervalo de tempo
    Lcd_cmd(_lcd_clear);            //Limpa o Display LCD

    while(1){
        ADC_init();                                //Inicializa o módulo ADC
        ValorAN0 = ADC_Read(0);                    //Escreve na váriável o valor da leitura
        ValorTemp = ValorAN0*500.0/1024.0;         //Valor temperaura
        FloatToStr(ValorTemp, ValorTemp_STR);      //Transforma o valor da variável de 'int' para 'char'
        ValorTemp_STR[4] = 0;
        Lcd_out(1,1,"Temperatura:");
        Lcd_out(2,7, ValorTemp_STR);               //Escreve o valor da variável 'char' no Display LC
        Lcd_chr(2,12,223);
        Lcd_out(2,13,"C");
        Delay_ms(100);

    }

}