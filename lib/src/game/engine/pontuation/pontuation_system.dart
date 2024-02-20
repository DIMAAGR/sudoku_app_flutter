/* 
 *
 *  ABOUT THE PONTUATION SYSTEM:
 * 
 *  ====================================================================================================================
 *  1 - each square added correctly adds +25
 *  2 - for each hit in a row + 15% is added,
 *  3 - each wrong space added is deducted - 5
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
  PontuationSystem(Difficulty difficulty)
      : _difficulty = difficulty,
        _actualPontuation = Pontuation(0),
        _sequences = Sequence();

  PontuationSystem.fromOldPontuation(PontuationSystem pontuationSystem)
      : _difficulty = pontuationSystem._difficulty,
        _actualPontuation = pontuationSystem._actualPontuation,
        _sequences = pontuationSystem._sequences;

  final Difficulty _difficulty;
  final Pontuation _actualPontuation;
  final Sequence _sequences;

  int get sequences => _sequences.count;
  int get pontuation => _actualPontuation.pontuation;

  void decreaseUserPontuation() {
    _checkSequence(SequenceType.decrease);
    final valueToDecrease = (5 + (_actualPontuation.pontuation * .25) + (.25 * _difficultyPercentage) + _sequences.count).round();

    if (_actualPontuation.pontuation - valueToDecrease < 0) {
      _actualPontuation.setToZero();
    } else {
      _actualPontuation.decrease(valueToDecrease);
    }
  }

  void decreasePontuationByGameDuration(Duration duration) {
    if (_actualPontuation.pontuation - duration.inSeconds < 0) {
      _actualPontuation.setToZero();
    } else {
      _actualPontuation.decrease(duration.inSeconds);
    }
  }

  void increaseUserPontuation() {
    _checkSequence(SequenceType.increase);
    final valueToIncrease = (50 + (25 * .15) + (50 * _difficultyPercentage) + _sequences.count).round();
    _actualPontuation.increase(valueToIncrease);
  }

  void _checkSequence(SequenceType type) {
    if (_sequences.type == SequenceType.none) {
      _sequences.newSequenceType = type;
    }

    if (_sequences.type == type) {
      _sequences.increase();
    } else {
      _sequences.reset();
      _sequences.newSequenceType = type;
    }
  }

  double get _difficultyPercentage => switch (_difficulty) {
        Difficulty.easy => .12,
        Difficulty.medium => .20,
        Difficulty.hard => .35,
        Difficulty.expert => .40,
      };
}
