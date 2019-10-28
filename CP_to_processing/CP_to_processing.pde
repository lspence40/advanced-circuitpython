import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600);

int displayWidth = 600;
int displayHeight = 400;

void setup() {
   println("Available serial ports:");
   println(Serial.list());
   
   size(displayWidth, displayHeight);
   noStroke();
   textAlign(CENTER);
}

void draw() {
   print(myPort.available());
   if (myPort.available() > 0) {
      int power = myPort.read();
      fill(0, 0, 0);
      background(255, 255, 255);
      text(power, 300, 200);
   }
}
