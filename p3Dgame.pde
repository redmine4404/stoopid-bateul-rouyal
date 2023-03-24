tir t;

void setup() {
  noCursor();
  //size(800, 600, P3D); // size stable
  fullScreen(P3D); //souris stable mais caméra très buggée
  viseur = loadImage("costume3.png");
 // sky = loadImage("sky.JPG");
 // sky.resize(width, height);
  initMouse();
  t = new tir();
  //pointLight(255, 255, 255, 500, -1000, 500);
}


void draw() {
  println(sautTime, saut);
  push();
  cameraFPS();//------- caméra ---
  world(); //------- le monde ---
  move();  //------- mouvement ---
  t.shoot(); //------- tirer ---
  pop();
  viseur(); //------- le viseur ---
}
