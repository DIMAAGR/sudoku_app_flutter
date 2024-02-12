import 'package:sudoku/src/game/exceptions/game_exception.dart';

class HigherCaseException extends GameException {
  HigherCaseException({required super.message, super.code});
}
