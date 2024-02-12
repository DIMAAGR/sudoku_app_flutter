class AnsiColor {
  final String _code;

  const AnsiColor(this._code);

  String call(String message) {
    return '$_code$message\u001b[0m';
  }

  static const AnsiColor black = AnsiColor('\u001b[30m');
  static const AnsiColor red = AnsiColor('\u001b[31m');
  static const AnsiColor green = AnsiColor('\u001b[32m');
  static const AnsiColor yellow = AnsiColor('\u001b[33m');
  static const AnsiColor blue = AnsiColor('\u001b[34m');
  static const AnsiColor magenta = AnsiColor('\u001b[35m');
  static const AnsiColor cyan = AnsiColor('\u001b[36m');
  static const AnsiColor white = AnsiColor('\u001b[37m');
}
