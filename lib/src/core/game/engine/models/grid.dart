import 'package:sudoku/src/core/game/engine/entities/coordinate.dart';

/// Represents a Sudoku grid.
class Grid {
  /// The 2D matrix representing the Sudoku grid.
  final List<List<int>> matrix;

  /// Constructs a [Grid] with the given [matrix].
  Grid(this.matrix);

  /// Constructs an empty [Grid] with all cells initialized to zero.
  Grid.empty() : matrix = List.generate(9, (_) => List<int>.filled(9, 0));

  /// Gets the number of columns in the grid.
  int get columnSize => matrix[0].length;

  /// Gets the number of rows in the grid.
  int get lineSize => matrix.length;

  /// Gets the total number of cells in the grid.
  int get size => columnSize * lineSize;

  /// Gets a list representing the column at the specified [columnNumber].
  List<int> getColumn(int columnNumber) => List.generate(lineSize, (line) => matrix[line][columnNumber]);

  /// Gets a list representing the row at the specified [lineNumber].
  List<int> getLine(int lineNumber) => matrix[lineNumber];

  /// Checks if the grid is completely filled.
  ///
  /// Returns `true` if all cells are filled, `false` otherwise.
  bool checkGrid() => matrix.every((line) => !line.contains(0));

  /// Clears all cells in the grid, setting them to zero.
  void clear() {
    for (var line in matrix) {
      line.fillRange(0, columnSize, 0);
    }
  }

  /// Returns the number present in the playable grid at the specified linear index.
  ///
  /// Parameters:
  ///   - number: The linear index of the position in the grid.
  ///
  /// Returns:
  ///   The number present at the specified linear index of the playable grid.
  ///
  /// Example Usage:
  ///   ```dart
  ///   int number = gameEngine.fromLinearIndex(28);
  ///   ```
  ///   in grid:
  ///  [0, 9, 5, 8, 4, 3, 1, 0, 2]
  ///  [1, 0, 0, 0, 6, 7, 5, 0, 9]
  ///  [7, 2, 0, 0, 0, 1, 6, 0, 0]
  ///  [4, 6, 0, 1, 0, 9, 0, 5, 0]
  ///  [0, 5, 8, 0, 0, 4, 9, 2, 1]
  ///  [0, 0, 2, 5, 3, 0, 4, 6, 7]
  ///  [5, 4, 6, 0, 0, 2, 0, 9, 8]
  ///  [0, 7, 1, 3, 0, 6, 0, 0, 5]
  ///  [2, 3, 9, 4, 0, 5, 7, 0, 6]
  ///
  ///   THE OUTPUT IS: 4
  int fromLinearIndex(int number) {
    Coordinate coordinate = Coordinate.fromLinearIndex(number);
    return matrix[coordinate.row][coordinate.column];
  }

  /// Returns a subgrid of the original matrix.
  ///
  /// The subgrid is defined by the parameters of row indices
  /// [startRow] and [endRow], and column indices [startColumn] and [endColumn].
  ///
  /// Example:
  /// ```dart
  /// List<List<int>> matrix = [
  ///   [1, 2, 3],
  ///   [4, 5, 6],
  ///   [7, 8, 9],
  /// ];
  ///
  /// List<List<int>> sub = subgrid(0, 2, 0, 2);
  /// print(sub);  // Output: [[1, 2], [4, 5]]
  /// ```
  List<List<int>> subgrid(int startRow, int endRow, int startColumn, int endColumn) =>
      matrix.sublist(startRow, endRow).map((list) => list.sublist(startColumn, endColumn)).toList();
}
