import 'package:flutter/material.dart';
import 'package:sudoku/src/game/engine/enums/difficulty_level.dart';
import 'package:sudoku/src/game/engine/game_engine.dart';

class DashboardController extends ChangeNotifier {
  ValueNotifier<GameEngine> game = ValueNotifier(GameEngine());
  ValueNotifier<Map<int, int>> userInputPositions = ValueNotifier({});
  ValueNotifier<int> selectedCellNumber = ValueNotifier(-1);

  void newGame(Difficulty difficulty) {
    game.value.generateGrid(difficulty);
    notifyListeners();
  }

  void addNumber(int linearIndexPosition, int number) {
    Map<int, int> newUserInputPositions = Map.from(userInputPositions.value);

    number == 0
        ? newUserInputPositions.remove(linearIndexPosition) //
        : newUserInputPositions[linearIndexPosition] = number;

    userInputPositions.value = newUserInputPositions;
    notifyListeners();
  }

  void setSelectedCellIndex(int cellNumber) {
    if (cellNumber == selectedCellNumber.value) {
      selectedCellNumber.value = -1;
    } else {
      selectedCellNumber.value = cellNumber;
    }
    selectedCellNumber.notifyListeners();
  }
}
