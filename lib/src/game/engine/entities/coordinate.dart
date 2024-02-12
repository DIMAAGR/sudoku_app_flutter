class Coordinate {
  Coordinate(int row, int column)
      : _x = row,
        _y = column;

  final int _x;
  final int _y;

  int get row => _x;
  int get column => _y;
}
