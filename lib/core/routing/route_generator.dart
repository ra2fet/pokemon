import 'package:flutter/material.dart';
import 'package:pokemon/core/app_colors.dart';
import 'package:pokemon/core/app_router.dart';
import 'package:pokemon/features/home/presentation/pages/animations.dart';
import 'package:pokemon/features/pokemon/presentation/pages/pokemons.dart';

import '../../features/home/presentation/pages/home.dart';
import '../shared/pages/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return buildRoute(const Splash(), settings: settings);
      case AppRoutes.home:
        return buildRoute(Home(), settings: settings);
      case AppRoutes.pokemons:
        return buildRoute(Pokemons(), settings: settings);
      case AppRoutes.animations:
        final arguments = settings.arguments as AnimationsArguments;
        return buildRoute(Animations(name: arguments.name), settings: settings);
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'ERROR!!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Text(
                  'Seems the route you\'ve navigated to doesn\'t exist!!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
