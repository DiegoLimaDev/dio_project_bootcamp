class GenerateList {
  static List generateList(int num) {
    var list = List.generate(num + 1, (index) => index++);
    return list;
  }
}
