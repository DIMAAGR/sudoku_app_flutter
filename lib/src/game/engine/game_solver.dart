import 'package:sudoku/src/game/engine/entities/coordinate.dart';
import 'package:sudoku/src/game/engine/models/grid.dart';
import 'package:sudoku/src/game/exceptions/invalid_number_exception.dart';

class GameSolver {
  GameSolver();
  GameSolver.grid(this.grid);

  late Grid grid;
  final List<int> validNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  void addGrid(Grid grid) {
    this.grid = grid;
  }

  /// Solves the Sudoku grid using a backtracking algorithm.
  ///
  /// This recursive method explores possible values for each empty cell in the
  /// Sudoku grid until a valid solution is found. It modifies the [grid] in-place.
  ///
  /// Returns true if the Sudoku grid is successfully solved, false otherwise.
  bool solveSudoku() {
    return _solveSudoku(grid);
  }

  bool _solveSudoku(Grid grid) {
    for (int i = 0; i < 81; i++) {
      Coordinate coord = Coordinate.fromLinearIndex(i);
      if (grid.matrix[coord.row][coord.column] == 0) {
        for (int value = 1; value <= 9; value++) {
          if (isNumberValidToAdd(grid, coord, value)) {
            grid.matrix[coord.row][coord.column] = value;
            if (grid.checkGrid()) {
              return true; // Found a solution
            } else {
              if (_solveSudoku(grid)) {
                return true; // Continue with the next cell
              }
            }
          }
        }
        grid.matrix[coord.row][coord.column] = 0; // Backtrack if no valid value is found
      }
    }
    return false; // No solution found for this branch
  }

  /// Checks if a value is used in the specified row of the Sudoku grid.
  bool _isValueUsedInRow(Grid grid, int row, int value) {
    return grid.getLine(row).contains(value);
  }

  /// Checks if a value is used in the specified column of the Sudoku grid.
  bool _isValueUsedInColumn(Grid grid, int col, int value) {
    return grid.getColumn(col).contains(value);
  }

  /// Checks if a value is used in the subgrid (3x3 square) of the Sudoku grid
  /// containing the specified row and column.
  bool _isValueUsedInSubgrid(Grid grid, int row, int col, int value) {
    int startRow = (row ~/ 3) * 3;
    int startCol = (col ~/ 3) * 3;
    return grid.subgrid(startRow, startRow + 3, startCol, startCol + 3).expand((list) => list).contains(value);
  }

  bool isNumberValidToAdd(Grid grid, Coordinate coordinate, int value) {
    int row = coordinate.row;
    int col = coordinate.column;
    if (!validNumbers.contains(value)) {
      throw InvalidNumberException(message: 'Cell is not empty.');
    }
    return !_isValueUsedInRow(grid, row, value) && !_isValueUsedInColumn(grid, col, value) && !_isValueUsedInSubgrid(grid, row, col, value);
  }
}
