import controlP5.*;

ControlP5 cp5;

boolean toggleValue = false;
boolean play = false;

// Estados Possíveis
final int OFF = 0;
final int ON = 1;

int estado = 0;

float angle;
float x;
PImage disc;


void setup() {
  size(600, 400);
  translate(0, 0);
  fill(255);
  imageMode(CENTER);
  rectMode(CENTER);
  disc = loadImage("disc.png");

  cp5 = new ControlP5(this);

  cp5.addToggle("toggleValue")
    .setPosition(490, 200)
    .setSize(50, 20)
    .setLabel("ON/OFF")
    ;

  cp5.addButton("play")
    .setValue(0)
    .setPosition(440, 240)
    .setSize(100, 50)
    .setLabel("Play/Pause")
    ;
}

void draw() {
  println(play, estado);
  MEF();
  background(50);
  pushMatrix();
  desenhaLED();

  desenhaDisco();

  popMatrix();
}

void desenhaDisco() {
  translate(200, 200);
  rotate(angle);
  image(disc, 0, 0, 350, 350);
  angle += x;
}

void desenhaLED() {
  if (estado==0) {
    fill(255, 0, 0);
  } else if (estado == 1) {
    fill(0, 255, 0);
  }

  noStroke();
  ellipse(450, 210, 20, 20);
}


void MEF() {
  if (toggleValue == false) {
    estado = OFF;
    play = false;
  }

  if (toggleValue == true) {
    estado = ON;
  }
  
  if (estado == 1 && play == true)
    x = 0.1;
  
  if (play == false)
    x = 0.0;

}

public void play() {
  if(estado == 1 && play == false)
    play = true;
  else if(estado == 1 && play == true)
    play = false;
}
