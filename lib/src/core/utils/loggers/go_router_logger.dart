import 'package:flutter/material.dart';

import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';

class GoRouterLogger extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    printInfo(route, title: 'Route Push');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    printInfo(route, title: 'Route Pop');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    printInfo(route, title: 'Route Remove');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    printInfo(newRoute, title: 'Route Replace');
  }
}
