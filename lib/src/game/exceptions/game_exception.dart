class GameException implements Exception {
  final int? code;
  final String message;
  GameException({required this.message, this.code});
}
