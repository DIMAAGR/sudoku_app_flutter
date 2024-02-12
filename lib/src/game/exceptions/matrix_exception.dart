import 'package:sudoku/src/game/exceptions/game_exception.dart';

class MatrixException extends GameException {
  MatrixException({required super.message, super.code});
}
