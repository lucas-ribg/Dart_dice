import 'package:dice_roll/models/dice.dart';
import 'package:dice_roll/models/magic_dice.dart';

class Player {
  double score = 0.0;
  bool magicDice = false;

  void rollDices(Dice dice1, Dice dice2, Dice dice3) {
    dice1.roll();
    dice2.roll();
    dice3.roll();
    score = dice1.topFace.toDouble() + dice2.topFace.toDouble() + dice3.topFace.toDouble();
  }

  void rollMagicDice(MagicDice dice) {
    if (magicDice == true) {
      print("Dado mágico já utilizado!");
    } else {
      dice.roll();
      if (dice.topFace == 0) {
        score = score/2;
      }
      if (dice.topFace == 1) {
        score = score*2;
      }
    }
  }
}