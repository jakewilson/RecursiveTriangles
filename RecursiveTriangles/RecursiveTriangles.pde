Triangle[] t;

final float INF = 0.25;
final float rad = 128;

final float ABS_WIDTH  = 512;
final float ABS_HEIGHT = 512;

float iteration;
final float START_X = 0;
final float START_Y = 0;

void setup() {
  size(512, 512);
  background(255);
  frameRate(1);
  iteration = 1;
}

void draw() {
  float numTriangles = pow(2, iteration - 1);
  float w = ABS_WIDTH  / pow(2, iteration - 1);
  float h = ABS_HEIGHT / pow(2, iteration - 1);
  float leftX = START_X;
  float leftY = START_Y + h;
  for (int i = 0; i < numTriangles; i++) {
    randomFillAndStroke();
    rect(leftX, leftY - h/2, w, h/2);
    randomFillAndStroke();
    triangle(leftX, leftY, leftX + w/2, leftY - h/2, leftX + w, leftY);
    leftX += w;
  }
  if (iteration++ == 9) {
    reset();
  }
}

void randomFillAndStroke() {
 fill(random(255), random(255), random(255));
}

void reset() {
  background(255);
  iteration = 1;
}
