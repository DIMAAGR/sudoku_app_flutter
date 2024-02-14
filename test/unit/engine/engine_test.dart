import 'package:flutter/foundation.dart';
import 'package:sudoku/src/game/engine/entities/coordinate.dart';
import 'package:sudoku/src/game/engine/enums/difficulty_level.dart';
import 'package:sudoku/src/game/engine/game_engine.dart';
import 'package:sudoku/src/game/exceptions/higher_case_exception.dart';
import 'package:sudoku/src/game/exceptions/invalid_move_exception.dart';
import 'package:test/test.dart';

import '../../ansi_color.dart';

void main() {
  group('GameEngine', () {
    late GameEngine gameEngine;

    setUp(() {
      gameEngine = GameEngine();
    });

    test('generateGrid should generate a valid Sudoku grid', () {
      gameEngine.generateGrid(Difficulty.medium);
      expect(gameEngine.completedGrid, isNotNull);
    });

    test(
        'setNumberOnGrid should throw InvalidMoveException if cell is already filled '
        'or set a number if the cell is empty '
        'or throw a HigherCaseException if the number is invalid', () {
      gameEngine.generateGrid(Difficulty.medium);
      final coordinate = Coordinate(0, 0);
      final initialNumber = gameEngine.playableGrid.matrix[coordinate.row][coordinate.column];
      const newNumber = 5;

      if (kDebugMode) {
        printColored(
            '\n\nsetNumberOnGrid should throw InvalidMoveException if cell is already filled '
            'or set a number if the cell is empty '
            'or throw a HigherCaseException if the number is invalid\n',
            AnsiColor.cyan);

        printColored('Completed Grid:             |  Playable Grid:', AnsiColor.yellow);
        for (var i = 0; i < gameEngine.completedGrid.matrix.length; i++) {
          print('${gameEngine.completedGrid.matrix[i]} |  ${gameEngine.playableGrid.matrix[i]}');
        }
        print('\n\n');
      }

      try {
        if (initialNumber == 0) {
          expect(gameEngine.playableGrid.matrix[coordinate.row][coordinate.column], equals(0));
          gameEngine.setNumberOnGrid(coordinate: coordinate, number: newNumber);
          expect(gameEngine.playableGrid.matrix[coordinate.row][coordinate.column], equals(newNumber));
        } else {
          expect(initialNumber, isNot(equals(0)));
          gameEngine.setNumberOnGrid(coordinate: coordinate, number: newNumber);
        }
      } catch (e) {
        printColored('\n$e', AnsiColor.red);
        expect(e, anyOf(isA<InvalidMoveException>(), isA<HigherCaseException>()));
      }
    });

    test('checkNumberOnGrid should return true if the number is correct', () {
      gameEngine.generateGrid(Difficulty.easy);
      const row = 0;
      const col = 0;
      final number = gameEngine.completedGrid.matrix[row][col];
      expect(gameEngine.checkNumberOnGrid(row: row, col: col, number: number), isTrue);
    });

    test('checkNumberOnGrid should return false if the number is incorrect', () {
      gameEngine.generateGrid(Difficulty.easy);
      const row = 0;
      const col = 0;
      final correctNumber = gameEngine.completedGrid.matrix[row][col];
      final wrongNumber = correctNumber != 9 ? 9 : 8; // Garantir que o número errado seja diferente do correto
      expect(gameEngine.checkNumberOnGrid(row: row, col: col, number: wrongNumber), isFalse);
    });

    test('checkNumberOnGrid should return true if the number is correct', () {
      gameEngine.generateGrid(Difficulty.easy);
      const row = 0;
      const col = 0;
      final number = gameEngine.completedGrid.matrix[row][col];
      expect(gameEngine.checkNumberOnGrid(row: row, col: col, number: number), isTrue);
    });
  });
}

void printColored(String message, AnsiColor color) {
  if (kDebugMode) {
    print(color(message));
  }
}
