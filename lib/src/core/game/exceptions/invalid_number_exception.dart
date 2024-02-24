import 'package:sudoku/src/core/game/exceptions/game_exception.dart';

class InvalidNumberException extends GameException {
  InvalidNumberException({required super.message, super.code});

  @override
  String toString() {
    return 'InvalidNumberException: $message';
  }
}
