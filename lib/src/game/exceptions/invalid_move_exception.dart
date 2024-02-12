import 'package:sudoku/src/game/exceptions/game_exception.dart';

class InvalidMoveException extends GameException {
  InvalidMoveException({required super.message, super.code});
}
