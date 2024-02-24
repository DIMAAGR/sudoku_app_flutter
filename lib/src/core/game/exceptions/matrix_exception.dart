import 'package:sudoku/src/core/game/exceptions/game_exception.dart';

class MatrixException extends GameException {
  MatrixException({required super.message, super.code});

  @override
  String toString() {
    return 'MatrixException: $message';
  }
}
