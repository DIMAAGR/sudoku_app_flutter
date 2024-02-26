import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku/src/core/game/engine/entities/coordinate.dart';
import 'package:sudoku/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:sudoku/src/modules/dashboard/presentation/widgets/cell_widget.dart';

class SubGrid extends StatelessWidget {
  final int subgridPosition;

  const SubGrid({Key? key, required this.subgridPosition}) : super(key: key);

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  DashboardController get _controller => Modular.get();

  int _calculateRealIndex(int index) {
    final row = (subgridPosition ~/ 3) * 3;
    final column = (subgridPosition % 3) * 3;
    return row * 9 + column + index % 3 + (index ~/ 3) * 9;
  }

  String _getCellNumber(int realIndex) {
    if (_controller.userInputPositions.value[realIndex] != null) {
      return _controller.userInputPositions.value[realIndex]!.toString();
    } else {
      return _controller.game.value.getNumberAtLinearIndex(realIndex).toString();
    }
  }

  CellType _getCellTypeForFilledCell(bool isSelectedCell) {
    if (isSelectedCell) {
      return CellType.definedByUserAndSelected;
    } else {
      return CellType.definedByUser;
    }
  }

  CellType _getCellTypeForEmptyCell(bool isSelectedCell) {
    if (isSelectedCell) {
      return CellType.selected;
    } else {
      return CellType.predefined;
    }
  }

  bool _isSameRowOrColumn(int realIndex) {
    final selectedCellIndex = _controller.selectedCellNumber.value;
    if (selectedCellIndex == -1) return false;
    final selectedCellCoord = Coordinate.fromLinearIndex(selectedCellIndex);
    final actualCellCoord = Coordinate.fromLinearIndex(realIndex);
    return selectedCellCoord.column == actualCellCoord.column || selectedCellCoord.row == actualCellCoord.row;
  }

  void _handleCellTap(int realIndex, bool isCellEmpty, bool isWrong) {
    if (isCellEmpty || isWrong) {
      _controller.setSelectedCellIndex(realIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([_controller.selectedCellNumber, _controller.userInputPositions]),
      builder: (context, _) {
        return GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          padding: const EdgeInsets.all(1),
          children: List.generate(9, (index) {
            CellType type;

            final realIndex = _calculateRealIndex(index);
            final userInput = _controller.userInputPositions.value[realIndex] ?? -1;
            final isSelectedCell = _controller.selectedCellNumber.value == realIndex;
            final isCellEmpty = _controller.game.value.getNumberAtLinearIndex(realIndex) == 0;
            final isCellFilled = userInput != -1;
            final correctCellNumber = _controller.game.value.completedGrid.fromLinearIndex(realIndex);
            final isWrong = isCellFilled && userInput != correctCellNumber;

            if (isCellFilled) {
              type = _getCellTypeForFilledCell(isSelectedCell);
            } else {
              type = _getCellTypeForEmptyCell(isSelectedCell);
            }

            if (_isSameRowOrColumn(realIndex)) {
              type = isSelectedCell ? CellType.selected : CellType.sameRowOrColumn;
            }

            if (isWrong) {
              type = CellType.wrong;
            }

            return SudokuCell(
              type: type,
              positionIndex: realIndex,
              number: _getCellNumber(realIndex),
              onTap: () => _handleCellTap(realIndex, isCellEmpty, isWrong),
            );
          }),
        );
      },
    );
  }
}
