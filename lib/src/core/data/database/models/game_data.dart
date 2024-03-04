import 'package:sudoku/src/core/data/database/exceptions/null_exception.dart';
import 'package:sudoku/src/core/game/engine/models/grid.dart';
import 'package:sudoku/src/core/game/engine/models/pontuation.dart';

class GameData {
  GameData({
    required Pontuation pontuation,
    required int errorCount,
    required Grid playableGrid,
    required Grid completedGrid,
    required Map<int, int> userInputPositions,
    required Map<String, bool> correctlyFilledPositions,
  })  : _pontuation = pontuation,
        _errorCount = errorCount,
        _completedGameGrid = completedGrid,
        _playableGameGrid = playableGrid,
        _userInputPositions = userInputPositions,
        _correctlyFilledPositions = correctlyFilledPositions;

  final Pontuation? _pontuation;
  final int? _errorCount;

  final Grid? _playableGameGrid;
  final Grid? _completedGameGrid;

  final Map<int, int>? _userInputPositions;
  final Map<String, bool>? _correctlyFilledPositions;

  factory GameData.fromJSON(Map<String, dynamic> json) {
    try {
      return GameData(
        pontuation: Pontuation(json['pontuation']),
        errorCount: json['error_count'],
        playableGrid: Grid(json['playable_grid']),
        completedGrid: Grid(json['completed_grid']),
        userInputPositions: json['user_input_positions'],
        correctlyFilledPositions: json['correctly_filled_positions'],
      );
    } on FormatException catch (e) {
      throw NullException(message: '${e.source} is null');
    }
  }

  GameData copyWith(
    Pontuation? pontuation,
    int? errorCount,
    Grid? playableGrid,
    Grid? completedGrid,
    Map<int, int>? userInputPositions,
    Map<String, bool>? correctlyFilledPositions,
  ) {
    return GameData(
      pontuation: pontuation ?? _pontuation!,
      errorCount: errorCount ?? _errorCount!,
      playableGrid: playableGrid ?? _playableGameGrid!,
      completedGrid: completedGrid ?? _completedGameGrid!,
      userInputPositions: userInputPositions ?? _userInputPositions!,
      correctlyFilledPositions: correctlyFilledPositions ?? _correctlyFilledPositions!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pontuation': _pontuation?.pontuation,
      'error_count': _errorCount,
      'playable_grid': _playableGameGrid?.matrix,
      'completed_grid': _completedGameGrid?.matrix,
      'user_input_positions': _userInputPositions,
      'correctly_filled_positions': _correctlyFilledPositions,
    };
  }

  Pontuation get pontuation => _pontuation ?? Pontuation(0);
  int get errorCount => _errorCount ?? 0;

  Map<int, int> get userInputPositions => _userInputPositions ?? {};
  Map<String, bool> get correctlyFilledPositions => _correctlyFilledPositions ?? {};

  Grid get playableGrid => _playableGameGrid ?? Grid.empty();
  Grid get completeGrid => _completedGameGrid ?? Grid.empty();
}
