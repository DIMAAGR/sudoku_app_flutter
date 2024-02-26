import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku/src/core/const/routes.dart';
import 'package:sudoku/src/core/const/spaces.dart';
import 'package:sudoku/src/core/theme/app_theme.dart';
import 'package:sudoku/src/core/game/engine/enums/difficulty_level.dart';

class SelectDifficultyBottomSheet extends StatelessWidget {
  const SelectDifficultyBottomSheet({super.key});

  void _goToDashboardPage(Difficulty difficulty) {
    Modular.to.pushNamedAndRemoveUntil(
      AppRoutes.dashboard,
      (p0) => false,
      arguments: difficulty,
    );
  }

  void _doStartEasyGame() => _goToDashboardPage(Difficulty.easy);
  void _doStartMediumGame() => _goToDashboardPage(Difficulty.medium);
  void _doStartHardGame() => _goToDashboardPage(Difficulty.hard);
  void _doStartExpertGame() => _goToDashboardPage(Difficulty.expert);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Selecione uma dificuldade', style: AppTheme.actualTheme(context).title),
          Spaces.y32,
          ElevatedButton(
            onPressed: _doStartEasyGame,
            style: AppTheme.actualTheme(context).difficultyButton,
            child: const Text('Fácil'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: _doStartMediumGame,
            style: AppTheme.actualTheme(context).difficultyButton,
            child: const Text('Médio'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: _doStartHardGame,
            style: AppTheme.actualTheme(context).difficultyButton,
            child: const Text('Difícil'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: _doStartExpertGame,
            style: AppTheme.actualTheme(context).difficultyButton,
            child: const Text('Especialista'),
          ),
          Spaces.y8,
        ],
      ),
    );
  }
}
