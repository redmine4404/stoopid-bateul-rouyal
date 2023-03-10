tir t;

void setup() {
  noCursor();
  size(800, 600, P3D);
  //fullScreen(P3D);
  viseur = loadImage("costume3.png");
 // sky = loadImage("sky.JPG");
 // sky.resize(width, height);
  initMouse();
  t = new tir();
  //pointLight(255, 255, 255, 500, -1000, 500);
}


void draw() {

  if (keyPressed && key == 'a') {
    // pointLight(255, 0, 0, 500, -1000, 500);
  } else {

    //pointLight(255, 255, 255, 500, -1000, 500);
  }

  // directionalLight(0, 255, 255, -x, -y, -1);


  push();
  cameraFPS();//------- caméra ---
  world(); //------- le monde ---
  move();  //------- mouvement ---
  t.shoot(); //------- tirer ---
  pop();
  viseur(); //------- le viseur ---
}
