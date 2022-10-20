import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_app/resources/route_manager.dart';

import '../../configs/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startDelay() async {
    await Future.delayed(Duration(seconds: 2));
    _goNext();
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.introRoute);
  }

  @override
  void initState() {
    startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        height: query.height,
        width: query.width,
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            'assets/images/app_splash_logo.png',
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
}
