abstract class Circle {
  float x;
  float y;
  float diameter;
  
  Circle(float x, float y, float diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }

  float getIntersectingDist(Circle other) {
    return dist(x, y, other.x, other.y) - diameter/2
      - other.diameter/2;
  }

  boolean hasMinDist(Circle other, float d) {
    return getIntersectingDist(other) > d;
  }

  boolean collides(Circle other) {
    return getIntersectingDist(other) < 0;
  }
}