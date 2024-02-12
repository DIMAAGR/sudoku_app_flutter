import 'dart:math';

import 'package:sudoku/src/game/engine/entities/coordinate.dart';
import 'package:sudoku/src/game/engine/extensions/int_extensions.dart';
import 'package:sudoku/src/game/engine/game_solver.dart';
import 'package:sudoku/src/game/engine/models/grid.dart';
import 'package:sudoku/src/game/exceptions/higher_case_exception.dart';
import 'package:sudoku/src/game/exceptions/invalid_move_exception.dart';
import 'package:sudoku/src/game/exceptions/matrix_exception.dart';

// =====================================================================================================================
// Based on Sudoku Generator Algorithm from 101computing.net
// =====================================================================================================================

enum Difficulty { easy, medium, hard, expert }

/// The main class representing the Sudoku game engine.
///
/// This class manages the generation, configuration, and solving of Sudoku grids.
class GameEngine {
  final Map<Difficulty, int> _difficultyMap = {
    Difficulty.easy: 30,
    Difficulty.medium: 40,
    Difficulty.hard: 50,
    Difficulty.expert: 60,
  };

  final Grid _playableGameMatrix = Grid.empty();
  final Grid _completedGameMatrix = Grid.empty();
  final GameSolver _gameSolver = GameSolver();

  Grid get completedGrid => _completedGameMatrix;
  Grid get playableGrid => _playableGameMatrix;

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
      int row = Random().nextInt(_playableGameMatrix.lineSize);
      int col = Random().nextInt(_playableGameMatrix.columnSize);

      if (_playableGameMatrix.matrix[row][col].isNotEmpty) {
        _playableGameMatrix.matrix[row][col] = 0;
      }
    }
  }

  _fillGrid() {
    for (int i = 0; i < _completedGameMatrix.size; i++) {
      int row = i ~/ _completedGameMatrix.columnSize;
      int col = i % _completedGameMatrix.columnSize;

      if (_completedGameMatrix.matrix[row][col] == 0) {
        List<int> numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        numberList.shuffle();

        for (int value in numberList) {
          if (_gameSolver.isNumberValidToAdd(_completedGameMatrix, Coordinate(row, col), value)) {
            _completedGameMatrix.matrix[row][col] = value;
            if (_fillGrid()) {
              return true;
            }
          }
        }
        _completedGameMatrix.matrix[row][col] = 0;
        return false;
      }
    }
    return true; // return true if the grid is complete
  }
}
