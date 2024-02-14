import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:sudoku/src/modules/dashboard/presentation/game_dashboard.dart';

class DashboardModule extends Module {
  void _controllers(Injector i) {
    i.addSingleton(DashboardController.new);
  }

  void _usecases(i) {}
  void _general(i) {}

  @override
  void binds(i) {
    _controllers(i);
    _usecases(i);
    _general(i);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (ctx) => const GameDashboardView());
  }
}
