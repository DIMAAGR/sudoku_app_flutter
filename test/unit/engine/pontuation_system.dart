import 'package:sudoku/src/game/engine/enums/difficulty_level.dart';
import 'package:sudoku/src/game/engine/pontuation/pontuation_system.dart';
import 'package:test/test.dart';

main() {
  group('Pontuation System', () {
    test('Tests reducing the score to zero without allowing negative values', () {
      PontuationSystem pontuationSystem = PontuationSystem(Difficulty.easy);

      pontuationSystem.decreaseUserPontuation();
      pontuationSystem.decreaseUserPontuation();
      pontuationSystem.decreaseUserPontuation();

      expect(pontuationSystem.actualPontuation.pontuation, equals(0));
    });

    test('Tests different increases value according by difficult level', () {
      int oldPontuation = 0;

      PontuationSystem easy = PontuationSystem(Difficulty.easy);
      easy.increaseUserPontuation();

      expect(easy.actualPontuation.pontuation, greaterThan(oldPontuation));
      oldPontuation = easy.actualPontuation.pontuation;

      PontuationSystem medium = PontuationSystem(Difficulty.medium);
      medium.increaseUserPontuation();

      expect(medium.actualPontuation.pontuation, greaterThan(oldPontuation));
      oldPontuation = medium.actualPontuation.pontuation;

      PontuationSystem hard = PontuationSystem(Difficulty.hard);
      hard.increaseUserPontuation();

      expect(hard.actualPontuation.pontuation, greaterThan(oldPontuation));
      oldPontuation = hard.actualPontuation.pontuation;

      PontuationSystem expert = PontuationSystem(Difficulty.expert);
      expert.increaseUserPontuation();

      expect(expert.actualPontuation.pontuation, greaterThan(oldPontuation));
    });
  });
}
