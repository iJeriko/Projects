int A = 0;
int Sensor = A0;
int REDPIN = 10;
int r;
int FADESPEED = 1;
void setup() {
pinMode(REDPIN, OUTPUT);
Serial.begin(1200);
}

void loop() {
A = analogRead(Sensor);
Serial.println(A);
if ( A == 0)
{for (r = 0; r < 256; r++) { 
    analogWrite(REDPIN, r);
    delay(FADESPEED);
  } 
   for (r = 255; r > 0; r--) { 
    analogWrite(REDPIN, r);
    delay(FADESPEED);
   }
  
}
}
