import processing.serial.*;

Serial puerto;

void setup(){
size(400,400);
  puerto = new Serial(this,Serial.list()[0],9600);
  println("Puertos disponibles:");
  println(Serial.list());
  textSize(32);
}


void draw(){
  fill(255,0,0);
  rect(0,0,200,400);
  fill(0,255,0);
  rect(200,0,200,400);
  
  if(mouseX<=200){
     puerto.write('r');
     fill(#f7ba04);
     text("Rojo",50,200);
  }
  if(mouseX>=200){
     puerto.write('v');
     fill(255,0,0);
     text("Rojo",250,200);
  }
}
