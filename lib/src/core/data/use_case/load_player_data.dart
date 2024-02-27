import 'package:dartz/dartz.dart';
import 'package:sudoku/src/core/data/database/models/player_data.dart';
import 'package:sudoku/src/core/data/interfaces/repositories/player_repository_interface.dart';
import 'package:sudoku/src/core/data/interfaces/use_case/player_use_case_interface.dart';
import 'package:sudoku/src/core/data/result/db_result.dart';

class LoadPlayerDataUseCase implements ILoadPlayerDataUseCase {
  LoadPlayerDataUseCase(this._repository);

  final IPlayerRepository _repository;

  @override
  Future<Either<PlayerData, Failure>> call(String playerID) {
    return _repository.loadPlayerData(playerID);
  }
}
