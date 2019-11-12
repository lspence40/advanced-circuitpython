import processing.serial.*;  // import things
Serial myPort = new Serial(this, Serial.list()[2], 9600);

int displayWidth = 600;  // set screen width and hight
int displayHeight = 400;

void setup() {  // do once
  
   println("Available serial ports:");
   printArray(Serial.list());  // check available serial ports
   
   size(displayWidth, displayHeight);  // set screen width and hight
   
   textAlign(CENTER);  // formatting
}

void draw() {  // repeat endlessly

   //print(myPort.available());  *debugging*
   
   if (myPort.available() > 0) {  // only run in data is available\
   
      float power = myPort.read();  // get data
      
      background(255, 255, 255);  // clear previos frame
      
      fill(255, 255, 255);  // make a circle
      ellipse(300, 200, 250, 250);
      
      translate(300, 200);
      rotate((((power/255)*(PI*2))*.75)+(PI/4));
      stroke(255, 0, 0);
      line(0, 0, 0, 100);  // make a line that follows where the potentiometer goes
      stroke(0, 0, 0);
      
      rotate(-1*((((power/255)*(PI*2))*.75)+(PI/4)));  // rotate back to original position
      
      rotate(-PI/4);  // go to  good starting position
      
      for(int i = 0; i < 43; i++) {
        line(0, 125, 0, 100);  // make the small lines
        rotate(-((3*PI)/2)/42);
      }
      
      for(int i = 0; i < 43; i++) {
        rotate(((3*PI)/2)/42);  // go back to starting position
      }
      
      for(int i = 0; i < 7; i++) {
        line(0, 125, 0, 140);  // make the longer black lines
        rotate(-(PI/4));
      }
      
      fill(0, 0, 0);
      textSize(20);
      text("0", -110, 110);
      text("70", -160, 10);
      text("140", -110, -110);  // make the outside numbers
      text("210", 0, -150);
      text("280", 110, -110);
      text("350", 165, 10);
      text("420", 115, 115);
      
      textSize(10);
      text(int((power/255)*420), 0, 0);  // make the small inside number
   }
}
