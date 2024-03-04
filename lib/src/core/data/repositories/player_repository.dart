import 'package:dartz/dartz.dart';
import 'package:sudoku/src/core/data/database/exceptions/generic_error_exception.dart';
import 'package:sudoku/src/core/data/database/exceptions/null_exception.dart';
import 'package:sudoku/src/core/data/database/hive_client.dart';
import 'package:sudoku/src/core/data/database/models/player_data.dart';
import 'package:sudoku/src/core/data/interfaces/repositories/player_repository_interface.dart';
import 'package:sudoku/src/core/data/result/db_result.dart';

class PlayerRepository implements IPlayerRepository {
  @override
  Future<Either<PlayerData, Failure>> loadPlayerData(String playerID) async {
    try {
      Map<String, dynamic> data = await (await HiveClient.gameDB).get(playerID) as Map<String, dynamic>;
      return Left(PlayerData.fromJson(data));
    } on FormatException catch (e) {
      return Right(Failure(NullException(message: '${e.source} is null')));
    } on Exception catch (e) {
      return Right(Failure(GenericErrorException(message: 'A UNKNOWN ERROR HAS OCCURRED: ${e.toString()}')));
    }
  }

  @override
  Future<Either<Ok<void>, Failure>> savePlayerData(PlayerData data) async {
    try {
      await (await HiveClient.gameDB).put(data.userID!, data.toJSON());
      return Left(Ok<void>());
    } on FormatException catch (e) {
      return Right(Failure(NullException(message: '${e.source} is null')));
    } on Exception catch (e) {
      return Right(Failure(GenericErrorException(message: 'A UNKNOWN ERROR HAS OCCURRED: ${e.toString()}')));
    }
  }
}
