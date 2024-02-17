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

      expect(pontuationSystem.pontuation, equals(0));
    });

    test('Tests different increases value according by difficult level', () {
      int oldPontuation = 0;

      PontuationSystem easy = PontuationSystem(Difficulty.easy);
      easy.increaseUserPontuation();

      expect(easy.pontuation, greaterThan(oldPontuation));
      oldPontuation = easy.pontuation;

      PontuationSystem medium = PontuationSystem(Difficulty.medium);
      medium.increaseUserPontuation();

      expect(medium.pontuation, greaterThan(oldPontuation));
      oldPontuation = medium.pontuation;

      PontuationSystem hard = PontuationSystem(Difficulty.hard);
      hard.increaseUserPontuation();

      expect(hard.pontuation, greaterThan(oldPontuation));
      oldPontuation = hard.pontuation;

      PontuationSystem expert = PontuationSystem(Difficulty.expert);
      expert.increaseUserPontuation();

      expect(expert.pontuation, greaterThan(oldPontuation));
    });

    test('tests the progressive score increase according to the successes in a row', () {
      int oldProgressivePontuation = 0;
      PontuationSystem easy = PontuationSystem(Difficulty.easy);
      easy.increaseUserPontuation();
      expect(easy.pontuation, greaterThan(oldProgressivePontuation));
      oldProgressivePontuation = easy.pontuation;
      easy.increaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), greaterThan(oldProgressivePontuation));
      oldProgressivePontuation = (easy.pontuation - oldProgressivePontuation);
      easy.increaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), greaterThan(oldProgressivePontuation));
      oldProgressivePontuation = (easy.pontuation - oldProgressivePontuation);
      easy.increaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), greaterThan(oldProgressivePontuation));
      oldProgressivePontuation = (easy.pontuation - oldProgressivePontuation);
      easy.increaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), greaterThan(oldProgressivePontuation));
      oldProgressivePontuation = (easy.pontuation - oldProgressivePontuation);
      easy.increaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), greaterThan(oldProgressivePontuation));
      oldProgressivePontuation = (easy.pontuation - oldProgressivePontuation);
      easy.increaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), greaterThan(oldProgressivePontuation));
      oldProgressivePontuation = (easy.pontuation - oldProgressivePontuation);
    });

    test('tests the progressive score decrease according to the successes in a row', () {
      int oldProgressivePontuation = 0;
      int oldDecreaseValue = 0;
      PontuationSystem easy = PontuationSystem(Difficulty.easy);
      easy.increaseUserPontuation();
      easy.increaseUserPontuation();
      easy.increaseUserPontuation();
      easy.increaseUserPontuation();
      easy.increaseUserPontuation();
      easy.increaseUserPontuation();
      easy.increaseUserPontuation();
      oldProgressivePontuation = easy.pontuation;
      easy.decreaseUserPontuation();
      oldDecreaseValue = easy.pontuation - oldProgressivePontuation;
      easy.decreaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), lessThan(oldDecreaseValue));
      oldDecreaseValue = easy.pontuation - oldProgressivePontuation;
      easy.decreaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), lessThan(oldDecreaseValue));
      oldDecreaseValue = easy.pontuation - oldProgressivePontuation;
      easy.decreaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), lessThan(oldDecreaseValue));
      easy.decreaseUserPontuation();
      expect((easy.pontuation - oldProgressivePontuation), lessThan(oldDecreaseValue));
    });
  });
}
