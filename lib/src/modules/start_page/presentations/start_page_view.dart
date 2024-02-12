import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku/src/core/const/routes.dart';
import 'package:sudoku/src/core/const/spaces.dart';
import 'package:sudoku/src/core/theme/app_theme.dart';
import 'package:sudoku/src/modules/start_page/presentations/widgets/start_page_button_list.dart';

class StartPageView extends StatelessWidget {
  const StartPageView({super.key});

  void _onNewgamePressed() {
    Modular.to.pushNamed(AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 240),
          child: Center(
            child: Text(
              'Sudoku',
              style: AppTheme.actualTheme(context).title,
            ),
          ),
        ),
        Spaces.fill,
        Padding(
          padding: const EdgeInsets.only(bottom: 88.0),
          child: StartPageButtonList(
            hasSavedGame: false,
            onContinuePressed: () {},
            onScorePressed: () {},
            onNewGamePressed: _onNewgamePressed,
          ),
        ),
      ],
    ));
  }
}