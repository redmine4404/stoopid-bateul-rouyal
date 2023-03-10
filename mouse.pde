
import java.awt.AWTException; // pour les erreurs système
import java.awt.Robot; // pour controller la souris

Robot robby; // invoque la classe

float xRad, yRad; // variable pour l'angle de la souris en X et Y
boolean mouseOn;

void initMouse() { // à mettre dans la setup

  try {
    robby = new Robot(); // lance la classe
  }
  catch (AWTException e) {
    println("Robot class not supported by your system!");
    exit();
  }
}

void cameraFPS() {

  translate(width/2, height/2, 500);
  rotateY(xRad);
  float cameraX = yRad * cos(xRad);
  float cameraZ = yRad * sin(xRad);
  rotateX(cameraX);
  rotateZ(cameraZ);
  translate(x, y, z);
  mouseMove();
}

void mouseMove() {
  if (mouseOn) {
    robby.mouseMove(displayWidth/2, displayHeight/2); // replace la souris au centre de l'écran
    xRad += radians( (mouseX-width/2)* 0.5); // calcul pour savoir si on est a droite ou a gauche
    yRad -= radians((mouseY-height/2)* 0.5); // calcul pour la vue haut/bas 
    yRad = constrain(yRad, -0.8, 0.8); // pour ne pas regarde ni trop bas ni trop haut
  }
}
void mousePressed() {
  mouseOn = true;
}

void viseur() {
  push();
  translate(width/2, height/2, 465);
  imageMode(CENTER);
  image(viseur, 0, 0, 5, 5);

  pop();
}
