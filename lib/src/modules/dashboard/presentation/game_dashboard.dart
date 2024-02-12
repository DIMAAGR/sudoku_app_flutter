import 'package:flutter/material.dart';
import 'package:sudoku/src/game/widgets/cell_widget.dart';

class GameDashboardView extends StatelessWidget {
  const GameDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(children: [
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
        Row(
          children: [
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
            SudokuCell(),
          ],
        ),
      ]),
    );
  }
}
