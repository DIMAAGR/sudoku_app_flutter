import 'package:dartz/dartz.dart';
import 'package:sudoku/src/core/data/database/models/player_data.dart';
import 'package:sudoku/src/core/data/result/db_result.dart';

abstract class IPlayerRepository {
  Future<Either<PlayerData, Failure>> loadPlayerData(String playerID);
  Future<Either<Ok, Failure>> savePlayerData(PlayerData data);
}
