class Target extends Circle {
  
  boolean selected = false;

  Target(float x, float y, float diameter) {
    super(x, y, diameter);
  }

  Target(float diameter) {
    super(random(diameter/2, width-diameter/2),
    random(diameter/2, height-diameter/2),
    diameter);
  }
  
  Target(float minDia, float maxDia) {
    this(random(minDia, maxDia));
  }
  
  void render() {
    if (selected) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    stroke(#20C940);
    strokeWeight(3);
    ellipse(x, y, diameter, diameter);
  }
  
  void render(int r, int g, int b) {
    fill(r,g,b);
    stroke(#20C940);
    strokeWeight(3);
    ellipse(x, y, diameter, diameter);
  }
}