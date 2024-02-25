import 'dart:math';

import 'package:sudoku/src/core/game/engine/entities/coordinate.dart';
import 'package:sudoku/src/core/game/engine/extensions/int_extensions.dart';
import 'package:sudoku/src/core/game/engine/game_solver.dart';
import 'package:sudoku/src/core/game/engine/models/grid.dart';
import 'package:sudoku/src/core/game/exceptions/higher_case_exception.dart';
import 'package:sudoku/src/core/game/exceptions/invalid_move_exception.dart';
import 'package:sudoku/src/core/game/exceptions/matrix_exception.dart';

import 'enums/difficulty_level.dart';

// =====================================================================================================================
// Based on Sudoku Generator Algorithm from 101computing.net
// =====================================================================================================================

/// The main class representing the Sudoku game engine.
///
/// This class manages the generation, configuration, and solving of Sudoku grids.
class GameEngine {
  final Map<Difficulty, int> _difficultyMap = {
    Difficulty.easy: 36,
    Difficulty.medium: 46,
    Difficulty.hard: 54,
    Difficulty.expert: 62,
  };

  final Grid _playableGameMatrix;
  final Grid _completedGameMatrix;
  final GameSolver _gameSolver = GameSolver();

  Grid get completedGrid => _completedGameMatrix;
  Grid get playableGrid => _playableGameMatrix;

  /// Constructs a new [GameEngine] instance with empty grids.
  ///
  /// This constructor initializes the [_completedGameMatrix] and [_playableGameMatrix]
  /// as empty grids, ready to be filled or populated later.
  GameEngine()
      : _completedGameMatrix = Grid.empty(),
        _playableGameMatrix = Grid.empty();

  /// Constructs a new [GameEngine] instance with provided game grids.
  ///
  /// This constructor initializes the [_completedGameMatrix] and [_playableGameMatrix]
  /// with the provided completedMatrix and playableMatrix, respectively.
  ///
  /// Parameters:
  ///   - completedMatrix: The completed grid representing the solved Sudoku puzzle.
  ///   - playableMatrix: The playable grid representing the Sudoku puzzle with hidden numbers.
  GameEngine.fromOldGame(Grid completedMatrix, Grid playableMatrix)
      : _completedGameMatrix = completedMatrix,
        _playableGameMatrix = playableMatrix;

  /// Generates a new Sudoku grid based on the specified [difficulty].
  ///
  /// This method fills the [_completedGameMatrix], copies it to the [_playableGameMatrix],
  /// and removes numbers to make it playable.
  ///
  /// Example:
  /// ```dart
  /// gameEngine.generateGrid(Difficulty.medium);
  /// ```
  generateGrid(Difficulty difficulty) {
    _completedGameMatrix.clear();
    _fillGrid();
    _copyCompletedToPlayable();
    _removeNumbersForPlayableGrid(difficulty);
  }

  /// Sets a number on the playable grid at the specified [row] and [col].
  ///
  /// The number is set if the cell is empty and the value is valid.
  ///
  /// Example:
  /// ```dart
  /// gameEngine.setNumberOnGrid(row: 1, col: 2, number: 3);
  /// ```
  setNumberOnGrid({required Coordinate coordinate, required int number}) {
    int row = coordinate.row;
    int col = coordinate.column;
    if (row >= 0 && row < _playableGameMatrix.lineSize && col >= 0 && col < _playableGameMatrix.columnSize) {
      if (_playableGameMatrix.matrix[row][col] == 0) {
        if (_gameSolver.isNumberValidToAdd(_playableGameMatrix, Coordinate(row, col), number)) {
          _playableGameMatrix.matrix[row][col] = number;
        } else {
          throw HigherCaseException(message: 'Invalid number for this cell.');
        }
      } else {
        throw InvalidMoveException(message: 'Cell already filled.');
      }
    } else {
      throw MatrixException(message: 'Invalid row or column index.');
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
  ///   int number = gameEngine.getNumberAtLinearIndex(28);
  ///   ```
  ///   in grid:
  ///  - [0, 9, 5, 8, 4, 3, 1, 0, 2]
  ///  - [1, 0, 0, 0, 6, 7, 5, 0, 9]
  ///  - [7, 2, 0, 0, 0, 1, 6, 0, 0]
  ///  - [4, 6, 0, 1, 0, 9, 0, 5, 0]
  ///  - [0, 5, 8, 0, 0, 4, 9, 2, 1]
  ///  - [0, 0, 2, 5, 3, 0, 4, 6, 7]
  ///  - [5, 4, 6, 0, 0, 2, 0, 9, 8]
  ///  - [0, 7, 1, 3, 0, 6, 0, 0, 5]
  ///  - [2, 3, 9, 4, 0, 5, 7, 0, 6]
  ///
  ///   THE OUTPUT IS: 4
  int getNumberAtLinearIndex(int number) {
    Coordinate coordinate = Coordinate.fromLinearIndex(number);
    return playableGrid.matrix[coordinate.row][coordinate.column];
  }

  /// Checks if a number at the specified [row] and [col] on the completed grid is equal to [number].
  ///
  /// Returns `true` if the number is correct, `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// bool isCorrect = gameEngine.checkNumberOnGrid(row: 1, col: 2, number: 3);
  /// ```
  bool checkNumberOnGrid({required int row, required int col, required int number}) {
    if (row >= 0 && row < _completedGameMatrix.lineSize && col >= 0 && col < _completedGameMatrix.columnSize) {
      return _completedGameMatrix.matrix[row][col] == number;
    } else {
      throw MatrixException(message: 'Invalid row or column index.');
    }
  }

  void _copyCompletedToPlayable() {
    for (int i = 0; i < _completedGameMatrix.lineSize; i++) {
      for (int j = 0; j < _completedGameMatrix.columnSize; j++) {
        _playableGameMatrix.matrix[i][j] = _completedGameMatrix.matrix[i][j];
      }
    }
  }

  _removeNumbersForPlayableGrid(Difficulty difficulty) {
    int cellsToRemove = _difficultyMap[difficulty] ?? 40;
    for (int i = 0; i < cellsToRemove; i++) {
      bool isCellEmpty = true;
      late int row, col;

      while (isCellEmpty) {
        row = Random().nextInt(_playableGameMatrix.lineSize);
        col = Random().nextInt(_playableGameMatrix.columnSize);

        if (_playableGameMatrix.matrix[row][col].isNotEmpty) {
          isCellEmpty = false;
        }
      }

      if (_playableGameMatrix.matrix[row][col].isNotEmpty) {
        _playableGameMatrix.matrix[row][col] = 0;
      }
    }
  }

  _fillGrid() {
    for (int i = 0; i < _completedGameMatrix.size; i++) {
      Coordinate coord = Coordinate.fromLinearIndex(i);

      if (_completedGameMatrix.matrix[coord.row][coord.column] == 0) {
        List<int> numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        numberList.shuffle();

        for (int value in numberList) {
          if (_gameSolver.isNumberValidToAdd(_completedGameMatrix, coord, value)) {
            _completedGameMatrix.matrix[coord.row][coord.column] = value;
            if (_fillGrid()) {
              return true;
            }
          }
        }
        _completedGameMatrix.matrix[coord.row][coord.column] = 0;
        return false;
      }
    }
    return true; // return true if the grid is complete
  }
}
