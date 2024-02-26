import 'package:hive/hive.dart';
import 'package:sudoku/src/core/data/database/exceptions/unable_to_connect_exception.dart';

class HiveClient {
  static const String _playerDBKey = 'cf7b820377dd44639be898877aad0db1';
  static const String _gameDBKey = '35a3ae269518464a9c3d0667088043f1';

  // Getters
  static Future<CollectionBox<Map>> get playerDB async =>
      (await _playerCollection()).openBox<Map>('game_data').catchError(throw UnableToConnectException(message: 'the PlayerDB it is unable to connect!'));

  static Future<CollectionBox<Map>> get gameDB async =>
      (await _gameCollection()).openBox<Map>('player_data').catchError(throw UnableToConnectException(message: 'the GameDB it is unable to connect!'));

  // Collections
  static Future<BoxCollection> _playerCollection() => _newCollection('users', _playerDBKey.codeUnits, 'player_data');
  static Future<BoxCollection> _gameCollection() => _newCollection('sessions', _gameDBKey.codeUnits, 'game_data');

  // New Collections Method
  static Future<BoxCollection> _newCollection(String collectionName, List<int> codeUnits, String collection) => BoxCollection.open(
        collectionName,
        {collection},
        key: HiveAesCipher(codeUnits),
        path: './$collectionName/',
      );
}
