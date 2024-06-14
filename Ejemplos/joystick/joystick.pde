import processing.serial.*;

Serial Puerto;
char dato;
int posX=250;
int posY=250;
void setup() {
  size(500, 500);
  String nombrePuerto = Serial.list()[0];
  Puerto = new Serial(this, nombrePuerto, 9600);
}

void draw() {
  background(255);
  fill(#8b0c73);
  circle(posX, posY, 70);

  if (keyPressed) {
    println("accion");
  }
}

void keyPressed() {
  if (key == 'a') {
    posX=posX-5;
  }
  if (keyCode == RIGHT) {
    posX+=5;
  }
}

void serialEvent(Serial puerto) {
  dato  = puerto.readChar();
  // Mover el círculo según el dato recibido
  if (dato == 'a') {
    posX -= 5; // Mover a la izquierda
  } else if (dato == 'd') {
    posX += 5; // Mover a la derecha
  } else if (dato == 'w') {
    posY -= 5; // Mover hacia arriba
  } else if (dato == 's') {
    posY += 5; // Mover hacia abajo
  }
}
