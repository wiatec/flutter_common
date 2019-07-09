class CommonFile{

  static const sizeUnits = ["GB", "MB", "KB", "B"];


  /// format size to str
  /// eg 1MB
  static String strSize(int size) {
    int idx = 3;
    int r1 = 0;
    String result = "";
    while (idx >= 0) {
      int s1 = size % 1024;
      size = size >> 10;
      if (size == 0 || idx == 0) {
        r1 = (r1 * 100) ~/ 1024;
        if (r1 > 0) {
          if (r1 >= 10)
            result = "$s1.$r1${sizeUnits[idx]}";
          else
            result = "$s1.0$r1${sizeUnits[idx]}";
        } else
          result = s1.toString() + sizeUnits[idx];
        break;
      }
      r1 = s1;
      idx--;
    }
    return result;
  }
}