import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku/src/core/const/spaces.dart';
import 'package:sudoku/src/core/theme/app_theme.dart';
import 'package:sudoku/src/core/game/engine/enums/difficulty_level.dart';
import 'package:sudoku/src/core/game/engine/pontuation/pontuation_system.dart';
import 'package:sudoku/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:sudoku/src/modules/dashboard/presentation/widgets/grid_widget.dart';
import 'package:sudoku/src/modules/dashboard/presentation/widgets/stop_watch_text_widget.dart';

class GameDashboardView extends StatefulWidget {
  const GameDashboardView({super.key, required this.difficulty});

  final Difficulty difficulty;

  @override
  State<GameDashboardView> createState() => _GameDashboardViewState();
}

class _GameDashboardViewState extends State<GameDashboardView> {
  final Stopwatch _stopwatch = Stopwatch();
  final DashboardController _controller = Modular.get();
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    _controller.newGame(widget.difficulty);
    _stopwatch.start();

    super.initState();
  }

  void _handleNumberButtonClick(int number) {
    final postionIsNotNull = _controller.userInputPositions.value[_controller.selectedCellNumber.value] != null;

    if (postionIsNotNull && _controller.userInputPositions.value[_controller.selectedCellNumber.value] == number) {
      _controller.addNumber(_controller.selectedCellNumber.value, 0);
    } else {
      _controller.addNumber(_controller.selectedCellNumber.value, number);
    }
  }

  void _onPausePressed() {
    setState(() {
      _stopwatch.stop();
      _showPauseDialog();
    });
  }

  void _showPauseDialog() {
    showDialog(
      context: context,
      builder: (context) => PopScope(
        onPopInvoked: (popped) {
          setState(() {
            _stopwatch.start();
          });
        },
        child: AlertDialog(
          surfaceTintColor: AppTheme.actualTheme(context).appColors.backgroundColor,
          backgroundColor: AppTheme.actualTheme(context).appColors.backgroundColor,
          title: Row(
            children: [
              Text(
                'Jogo Pausado!',
                style: AppTheme.actualTheme(context).pause,
              ),
              Spaces.fill,
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          titlePadding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          content: SizedBox(
            height: 200,
            child: Center(
                child: Text(
              'Você só conseguirá ver o tabuleiro completo após sair dessa tela!',
              style: AppTheme.actualTheme(context).pontuation,
            )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StopwatchText(stopwatch: _stopwatch),
                Row(
                  children: [
                    ValueListenableBuilder<PontuationSystem>(
                        valueListenable: _controller.pontuation,
                        builder: (context, actualPontuation, _) {
                          return Text(
                            'Pontuação: ${actualPontuation.pontuation}',
                            style: AppTheme.actualTheme(context).pontuation,
                          );
                        }),
                    Spaces.fill,
                    IconButton(onPressed: () => _onPausePressed(), icon: const Icon(Icons.pause))
                  ],
                ),
              ],
            ),
          ),
          const SudokuGrid(),
          Spaces.fill,
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox(
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
                      onPressed: () => _handleNumberButtonClick(index + 1));
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
