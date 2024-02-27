import 'package:dartz/dartz.dart';
import 'package:sudoku/src/core/data/database/models/player_data.dart';
import 'package:sudoku/src/core/data/result/db_result.dart';

abstract class ISavePlayerDataUseCase {
  Future<Either<Ok, Failure>> call(PlayerData data);
}

abstract class ILoadPlayerDataUseCase {
  Future<Either<PlayerData, Failure>> call(String playerID);
}
