// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    RouteA.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenA(),
      );
    },
    RouteB.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenB(),
      );
    },
    RouteC.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenC(),
      );
    },
  };
}

/// generated route for
/// [ScreenA]
class RouteA extends PageRouteInfo<void> {
  const RouteA({List<PageRouteInfo>? children})
      : super(
          RouteA.name,
          initialChildren: children,
        );

  static const String name = 'RouteA';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenB]
class RouteB extends PageRouteInfo<void> {
  const RouteB({List<PageRouteInfo>? children})
      : super(
          RouteB.name,
          initialChildren: children,
        );

  static const String name = 'RouteB';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenC]
class RouteC extends PageRouteInfo<void> {
  const RouteC({List<PageRouteInfo>? children})
      : super(
          RouteC.name,
          initialChildren: children,
        );

  static const String name = 'RouteC';

  static const PageInfo<void> page = PageInfo<void>(name);
}
