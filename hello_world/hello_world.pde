boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;
float decider = random(0, 4);
int circleSpeed = 1;

float circleX = 450;
float circleY = 180;
int circleSize = 0;
int circleChange = 1;
int circleSizeMax = 150;
int circleSizeMin = 0;

int displayWidth = 600;
int displayHeight = 400;

String words = "hello world!";
//variables

void setup() { //do once

  circleX = random(0, displayWidth); //set random starting position
  circleY = random(0, displayHeight);

  if(decider < 1) {
    right = true;
    up = true;
  } else if(decider < 2) {
    right = true;
    down = true;
  } else if(decider < 3) {
    left = true; //pick one of 4 random starting directions
    down = true;
  } else {
    left = true;
    up = true;
  }

  size(displayWidth, displayHeight);
  noStroke(); //formatting
  textAlign(CENTER);
}

void draw() { //repeat forever

  if((circleX - (circleSize / 2)) < 0)
    circleX = circleSize / 2;
  if((circleY - (circleSize / 2)) < 0)
    circleY = circleSize / 2;
  if((circleX + (circleSize / 2)) > displayWidth)  //don't go off the edge
    circleX = displayWidth - (circleSize / 2);     //not sure whay this is here because i have the bounce thing later but ok
  if((circleY + (circleSize / 2)) > displayHeight) //i don't feel like removing it
    circleY = displayHeight - (circleSize / 2);

  if(circleSize < circleSizeMin) {
    circleSize = circleSizeMin;
    circleChange = abs(circleChange);
  }
  if(circleSize > circleSizeMax) { //make the circle shrink and grow
    circleSize = circleSizeMax;
    circleChange = -abs(circleChange);
  }
  circleSize += circleChange;

  if(left)
    circleX -= circleSpeed;
  if(right)
    circleX += circleSpeed;
  if(up)
    circleY -= circleSpeed; //move the circle in the desiganated direction
  if(down)
    circleY += circleSpeed;

  if(circleY < circleSize / 2) {
    down = true;
    up = false;
  }
  if(circleY > displayHeight - circleSize / 2) {
    up = true;
    down = false;
  }
  if(circleX < circleSize / 2) { //if on edge, bounce
    right = true;
    left = false;
  }
  if(circleX > displayWidth - circleSize / 2) {
    left = true;
    right = false;
  }

  background(0, 0, 0);
  fill(255, 0, 0); //draw the circle
  ellipse(circleX, circleY, circleSize, circleSize);
  
  textSize(circleSize / 8);
  fill(0, 255, 0); //draw the text
  text(words, circleX, circleY);
}
