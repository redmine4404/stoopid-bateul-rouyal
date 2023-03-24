boolean wall, wall2;
PImage viseur, sky, sky2;

void world() {
  //background(sky);
  boxes(0, 0, 0, 5000, 5000, 5000, #FFFFFF);
  wall = false;//reset les deux hitbox en début de boucle
  wall2 = false;
  ground();
  boxes(0, 0, 500, 200/1.5, 100/1.5, 50/1.5, #521515);//boxe
  boxes(500, 0, 0, 200/1.5, 800/1.5, 50/1.5, #393DEA);//boxe
  boxes(-500, 0, 0, 200/1.5, 50/1.5, 50/1.5, #56644E);//boxe
  boxes(0, 0, -500, 200/1.5, 200/1.5, 200/1.5, #FF4603);//boxe orange
  println(wall, wall2);
}


void boxes(int xx, int yy, int zz, float h, float p, float l, color couleur) {
  push();
  translate(xx, yy, zz); // place la boxe 
  fill(couleur); // choisit une couleur
  if (-x  > xx - h/1.2  && -x  < xx + h/1.2 
    && -z > zz - l/1.2 && -z < zz + l/1.2 && -y > yy - p/1 && -y < yy + p/1 ) { // on inverse les X et Z car c'est le décors qui bouge et non le joueur
    //  fill(0); // choisit une couleur
    wall = true;
  }
  if ( -x  > xx - h/1.2  && -x  < xx + h/1.2 
    && -z > zz - l/1.2 && -z < zz + l/1.2  ) { // hitbox sans l'axe Y pour le saut, savoir si on est ou non dans l'objet
    // fill(0); // choisit une couleur
    wall2 = true;
  }
  box(h, p, l); //créer une boxe aux dimensions suivantes
  pop();
}

void ground() {
  push();
  translate(0, 100, 0);
  fill(#655D67);
  box(2000, 1, 2000);
  pop();
}
