import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku/src/core/const/routes.dart';
import 'package:sudoku/src/modules/dashboard/dashboard_module.dart';
import 'package:sudoku/src/modules/start_page/start_page_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(AppRoutes.defaultMainRoute, module: StartPageModule());
    r.module(AppRoutes.dashboard, module: DashboardModule());
  }
}
