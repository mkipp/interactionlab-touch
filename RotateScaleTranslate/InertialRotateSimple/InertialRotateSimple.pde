/**
 * Simple study of inertial rotation
 * for single touch
 *
 * @author Michael Kipp
 */

float x = 50;
float y = 50;
float angle = 0;
float angSpeed = 0;
float mx = 0;
float my = 0;
PVector perp = new PVector();

void setup() {
}

void draw() {
  background(255);

  // set vector perp to center
  perp.set(mouseX - x, mouseY - y );
  perp.rotate(PI/2);

  // draw box
  translate(x, y);
  rotate(angle);
  noFill();
  rectMode(CENTER);
  stroke(0);
  rect(0, 0, 50, 40);
  angle += angSpeed;
  if (angSpeed > 0.01 ) {
    angSpeed -= .0001;
  } else if (angSpeed < -0.01) {
    angSpeed += .0001;
  } else {
    angSpeed = 0;
  }
  //angle += .01;
}

float signum(float f) {
  if (f > 0) 
    return 1;
  if (f < 0) 
    return -1;
  return 0;
}

void mousePressed() {
  mx = mouseX;
  my = mouseY;
}

void mouseReleased() {
  float dx = mouseX - mx;
  float dy = mouseY - my;
  PVector traj = new PVector(dx, dy);
  println("traj = " + traj);
  println("len = " + traj.mag());

  // project on perp
  float a = traj.dot(perp) * perp.mag();
  println("a = " + signum(a));

  angSpeed = signum(a) * traj.mag()/1000;
}