class tir {
  ArrayList<Ball> bullet;
  Ball ball;
  tir() {
    bullet = new ArrayList<Ball>();
  }




  void shoot() {
    if (mousePressed && millis()%100 < 18 ) {
      bullet.add(new Ball());
    }
    for (int index = bullet.size()-1; index >= 0; index--) { 
      ball = bullet.get(index);
      ball.move();
      if (ball.finished()) {
        bullet.remove(index);
      }
    }
  }
}
