import 'package:flutter/material.dart';

import '../models/news/news_model.dart';

class MainRouteObserver extends RouteObserver {
  MainRouteObserver();
  
  final List<Route<dynamic>?> _history = <Route<dynamic>?>[];

  List<Route<dynamic>> get history => List<Route<dynamic>>.from(_history);

  void Function(NewsModel news)? onToggleBookMark;

  @override
  void didPop(Route route, Route? previousRoute) {
    _history.removeLast();
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _history.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _history.remove(route);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    int oldRouteIndex = _history.indexOf(oldRoute);
    _history.replaceRange(oldRouteIndex, oldRouteIndex + 1, [newRoute]);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  int pageCount(String pageName) {
    int pageCount = 0;
    for (var history in history) {
      String? name = history.settings.name;
      if (name ==  "/$pageName") {
        pageCount++;
      }
    }
    return pageCount;
  }
}