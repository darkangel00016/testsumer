import 'package:flutter/material.dart';
import '../../../common/constants/route_constants.dart';
import 'dashboard_screen.dart';

class DashboardRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.dashboard: (context) => DashboardScreen(),
    };
  }
}