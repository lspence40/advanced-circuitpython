import processing.serial.*;  // library

Serial myPort;  // setup serial port

int displayWidth = 360;  // set screen width and hight
int displayHeight = 460;

int pos1 = 180;
int pos2 = 180;  // variables

void setup() {  // do once
  
  size(displayWidth, displayHeight);  // set screen width and hight
  
  textSize(40);  // formatting
  
  frameRate(20);  //make program run 20 times per second

  
  println("Available serial ports:");  // setup serial ports
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
}

void draw() {  // do forever
  
  background(100, 100, 100);  // clear previous screen
  
  strokeWeight(2);
  stroke(0, 255, 0);
  line(180, 0, 180, 360);
  line(0, 180, 360, 180);
  strokeWeight(8);
  stroke(0, 0, 150);  // make boxes
  line(0, 0, 360, 0);
  line(360, 0, 360, 460);
  line(360, 360, 0, 360);
  line(0, 460, 0, 0);
  line(0, 460, 360, 460);
  
  if(mouseX >= 0 && mouseX <= 360 && mouseY >= 0 && mouseY <= 360 && mousePressed) {
    // only do if the mouse is inside the box and the mouse is being pressed
    
    pos1 = mouseX;
    pos2 = mouseY;  // set positions to send to board
  }
  
  noStroke();
  ellipse(pos1, pos2, 10, 10);  // make a circle at the place
  
  text("servo 1: " + pos1/2, 5, 400);  // so you can see what information you are sending
  text("servo 2: " + pos2/2, 5, 440);
  
  myPort.write((pos1/2) + "," + (pos2/2) + "]");  // send the information
}
