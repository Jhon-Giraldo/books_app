import 'package:flutter/material.dart';

import 'app_colors_config.dart';
import 'app_text_style_config.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData getThemeData() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColorsConfig.primaryColor,
      scaffoldBackgroundColor: AppColorsConfig.whiteColor,
      cardColor: AppColorsConfig.cardColor1,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: AppColorsConfig.principalIcons,
      ),
      fontFamily: 'Lora',
      textTheme: const TextTheme(
        displayLarge: AppTextStyleConfig.logoTextStyle,
        displayMedium: AppTextStyleConfig.buttonTextStyle,
        bodyLarge: AppTextStyleConfig.appbarTextStyle,
        bodyMedium: AppTextStyleConfig.subtitleStyle,
      ),
    );
  }
}
