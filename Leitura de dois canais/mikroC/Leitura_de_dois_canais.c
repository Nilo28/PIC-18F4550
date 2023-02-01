/*  Informações
    RA0/AN0 -> Primeiro sinal/Linha 1 LCD
    RA1/AN1 -> Segundo sinal/Linha 2 LCD
*/

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
    unsigned int ValorAN1;
    float TensaoAN0;
    float TensaoAN1;
    unsigned char TensaoAN0_STR[10];
    unsigned char TensaoAN1_STR[10];
  
  //Registradores
    TRISA.RA0 = 1;   //Configura RA0/AN0 como entrada
    TRISA.RA1 = 1;   //Configura RA1/AN1 como entrada
    
    ADCON0 = 0b00000001;   //Habilita ADC, Configura como AN0
    /*ADCON0 = 0b00000101    Habilita ADC, Configura como AN1*/
    ADCON1 = 0b00001101;   //Habilita tensão de referência interna, Configura apenas AN0 e AN1 como analógicos
    ADCON2 = 0b10101010;   //Justifica à direita, Fosc/32
    
  //Configurações Display LCD
    Lcd_init();                     //Inicializa o Display LCD
    Lcd_cmd(_lcd_clear);            //Limpa o Display LCD
    Lcd_cmd(_lcd_cursor_off);       //Desliga o cursor do Display LCD
    Lcd_out(1,1,"Iniciando.");    //Mensagem inicial do Display LCD
    Delay_ms(500);                 //Intervalo de tempo
    Lcd_out(1,1,"Iniciando..");    //Mensagem inicial do Display LCD
    Delay_ms(500);                 //Intervalo de tempo
    Lcd_out(1,1,"Iniciando...");    //Mensagem inicial do Display LCD
    Delay_ms(500);                 //Intervalo de tempo
    Lcd_cmd(_lcd_clear);            //Limpa o Display LCD
    Lcd_out(1,1,"AN0:");            //Informação inicial da linha 1 do Display LCD
    Lcd_out(2,1,"AN1:");            //Informação inicial da linha 2 do Display LCD
  
  //Loop infinito
    while(1){
      //AN0
        ADCON0 = 0b00000011;                        //Inicializa a conversão do pino AN0
        while(ADCON0.GO_DONE == 1);                 //Espera terminar a conversão
      
        ValorAN0 = ((ADRESH << 8) | (int)ADRESL);   //Escreve o valor digital na variável
        TensaoAN0 = ValorAN0*5.5/1023.0;            //Calculo Tensão AN0
        FloatToStr(TensaoAN0, TensaoAN0_STR);        //Transforma o valor da variável de 'int' para 'char'
        TensaoAN0_STR[4] = 0;                       //Limpa casas decimais
        Lcd_out(1,5, TensaoAN0_STR);                //Escreve o valor da variável 'char' no Display LCD
        Delay_ms(50);                               //Intervalo de tempo

      //AN1
        ADCON0 = 0b00000111;                        //Inicializa a conversão do pino AN1
        while(ADCON0.GO_DONE == 1);                 //Espera terminar a conversão

        ValorAN1 = ((ADRESH << 8) | (int)ADRESL);   //Escreve o valor digital na variável
        TensaoAN1 = ValorAN1*5.5/1023.0;            //Cálculo Tensão AN1
        FloatToStr(TensaoAN1, TensaoAN1_STR);       //Transforma o valor da variável de 'int' para 'char'
        TensaoAN1_STR[4] = 0;                       //Limpa casas decimais
        Lcd_out(2,5, TensaoAN1_STR);                //Escreve o valor da variável 'char' no Display LCD
        Delay_ms(50);                               //Intervalo de tempo
      
    }
  
}
