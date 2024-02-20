import 'package:flutter/material.dart';
import 'package:sudoku/src/game/engine/enums/difficulty_level.dart';
import 'package:sudoku/src/game/engine/game_engine.dart';
import 'package:sudoku/src/game/engine/pontuation/pontuation_system.dart';

class DashboardController extends ChangeNotifier {
  ValueNotifier<GameEngine> game = ValueNotifier(GameEngine());
  ValueNotifier<Map<int, int>> userInputPositions = ValueNotifier({});
  ValueNotifier<int> selectedCellNumber = ValueNotifier(-1);

  late ValueNotifier<PontuationSystem> pontuation;

  Map<int, bool> correctlyFilledPositions = {};
  int errorCount = 0;

  void newGame(Difficulty difficulty) {
    game.value.generateGrid(difficulty);
    pontuation = ValueNotifier(PontuationSystem(difficulty));

    notifyListeners();
  }

  void increasePontuation() {
    PontuationSystem newPontuation = PontuationSystem.fromOldPontuation(pontuation.value);
    newPontuation.increaseUserPontuation();
    pontuation.value = newPontuation;
    notifyListeners();
  }

  void decreasePontuation() {
    PontuationSystem newPontuation = PontuationSystem.fromOldPontuation(pontuation.value);
    newPontuation.decreaseUserPontuation();
    pontuation.value = newPontuation;
    notifyListeners();
  }

  void addNumber(int linearIndexPosition, int number) {
    Map<int, int> newUserInputPositions = Map.from(userInputPositions.value);

    number == 0
        ? newUserInputPositions.remove(linearIndexPosition) //
        : newUserInputPositions[linearIndexPosition] = number;

    userInputPositions.value = newUserInputPositions;
    notifyListeners();

    _setNewPontuation(linearIndexPosition, number);
  }

  void _setNewPontuation(int linearIndexPosition, int number) {
    if (number != 0) {
      if (game.value.completedGrid.fromLinearIndex(linearIndexPosition) == number) {
        if (!correctlyFilledPositions.containsKey(linearIndexPosition)) {
          increasePontuation();
        }
        correctlyFilledPositions[linearIndexPosition] = true;
      } else {
        decreasePontuation();
        correctlyFilledPositions[linearIndexPosition] = true;
        errorCount++;
      }
    }
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
