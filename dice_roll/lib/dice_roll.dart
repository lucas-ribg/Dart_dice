import 'dart:io';

import 'package:dice_roll/models/dice.dart';
import 'package:dice_roll/models/magic_dice.dart';
import 'package:dice_roll/models/player.dart';

void main() {
  int userWins = 0;
  int computerWins = 0;
  int ties = 0;
  int rounds = 0;
  Dice dice1 = Dice();
  Dice dice2 = Dice();
  Dice dice3 = Dice();
  MagicDice magicDice = MagicDice();
  Player player = Player();
  Player computer = Player();

  print("\n==============================");
  print("Bem vindo ao jogo de dados! :)");
  print("==============================\n");

  print("Quantas rodadas você deseja jogar? Digite o número de rodadas: ");
  rounds = int.parse(stdin.readLineSync()!);

  for (var round = 1; round <= rounds; round++) {
    print('\nRodada $round:');

    player.rollDices(dice1, dice2, dice3);
    print('Você rolou: \ndado 1: ${dice1.topFace} \ndado 2: ${dice2.topFace} \ndado 3: ${dice3.topFace}');
    computer.rollDices(dice1, dice2, dice3);
    print('Computador rolou: \ndado 1: ${dice1.topFace} \ndado 2: ${dice2.topFace} \ndado 3: ${dice3.topFace}');

    print('Soma dos seus dados: ${player.score}');
    print('Soma dos dados do computador: ${computer.score}\n');

    if (player.magicDice != true) {
      print("Você gostaria de utilizar o dado mágico? ;) Digite 'S' ou 'N'");
      String useMagicDice = stdin.readLineSync()!;
      if (useMagicDice == 'S' || useMagicDice == 's') {
        player.magicDice = true;
        player.rollMagicDice(magicDice);
        print('\nVocê rolou: \ndado mágico: ${magicDice.topFace} \n');
        
        print('Soma dos seus dados: ${player.score}');
        print('Soma dos dados do computador: ${computer.score}\n');
      }
    }
    
    if (player.score > computer.score) {
      userWins++;
      print('Você venceu esta rodada!\n');
    } else if (computer.score > player.score) {
      computerWins++;
      print('O computador venceu esta rodada!\n');
    } else {
      ties++;
      print('Esta rodada terminou em empate!\n');
    }
  }

  print('\nFim das rodadas.');
  print('Placar Final:');
  print('Você venceu: $userWins rodadas');
  print('Computador venceu: $computerWins rodadas');
  print('Empates: $ties rodadas');

  if (userWins > computerWins) {
    print('Você é o vencedor final!');
  } else if (computerWins > userWins) {
    print('O computador é o vencedor final!');
  } else {
    print('O jogo terminou em empate.');
  }
}
