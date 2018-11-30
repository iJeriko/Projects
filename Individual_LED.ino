int REDPIN = 10;
int r;
int FADESPEED = 1;
void setup() {
pinMode(REDPIN, OUTPUT);
}

void loop() {
  for (r = 0; r < 256; r++) { 
    analogWrite(REDPIN, r);
    delay(FADESPEED);
  } 
   for (r = 255; r > 0; r--) { 
    analogWrite(REDPIN, r);
    delay(FADESPEED);
   }

}
