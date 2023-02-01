#line 1 "C:/Users/Edna/Documents/Nilo F/IFPI/Sistemas Embarcados/TeclaLED/TeclaLED.c"

void main() {

 unsigned char controle;
 controle = 1;



 ADCON1 = 0b00001111;

 TRISB.RB0 = 1;

 TRISD.RD0 = 0;
 PORTD.RD0 = 0;

 while(1){

 if(PORTB.RB0 == 1 && controle == 1){

 if(PORTD.RD0 == 1 && controle == 1){
 PORTD.RD0 = 0;
 controle = 0;
 Delay_ms(100);
 }

 if(PORTD.RD0 == 0 && controle == 1){
 PORTD.RD0 = 1;
 controle = 0;
 Delay_ms(100);
 }
 }


 if(PORTB.RB0 == 0 && controle == 0)
 controle = 1;
 }

 }
