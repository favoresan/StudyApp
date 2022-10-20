import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_app/data_uploader.dart';
import 'package:study_app/screens/intro/introduction.dart';
import 'package:study_app/screens/login/login.dart';
import 'package:study_app/screens/main/main_view.dart';
import 'package:study_app/screens/splash/splash.dart';

import '../screens/main/home_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String introRoute = '/intro';
  static const String mainRoute = '/main';
  static const String loginRoute = '/login';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.introRoute:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'No route found',
                ),
              ),
              body: const Center(
                child: Text(
                  'No route found',
                ),
              ),
            ));
  }
}
