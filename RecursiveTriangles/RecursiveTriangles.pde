Triangle[] t;

final float INF = 0.25;

void setup() {
  size(600, 600);
  float rad = 128;
  background(255);
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
}

class Triangle {
  
  Point left, top, right;
  Point center;
  float rad;
  color c;
  
  public Triangle(Point c, float r) {
    center = c;
    rad    = r;
    left   = new Point(center.x - rad, center.y + rad);
    right  = new Point(center.x + rad, center.y + rad);
    top    = new Point(center.x, center.y - rad);
  }
  
  /**
   * Draws the triangle
   */
  void display() {
    fill(c);
    triangle(left.x, left.y, top.x, top.y, right.x, right.y);
  }
  
  /**
   * Draws a rectangular outline around the triangle
   */
  void outline() {
    fill(255);
//    rect();
  }
  
}

class Point {
 
  float x, y;
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y; 
  }
 
}
