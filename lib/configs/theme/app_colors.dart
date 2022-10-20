import 'package:flutter/material.dart';
import 'package:study_app/configs/theme/app_dark_theme.dart';
import 'package:study_app/configs/theme/app_light_theme.dart';
import 'package:study_app/configs/theme/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryLightColorLight,
      primaryColorLight,
    ]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryDarkColorDark,
      primaryColorDark,
    ]);

LinearGradient mainGradient(BuildContext context) =>
    UiParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;

customScaffoldColor(BuildContext context) => UiParameters.isDarkMode(context)
    ? Color.fromARGB(255, 20, 46, 158)
    : Color.fromARGB(255, 221, 221, 221);
