import 'package:sudoku/src/core/data/database/exceptions/database_exception.dart';

class NullException extends DatabaseException {
  NullException({super.message, super.code});
}
