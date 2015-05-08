class TrailDust { // this class holds the properties for the background dust (nothing special)

  float x3, y3;
  float angle = 4.0;
  float scalar = 0.01;
  float speed = 0.1;
  color colorX = color(random(255), random(255), random(255));

  TrailDust(float tempX, float tempY) {
    x3 = tempX;
    y3 = tempY;
  }
  
  // make the dust rotate/jiggle every so slightly
  
  void move() {
    x3 += cos(angle) * scalar;
    y3 += sin(angle) * scalar;
  }
  
  void display() {
    strokeWeight(1);
    stroke(colorX);
    point(x3, y3);
    angle += speed;
  }
}
