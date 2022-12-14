import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:study_app/configs/theme/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xff3ac3cb);
const Color primaryColorLight = Color(0xfff85187);
const mainTextColorLight = Color.fromARGB(255, 40, 40, 40);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: primaryColorLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      ),
    );
  }
}
