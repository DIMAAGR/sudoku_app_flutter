import 'package:flutter/material.dart';
import 'package:sudoku/src/core/theme/app_theme.dart';

enum CellType { wrong, predefined, definedByUser, selected, definedByUserAndSelected, sameRowOrColumn }

class SudokuCell extends StatefulWidget {
  const SudokuCell({super.key, this.number, required this.type, required this.positionIndex, required this.onTap});

  final String? number;
  final int positionIndex;
  final CellType type;
  final Function() onTap;

  @override
  State<SudokuCell> createState() => _SudokuCellState();
}

class _SudokuCellState extends State<SudokuCell> {
  BorderRadius get _borderRadius => switch (widget.positionIndex) {
        0 => const BorderRadius.only(topLeft: Radius.circular(8)),
        8 => const BorderRadius.only(topRight: Radius.circular(8)),
        72 => const BorderRadius.only(bottomLeft: Radius.circular(8)),
        80 => const BorderRadius.only(bottomRight: Radius.circular(8)),
        _ => const BorderRadius.all(Radius.zero)
      };

  Color get _cellColor => switch (widget.type) {
        CellType.definedByUser => AppTheme.actualTheme(context).appColors.unselectedCell,
        CellType.wrong => AppTheme.actualTheme(context).appColors.wrongCell,
        CellType.predefined => AppTheme.actualTheme(context).appColors.unselectedCell,
        CellType.selected => AppTheme.actualTheme(context).appColors.selectedSell,
        CellType.definedByUserAndSelected => AppTheme.actualTheme(context).appColors.selectedSell,
        CellType.sameRowOrColumn => AppTheme.actualTheme(context).appColors.sameRowOrColumn
      };

  TextStyle get _cellTextStyle => switch (widget.type) {
        CellType.definedByUser => AppTheme.actualTheme(context).userInputNumberText,
        CellType.wrong => AppTheme.actualTheme(context).incorrectNumberText,
        CellType.predefined => AppTheme.actualTheme(context).presetNumberText,
        CellType.selected => AppTheme.actualTheme(context).actualSelectedNumberText,
        CellType.definedByUserAndSelected => AppTheme.actualTheme(context).actualSelectedNumberText,
        CellType.sameRowOrColumn => AppTheme.actualTheme(context).presetNumberText
      };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: _cellColor,
        ),
        height: 32,
        width: 32,
        child: Center(
            child: Text(
          widget.number != null && widget.number != '0' ? widget.number! : '',
          style: _cellTextStyle,
        )),
      ),
    );
  }
}
