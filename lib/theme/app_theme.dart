import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    scaffoldBackgroundColor: AppColors.warmWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.warmWhite,
      foregroundColor: AppColors.black,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.warmWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.gray),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.violet, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
      errorStyle: const TextStyle(color: AppColors.error),
    ),
  );
}