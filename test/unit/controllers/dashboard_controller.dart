import 'package:flutter/foundation.dart';
import 'package:sudoku/src/game/engine/enums/difficulty_level.dart';
import 'package:sudoku/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:test/test.dart';

import '../../ansi_color.dart';

dashboardControllerTest() {
  // GROUP cria o grupo do respectivo teste que será executado!
  group('DashboardController', () {
    // FAZ O IMPORT DO DASHBOARD CONTROLLER E AGUARDA O SETUP (INSTANCIAÇÃO) DA CLASSE
    late DashboardController dashboardController;

    /* 
     * É chamada antes de cada teste dentro do grupo de testes em que é definida.
     * É semelhante a um "setup" ou "preparação" que você deseja realizar antes de
     * cada teste, como inicializar variáveis, configurar objetos ou executar
     * outras tarefas de inicialização necessárias para o teste.
     */
    setUp(() => dashboardController = DashboardController());

    // TESTA O COMPONENTE/CLASSE/WIDGET
    test('expects GENERATE a new game GRID using newGame() function ', () {
      final previousEasyGame = dashboardController.game.value;
      dashboardController.newGame(Difficulty.easy);
      final newEasyGame = dashboardController.game.value;

      if (kDebugMode) {
        printColored('\n\nexpects GENERATE a new game GRID: (EASY MODE) \n', AnsiColor.cyan);
        printColored('Completed Grid:             |  Playable Grid:', AnsiColor.yellow);
        for (var i = 0; i < dashboardController.game.value.completedGrid.matrix.length; i++) {
          print('${dashboardController.game.value.completedGrid.matrix[i]} |  ${dashboardController.game.value.playableGrid.matrix[i]}');
        }
        print('\n\n');
      }

      expect(previousEasyGame, isNot(newEasyGame));

      // ---------------------------------------------------------------------------------------------------------------

      final previousMediumGame = dashboardController.game.value;
      dashboardController.newGame(Difficulty.medium);
      final newMediumGame = dashboardController.game.value;

      if (kDebugMode) {
        printColored('\n\nexpects GENERATE a new game GRID: (MEDIUM MODE) \n', AnsiColor.cyan);
        printColored('Completed Grid:             |  Playable Grid:', AnsiColor.yellow);
        for (var i = 0; i < dashboardController.game.value.completedGrid.matrix.length; i++) {
          print('${dashboardController.game.value.completedGrid.matrix[i]} |  ${dashboardController.game.value.playableGrid.matrix[i]}');
        }
        print('\n\n');
      }

      expect(previousMediumGame, isNot(newMediumGame));

      // ---------------------------------------------------------------------------------------------------------------

      final previousHardGame = dashboardController.game.value;
      dashboardController.newGame(Difficulty.hard);
      final newHardGame = dashboardController.game.value;

      if (kDebugMode) {
        printColored('\n\nexpects GENERATE a new game GRID: (HARD MODE) \n', AnsiColor.cyan);
        printColored('Completed Grid:             |  Playable Grid:', AnsiColor.yellow);
        for (var i = 0; i < dashboardController.game.value.completedGrid.matrix.length; i++) {
          print('${dashboardController.game.value.completedGrid.matrix[i]} |  ${dashboardController.game.value.playableGrid.matrix[i]}');
        }
        print('\n\n');
      }

      expect(previousHardGame, isNot(newHardGame));

      // ---------------------------------------------------------------------------------------------------------------

      final previousExpertGame = dashboardController.game.value;
      dashboardController.newGame(Difficulty.expert);
      final newExpertGame = dashboardController.game.value;

      if (kDebugMode) {
        printColored('\n\nexpects GENERATE a new game GRID: (EXPERT MODE) \n', AnsiColor.cyan);
        printColored('Completed Grid:             |  Playable Grid:', AnsiColor.yellow);
        for (var i = 0; i < dashboardController.game.value.completedGrid.matrix.length; i++) {
          print('${dashboardController.game.value.completedGrid.matrix[i]} |  ${dashboardController.game.value.playableGrid.matrix[i]}');
        }
        print('\n\n');
      }

      expect(previousExpertGame, isNot(newExpertGame));

      // ---------------------------------------------------------------------------------------------------------------
    });

    test('addNumber() should update userInputPositions correctly', () {
      const linearIndexPosition = 5;
      const number = 3;

      dashboardController.addNumber(linearIndexPosition, number);

      final newUserInputPositions = dashboardController.userInputPositions.value;

      expect(newUserInputPositions[linearIndexPosition], equals(number));
    });

    test('setSelectedCellIndex() should update selectedCellNumber', () {
      const cellNumber = 10;

      dashboardController.setSelectedCellIndex(cellNumber);

      expect(dashboardController.selectedCellNumber.value, equals(cellNumber));
    });
  });
}

void printColored(String message, AnsiColor color) {
  if (kDebugMode) {
    print(color(message));
  }
}
