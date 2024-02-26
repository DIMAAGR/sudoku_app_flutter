import 'package:sudoku/src/core/data/database/exceptions/database_exception.dart';

class UnableToConnectException extends DatabaseException {
  UnableToConnectException({super.message, super.code});
}
