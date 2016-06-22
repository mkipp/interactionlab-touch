class DataPrinter {
  PrintWriter output;
  
  DataPrinter(String path) {
    output = createWriter(path);
  }
  
  void printData(String data) {
    output.println(data);
  }
  
  void saveData() {
    output.flush();
    output.close();
  }
}
