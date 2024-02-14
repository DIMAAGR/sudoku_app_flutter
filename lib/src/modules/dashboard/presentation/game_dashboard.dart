import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku/src/core/const/spaces.dart';
import 'package:sudoku/src/game/engine/enums/difficulty_level.dart';
import 'package:sudoku/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:sudoku/src/modules/dashboard/presentation/widgets/grid_widget.dart';

class GameDashboardView extends StatefulWidget {
  const GameDashboardView({super.key});

  @override
  State<GameDashboardView> createState() => _GameDashboardViewState();
}

class _GameDashboardViewState extends State<GameDashboardView> {
  final DashboardController _controller = Modular.get();

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    _controller.newGame(Difficulty.medium);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SudokuGrid(),
          Spaces.y16,
          SizedBox(
            height: 100,
            width: screenWidth(context) - 32,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: List.generate(9, (index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(48, 48),
                    minimumSize: const Size(48, 48),
                    padding: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text('${index + 1}'),
                  onPressed: () {
                    bool postionIsNotNull = _controller.userInputPositions.value[_controller.selectedCellNumber.value] != null;

                    if (postionIsNotNull && _controller.userInputPositions.value[_controller.selectedCellNumber.value] == index + 1) {
                      _controller.addNumber(_controller.selectedCellNumber.value, 0);
                    } else {
                      _controller.addNumber(_controller.selectedCellNumber.value, index + 1);
                    }
                  },
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
