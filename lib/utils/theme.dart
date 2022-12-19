import 'package:chat_app_demo_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:instant_text_styles/instant_text_styles.dart';

class AppThemes {
  static ThemeData main({bool isDark = false}) {
    final backgroundColor =
        isDark ? AppColors.neutralActive : AppColors.neutralWhite;
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: AppColors.primary,
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColorLight: AppColors.primaryLight,
      primaryColorDark: AppColors.primaryDark,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      disabledColor: AppColors.neutralDisabled,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        selectedItemColor: AppColors.iconColorFromBackground(
          backgroundColor,
        ),
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                isDark ? AppColors.primary : AppColors.primaryDefault,
            foregroundColor: AppColors.textColorFromBackground(
                isDark ? AppColors.primary : AppColors.primaryDefault),
            textStyle: TextStyles.button),
      ),
      dividerColor: isDark ? AppColors.neutralDark : AppColors.neutralLine,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        hintStyle: TextStyles.body.large,
        focusColor: isDark ? AppColors.neutralWhite : AppColors.neutralActive,
        filled: true,
        fillColor: isDark ? AppColors.neutralDark : AppColors.neutralOffWhite,
        border: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
