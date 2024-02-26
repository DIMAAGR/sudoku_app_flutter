import 'package:sudoku/src/core/data/database/exceptions/null_exception.dart';
import 'package:sudoku/src/core/data/database/models/game_data.dart';

class PlayerData {
  PlayerData({
    String? userID,
    String? username,
    GameData? lastGameData,
    List<GameData>? allGameData,
  })  : _userID = userID,
        _username = username,
        _allGameData = allGameData,
        _lastGameData = lastGameData;

  final String? _userID;
  final String? _username;
  final List<GameData>? _allGameData;
  final GameData? _lastGameData;

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    try {
      return PlayerData(
        allGameData: List.generate(json['all_game_data']?.lenght ?? 0, (index) => GameData.fromJSON(json['all_game_data']?[index])),
        lastGameData: json['last_game_data'],
        userID: json['user_id'],
        username: json['username'],
      );
    } on FormatException catch (e) {
      throw NullException(message: '${e.source} is null');
    }
  }

  Map<String, dynamic> toJSON() {
    return {
      'all_game_data': _allGameData?.map((e) => e.toJson()).toList(),
      'last_game_data': _lastGameData?.toJson(),
      'user_id': _userID,
      'username': _username,
    };
  }

  String? get userID => _userID;
  String? get userName => _username;
  GameData? get lastGameData => _lastGameData;
  List<GameData>? get allGameData => _allGameData;
}
