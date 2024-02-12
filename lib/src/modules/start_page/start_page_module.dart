import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku/src/modules/start_page/presentations/start_page_view.dart';

class StartPageModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (ctx) => const StartPageView());
  }
}
