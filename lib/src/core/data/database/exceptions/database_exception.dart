abstract class DatabaseException implements Exception {
  final String? message;
  final String? code;

  DatabaseException({this.message, this.code});
}
