import 'package:sudoku/src/core/game/exceptions/game_exception.dart';

class HigherCaseException extends GameException {
  HigherCaseException({required super.message, super.code});

  @override
  String toString() {
    return 'HigherCaseException: $message';
  }
}
