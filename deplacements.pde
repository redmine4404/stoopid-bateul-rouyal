int x, y, z, sautTime;
int lastX, lastZ, lastY;

boolean up, left, down, right, saut;




void move() {

  if (wall) { // si un objet est touché alors revenir à la dernière position enregistrée
    x = lastX;
    z = lastZ;
    y = lastY;
  } else {
    lastX = x;
    lastZ = z;
    lastY = y;
  }



  if (up) {
    x -=  sin(xRad) * 10; // oriente le déplacement suivant la caméra
    z +=  cos(xRad) * 10; // oriente le déplacement suivant la caméra
  }

  if (left) {
    x += 5 * sin(xRad + PI/2); // oriente le déplacement suivant la caméra + un quart de tour pour se déplacer de coté
    z -= 5 * cos(xRad + PI/2);// oriente le déplacement suivant la caméra + un quart de tour pour se déplacer de coté
  }
  if (right) {
    x -= 5 * sin(xRad + PI/2);// oriente le déplacement suivant la caméra + un quart de tour pour se déplacer de coté
    z += 5 * cos(xRad + PI/2);// oriente le déplacement suivant la caméra + un quart de tour pour se déplacer de coté
  }
  if (down) {
    x += 5 * sin(xRad); // oriente le déplacement suivant la caméra mais dans le sens inverse
    z -= 5 * cos(xRad); // oriente le déplacement suivant la caméra mais dans le sens inverse
  }
  saut();
}

void saut () {
  if ( y>0 && !saut && !wall2) { // si ne touche pas le sol et ne saute pas et n'est pas dans la zone du cube.
    saut = true; //lancer le saut
    sautTime = 25; // pour tomber directement
  }
  if (saut && sautTime < 50 ) { // saut en deux phase d'abord monter puis tomber
    sautTime++;
    if ( y>=0)y += 25 - sautTime; // tomber/sauter uniquement si on est au dessus du sol ou sur le sol
  }

  if (saut && sautTime == 50 ) { //quand le saut arrive a son terme, reset les variables, si touche la box alors ne pas reset Y.
    sautTime =0;
    saut = false;
    if (!wall)y = 0;
  }
}


void keyPressed() {

  if (key == 'z') {
    up = true;
  }

  if (key == 'q') {
    left = true;
  }
  if (key == 's') {
    down = true;
  }
  if (key == 'd') {
    right = true;
  }
  if (key == ' ') {
    saut = true;
  }
}


void keyReleased() {

  if (key == 'z') {
    up = false;
  }

  if (key == 'q') {
    left = false;
  }
  if (key == 's') {
    down = false;
  }
  if (key == 'd') {
    right = false;
  }
}
