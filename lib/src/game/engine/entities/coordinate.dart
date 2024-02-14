class Coordinate {
  Coordinate(int row, int column)
      : _x = row,
        _y = column;

  Coordinate.fromLinearIndex(int number)
      : _x = number ~/ 9,
        _y = number % 9;

  final int _x;
  final int _y;

  int get row => _x;
  int get column => _y;
}
