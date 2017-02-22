int basef=3;
int baser=4;
int wristf=5;
int wristr=6;
int inByte=0;

void setup()
{
 Serial.begin(9600);
 pinMode(3,OUTPUT);
pinMode(4,OUTPUT); 
pinMode(5,OUTPUT);
pinMode(6,OUTPUT);
}


void loop()
{
 // delay(30000);
  
  if(Serial.available()>0)//change made:included 0 
  {
    inByte=Serial.read();
       if(inByte=='R')
       {
         Serial.println('red');
          
  digitalWrite(5,LOW);digitalWrite(6,HIGH);//go down to pick//
  delay(9500);
  digitalWrite(5,LOW);digitalWrite(6,LOW);//stay//
  delay(3000);//suction delay//
  
  digitalWrite(5,HIGH);digitalWrite(6,LOW);//come up after pickin//
  delay(9500);
  digitalWrite(5,LOW);digitalWrite(6,LOW);//STAY//
  delay(100);
  
  digitalWrite(3,LOW);digitalWrite(4,HIGH);//ROTATE TO DROP//
  delay(500);
  digitalWrite(3,LOW);digitalWrite(4,LOW);//STAY//
  delay(100);
  
  digitalWrite(5,LOW);digitalWrite(6,HIGH);//go down to drop//
  delay(6000);
  digitalWrite(5,LOW);digitalWrite(6,LOW);//stay//
  delay(3000);//suction delay//
  
  digitalWrite(5,HIGH);digitalWrite(6,LOW);//come up after dropin//
  delay(7000);
  digitalWrite(5,LOW);digitalWrite(6,LOW);//STAY//
  delay(100);
  
  digitalWrite(3,HIGH);digitalWrite(4,LOW);//ROTATE TO lift//
  delay(500);
  digitalWrite(3,LOW);digitalWrite(4,LOW);//STAY//
  delay(100);
  
}

else if(inByte=='B')
       {
         Serial.println('blue');
          
  digitalWrite(5,LOW);digitalWrite(6,HIGH);//go down to pick//
  delay(9500);
  digitalWrite(5,LOW);digitalWrite(6,LOW);//stay//
  delay(2000);//suction delay//
  
  digitalWrite(5,HIGH);digitalWrite(6,LOW);//come up after pickin//
  delay(9500);
  digitalWrite(5,LOW);digitalWrite(6,LOW);//STAY//
  delay(100);
  
  digitalWrite(3,HIGH);digitalWrite(4,LOW);//ROTATE TO DROP//
  delay(500);
  digitalWrite(3,LOW);digitalWrite(4,LOW);//STAY//
  delay(100);
  
   digitalWrite(5,LOW);digitalWrite(6,HIGH);//go down to drop//
  delay(6000);
  digitalWrite(5,LOW);digitalWrite(6,LOW);//stay//
  delay(2000);//suction delay//
  
  digitalWrite(5,HIGH);digitalWrite(6,LOW);//come up after dropin//
  delay(6000);
  digitalWrite(5,LOW);digitalWrite(6,LOW);//STAY//
  delay(100);
  
  digitalWrite(3,LOW);digitalWrite(4,HIGH);//ROTATE TO lift//
  delay(500);
  digitalWrite(3,LOW);digitalWrite(4,LOW);//STAY//
  delay(100);
  
}
  }}
 
