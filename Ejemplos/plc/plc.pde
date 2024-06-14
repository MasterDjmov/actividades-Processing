// Variables para emulación de datos
int piezasProducidas = 0;
float velocidadProduccion = 0.0;
String estadoMaquina = "Operativa";

// Configuración inicial
void setup() {
  size(800, 600);
  textSize(20);
  frameRate(1); // Actualización de datos una vez por segundo
}

// Bucle principal de dibujo
void draw() {
  background(255);
  
  // Emulación de actualización de datos desde el PLC
  emularDatosPLC();
  
  // Mostrar datos en la pantalla
  fill(0);
  text("Monitorización de Producción en Tiempo Real", 20, 40);
  
  text("Piezas Producidas: " + piezasProducidas, 20, 100);
  text("Velocidad de Producción: " + velocidadProduccion + " piezas/segundo", 20, 150);
  text("Estado de la Máquina: " + estadoMaquina, 20, 200);
}

// Función para emular datos del PLC
void emularDatosPLC() {
  // Emular aumento de piezas producidas
  piezasProducidas += int(random(1, 5));
  
  // Emular cambio en la velocidad de producción
  velocidadProduccion = random(0.5, 2.0);
  
  // Emular cambio en el estado de la máquina
  float randomEstado = random(0, 1);
  if (randomEstado < 0.8) {
    estadoMaquina = "Operativa";
  } else if (randomEstado < 0.9) {
    estadoMaquina = "Mantenimiento";
  } else {
    estadoMaquina = "Parada";
  }
}
