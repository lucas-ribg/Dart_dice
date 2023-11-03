import 'dart:math';

class MagicDice {
  int topFace = 0;

  int roll() {
    var random = Random();
    topFace = random.nextInt(1);
    return topFace;
  }
}