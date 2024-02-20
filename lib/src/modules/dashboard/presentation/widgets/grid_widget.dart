import 'package:flutter/material.dart';
import 'package:sudoku/src/modules/dashboard/presentation/widgets/subgrid.dart';

class SudokuGrid extends StatelessWidget {
  const SudokuGrid({super.key});

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: screenWidth(context) - 32,
        height: screenWidth(context) - 32,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          padding: const EdgeInsets.all(1),
          children: List.generate(9, (index) {
            return Padding(
              padding: const EdgeInsets.all(0.2),
              child: SubGrid(subgridPosition: index),
            );
          }),
        ),
      ),
    );
  }
}
