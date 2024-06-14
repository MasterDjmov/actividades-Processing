import ddf.minim.*;
// creo variables
PImage fondo, a1, a2, a3, p1, p2, p3;
PImage ob1, ob2, ob3, ob4;
//cargo las librerias de sonido y creo sus objetos
Minim minim;
AudioPlayer player;
//variables para mover el piso 1
int posX=200;
int posY=600;
int vx=2;
void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  //size(1280, 960);
  // leo textura
  fondo = loadImage("BG.png");
  a1 = loadImage("14.png");
  a2 = loadImage("15.png");
  a3 = loadImage("16.png");

  p1 = loadImage("1.png");
  p2 = loadImage("2.png");
  p3 = loadImage("3.png");

  ob1 = loadImage("Skeleton.png");
  ob2 = loadImage("Stone.png");
  ob3 = loadImage("cactus1.png");
  ob4 = loadImage("cactus2.png");
  
  // Inicializar Minim y cargar el archivo MP3
  minim = new Minim(this);
  player = minim.loadFile("musica.mp3");

  // Reproducir el archivo MP3 en bucle
  player.loop();
}

void draw() {
  // ubico imágenes
  //image(fondo, 0, 0);
  coverImage(fondo);
  // ubico el piso de forma secuencial
  image(p1, 0, height - 128);
  for (int i = 128; i < width - 128; i += 128) {
    image(p2, i, height - 128);
  }
  //ubico algunos objetos
  image(p3, width - 128, height - 128);
  image(ob1, 700, height-176);
  image(ob2, 350, height-200);

  // ubico bloques voladores
  image(a1, posX, posY); // esquina izquierda
  image(a2, posX+128, posY); // bloque de continuidad
  image(a3, posX+256, posY); // esquina derecha

  image(a1, 500, 450); // esquina izquierda
  image(a2, 628, 450); // bloque de continuidad
  image(a2, 756, 450); // bloque de continuidad
  image(a3, 884, 450); // esquina derecha
  image(ob3, 756, 360);
  image(ob4, 610, 410);

  image(a1, 800, 300); // esquina izquierda
  image(a2, 928, 300); // bloque de continuidad
  image(a3, 1056, 300); // esquina derecha

  //control de estados
  posX+=vx;
  if (posX+256+128>=width) vx=-vx;
  if (posX<=0) vx=-vx;
}
// Función para ajustar la imagen de fondo a la pantalla
void coverImage(PImage img) {
  float imgAspect = float(img.width) / float(img.height);
  float screenAspect = float(width) / float(height);
  
  if (imgAspect > screenAspect) {
    // La imagen es más ancha que la pantalla
    float newWidth = height * imgAspect;
    float x = (width - newWidth) / 2;
    image(img, x, 0, newWidth, height);
  } else {
    // La imagen es más alta que la pantalla
    float newHeight = width / imgAspect;
    float y = (height - newHeight) / 2;
    image(img, 0, y, width, newHeight);
  }
}
