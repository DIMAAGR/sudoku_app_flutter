import 'package:flutter/material.dart';
import 'package:sudoku/src/core/const/spaces.dart';
import 'package:sudoku/src/core/theme/app_theme.dart';

class StartPageButtonList extends StatelessWidget {
  final VoidCallback onContinuePressed;
  final VoidCallback onNewGamePressed;
  final VoidCallback onScorePressed;
  final bool hasSavedGame;
  const StartPageButtonList({
    super.key,
    required this.onContinuePressed,
    required this.onNewGamePressed,
    required this.hasSavedGame,
    required this.onScorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 56.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (hasSavedGame) ...[
            ElevatedButton(
              onPressed: onContinuePressed,
              style: AppTheme.actualTheme(context).lightButton,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Continuar'),
              ),
            ),
            Spaces.y8,
          ],
          ElevatedButton(
            onPressed: onNewGamePressed,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Novo Jogo'),
            ),
          ),
          ElevatedButton(
            onPressed: onNewGamePressed,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Pontuações'),
            ),
          ),
        ],
      ),
    );
  }
}
