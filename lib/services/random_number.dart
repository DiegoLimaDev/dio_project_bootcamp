import 'dart:math';

class CreateRandomNumberService {
  static int randomNumb(int maxRange) {
    Random numb = Random();
    return numb.nextInt(maxRange);
  }
}
