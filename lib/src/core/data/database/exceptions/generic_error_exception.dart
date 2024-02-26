import 'package:sudoku/src/core/data/database/exceptions/database_exception.dart';

class GenericErrorException extends DatabaseException {
  GenericErrorException({super.message, super.code});
}
