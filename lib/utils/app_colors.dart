import 'package:flutter/material.dart';

class AppColors {
  static const primaryDark = Color(0xFF001A83);
  static const primaryDefault = Color(0xFF002DE3);
  static const primary = Color(0xFF375FFF);
  static const primaryLight = Color(0xFF879FFF);
  static const primaryBackground = Color(0xFFD2D5F9);
  static const neutralActive = Color(0xFF0F1828);
  static const neutralDark = Color(0xFF152033);
  static const neutralBody = Color(0xFF1B2B48);
  static const neutralWeak = Color(0xFFA4A4A4);
  static const neutralDisabled = Color(0xFFADB5BD);
  static const neutralLine = Color(0xFFEDEDED);
  static const neutralOffWhite = Color(0xFFF7F7FC);
  static const neutralWhite = Color(0xFFFFFFFF);
  static const accentDanger = Color(0xFFE94242);
  static const accentWarning = Color(0xFFFDCF41);
  static const accentSuccess = Color(0xFF2CC069);
  static const accentSafe = Color(0xFF7BCBCF);

  static const gradientStyle01 = LinearGradient(colors: [
    Color(0xFFD2D5F9),
    Color(0xFF2C37E1),
  ]);
  static const gradientStyle02 = LinearGradient(colors: [
    Color(0xFFEC9EFF),
    Color(0xFF5F2EEA),
  ]);

  static MaterialColor primaryMaterialColor =
      getMaterialColorFromColor(AppColors.primaryDefault);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }

  static Color textColorFromBackground(Color background) =>
      background.computeLuminance() > 0.3 ? Colors.black : Colors.white;

  static Color iconColorFromBackground(Color background) =>
      background.computeLuminance() > 0.3 ? neutralActive : neutralOffWhite;
}
