import 'package:sudoku/src/game/exceptions/game_exception.dart';

class InvalidNumberException extends GameException {
  InvalidNumberException({required super.message, super.code});
}
