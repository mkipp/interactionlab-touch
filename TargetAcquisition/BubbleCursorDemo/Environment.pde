// Represents targets

class Environment {
  
  GUI gui = new GUI();
  ArrayList<Target> targets  = new ArrayList<Target>();
  ArrayList<Target> collisionHistory = new ArrayList<Target>();
  int collisions = 0;

  void init(int numTargets, float minDist, 
    float minDia, float maxDia) {
    gui.init();
    for (int i = 0; i < numTargets; i++) {
      Target tar = new Target(minDia, maxDia);
      while (! hasMinDist(tar, minDist)) {
        tar = new Target(minDia, maxDia);
      }
      targets.add(tar);
    }
  }

  void initGrid(float dia, float density) {
    int columns = (int) (width / (dia * 1.5));
    int rows = (int) (height / (dia * 1.5));

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < columns; c++) {
        if (random(1) < density) {
          float x = dia + c * dia * 1.5;
          float y = dia + r * dia * 1.5;
          targets.add(new Target(x, y, dia));
        }
      }
    }
  }

  Target[] getTwoClosest(Circle cursor) {
    Target closest = targets.get(0);
    Target secClosest = null;

    float closestDist = 
      dist(cursor.x, cursor.y, closest.x, closest.y) - closest.diameter/2;
    float secClosestDist = 10000;

    for (int i = 1; i < targets.size(); i++) {
      Target current = targets.get(i);
      float currentDist = 
        dist(cursor.x, cursor.y, current.x, current.y) - current.diameter/2;
      if (currentDist < closestDist) {

        // current target is closest
        secClosest = closest;
        secClosestDist = closestDist;
        closest = current;
        closestDist = currentDist;
      } else if (currentDist < secClosestDist) {

        // current target is closer than second closest
        secClosest = current;
        secClosestDist = currentDist;
      }
    }

    Target[] result = {closest, secClosest};
    return result;
  }

  boolean hasMinDist(Circle tar, float minDist) {
    boolean result = true;
    for (Circle other : targets) {
      if (!tar.hasMinDist(other, minDist)) {
        result = false;
      }
    }
    return result;
  }

  void update(BubbleCursor cursor, DataPrinter dataPrinter) {
    gui.update();
    for (Target target : targets) {
      if (cursor.collides(target)) {
        if (!collisionHistory.contains(target)) {
          collisionHistory.add(target);
          if (target.selected) {
            target.selected = false;
            collisionHistory.clear();
            println("HIT");
            gui.stopTime(dataPrinter);
          } else {
            collisions++;
            println("collisions = " + collisions);
          }
        }
        target.render(0, 0, 255);
      } else {
        target.render();
      }
    }
  }

  void reset() {
    for (Target target : targets) {
      target.selected = false;
    }
  }

  void selectOne() {
    reset();
    gui.reset();
    int sel = (int)random(targets.size());
    targets.get(sel).selected = true;
    collisions = 0;
  }
}
