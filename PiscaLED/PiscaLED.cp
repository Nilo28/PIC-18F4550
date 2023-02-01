#line 1 "C:/Users/Edna/Documents/Nilo F/IFPI/Sistemas Embarcados/PiscaLED.c"
void main() {
 ADCON1 = 0b00001111;

 TRISD.RD0 = 0;
 PORTD.RD0 = 0;

 TRISD.RD1 = 0;
 PORTD.RD1 = 0;

 while(1){
 PORTD.RD0 = 0;
 PORTD.RD1 = 1;
 Delay_ms(1000);
 PORTD.RD0 = 1;
 PORTD.RD1 = 0;
 Delay_ms(1000);

 }

}
