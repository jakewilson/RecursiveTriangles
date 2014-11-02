Triangle[] t;

final float INF = 0.25;
final float rad = 128;

void setup() {
  size(300, 550);
  background(255);
  //drawFractal(new Triangle(new Point(width / 2, height - rad), rad));
}

void loop() {
  drawFractal(new Triangle(new Point(width / 2, height - rad), rad));
}

void drawFractal(Triangle t) {
  if (t.rad < INF) {
    t.display();
    return;
  }
  Point center = new Point(t.center.x - (t.rad / 2), t.center.y - (t.rad * 1.5));
  drawFractal(new Triangle(center, t.rad / 2));
  center = new Point(t.center.x + (t.rad / 2), center.y);
  drawFractal(new Triangle(center, t.rad / 2));
  t.display();
  millis(1000);
}

/**
  * Has the program sleep for n number of milliseconds
  */
void milliSleep(int n) {
  int start = millis();
  while (millis() - start < n); // sleep
}

/**
 * Returns a random color
 */
color randomColor() {
  return color(random(255), random(255), random(255)); 
}

class Triangle {
  
  Point left, top, right;
  Point center;
  float rad;
  color c;
  
  public Triangle(Point cen, float r, color c) {
    center = cen;
    rad    = r;
    left   = new Point(center.x - rad, center.y + rad);
    right  = new Point(center.x + rad, center.y + rad);
    top    = new Point(center.x, center.y - rad);
    this.c = c;
  }
  
  public Triangle(Point c, float r) {
    this(c, r, randomColor());
  }
  
  /**
   * Draws the triangle
   */
  void display() {
    outline();
    fill(c);
    triangle(left.x, left.y, top.x, top.y, right.x, right.y);
  }
  
  /**
   * Draws a rectangular outline around the triangle
   */
  void outline() {
    fill(255);
    rect(center.x - rad, center.y - rad, rad * 2, rad * 2);
  }
  
}

class Point {
 
  float x, y;
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y; 
  }
 
}
