public class DisposeHandler {
  
  DisposeHandler(PApplet pa, DataPrinter dataPrinter) {
    pa.registerMethod("dispose", this);
  }
  
  public void dispose() {
    println("Closing sketch");
    dataPrinter.saveData();
  }
}
