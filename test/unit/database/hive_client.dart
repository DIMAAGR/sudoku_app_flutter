import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:sudoku/src/core/data/database/hive_client.dart';
import 'package:test/test.dart';

main() {
  group('Hive Client DB Test', () {
    test('', () async {
      WidgetsFlutterBinding.ensureInitialized();
      
      CollectionBox? collection = await HiveClient.gameDB;
      expect(collection, isNotNull);

      await collection.put('EXEMPLO_1', {'messagem': 'olá DB!'});

      Map<dynamic, dynamic> data = await collection.get('EXEMPLO_1');
      expect(data, equals({'messagem': 'olá DB!'}));
    });
  });
}
