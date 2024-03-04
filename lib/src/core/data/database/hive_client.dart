import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sudoku/src/core/data/database/exceptions/unable_to_connect_exception.dart';

class HiveClient {
  static const String _gameDBKey = '35a3ae269518464a9c3d0667088043f1';
  static const String _gameCollectionName = 'sessions';
  static const String _gameDataBoxName = 'game_data';

  static Future<CollectionBox<dynamic>> get gameDB async {
    try {
      final collection = await _openCollection(_gameCollectionName, _gameDBKey.codeUnits, _gameDataBoxName);
      return collection.openBox(_gameDataBoxName);
    } catch (e) {
      throw UnableToConnectException(message: 'The GameDB is unable to connect: $e');
    }
  }

  static Future<String> get applicationDirectoryPath async => (await getApplicationDocumentsDirectory()).path;

  static Future<BoxCollection> _openCollection(String collectionName, List<int> codeUnits, String boxName) async {
    return BoxCollection.open(
      collectionName,
      {boxName},
      key: HiveAesCipher(codeUnits),
      path: '${await applicationDirectoryPath}/$collectionName/',
    );
  }
}
