import 'package:flutter/material.dart';

import 'app_colors_config.dart';

class AppTextStyleConfig {
  AppTextStyleConfig._();

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 20,
    color: AppColorsConfig.blackColor,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle appbarTextStyle = TextStyle(
    fontSize: 30,
    color: AppColorsConfig.subtittleColor,
    fontStyle: FontStyle.normal,
  );

  static TextStyle titleStyle = const TextStyle(
    fontSize: 30,
    color: AppColorsConfig.blackColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 20,
    color: AppColorsConfig.subtittleColor,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );
}
