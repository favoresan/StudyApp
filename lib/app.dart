import 'package:flutter/material.dart';
import 'package:study_app/configs/theme/app_light_theme.dart';

import 'package:study_app/resources/route_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      title: 'Study app',
      theme: LightTheme().buildLightTheme(),
    );
  }
}
