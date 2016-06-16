// Area cursor that adjusts its size, based on the
// distance to the two closest targets.

class BubbleCursor extends Circle {

  final boolean SHOW_PROJECTION = false; 
  float prevX, prevY;

  BubbleCursor(float diameter) {
    super(0, 0, diameter);
  }

  void update(float x, float y, Environment environ) {
    this.x = x;
    this.y = y;

    // identify 2 closest targets
    Target[] closest = environ.getTwoClosest(this);
    //closest[0].render(0,255,0);
    //closest[1].render(0,255,255);

    // compute distances
    float containDistTo0 = dist(cursor.x, cursor.y, closest[0].x, closest[0].y)
      + closest[0].diameter/2;
    float intersectDistTo1 = dist(cursor.x, cursor.y, closest[1].x, closest[1].y)
      - closest[1].diameter/2 - GAP;

    // adjust cursor size
    diameter = 2 * min(containDistTo0, intersectDistTo1);

    // draw cursor
    noStroke();
    fill(150, 150, 150, 100);
    ellipse(x, y, diameter, diameter);
    stroke(0);
    strokeWeight(2);
    line(x - 5, y, x + 5, y);
    line(x, y - 5, x, y + 5);

    // draw ballistic projection
    if (SHOW_PROJECTION) {
      float scale = 5;
      float projX = x + scale*(x - prevX);
      float projY = y + scale*(y - prevY);
      strokeWeight(2);
      stroke(0, 0, 255);
      line(x, y, projX, projY);
    }

    float smooth = .8;
    prevX = smooth * prevX + (1-smooth) * x;
    prevY = smooth * prevY + (1-smooth) * y;
  }
}