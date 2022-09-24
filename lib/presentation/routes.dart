import 'package:flutter/material.dart';

import 'gifs_trending/dashboard/dashboard_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> _getCombinedRoutes() => {
    ...DashboardRoutes.getAll(),
  };

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}