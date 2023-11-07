
import 'package:auto_route/auto_route.dart';

import '../screens/screen_a.dart';
import '../screens/screen_b.dart';
import '../screens/screen_c.dart';
part 'auto_router.gr.dart';
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: RouteA.page, initial: true),
    AutoRoute(page: RouteB.page),
    AutoRoute(page: RouteC.page),
  ];
}