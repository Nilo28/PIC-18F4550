#line 1 "C:/Users/nilof/OneDrive/Documentos/IFPI/Sistemas Embarcados/Manipulação de IO/mikroc/Manipulacao_de_IO.c"




unsigned char ControleRB0;
unsigned char ControleRB1;
unsigned char ControleLEDS;

void main() {

 ControleRB0 = 0;
 ControleRB1 = 0;
 ControleLEDS = 1;


 ADCON1 = 0b00001111;

 TRISB.RB0 = 1;
 TRISB.RB1 = 1;

 TRISD = 0;
 PORTD = 0;

 while(1){

 if(PORTB.RB0 == 1 && ControleRB0 == 0){
 ControleRB0 = 1;
 ControleLEDS++;
 Delay_ms(100);
 }
 if(PORTB.RB0 == 0 && ControleRB0 == 1){
 ControleRB0 = 0;
 Delay_ms(100);
 }


 if(PORTB.RB1 == 1 && ControleRB1 == 0){
 ControleRB1 = 1;
 ControleLEDS--;
 Delay_ms(100);
 }
 if(PORTB.RB1 == 0 && ControleRB1 == 1){
 ControleRB1 = 0;
 Delay_ms(100);
 }


 if(ControleLEDS == 1){
 PORTD = 0b00000000;
 Delay_ms(100);
 }
 if(ControleLEDS == 2){
 PORTD = 0b00000001;
 Delay_ms(100);
 }
 if(ControleLEDS == 3){
 PORTD = 0b00000011;
 Delay_ms(100);
 }
 if(ControleLEDS == 4){
 PORTD = 0b00000111;
 Delay_ms(100);
 }
 if(ControleLEDS == 5){
 PORTD = 0b00001111;
 Delay_ms(100);
 }
 if(ControleLEDS == 6){
 PORTD = 0b00011111;
 Delay_ms(100);
 }
 if(ControleLEDS == 7){
 PORTD = 0b00111111;
 Delay_ms(100);
 }
 if(ControleLEDS == 8){
 PORTD = 0b01111111;
 Delay_ms(100);
 }
 if(ControleLEDS == 9){
 PORTD = 0b11111111;
 Delay_ms(100);
 }
 if(ControleLEDS == 0){
 ControleLEDS = 1;
 Delay_ms(100);
 }
 if(ControleLEDS == 10){
 ControleLEDS = 9;
 Delay_ms(100);
 }

 }

}
