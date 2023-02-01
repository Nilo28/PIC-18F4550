//Configuração pinos do LCD
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
//Variáveis de controle
  //Botões pressionados
  unsigned char controleC0;
  unsigned char controleC1;
  unsigned char controleD0;
  
  //Diferenciar a tela
  unsigned char Tela;
  
  //Alternar opções
  unsigned char Alterna;
  
  //Indentificar opção marcada
  unsigned char T1;
  unsigned char T2;
  unsigned char T3;

  //Valores iniciais das variáveis
  tela = 1;
  controleC0 = 0;
  controleC1 = 0;
  controleD0 = 0;
  Alterna = 0;
  T1 = 0;
  T2 = 0;
  T3 = 0;


//Registradores
  ADCON1 = 0b00001111;  //Configura todos os pinos como digitais
  
  TRISC.RC0 = 1;     //Configura RC0 como entrada
  TRISC.RC1 = 1;     //Configura RC1 como entrada
  TRISD.RD0 = 1;     //Configura RD0 como entrada
  TRISA.RA0 = 0;     //Configura RA0 como saída
  TRISA.RA1 = 0;     //Configura RA1 como saída
  
  PORTA.RA0 = 0;     //Inicializa RA0 com nível baixo
  PORTA.RA1 = 0;     //Inicializa RA1 com nível baixo
  
//Configurações iniciais LCD
  Lcd_Init();                            //Inicializa o módulo LCD
  Lcd_Cmd(_LCD_Clear);                   //Limpa o display LCD
  Lcd_Cmd(_LCD_Cursor_off);              //Desabilita cursor do LCD
  Lcd_Out(1,1, "Inicializando...");      //Mensagem inicial
  Delay_ms(3000);                        //Intervalo de tempo
  Lcd_cmd(_LCD_Clear);                   //Limpa o display LCD
  Lcd_Out(1,2, "Liga");
  Lcd_Out(2,2, "Desliga");

//Loop infinito
  while(1){
    //DISPLAY LCD
    //Botão "selecionar menu"---------------------------------------------------
      //Tela LIGA e DESLIGA
      if(tela == 1){
        Lcd_Out(1,2, "Liga");
        Lcd_Out(2,2, "Desliga");
        if(PORTC.RC0 == 1 && controleC0 == 0){
          if(Alterna == 0 && controleC0 == 0){
             Lcd_Out(1,1, ">Liga    [ENTER]");
             Lcd_Out(2,1, " Desliga        ");
             Alterna = 1;
             controleC0 = 1;
             T1 = 1;
          }
          if(Alterna == 1 && controleC0 == 0){
             Lcd_Out(1,1, " Liga           ");
             Lcd_Out(2,1, ">Desliga [ENTER]");
             Alterna = 0;
             controleC0 = 1;
             T1 = 2;
          }
        }
        if(PORTC.RC0 == 0 && controleC0 == 1){
          controleC0 = 0;
        }
      }
      //Tela de escolha para Ligar LED
      if(tela == 2){
        Lcd_Out(1,11, "LED 1 ");
        Lcd_Out(2,11, "LED 2 ");
        if(PORTC.RC0 == 1 && controleC0 == 0){
          if(Alterna == 0 && controleC0 == 0){
             Lcd_cmd(_LCD_Clear);
             Lcd_Out(1,1, " Liga    >LED 1 ");
             Lcd_Out(2,1, "          LED 2 ");
             Alterna = 1;
             controleC0 = 1;
             T2 = 1;
          }
          if(Alterna == 1 && controleC0 == 0){
             Lcd_cmd(_LCD_Clear);
             Lcd_Out(1,1, "          LED 1 ");
             Lcd_Out(2,1, " Liga    >LED 2 ");
             Alterna = 0;
             controleC0 = 1;
             T2 = 2;
          }
        }
        if(PORTC.RC0 == 0 && controleC0 == 1){
          controleC0 = 0;
        }
      }
      //Tela de escolha para Desligar o LED
      if(tela == 3){
        Lcd_Out(1,11, "LED 1 ");
        Lcd_Out(2,11, "LED 2 ");
        if(PORTC.RC0 == 1 && controleC0 == 0){
          if(Alterna == 0 && controleC0 == 0){
             Lcd_cmd(_LCD_Clear);
             Lcd_Out(1,1, " Desliga >LED 1 ");
             Lcd_Out(2,1, "          LED 2 ");
             Alterna = 1;
             controleC0 = 1;
             T3 = 1;
          }
          if(Alterna == 1 && controleC0 == 0){
             Lcd_cmd(_LCD_Clear);
             Lcd_Out(1,1, "          LED 1 ");
             Lcd_Out(2,1, " Desliga >LED 2 ");
             Alterna = 0;
             controleC0 = 1;
             T3 = 2;
          }
        }
        if(PORTC.RC0 == 0 && controleC0 == 1){
          controleC0 = 0;
        }
      }
    //Botão "ENTER Menu"--------------------------------------------------------
      //Tela LIGA e DESLIGA
      if(tela == 1){
        if(PORTC.RC1 == 1 && controleC1 == 0){
          if(T1 == 1 && controleC1 == 0){
            Tela = 2;
            Alterna = 0;
            Lcd_cmd(_LCD_Clear);
            controleC1 = 1;
          }
          if(T1 == 2 && controleC1 == 0){
            Tela = 3;
            Alterna = 0;
            Lcd_cmd(_LCD_Clear);
            controleC1 = 1;
          }
        }
        if(PORTC.RC1 == 0 && controleC1 == 1){
          controleC1 = 0;
        }
      }
      //Tela de escolha para Ligar o LED
      if(tela == 2){
        if(PORTC.RC1 == 1 && controleC1 == 0){
          if(T2 == 1 && controleC1 == 0){
            PORTA.RA0 = 1;
            Lcd_cmd(_LCD_Clear);
            Lcd_Out(1,1, "   Led Ligado   ");
            Delay_ms(1000);
            Lcd_cmd(_LCD_Clear);
            controleC1 = 1;
          }
          if(T2 == 2 && controleC1 == 0){
            PORTA.RA1 = 1;
            Lcd_cmd(_LCD_Clear);
            Lcd_Out(1,1, "   Led Ligado   ");
            Delay_ms(1000);
            Lcd_cmd(_LCD_Clear);
            controleC1 = 1;
          }
        }
        if(PORTC.RC1 == 0 && controleC1 == 1){
          controleC1 = 0;
        }
      }
      //Tela de escolha para Desligar o LED
      if(tela == 3){
        if(PORTC.RC1 == 1 && controleC1 == 0){
          if(T3 == 1 && controleC1 == 0){
            PORTA.RA0 = 0;
            Lcd_cmd(_LCD_Clear);
            Lcd_Out(1,1, "  Led Desligado ");
            Delay_ms(1000);
            Lcd_cmd(_LCD_Clear);
            controleC1 = 1;
          }
          if(T3 == 2 && controleC1 == 0){
            PORTA.RA1 = 0;
            Lcd_cmd(_LCD_Clear);
            Lcd_Out(1,1, "  Led Desligado ");
            Delay_ms(1000);
            Lcd_cmd(_LCD_Clear);
            controleC1 = 1;
          }
        }
        if(PORTC.RC1 == 0 && controleC1 == 1){
          controleC1 = 0;
        }
      }
    //Botão "Retornar MENU"-----------------------------------------------------
      //Tela LIGA e DESLIGA
      if(tela == 1){
        if(PORTD.RD0 == 1 && controleD0 == 0){
          Lcd_cmd(_LCD_Clear);
          Lcd_Out(1,1, "***ERROR  404***");
          Delay_ms(1000);
          Lcd_Out(2,1, "***Resolvendo***");
          Delay_ms(2000);
          Lcd_cmd(_LCD_Clear);
          Lcd_Out(1,2, "Liga");
          Lcd_Out(2,2, "Desliga");
          controleD0 = 1;
        }
        if(PORTD.RD0 == 0 && controleD0 == 1){
          controleD0 = 0;
        }
      }
      //Tela de escolha para Ligar o LED
      if(tela == 2){
        if(PORTD.RD0 == 1 && controleD0 == 0){
          tela = 1;
          Lcd_cmd(_LCD_Clear);
          Alterna = 0;
          controleD0 = 1;
        }
        if(PORTD.RD0 == 0 && controleD0 == 1){
          controleD0 = 0;
        }
      }
      //Tela de escolha para Desligar o LED
      if(tela == 3){
        if(PORTD.RD0 == 1 && controleD0 == 0){
          tela = 1;
          Lcd_cmd(_LCD_Clear);
          Alterna = 0;
          controleD0 = 1;
        }
        if(PORTD.RD0 == 0 && controleD0 == 1){
          controleD0 = 0;
        }
      }
  }
}