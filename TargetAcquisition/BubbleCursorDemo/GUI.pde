class GUI {
  
  int initialTime;
  int time;
  float interval;
  String currentTime;
  boolean updateTime;
  
  int xpos;
  int ypos;
  
  void init() {
    initialTime = millis();
    interval = 1000;
    updateTime = true;
    
    xpos = 30;
    ypos = 30;
  }
  
  void update() {
    if (updateTime) {
      currentTime = nf( (millis() - initialTime) / interval, 1, 1);
    }
    
    textSize(30);
    fill(0);
    text(currentTime, xpos, ypos);
  }
  
  void reset() {
    updateTime = true;
    initialTime = millis();
  }
  
  void stopTime(DataPrinter dataPrinter) {
    updateTime = false;
    dataPrinter.printData(currentTime);
  }
}
