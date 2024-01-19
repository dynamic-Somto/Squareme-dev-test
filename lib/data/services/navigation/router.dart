import 'package:bayfront/data/services/navigation/routes.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  CustomRouter._();

  static generateRoutes(RouteSettings settings) {
    switch (settings.name) {
    // AUTH
      case Routes.intro:
        return MaterialPageRoute(
            settings: settings, builder: (_) => Container(color: Colors.white));
    }
  }
}
