
void main() 
{
  //Configuração Timer
    T0CON = 0b01101000;          //Deslig.; 8 bits; clock ext.; borda desc.; Presc. Desabilitado
    TMR0L = 0x00;                //Inicia carga inicial 0
    T0CON.TMR0ON = 1;            //Inicia o Timer
  
  //Configuração Registradores
    ADCON1 = 0b00001111;         //Define todos os pinos como digitais
    TRISA.RA4 = 1;               //Define RA4 como entrada
    TRISD.RD0 = 0;               //Define como RD0 como saída
    PORTD.RD0 = 0;               //Inicializa desligado o LED

    
    while(1)
    {
        if(TMR0L == 0x0A)
        {
            PORTD.RD0 = 1;       //Liga o LED
            TMR0L = 0x00;        //Limpa o valor armazenado
            Delay_ms(1000);      //Espera 1s
            PORTD.RD0 = 0;       //Desliga o LED
        }
        
    }
    
}