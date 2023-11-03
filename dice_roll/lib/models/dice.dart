import 'dart:math';

class Dice {
  int topFace = 1;

  int roll() {
    var random = Random();
    topFace = random.nextInt(5) + 1;
    return topFace + 1;
  }
}