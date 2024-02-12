import 'package:flutter/material.dart';

class SudokuCell extends StatelessWidget {
  const SudokuCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 32,
      width: 32,
    );
  }
}
