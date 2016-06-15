// Bubble cursor according to (Grossman, Balakrishnan, 2005)
//
// NEXT: ballistic cursor, trajectory cursor
//
// (c) 2016 Michael Kipp

Environment environ = new Environment();
BubbleCursor cursor = new BubbleCursor(30);
float GAP = 10; // distance to second closest target

void setup() {
  size(800, 620);
  noCursor();
  //environ.init(20, 30, 10, 60);
  environ.initGrid(50, .3);
}

void draw() {
  background(255);
  environ.update(cursor);
  cursor.update(mouseX, mouseY, environ);
}

void keyPressed() {
  if (key == ' ') {
    environ.selectOne();
  }
}