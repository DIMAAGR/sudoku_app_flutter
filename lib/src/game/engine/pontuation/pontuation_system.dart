/* 
 *
 *  ABOUT THE PONTUATION SYSTEM:
 * 
 *  ====================================================================================================================
 *  1 - each square added correctly adds +100
 *  2 - for each hit in a row + 15% is added,
 *  3 - each wrong space added is deducted - 75
 *  4 - for each error in a row is deducted - 25%
 *  5 - for each difficulty level, 5% of the score is increased for each correct answer and 5% is deducted for each error
 *  6 - at the end of the game, the time spent on the second * difficulty level is deducted
 *  7 - a summary must be shown to the player at the end of each game
 *  ====================================================================================================================
 */

import 'package:sudoku/src/game/engine/enums/difficulty_level.dart';
import 'package:sudoku/src/game/engine/models/sequence.dart';

import '../models/pontuation.dart';

class PontuationSystem {
  PontuationSystem(Difficulty difficulty) : _difficulty = difficulty;

  final Difficulty _difficulty;
  Pontuation actualPontuation = Pontuation(0);
  int sucessiveCount = 1;
  Sequence sequences = Sequence();

  void decreaseUserPontuation() {
    _checkSequence(SequenceType.decrease);
    final valueToDecrease = (75 + (actualPontuation.pontuation * .25) + (.25 * difficultyPercentage) + sequences.count).round();

    if (actualPontuation.pontuation - valueToDecrease < 0) {
      actualPontuation.setToZero();
    } else {
      actualPontuation.decrease(valueToDecrease);
    }
  }

  void increaseUserPontuation() {
    _checkSequence(SequenceType.increase);
    final valueToIncrease = (100 + (100 * .15) + (100 *difficultyPercentage) + sequences.count).round();
    actualPontuation.increase(valueToIncrease);
  }

  void _checkSequence(SequenceType type) {
    if (sequences.type == SequenceType.none) {
      sequences.newSequenceType = type;
    }

    if (sequences.type == type) {
      sequences.increase();
    } else {
      sequences.reset();
      sequences.newSequenceType = type;
    }
  }

  double get difficultyPercentage => switch (_difficulty) {
        Difficulty.easy => .05,
        Difficulty.medium => .10,
        Difficulty.hard => .15,
        Difficulty.expert => .20,
      };
}
