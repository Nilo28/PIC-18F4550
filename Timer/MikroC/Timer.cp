#line 1 "C:/Users/nilof/OneDrive/Documentos/IFPI/Sistemas Embarcados/Projetos/Timer/MikroC/Timer.c"

void main()
{

 T0CON = 0b01101000;
 TMR0L = 0x00;
 T0CON.TMR0ON = 1;


 ADCON1 = 0b00001111;
 TRISA.RA4 = 1;
 TRISD.RD0 = 0;
 PORTD.RD0 = 0;


 while(1)
 {
 if(TMR0L == 0x0A)
 {
 PORTD.RD0 = 1;
 TMR0L = 0x00;
 Delay_ms(1000);
 PORTD.RD0 = 0;
 }

 }

}
