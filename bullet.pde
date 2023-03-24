
class Ball {

  float xS, yS, zS;
  float dirX, dirZ;

  int range = 100; // durée du trajet en frame

  Ball() {
    xS = -x; // inverser les valeurs car c'est le monde qui bouge et non le joueur
    yS = -y;
    zS = -z;
    dirX = xRad; // on récupère l'angle de la souris
    dirZ = yRad;
  }

  void move() {
    push();
    translate(xS, yS, zS); // déplace la balle sur 3 dimensions
    fill(255, 0, 0);
    noStroke();
    sphere(10);
    pop();
    xS +=  sin(dirX) * 40; // oriente le déplacement suivant l'inverse de la caméra
    zS -=  cos(dirX) * 40; // oriente le déplacement suivant l'inverse de la caméra
    yS -=  sin(dirZ) * 40; // oriente le déplacement suivant l'inverse de la caméra

    range--;
  }

  boolean finished() { // quand la balle finit son trajet elle est supprimée
    if (range <0 ) {
      return true;
    } else {
      return false;
    }
  }
}
